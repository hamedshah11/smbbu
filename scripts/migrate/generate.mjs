// Generates idempotent SQL + a storage upload plan from migration-input/.
// Pure/offline: parses local files, writes scripts/migrate/out/*.sql,
// scripts/migrate/upload-plan.json, and migration-review.csv. No network.
import fs from "node:fs";
import path from "node:path";
import {
  INPUT_DIR, OUT_DIR, pub, readJson, slugify, q, qNN, qJson, qInt, qTs,
  parseDate, excerpt, normName, numericId, basenameFromUrl, Review, writeSql,
} from "./lib.mjs";

const review = new Review();
const uploadPlan = []; // { localPath, bucket, key }
const planned = new Set();
function plan(localRel, bucket, key) {
  const localPath = path.join(INPUT_DIR, localRel);
  if (!fs.existsSync(localPath)) return false;
  const tag = `${bucket}:${key}`;
  if (!planned.has(tag)) {
    planned.add(tag);
    uploadPlan.push({ localPath: path.relative(process.cwd(), localPath), bucket, key });
  }
  return true;
}

// ---- PDF resolution index -------------------------------------------------
const pdfFiles = fs.readdirSync(path.join(INPUT_DIR, "pdfs"));
const pdfByNorm = new Map(pdfFiles.map((f) => [normName(f), f]));
const pdfById = new Map();
for (const f of pdfFiles) {
  const id = numericId(f);
  if (id) pdfById.set(id, f);
}
function resolvePdf(url) {
  const base = basenameFromUrl(url);
  if (!/\.pdf$/i.test(base)) return null; // xlsx/docx etc. not in pdfs/
  let file = pdfByNorm.get(normName(base));
  if (!file) {
    const id = numericId(base);
    if (id) file = pdfById.get(id);
  }
  if (!file) return null;
  const sizeKb = Math.max(1, Math.round(fs.statSync(path.join(INPUT_DIR, "pdfs", file)).size / 1024));
  return { file, url: pub("pdfs", file), size_kb: sizeKb };
}
function niceName(file) {
  return file
    .replace(/\.pdf$/i, "")
    .replace(/[-_]?\d{8,}\d*$/, "")
    .replace(/[-_+]+/g, " ")
    .replace(/\s+/g, " ")
    .trim()
    .replace(/\b\w/g, (c) => c.toUpperCase()) + ".pdf";
}
// Upload every PDF in pdfs/ (task: "upload all of pdfs/").
for (const f of pdfFiles) plan(`pdfs/${f}`, "pdfs", f);

// ---- Image manifest (original_url -> local file) --------------------------
const manifest = new Map();
{
  const raw = fs.readFileSync(path.join(INPUT_DIR, "images-manifest.csv"), "utf8").split(/\r?\n/);
  raw.shift();
  for (const line of raw) {
    if (!line) continue;
    const i1 = line.indexOf(",");
    const i2 = line.indexOf(",", i1 + 1);
    const file = line.slice(0, i1);
    const url = line.slice(i1 + 1, i2 >= 0 ? i2 : undefined);
    if (url && !manifest.has(url)) manifest.set(url, file);
  }
}
function resolveImage(url, expectDir) {
  const localRel = manifest.get(url);
  if (localRel && fs.existsSync(path.join(INPUT_DIR, localRel))) {
    return localRel; // e.g. images/news/xxxx.jpg
  }
  // fallback: basename in the expected dir
  const base = basenameFromUrl(url);
  if (expectDir && fs.existsSync(path.join(INPUT_DIR, "images", expectDir, base))) {
    return `images/${expectDir}/${base}`;
  }
  return null;
}

// ---- Body PDF-link rewriting ---------------------------------------------
function rewriteBody(body) {
  if (!body) return body;
  return body.replace(/https?:\/\/[^\s)"']+\.pdf/gi, (m) => {
    const r = resolvePdf(m);
    return r ? r.url : m;
  });
}

// ==========================================================================
// INSTITUTES
// ==========================================================================
const INSTITUTE_CODES = {
  "chandka-medical-college-larkana": "CMC",
  "ghulam-muhammad-mahar-medical-college-sukkur": "GMMMC",
  "bibi-aseefa-dental-college-larkana": "BADC",
  "benazir-college-of-nursing": "BCON",
  "institute-of-pharmacy": "IOP",
  "institute-of-physiotherapy-and-rehabilitation-sciences": "IPRS",
};
function instituteCode(name, slug) {
  if (INSTITUTE_CODES[slug]) return INSTITUTE_CODES[slug];
  return name
    .split(/\s+/)
    .filter((w) => !/^(of|and|the|&|larkana|sukkur)$/i.test(w))
    .map((w) => w[0])
    .join("")
    .toUpperCase()
    .slice(0, 6);
}
const institutesRaw = readJson("institutes.json");
const instituteSlugs = [];
const instituteRows = institutesRaw.map((it, i) => {
  const slug = slugify(it.name);
  instituteSlugs.push({ slug, name: it.name });
  let logoUrl = "NULL";
  if (it.logo && plan(`images/logos/${it.logo}`, "images", `logos/${it.logo}`)) {
    logoUrl = q(pub("images", `logos/${it.logo}`));
  } else if (it.logo) {
    review.add("institute", slug, "logo file missing", it.logo);
  }
  const city = it.city || "";
  return `(${qNN(it.name)}, ${qNN(instituteCode(it.name, slug))}, ${qNN(slug)}, ${qNN(city)}, ${qNN(it.description || "")}, ${q(it.external_url || null)}, ${logoUrl}, true, ${qInt(i + 1)})`;
});
writeSql(
  "01_institutes.sql",
  `insert into institutes (name, code, slug, city, description, website_url, logo_url, is_constituent, sort_order) values\n` +
    instituteRows.join(",\n") +
    `\non conflict (slug) do update set name=excluded.name, city=excluded.city, description=excluded.description, website_url=excluded.website_url, logo_url=excluded.logo_url, sort_order=excluded.sort_order;\n`,
);

// Resolve a faculty campus category to an institute slug by token overlap.
function resolveInstituteSlug(category) {
  if (!category || !category.startsWith("campus:")) return null;
  const tokens = category.replace("campus:", "").split("-").filter((t) => t.length > 3);
  let best = null, score = 0;
  for (const { slug } of instituteSlugs) {
    const it = slug.split("-");
    const ov = tokens.filter((t) => it.includes(t)).length;
    if (ov > score) { score = ov; best = slug; }
  }
  return score > 0 ? best : null;
}

// ==========================================================================
// FACULTY
// ==========================================================================
const facultyRaw = readJson("faculty.json");
const facultyFiles = new Set(fs.readdirSync(path.join(INPUT_DIR, "images/faculty")));
let facultyPhotos = 0, facultyMissingPhotos = 0, facultyLinked = 0;
const seenFacultySlug = new Map();
const facultyRows = facultyRaw.map((f, i) => {
  let baseSlug = slugify(f.name) || `faculty-${i}`;
  const n = seenFacultySlug.get(baseSlug) || 0;
  seenFacultySlug.set(baseSlug, n + 1);
  const slug = n === 0 ? baseSlug : `${baseSlug}-${n + 1}`;

  let photoUrl = "NULL";
  if (f.photo && facultyFiles.has(f.photo) && plan(`images/faculty/${f.photo}`, "images", `faculty/${f.photo}`)) {
    photoUrl = q(pub("images", `faculty/${f.photo}`));
    facultyPhotos++;
  } else {
    facultyMissingPhotos++;
    if (f.photo) review.add("faculty", slug, "photo file missing", f.photo);
  }

  const instSlug = resolveInstituteSlug(f.category);
  if (instSlug) facultyLinked++;
  const instituteId = instSlug
    ? `(select id from institutes where slug=${q(instSlug)})`
    : "NULL";

  const dept = f.department || (f.category ? f.category.replace(/^campus:/, "") : "General");
  // faculty schema has no slug column; the truncate-then-insert makes plain inserts safe.
  return `(${qNN(f.name)}, ${qNN(f.designation || "Faculty Member")}, ${qNN(dept)}, ${instituteId}, ${photoUrl}, ${qInt(i + 1)})`;
});
writeSql(
  "02_faculty.sql",
  `insert into faculty (name, designation, department, institute_id, photo_url, sort_order) values\n` +
    facultyRows.join(",\n") + ";\n",
);

// ==========================================================================
// ANNOUNCEMENTS
// ==========================================================================
const CAT_MAP = {
  jobs: "job",
  job: "job",
  notifications: "circular",
  notification: "circular",
  examination: "examination",
  exam: "examination",
  tender: "tender",
  admission: "admission",
  admissions: "admission",
  all: "circular",
};
const annRaw = readJson("announcements.json");
const usedSlugs = new Set();
let annStats = { total: 0, withPdf: 0, attachments: 0, badDate: 0, unmappedCat: 0 };

function uniqueSlug(s) {
  let slug = s || "notice";
  let base = slug, k = 2;
  while (usedSlugs.has(slug)) slug = `${base}-${k++}`;
  usedSlugs.add(slug);
  return slug;
}

const annRows = [];
for (const a of annRaw) {
  const rawCat = (a.category || "").toLowerCase();
  let cat = CAT_MAP[rawCat];
  if (!cat) { cat = "circular"; annStats.unmappedCat++; review.add("announcement", a.slug || a.title, "unmapped category -> circular", a.category); }
  const slug = uniqueSlug(a.slug ? slugify(a.slug) : slugify(a.title));
  const published = parseDate(a.date);
  if (!published) { annStats.badDate++; review.add("announcement", slug, "unparseable date", a.date); }

  const attachments = [];
  for (const link of a.pdf_links || []) {
    const r = resolvePdf(link);
    if (r) attachments.push({ name: niceName(r.file), url: r.url, size_kb: r.size_kb });
    else review.add("announcement", slug, "attachment not resolved to local PDF", basenameFromUrl(link));
  }
  if (attachments.length) { annStats.withPdf++; annStats.attachments += attachments.length; }

  const body = rewriteBody(a.body || "");
  annRows.push(
    `(${q(a.title)}, ${q(slug)}, ${q(cat)}::announcement_category, ${q(excerpt(body))}, ${q(body)}, ${qTs(published)}, ${qJson(attachments)})`,
  );
  annStats.total++;
}

// ==========================================================================
// NEWS & EVENTS  (into announcements as news/event)
// ==========================================================================
const EVENT_WORDS = /\b(camp|ceremon|convocation|drive|celebrat|walk|seminar|conference|workshop|festival|day|sports|gala|visit|distribution|inaugurat)/i;
const neRaw = readJson("news_events.json");
let neStats = { total: 0, news: 0, event: 0, withImg: 0, missingImg: 0 };
for (const a of neRaw) {
  const slug = uniqueSlug(a.slug ? slugify(a.slug) : slugify(a.title));
  const published = parseDate(a.date);
  if (!published) review.add("news_event", slug, "unparseable date", a.date);
  const isEvent = EVENT_WORDS.test(`${a.title} ${a.body || ""}`);
  const cat = isEvent ? "event" : "news";
  isEvent ? neStats.event++ : neStats.news++;

  let photoUrl = null;
  const imgs = a.images || [];
  for (const u of imgs) {
    const localRel = resolveImage(u, "news");
    if (localRel) {
      const base = path.basename(localRel);
      plan(localRel, "images", `news/${base}`);
      if (!photoUrl) photoUrl = pub("images", `news/${base}`);
    }
  }
  if (imgs.length && !photoUrl) { neStats.missingImg++; review.add("news_event", slug, "images present but none resolved", `${imgs.length} refs`); }
  if (photoUrl) neStats.withImg++;

  const body = rewriteBody(a.body || "");
  annRows.push(
    `(${q(a.title)}, ${q(slug)}, ${q(cat)}::announcement_category, ${q(excerpt(body))}, ${q(body)}, ${qTs(published)}, ${qJson([])}, ${q(photoUrl)})`,
  );
  neStats.total++;
}

// Emit announcements + news/events uniformly (full column set) in one pass.
function annTuple({ title, slug, cat, body, published, attachments, photoUrl }) {
  return `(${qNN(title)}, ${qNN(slug)}, ${q(cat)}::announcement_category, ${q(excerpt(body))}, ${qNN(body)}, ${qTs(published)}, ${qJson(attachments || [])}, ${q(photoUrl || null)})`;
}
const allAnn = [];
usedSlugs.clear();
for (const a of annRaw) {
  const rawCat = (a.category || "").toLowerCase();
  const cat = CAT_MAP[rawCat] || "circular";
  const slug = uniqueSlug(a.slug ? slugify(a.slug) : slugify(a.title));
  const published = parseDate(a.date);
  const attachments = [];
  for (const link of a.pdf_links || []) {
    const r = resolvePdf(link);
    if (r) attachments.push({ name: niceName(r.file), url: r.url, size_kb: r.size_kb });
  }
  allAnn.push(annTuple({ title: a.title, slug, cat, body: rewriteBody(a.body || ""), published, attachments, photoUrl: null }));
}
for (const a of neRaw) {
  const slug = uniqueSlug(a.slug ? slugify(a.slug) : slugify(a.title));
  const published = parseDate(a.date);
  const isEvent = EVENT_WORDS.test(`${a.title} ${a.body || ""}`);
  const cat = isEvent ? "event" : "news";
  let photoUrl = null;
  for (const u of a.images || []) {
    const localRel = resolveImage(u, "news");
    if (localRel && !photoUrl) photoUrl = pub("images", `news/${path.basename(localRel)}`);
  }
  allAnn.push(annTuple({ title: a.title, slug, cat, body: rewriteBody(a.body || ""), published, attachments: [], photoUrl }));
}

const COLS = "insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values\n";
const TAIL =
  "\non conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;\n";
const BATCH = 120;
let fileNo = 0;
for (let i = 0; i < allAnn.length; i += BATCH) {
  const chunk = allAnn.slice(i, i + BATCH);
  writeSql(`03_announcements_${String(fileNo).padStart(2, "0")}.sql`, COLS + chunk.join(",\n") + TAIL);
  fileNo++;
}

// ==========================================================================
// PAGES
// ==========================================================================
const SLUG_MAP = {
  about: "the-university",
  qec: "quality-enhancement-cell",
  dme: "directorate-of-medical-education",
  administration: "administration",
  financialaids: "scholarship-financial-aid-policy",
  policies: "policies-page",
  "studentResources/index": "student-resources",
  downloads: "downloads-page",
  contactus: "contact-page",
  annualreport: "annual-report",
  "affiliated-colleges": "affiliated-colleges",
  "admissions/post-graduate": "postgraduate-admissions",
};
const CONTACT_META = {
  "quality-enhancement-cell": { email: "qec@smbbmu.edu.pk", phone: "+92 74 9410 703 · EXT 188", location: "Admin Block, Main Campus, Larkana" },
  "directorate-of-medical-education": { email: "dme@smbbmu.edu.pk", phone: "+92 74 9410 703 · EXT 192", location: "Academic Block, Main Campus, Larkana" },
};
const pagesRaw = readJson("pages.json");
const pageSlugs = new Set();
const pageRows = [];
let pageStats = 0;
for (const p of pagesRaw) {
  const slug = SLUG_MAP[p.slug] || slugify(p.slug.replace(/\//g, "-"));
  if (pageSlugs.has(slug)) { review.add("page", slug, "duplicate slug skipped", p.slug); continue; }
  pageSlugs.add(slug);
  const body = rewriteBody(p.body || "");
  const meta = CONTACT_META[slug] ? { contact: CONTACT_META[slug] } : {};
  const standfirst = excerpt(body.replace(/^#.*$/m, ""), 220);
  pageRows.push(`(${qNN(slug)}, ${qNN(p.title || slug)}, ${q(standfirst)}, ${qNN(body)}, ${qJson(meta)})`);
  pageStats++;
}
writeSql(
  "04_pages.sql",
  `insert into pages (slug, title, standfirst, body, meta) values\n` +
    pageRows.join(",\n") +
    `\non conflict (slug) do update set title=excluded.title, standfirst=excluded.standfirst, body=excluded.body, meta=excluded.meta;\n`,
);

// ==========================================================================
// SLIDER  → images bucket under hero/
// ==========================================================================
let sliderCount = 0;
for (const f of fs.readdirSync(path.join(INPUT_DIR, "images/slider"))) {
  if (plan(`images/slider/${f}`, "images", `hero/${f}`)) sliderCount++;
}

// ==========================================================================
// TRUNCATE (run first)
// ==========================================================================
writeSql(
  "00_truncate.sql",
  `truncate announcements, faculty, institutes, pages, downloads restart identity cascade;\n`,
);

// ---- Upload plan + review + summary --------------------------------------
fs.writeFileSync(path.join(OUT_DIR, "upload-plan.json"), JSON.stringify(uploadPlan, null, 0));
const reviewCount = review.write();

const byBucket = uploadPlan.reduce((acc, u) => {
  const k = u.key.split("/")[0].includes(".") ? u.bucket : `${u.bucket}/${u.key.split("/")[0]}`;
  acc[k] = (acc[k] || 0) + 1;
  return acc;
}, {});

const summary = {
  institutes: instituteRows.length,
  faculty: facultyRaw.length,
  faculty_photos_set: facultyPhotos,
  faculty_linked_to_institute: facultyLinked,
  announcements_from_announcements: annRaw.length,
  announcements_from_news_events: neRaw.length,
  announcements_total: allAnn.length,
  news_classified: neStats.news,
  event_classified: neStats.event,
  attachments_resolved: annStats.attachments,
  pages: pageStats,
  slider_hero: sliderCount,
  upload_plan_total: uploadPlan.length,
  upload_by_group: byBucket,
  review_rows: reviewCount,
  sql_batches: fileNo,
};
fs.writeFileSync(path.join(OUT_DIR, "summary.json"), JSON.stringify(summary, null, 2));
console.log(JSON.stringify(summary, null, 2));
