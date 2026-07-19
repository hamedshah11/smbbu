// Generates idempotent SQL + a storage upload plan from migration-input/.
// Pure/offline: parses local files, writes scripts/migrate/out/*.sql,
// scripts/migrate/upload-plan.json, and migration-review.csv. No network.
import fs from "node:fs";
import path from "node:path";
import {
  INPUT_DIR, OUT_DIR, pub, readJson, slugify, q, qNN, qJson, qInt, qTs,
  parseDate, excerpt, normName, numericId, basenameFromUrl, Review, writeSql,
} from "./lib.mjs";

// Clean stale outputs first: the combined migration.sql globs every numbered
// .sql file in out/, so leftovers from a previous run (e.g. with a different
// batch size) would duplicate rows in it.
if (fs.existsSync(OUT_DIR)) {
  for (const f of fs.readdirSync(OUT_DIR)) {
    if (/^\d.*\.sql$/.test(f)) fs.unlinkSync(path.join(OUT_DIR, f));
  }
}

const review = new Review();
// Structured rows mirroring the SQL output, for the REST-based applier
// (scripts/migrate/finish.mjs) which works over HTTPS only.
const rowsOut = { institutes: [], faculty: [], announcements: [], pages: [], downloads: [] };
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
  rowsOut.institutes.push({
    name: it.name,
    code: instituteCode(it.name, slug),
    slug,
    city,
    description: it.description || "",
    website_url: it.external_url || null,
    logo_url: logoUrl === "NULL" ? null : pub("images", `logos/${it.logo}`),
    is_constituent: true,
    sort_order: i + 1,
  });
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
  rowsOut.faculty.push({
    name: f.name,
    designation: f.designation || "Faculty Member",
    department: dept,
    institute_slug: instSlug || null,
    photo_url: photoUrl === "NULL" ? null : pub("images", `faculty/${f.photo}`),
    sort_order: i + 1,
  });
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
  // "all" is intentionally absent — those are re-derived from the title below.
};

// Re-derive a category from the notice title (first match wins, case-insensitive).
// The source site's own categories are unreliable (e.g. a fees challan tagged
// "jobs", admission interviews tagged "examination"), so the title classifier
// runs on EVERY record; the source category is only a fallback when no rule
// matches. Rule ordering per editorial review:
//   1. result / time table          → examination (always wins)
//   2. "notice inviting tender"     → tender (strong phrase; a NIT for the
//      examination department or for prospectus printing is still a tender)
//   3. admission phrases            → admission ("for admission to" outranks
//      "interview"; "entry test" can't be preceded by "result of" here because
//      rule 1 already captured any "result …" title)
//   4. tender terms                 → tender
//   5. remaining examination terms  → examination (after tender, so tenders
//      *about* the examination department don't land here)
//   6. job terms                    → job ("interview" only reaches this rule
//      when there was no admission context above)
//   7. circular terms               → circular
const TITLE_RULES = [
  ["examination", /result|time ?table/i],
  ["tender", /notice inviting tender/i],
  ["admission", /for admission to|admission|entry test|merit list|prospectus|eligibility/i],
  ["tender", /tender|pre-?qualification|bid|quotation/i],
  ["examination", /examination|supplementary|ospe|osce|practical|viva|date sheet/i],
  ["job", /\bjobs?\b|appointment|interview|vacanc|recruitment|walk-?in/i],
  ["circular", /notification|office order|circular|notice|calendar/i],
];
function classifyByTitle(title) {
  for (const [cat, re] of TITLE_RULES) if (re.test(title || "")) return { cat, matched: true };
  return { cat: "circular", matched: false };
}
const classifyReport = {
  byTitle: {},          // final category counts for title-matched records
  sourceOverrides: [],  // title verdict disagreed with an explicit source category
  sourceFallback: {},   // unmatched title, kept explicit source category
  unmatched: [],        // unmatched title AND no usable source category → circular
};
function mapCategory(rawCat, title) {
  const rc = (rawCat || "").toLowerCase();
  const sourceCat = CAT_MAP[rc] || null;
  const { cat, matched } = classifyByTitle(title);
  if (matched) {
    classifyReport.byTitle[cat] = (classifyReport.byTitle[cat] || 0) + 1;
    if (sourceCat && sourceCat !== cat) {
      classifyReport.sourceOverrides.push({ title, from: sourceCat, to: cat });
    }
    return cat;
  }
  if (sourceCat) {
    classifyReport.sourceFallback[sourceCat] = (classifyReport.sourceFallback[sourceCat] || 0) + 1;
    return sourceCat;
  }
  classifyReport.unmatched.push(title);
  return "circular";
}
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

function annTuple({ title, slug, cat, body, published, attachments, photoUrl }) {
  rowsOut.announcements.push({
    title,
    slug,
    category: cat,
    excerpt: excerpt(body),
    body,
    published_at: published,
    attachments: attachments || [],
    photo_url: photoUrl || null,
  });
  return `(${qNN(title)}, ${qNN(slug)}, ${q(cat)}::announcement_category, ${q(excerpt(body))}, ${qNN(body)}, ${qTs(published)}, ${qJson(attachments || [])}, ${q(photoUrl || null)})`;
}

// Single authoritative pass over announcements → SQL + stats + review.
const allAnn = [];
const catCounts = {};
for (const a of annRaw) {
  const cat = mapCategory(a.category, a.title);
  catCounts[cat] = (catCounts[cat] || 0) + 1;
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
  allAnn.push(annTuple({ title: a.title, slug, cat, body: rewriteBody(a.body || ""), published, attachments, photoUrl: null }));
  annStats.total++;
}

// News & events → same table as news/event, images from images/news + slider.
const EVENT_WORDS = /\b(camp|ceremon|convocation|drive|celebrat|walk|seminar|conference|workshop|festival|day|sports|gala|visit|distribution|inaugurat)/i;
const neRaw = readJson("news_events.json");
const neStats = { total: 0, news: 0, event: 0, withImg: 0, missingImg: 0 };
for (const a of neRaw) {
  const slug = uniqueSlug(a.slug ? slugify(a.slug) : slugify(a.title));
  const published = parseDate(a.date);
  if (!published) review.add("news_event", slug, "unparseable date", a.date);
  const isEvent = EVENT_WORDS.test(`${a.title} ${a.body || ""}`);
  const cat = isEvent ? "event" : "news";
  isEvent ? neStats.event++ : neStats.news++;
  catCounts[cat] = (catCounts[cat] || 0) + 1;

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

  allAnn.push(annTuple({ title: a.title, slug, cat, body: rewriteBody(a.body || ""), published, attachments: [], photoUrl }));
  neStats.total++;
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
  rowsOut.pages.push({ slug, title: p.title || slug, standfirst, body, meta });
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
// DOWNLOADS  (from the scraped downloads-page table — the curated source)
// ==========================================================================
function downloadCategory(title) {
  const t = title.toLowerCase();
  if (/challan|fee/.test(t)) return "Fee Challans";
  if (/plagiarism|turnitin|policy|criteria|standard operat|procedure/.test(t)) return "Policies";
  if (/manual|quality assurance|performance evaluation|self assessment|assessment standard/.test(t)) return "Quality Assurance";
  if (/prospectus|admission|entry test/.test(t)) return "Admissions";
  if (/log ?book|curriculum|syllabus/.test(t)) return "Academics";
  if (/form|application|proforma|questionnaire|survey|evaluation|review|resume|report/.test(t)) return "Forms & Proformas";
  return "General";
}
const downloadStats = { total: 0, byCategory: {}, unresolved: 0 };
{
  const dlPage = pagesRaw.find((p) => p.slug === "downloads");
  const rows = dlPage
    ? [...(dlPage.body || "").matchAll(/\|\s*\d+\s*\|\s*([^|]+?)\s*\|\s*\[[^\]]*\]\((https?:\/\/[^)]+?\.pdf)\)/gi)]
    : [];
  const seenTitle = new Set();
  const dlRows = [];
  for (const m of rows) {
    const title = m[1].trim();
    if (seenTitle.has(title)) continue; // dedupe repeated table entries by title
    seenTitle.add(title);
    const r = resolvePdf(m[2].trim());
    if (!r) {
      downloadStats.unresolved++;
      review.add("download", title, "PDF not resolved to local file", basenameFromUrl(m[2]));
      continue;
    }
    const cat = downloadCategory(title);
    downloadStats.byCategory[cat] = (downloadStats.byCategory[cat] || 0) + 1;
    downloadStats.total++;
    rowsOut.downloads.push({ title, file_url: r.url, category: cat, file_size_kb: r.size_kb, page_slug: null });
    dlRows.push(`(${qNN(title)}, ${qNN(r.url)}, ${qNN(cat)}, ${qInt(r.size_kb)}, NULL)`);
  }
  if (dlRows.length) {
    writeSql(
      "05_downloads.sql",
      `insert into downloads (title, file_url, category, file_size_kb, page_slug) values\n` +
        dlRows.join(",\n") + ";\n",
    );
  }
}

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

// ---- Upload plan + rows + review + summary --------------------------------
fs.writeFileSync(path.join(OUT_DIR, "upload-plan.json"), JSON.stringify(uploadPlan, null, 0));
fs.writeFileSync(path.join(OUT_DIR, "rows.json"), JSON.stringify(rowsOut));
const reviewCount = review.write();

const byBucket = uploadPlan.reduce((acc, u) => {
  const k = u.key.split("/")[0].includes(".") ? u.bucket : `${u.bucket}/${u.key.split("/")[0]}`;
  acc[k] = (acc[k] || 0) + 1;
  return acc;
}, {});

// Concatenate the per-table SQL (sorted by filename) into one self-contained file.
const sqlFiles = fs.readdirSync(OUT_DIR).filter((f) => /^\d.*\.sql$/.test(f)).sort();
const combined = sqlFiles.map((f) => `-- ${f}\n` + fs.readFileSync(path.join(OUT_DIR, f), "utf8")).join("\n");
fs.writeFileSync(path.resolve(process.cwd(), "scripts/migrate/migration.sql"), combined);

const summary = {
  institutes: instituteRows.length,
  faculty: facultyRaw.length,
  faculty_photos_set: facultyPhotos,
  faculty_linked_to_institute: facultyLinked,
  announcements_from_announcements: annRaw.length,
  announcements_from_news_events: neRaw.length,
  announcements_total: allAnn.length,
  category_distribution: catCounts,
  all_reclassified_by_title: classifyReport.reclassified,
  all_reclassified_unmatched_count: classifyReport.unmatched.length,
  news_classified: neStats.news,
  event_classified: neStats.event,
  attachments_resolved: annStats.attachments,
  pages: pageStats,
  downloads: downloadStats.total,
  downloads_by_category: downloadStats.byCategory,
  slider_hero: sliderCount,
  upload_plan_total: uploadPlan.length,
  upload_by_group: byBucket,
  review_rows: reviewCount,
  sql_files: sqlFiles.length,
};
fs.writeFileSync(path.join(OUT_DIR, "summary.json"), JSON.stringify(summary, null, 2));
console.log(JSON.stringify(summary, null, 2));
console.log("\n--- category:'all' → title-classifier unmatched (fell back to circular):", classifyReport.unmatched.length);
classifyReport.unmatched.forEach((t) => console.log("   •", t));
