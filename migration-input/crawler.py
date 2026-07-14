#!/usr/bin/env python3
"""Crawler/archiver for https://www.smbbmu.edu.pk/beta/

- Stays on www.smbbmu.edu.pk under /beta/ only.
- Normalizes /beta/index.php/... and /beta//... variants to one canonical URL.
- 1 request/second, 3 retries with exponential backoff.
- Resume-safe: fetched HTML is cached in crawl-state/html/, visited URLs
  logged in crawl-state/visited.jsonl. Re-running skips completed fetches.

Outputs: content/*.md, pdfs/ + manifest.csv, images/ + images-manifest.csv,
announcements.json, news_events.json, faculty.json, institutes.json,
pages.json, inventory.csv.
"""

from __future__ import annotations

import csv
import hashlib
import json
import re
import sys
import time
import unicodedata
from collections import deque
from pathlib import Path
from urllib.parse import urljoin, urlsplit, unquote

import httpx
from bs4 import BeautifulSoup
from markdownify import markdownify as md

ROOT = Path(__file__).resolve().parent
CONTENT = ROOT / "content"
PDFS = ROOT / "pdfs"
IMAGES = ROOT / "images"
STATE = ROOT / "crawl-state"
HTML_CACHE = STATE / "html"
VISITED_LOG = STATE / "visited.jsonl"

BASE = "https://www.smbbmu.edu.pk/beta/"
HOST = "www.smbbmu.edu.pk"
UA = "Mozilla/5.0 (compatible; SMBBMU-Archiver/1.0; archival crawler; 1 req/s)"
RATE_SECONDS = 1.0
RETRIES = 3

ASSET_EXT = re.compile(
    r"\.(css|js|ico|woff2?|ttf|eot|svg|mp4|zip|docx?|xlsx?|pptx?)(\?|$)", re.I
)
IMG_EXT = re.compile(r"\.(jpe?g|png|gif|webp|bmp)(\?|$)", re.I)
PDF_EXT = re.compile(r"\.pdf(\?|$)", re.I)

STATIC_PAGE_SLUGS = [
    "about", "administration", "qec", "dme", "policies", "financialaids",
    "studentResources/index", "downloads", "contactus", "annualreport",
    "affiliated-colleges", "admissions/post-graduate",
]

SEEDS = (
    [""]
    + [f"announcements/{c}" for c in
       ("all", "admission", "examination", "notifications", "tender", "other")]
    + ["jobs", "newsandevents/events"]
    + [f"faculty/index/{c}" for c in
       ("basic", "medicine", "surgery", "community", "foreign", "dental")]
    + ["faculty", "alumni", "convocation"]
    + STATIC_PAGE_SLUGS
)

FACULTY_CATEGORIES = {"basic", "medicine", "surgery", "community", "foreign", "dental"}


# ----------------------------------------------------------------- helpers

def slugify(text: str) -> str:
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode()
    text = re.sub(r"[^a-zA-Z0-9]+", "-", text.strip().lower())
    return text.strip("-") or "unnamed"


def normalize(url: str, base: str = BASE) -> str | None:
    """Canonical page URL under /beta/, or None if out of scope."""
    if not url:
        return None
    url = url.strip().strip('"').strip("'")
    if url.startswith(("mailto:", "tel:", "javascript:", "#", "data:")):
        return None
    absu = urljoin(base, url)
    parts = urlsplit(absu)
    host = parts.netloc.lower()
    if host == "smbbmu.edu.pk":
        host = HOST
    if host != HOST:
        return None
    path = unquote(parts.path)
    path = re.sub(r"/{2,}", "/", path)
    if not path.startswith("/beta"):
        return None
    # /beta/index.php/foo == /beta/foo ; /beta/index.php == /beta/
    path = re.sub(r"^/beta/index\.php(/|$)", r"/beta/", path)
    path = re.sub(r"/{2,}", "/", path)
    path = path.rstrip()
    if path != "/beta/" and path.endswith("/"):
        path = path.rstrip("/")
    if path == "/beta":
        path = "/beta/"
    return f"https://{HOST}{path}"


def rel_path(url: str) -> str:
    """Path under /beta/ for the canonical URL ('' for home)."""
    return urlsplit(url).path[len("/beta/"):].strip("/")


def classify(url: str) -> str:
    p = rel_path(url)
    if p == "":
        return "home"
    if re.match(r"announcements/details/", p):
        return "announcement"
    if re.match(r"announcements(/|$)", p) or re.match(r"jobs(/\d+)?$", p):
        return "announcement_list"
    if re.match(r"news/details/", p):
        return "news"
    if re.match(r"newsandevents/events(/\d+)?$", p):
        return "events_list"
    if re.match(r"faculty(/|$)", p):
        return "faculty"
    if re.match(r"campuses/", p):
        return "campus"
    if re.match(r"news/downloadFile/", p):
        return "file"
    return "page"


def detect_date(soup: BeautifulSoup, url: str) -> str | None:
    meta = soup.select_one(".news-meta")
    if meta:
        m = re.search(r"([A-Z][a-z]{2}) (\d{1,2}), (\d{4})", meta.get_text(" ", strip=True))
        if m:
            months = {m_: i + 1 for i, m_ in enumerate(
                "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split())}
            mon = months.get(m.group(1))
            if mon:
                return f"{m.group(3)}-{mon:02d}-{int(m.group(2)):02d}"
    m = re.search(r"(\d{2})-(\d{2})-(\d{4})$", rel_path(url))
    if m:  # slugs end in MM-DD-YYYY
        return f"{m.group(3)}-{m.group(1)}-{m.group(2)}"
    return None


def cache_path(url: str) -> Path:
    return HTML_CACHE / (hashlib.sha1(url.encode()).hexdigest() + ".html")


# ----------------------------------------------------------------- fetcher

class Fetcher:
    def __init__(self):
        self.client = httpx.Client(
            headers={"User-Agent": UA}, timeout=30, follow_redirects=True
        )
        self.last_request = 0.0
        self.visited: dict[str, int] = {}       # url -> status
        self.failed: list[str] = []
        if VISITED_LOG.exists():
            for line in VISITED_LOG.read_text().splitlines():
                try:
                    rec = json.loads(line)
                    self.visited[rec["url"]] = rec["status"]
                except (json.JSONDecodeError, KeyError):
                    pass
        self._log = open(VISITED_LOG, "a")

    def _throttle(self):
        wait = self.last_request + RATE_SECONDS - time.time()
        if wait > 0:
            time.sleep(wait)
        self.last_request = time.time()

    def _record(self, url: str, status: int):
        self.visited[url] = status
        self._log.write(json.dumps({"url": url, "status": status}) + "\n")
        self._log.flush()

    def get(self, url: str) -> tuple[int, bytes | None]:
        """Fetch with retries; returns (status, content)."""
        for attempt in range(RETRIES):
            self._throttle()
            try:
                r = self.client.get(url)
                if r.status_code >= 500:
                    raise httpx.HTTPStatusError("server error", request=r.request, response=r)
                return r.status_code, r.content
            except Exception as exc:
                print(f"    retry {attempt + 1}/{RETRIES} for {url}: {exc}", flush=True)
                if attempt < RETRIES - 1:
                    time.sleep(2 ** (attempt + 1))
        return 0, None

    def get_page(self, url: str) -> tuple[int, str | None]:
        """HTML page with cache + resume. Returns (status, html)."""
        cp = cache_path(url)
        if url in self.visited and cp.exists():
            return self.visited[url], cp.read_text(encoding="utf-8", errors="replace")
        if url in self.visited and self.visited[url] != 200:
            return self.visited[url], None
        status, content = self.get(url)
        if content is not None and status == 200:
            cp.write_text(content.decode("utf-8", errors="replace"), encoding="utf-8")
        elif content is None:
            self.failed.append(url)
        self._record(url, status)
        html = content.decode("utf-8", errors="replace") if content is not None and status == 200 else None
        return status, html

    def download(self, url: str, dest: Path) -> tuple[int, int]:
        """Binary download, skipped if dest exists. Returns (status, bytes)."""
        if dest.exists() and dest.stat().st_size > 0:
            return 200, dest.stat().st_size
        if url in self.visited and self.visited[url] not in (200,):
            return self.visited[url], 0
        status, content = self.get(url)
        if status == 200 and content:
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_bytes(content)
            self._record(url, status)
            return status, len(content)
        if content is None:
            self.failed.append(url)
        self._record(url, status)
        return status, 0


# ------------------------------------------------------- content extraction

def strip_chrome(soup: BeautifulSoup) -> BeautifulSoup:
    """Remove scripts/styles/nav/footer, keep main content."""
    for tag in soup(["script", "style", "noscript", "iframe", "link", "meta"]):
        tag.decompose()
    for sel in ("header", "footer", ".navbar", ".footerWidgets", ".copyRights",
                ".dropdown-menu", "#drop-down-left", ".universityLogoA",
                ".topBar", ".nivoSlider", ".breadcrumb", ".headerStrip",
                "nav", ".mnMenu", ".websiteHeading"):
        for tag in soup.select(sel):
            tag.decompose()
    # in-page tab menus are javascript:; links with no standalone value
    for a in soup.select('a[href^="javascript"]'):
        a.decompose()
    # sidebar widgets ("Useful links" etc.)
    for h in soup.select("h1.title-widget"):
        parent = h.parent
        if parent:
            parent.decompose()
    return soup


def extract_main(soup: BeautifulSoup):
    """Best-effort main content element."""
    titles = soup.select("h1.page-title")
    if len(titles) > 1:  # listing page with one title per card
        return soup.body or soup
    pt = titles[0] if titles else None
    if pt is not None:
        for anc in pt.parents:
            if anc.name == "div" and ("introductionDetails" in (anc.get("class") or [])
                                      or anc.select_one(".news-body")):
                return anc
        return pt.parent or pt
    heads = soup.select("h1.glimpsesHeading")
    if heads:
        # smallest ancestor of the first heading that contains all of them
        node = heads[0].parent
        while node is not None and not all(h in node.descendants for h in heads[1:]):
            node = node.parent
        return node or soup.body or soup
    return soup.body or soup


def page_title(soup: BeautifulSoup) -> str:
    for sel in ("h1.page-title", "h1.glimpsesHeading"):
        el = soup.select_one(sel)
        if el and el.get_text(strip=True):
            return el.get_text(" ", strip=True)
    if soup.title and soup.title.string:
        return soup.title.string.strip()
    return ""


def to_markdown(el) -> str:
    text = md(str(el), heading_style="ATX", bullets="-")
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def save_markdown(url: str, ptype: str, title: str, date: str | None, body_md: str):
    rp = rel_path(url) or "index"
    parts = rp.split("/")
    # keep every path component under the filesystem's 255-byte limit
    parts = [p if len(p) <= 180 else
             p[:180] + "-" + hashlib.sha1(p.encode()).hexdigest()[:8]
             for p in parts]
    dest = CONTENT / ("/".join(parts) + ".md")
    dest.parent.mkdir(parents=True, exist_ok=True)
    fm = ["---", f"url: {url}", f'title: "{title.replace(chr(34), chr(39))}"',
          f"page_type: {ptype}"]
    if date:
        fm.append(f"date: {date}")
    fm.append("---")
    dest.write_text("\n".join(fm) + "\n\n" + body_md + "\n", encoding="utf-8")


# --------------------------------------------------------------- main crawl

def main():
    for d in (CONTENT, PDFS, IMAGES, STATE, HTML_CACHE,
              IMAGES / "slider", IMAGES / "faculty", IMAGES / "logos",
              IMAGES / "news", IMAGES / "attachments"):
        d.mkdir(parents=True, exist_ok=True)

    f = Fetcher()

    queue = deque()
    seen = set()
    for s in SEEDS:
        u = normalize(BASE + s)
        if u and u not in seen:
            seen.add(u)
            queue.append(u)

    inventory: dict[str, dict] = {}          # url -> row
    announcements: dict[str, dict] = {}
    news_events: dict[str, dict] = {}
    faculty: list[dict] = []
    faculty_seen = set()
    institutes: list[dict] = []
    static_pages: list[dict] = []
    pdf_manifest: list[dict] = []
    img_manifest: list[dict] = []
    ann_categories: dict[str, set] = {}      # announcement slug -> categories
    teacher_profile_urls = set()
    pdf_bytes = img_bytes = 0
    pdf_seen: dict[str, str] = {}            # url -> saved filename
    img_seen: dict[str, str] = {}

    def note_external(url: str):
        if url not in inventory:
            inventory[url] = {"url": url, "type": "external", "title": "",
                              "date": "", "status_code": ""}

    def uniquify(dest: Path, url: str) -> Path:
        if not dest.exists():
            return dest
        existing_src = next((r for r in pdf_manifest + img_manifest
                             if r["file"] == str(dest.relative_to(ROOT)) and r["original_url"] == url), None)
        if existing_src:
            return dest
        h = hashlib.sha1(url.encode()).hexdigest()[:8]
        return dest.with_name(dest.stem + "-" + h + dest.suffix)

    def grab_pdf(url: str, source_page: str) -> str | None:
        nonlocal pdf_bytes
        if url in pdf_seen:
            fname = pdf_seen[url]
            if not any(r["original_url"] == url and r["source_page"] == source_page
                       for r in pdf_manifest):
                pdf_manifest.append({"file": fname, "original_url": url,
                                     "source_page": source_page})
            return fname
        name = slugify(Path(unquote(urlsplit(url).path)).stem)[:120] + ".pdf"
        dest = uniquify(PDFS / name, url)
        status, size = f.download(url, dest)
        inventory[url] = {"url": url, "type": "pdf", "title": dest.name,
                          "date": "", "status_code": status}
        if status == 200:
            pdf_bytes += size
            rel = str(dest.relative_to(ROOT))
            pdf_seen[url] = rel
            pdf_manifest.append({"file": rel, "original_url": url,
                                 "source_page": source_page})
            return rel
        return None

    def grab_image(url: str, subdir: str, source_page: str,
                   name: str | None = None) -> str | None:
        nonlocal img_bytes
        if url in img_seen:
            rel = img_seen[url]
            if not any(r["original_url"] == url and r["source_page"] == source_page
                       for r in img_manifest):
                img_manifest.append({"file": rel, "original_url": url,
                                     "source_page": source_page})
            return rel
        upath = unquote(urlsplit(url).path)
        ext = Path(upath).suffix.lower() or ".jpg"
        base_name = name or slugify(Path(upath).stem)[:120]
        dest = uniquify(IMAGES / subdir / (base_name + ext), url)
        status, size = f.download(url, dest)
        inventory[url] = {"url": url, "type": "image", "title": dest.name,
                          "date": "", "status_code": status}
        if status == 200:
            img_bytes += size
            rel = str(dest.relative_to(ROOT))
            img_seen[url] = rel
            img_manifest.append({"file": rel, "original_url": url,
                                 "source_page": source_page})
            return rel
        return None

    def clean_asset_url(raw: str, base: str) -> str | None:
        if not raw:
            return None
        absu = urljoin(base, raw.strip())
        parts = urlsplit(absu)
        if parts.netloc.lower() not in (HOST, "smbbmu.edu.pk"):
            return None
        path = re.sub(r"/{2,}", "/", parts.path)
        return f"https://{HOST}{path}"

    n_pages = 0
    print(f"Starting crawl with {len(queue)} seeds", flush=True)

    while queue:
        url = queue.popleft()
        ptype = classify(url)
        if ptype == "file":
            continue  # downloadFile links handled as assets, not pages

        status, html = f.get_page(url)
        n_pages += 1
        if html is None:
            inventory[url] = {"url": url, "type": ptype, "title": "",
                              "date": "", "status_code": status or "FAILED"}
            print(f"[{n_pages}] {status or 'FAIL'} {url}", flush=True)
            continue

        soup = BeautifulSoup(html, "html.parser")
        title = page_title(soup)
        date = detect_date(soup, url)
        inventory[url] = {"url": url, "type": ptype, "title": title,
                          "date": date or "", "status_code": status}
        print(f"[{n_pages}] {status} {ptype:17s} {rel_path(url) or '/'}", flush=True)

        # ---- discover links -------------------------------------------
        for a in soup.find_all("a", href=True):
            href = a["href"].strip()
            norm = normalize(href, url)
            if norm is None:
                absu = urljoin(url, href)
                if absu.startswith("http") and HOST not in absu:
                    note_external(absu)
                continue
            sub = rel_path(norm)
            if PDF_EXT.search(sub) or "news/downloadFile/" in sub:
                if PDF_EXT.search(sub):
                    grab_pdf(norm, url)
                elif IMG_EXT.search(sub):
                    grab_image(norm, "attachments", url)
                else:  # downloadFile without recognizable ext: treat as pdf
                    grab_pdf(norm, url)
                continue
            if IMG_EXT.search(sub):
                # full-size gallery images linked from news pages
                if "uploads/" in sub:
                    grab_image(norm, "news", url)
                continue
            if ASSET_EXT.search(sub):
                continue
            if norm not in seen:
                seen.add(norm)
                queue.append(norm)

        # track announcement categories from listing pages; scope to the main
        # listing table so the "latest announcements" sidebar (present on
        # every page) doesn't tag items with every category
        if ptype == "announcement_list":
            m = re.match(r"(announcements/(\w+)|jobs)", rel_path(url))
            cat = "jobs" if rel_path(url).startswith("jobs") else m.group(2)
            listing = extract_main(soup)
            for a in listing.select('a[href*="announcements/details/"]'):
                norm = normalize(a["href"], url)
                if norm:
                    slug = rel_path(norm).split("/")[-1]
                    ann_categories.setdefault(slug, set()).add(cat)

        # ---- images on this page --------------------------------------
        if ptype == "home":
            for img in soup.select(".nivoSlider img[src]"):
                u = clean_asset_url(img["src"], url)
                if u:
                    grab_image(u, "slider", url)
            # university logo
            logo = clean_asset_url("/beta/images/logo.png", url)
            grab_image(logo, "logos", url, name="logo")
            # institute logos from inline CSS + institueBox divs
            css = " ".join(s.get_text() for s in soup.find_all("style"))
            logo_map = {}
            for cls, bg in re.findall(
                    r"\.(institueBox|gmc|badc|bcon|pharmacy|physiotherapy)\s*{[^}]*?"
                    r"background-image\s*:\s*url\(([^)]+)\)", css):
                logo_map["cmc" if cls == "institueBox" else cls] = bg.strip()
            # institute names from the nav menu
            nav_names = {}
            for a in soup.select("li a[href]"):
                t = a.get_text(" ", strip=True)
                if t and ("College" in t or "Institute" in t or "Pharmacy" in t):
                    nav_names[normalize(a["href"], url) or a["href"].strip()] = t
            for box in soup.select(".institueBox"):
                classes = [c for c in box.get("class", []) if c != "institueBox"]
                key = classes[0] if classes else "cmc"
                link = box.find("a", href=True)
                href = link["href"].strip() if link else ""
                internal = normalize(href, url)
                target = internal or href
                name = nav_names.get(target, key)
                logo_file = None
                if key in logo_map:
                    lu = clean_asset_url(logo_map[key], url)
                    if lu:
                        logo_file = grab_image(lu, "logos", url, name=slugify(name))
                city = "Sukkur" if "Sukkur" in name else "Larkana"
                institutes.append({
                    "name": name,
                    "city": city,
                    "description": "",
                    "logo": Path(logo_file).name if logo_file else None,
                    "external_url": None if internal else href,
                    "page_url": internal,
                })

        if ptype == "campus":
            campus_name = title or rel_path(url).split("/")[-1]
            tf = soup.select_one("#teachingFacultyContent") or soup
            for prof in tf.select(".teacherProfile"):
                name_el = prof.select_one(".page-title a") or prof.select_one(".page-title")
                if not name_el:
                    continue
                name = name_el.get_text(" ", strip=True)
                desig_el = prof.select_one(".news-summary p")
                designation = desig_el.get_text(" ", strip=True) if desig_el else ""
                link = name_el.get("href")
                if link:
                    n = normalize(link, url)
                    if n:
                        teacher_profile_urls.add(n)
                photo_file = None
                img = prof.select_one("img[src]")
                if img and "no-image" not in img["src"]:
                    u = clean_asset_url(img["src"], url)
                    if u:
                        photo_file = grab_image(u, "faculty", url, name=slugify(name))
                key = ("campus", campus_name, name)
                if key not in faculty_seen:
                    faculty_seen.add(key)
                    faculty.append({
                        "name": name,
                        "designation": designation,
                        "department": campus_name,
                        "category": "campus:" + (rel_path(url).split("/")[-1]),
                        "qualifications": None,
                        "photo": Path(photo_file).name if photo_file else None,
                        "source_url": url,
                    })
            # head-of-department photo also counts as a faculty photo
            hod = soup.select_one("img.hodPhoto[src]")
            if hod and "no-image" not in hod["src"]:
                u = clean_asset_url(hod["src"], url)
                if u and u not in img_seen:
                    grab_image(u, "faculty", url,
                               name=slugify(campus_name) + "-hod")

        if ptype == "news" or ptype == "announcement":
            for img in soup.select(".news-body img[src], .news-featured-image img[src]"):
                src = img["src"]
                if "uploads/" in src:
                    u = clean_asset_url(src, url)
                    if u:
                        grab_image(u, "news", url)

        # ---- structured extraction -------------------------------------
        if ptype == "announcement":
            slug = rel_path(url).split("/")[-1]
            body = soup.select_one(".news-body")
            pdf_links = []
            if body:
                for a in body.find_all("a", href=True):
                    n = normalize(a["href"], url)
                    if n and (PDF_EXT.search(n) or
                              ("news/downloadFile/" in n and not IMG_EXT.search(n))):
                        pdf_links.append(n)
            announcements[slug] = {
                "title": title,
                "slug": slug,
                "category": None,       # resolved after all listings are seen
                "categories": None,
                "date": date,
                "body": body.get_text("\n", strip=True) if body else "",
                "pdf_links": pdf_links,
                "source_url": url,
            }

        if ptype == "news":
            slug = rel_path(url).split("/")[-1]
            body = soup.select_one(".news-body")
            imgs = []
            for img in soup.select(".news-body img[src], .news-featured-image img[src]"):
                if "uploads/" in img["src"]:
                    u = clean_asset_url(img["src"], url)
                    if u:
                        imgs.append(u)
            news_events[slug] = {
                "title": title,
                "slug": slug,
                "date": date,
                "body": body.get_text("\n", strip=True) if body else "",
                "images": imgs,
                "source_url": url,
            }

        if ptype == "faculty" and rel_path(url).split("/")[-1] in FACULTY_CATEGORIES:
            cat = rel_path(url).split("/")[-1]
            main = extract_main(soup)
            dept = None
            for el in main.find_all(["h1", "table"]):
                if el.name == "h1":
                    dept = el.get_text(" ", strip=True)
                    continue
                for tr in el.find_all("tr"):
                    cells = [td.get_text(" ", strip=True) for td in tr.find_all("td")]
                    if not cells or not cells[0]:
                        continue
                    if cells[0].upper() in ("TITLE", "NAME", "S#"):
                        continue
                    name = cells[0]
                    designation = cells[1] if len(cells) > 1 else ""
                    qual = cells[2] if len(cells) > 2 else None
                    if qual:
                        qual = qual.strip() or None
                    key = (cat, dept, name)
                    if key in faculty_seen:
                        continue
                    faculty_seen.add(key)
                    faculty.append({
                        "name": name,
                        "designation": designation,
                        "department": dept,
                        "category": cat,
                        "qualifications": qual,
                        "photo": None,
                        "source_url": url,
                    })

        # ---- markdown --------------------------------------------------
        main = (soup.body or soup) if ptype == "home" else extract_main(soup)
        cleaned = strip_chrome(BeautifulSoup(str(main), "html.parser"))
        body_md = to_markdown(cleaned)
        save_markdown(url, ptype, title, date, body_md)

        if rel_path(url) in STATIC_PAGE_SLUGS:
            static_pages.append({
                "slug": rel_path(url),
                "title": title,
                "body": body_md,
                "source_url": url,
            })

    # fill institute descriptions from their campus pages
    for inst in institutes:
        if inst.get("page_url"):
            cp = cache_path(inst["page_url"])
            if cp.exists():
                s = BeautifulSoup(cp.read_text(encoding="utf-8", errors="replace"),
                                  "html.parser")
                intro = s.select_one("#introductionContent") or s.select_one(".news-body")
                if intro:
                    inst["description"] = intro.get_text(" ", strip=True)[:800]
        inst.pop("page_url", None)

    # exclude teacher-profile pages that live under /news/details/
    for u in teacher_profile_urls:
        news_events.pop(rel_path(u).split("/")[-1], None)

    # the site mirrors every announcement under /news/details/ too —
    # keep those in announcements.json only
    for slug in list(news_events):
        if slug in announcements:
            del news_events[slug]

    # resolve announcement categories now that every listing page is parsed
    for slug, rec in announcements.items():
        cats = sorted(ann_categories.get(slug, set()))
        rec["categories"] = cats or ["all"]
        rec["category"] = next((c for c in cats if c != "all"), "all")

    # ------------------------------------------------------------- outputs
    def dump(name, obj):
        (ROOT / name).write_text(
            json.dumps(obj, indent=2, ensure_ascii=False), encoding="utf-8")

    dump("announcements.json", sorted(announcements.values(),
         key=lambda r: r["date"] or "", reverse=True))
    dump("news_events.json", sorted(news_events.values(),
         key=lambda r: r["date"] or "", reverse=True))
    dump("faculty.json", faculty)
    dump("institutes.json", institutes)
    dump("pages.json", static_pages)

    with open(ROOT / "pdfs" / "manifest.csv", "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=["file", "original_url", "source_page"])
        w.writeheader()
        w.writerows(pdf_manifest)

    with open(ROOT / "images-manifest.csv", "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=["file", "original_url", "source_page"])
        w.writeheader()
        w.writerows(img_manifest)

    with open(ROOT / "inventory.csv", "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=["url", "type", "title", "date", "status_code"])
        w.writeheader()
        w.writerows(inventory.values())

    n_pdf_ok = len({r["original_url"] for r in pdf_manifest})
    n_img_ok = len({r["original_url"] for r in img_manifest})
    failed = sorted(set(f.failed))

    print("\n" + "=" * 60)
    print("CRAWL SUMMARY")
    print("=" * 60)
    print(f"Pages crawled:        {n_pages}")
    print(f"PDFs downloaded:      {n_pdf_ok}  ({pdf_bytes / 1e6:.1f} MB)")
    print(f"Images downloaded:    {n_img_ok}  ({img_bytes / 1e6:.1f} MB)")
    print(f"announcements.json:   {len(announcements)} records")
    print(f"news_events.json:     {len(news_events)} records")
    print(f"faculty.json:         {len(faculty)} records")
    print(f"institutes.json:      {len(institutes)} records")
    print(f"pages.json:           {len(static_pages)} records")
    print(f"inventory.csv:        {len(inventory)} URLs")
    if failed:
        print(f"\nFAILED after {RETRIES} retries ({len(failed)}):")
        for u in failed:
            print(f"  {u}")
    else:
        print("\nNo URLs failed after retries.")


if __name__ == "__main__":
    sys.exit(main())
