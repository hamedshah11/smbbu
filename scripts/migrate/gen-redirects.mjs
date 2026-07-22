// Old-site announcement redirect generator (CLAUDE.md rule 8).
//
// The old site served every notice at /beta/announcements/details/:slug and
// every news/event story at /beta/news/details/:slug — no category in the
// path. The new site routes details at /noticeboard/:category/:slug and the
// detail page 404s when the category segment doesn't match the row, so each
// slug's redirect must carry its *current* category from the live database
// (rule 8b: slugs are immutable and always read from the stored value —
// never re-derived).
//
//   SUPABASE_SERVICE_ROLE_KEY=… node scripts/migrate/gen-redirects.mjs
//
// Writes redirects-generated.json at the repo root, which next.config.ts
// merges into its static redirect list. Idempotent and safe to re-run after
// every content sync:
//   - entries are keyed by source path and NEVER deleted, even if the row
//     has disappeared from the database;
//   - an existing entry whose row's category changed gets its destination
//     refreshed (the old URL must follow the notice to its current home);
//   - new slugs get a new entry, sourced under /beta/news/details/ for
//     news|event rows and /beta/announcements/details/ for everything else.
//
// The script also verifies the static campus → institute and faculty-index →
// department mappings hardcoded in next.config.ts against the live tables,
// and exits non-zero if any target slug has gone missing.
import fs from "node:fs";
import path from "node:path";
import { setGlobalDispatcher, EnvHttpProxyAgent } from "undici";

setGlobalDispatcher(new EnvHttpProxyAgent());

const BASE = "https://bdsatrlrmfefxyielppw.supabase.co";
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
if (!KEY) {
  console.error("SUPABASE_SERVICE_ROLE_KEY is required.");
  process.exit(1);
}
const AUTH = { apikey: KEY, Authorization: `Bearer ${KEY}` };

const OUT_PATH = path.resolve("redirects-generated.json");

// Institute slugs that the static /beta/campuses/* redirects in
// next.config.ts point at. Slugs in the database are immutable (rule 8b),
// so a miss here means something is badly wrong — fail loudly.
const EXPECTED_INSTITUTE_SLUGS = [
  "benazir-college-of-nursing",
  "bibi-aseefa-dental-college-larkana",
  "institute-of-pharmacy",
  "institute-of-physiotherapy-and-rehabilitation-sciences",
];

// department_slug values that the static /beta/faculty/index/* redirects
// point at (generated column, migration 0003; rows assigned in 0006).
const EXPECTED_DEPARTMENT_SLUGS = [
  "faculty-of-basic-medical-sciences",
  "faculty-of-medicine",
  "faculty-of-surgery",
  "faculty-of-community-medicine-public-health-sciences",
];

async function fetchAll(table, select, order) {
  const out = [];
  const page = 1000;
  for (let from = 0; ; from += page) {
    const res = await fetch(`${BASE}/rest/v1/${table}?select=${select}&order=${order}.asc`, {
      headers: { ...AUTH, Range: `${from}-${from + page - 1}`, "Range-Unit": "items" },
    });
    if (res.status === 416) break;
    if (!res.ok && res.status !== 206) {
      throw new Error(`GET ${table} -> ${res.status}: ${(await res.text()).slice(0, 400)}`);
    }
    const chunk = await res.json();
    out.push(...chunk);
    if (chunk.length < page) break;
  }
  return out;
}

const announcements = await fetchAll("announcements", "slug,category", "slug");
console.log(`Fetched ${announcements.length} announcements.`);

// News/event stories lived under /beta/news/details/ on the old site;
// everything else under /beta/announcements/details/. Slugs were carried
// over verbatim by the migration, so the old path is fully reconstructible.
const oldSource = (a) =>
  a.category === "news" || a.category === "event"
    ? `/beta/news/details/${a.slug}`
    : `/beta/announcements/details/${a.slug}`;

const destinationBySlug = new Map(
  announcements.map((a) => [a.slug, `/noticeboard/${a.category}/${a.slug}`]),
);

const existing = fs.existsSync(OUT_PATH) ? JSON.parse(fs.readFileSync(OUT_PATH, "utf8")) : [];
const bySource = new Map(existing.map((e) => [e.source, e]));

// Refresh destinations of existing entries whose row still exists (category
// may have changed since the entry was written). Entries whose slug is gone
// from the database are kept untouched — never delete.
let updated = 0;
let stale = 0;
for (const entry of bySource.values()) {
  const slug = entry.source.split("/").pop();
  const dest = destinationBySlug.get(slug);
  if (!dest) {
    stale++;
  } else if (entry.destination !== dest) {
    entry.destination = dest;
    updated++;
  }
}

// Add entries for slugs not yet covered under their canonical old path.
let added = 0;
for (const a of announcements) {
  const source = oldSource(a);
  if (!bySource.has(source)) {
    bySource.set(source, {
      source,
      destination: destinationBySlug.get(a.slug),
      permanent: true,
    });
    added++;
  }
}

const merged = [...bySource.values()].sort((x, y) => x.source.localeCompare(y.source));
fs.writeFileSync(OUT_PATH, JSON.stringify(merged, null, 2) + "\n");
console.log(
  `Wrote ${merged.length} redirects to ${path.relative(process.cwd(), OUT_PATH)} ` +
    `(${added} added, ${updated} destinations updated, ${stale} kept for slugs no longer in the database).`,
);

// Verify the static mappings in next.config.ts against the live tables.
const problems = [];
const instituteSlugs = new Set((await fetchAll("institutes", "slug", "slug")).map((r) => r.slug));
for (const slug of EXPECTED_INSTITUTE_SLUGS) {
  if (!instituteSlugs.has(slug)) {
    problems.push(`institutes table has no row with slug "${slug}" (static campus redirect target)`);
  }
}
const departmentSlugs = new Set(
  (await fetchAll("faculty", "department_slug", "department_slug")).map((r) => r.department_slug).filter(Boolean),
);
for (const slug of EXPECTED_DEPARTMENT_SLUGS) {
  if (!departmentSlugs.has(slug)) {
    problems.push(`faculty table has no rows with department_slug "${slug}" (static faculty redirect target)`);
  }
}
if (problems.length) {
  console.error("\n⚠ Static redirect targets missing from the live database:");
  for (const p of problems) console.error(`  - ${p}`);
  process.exit(1);
}
console.log("Static campus and faculty redirect targets verified against the live database.");
