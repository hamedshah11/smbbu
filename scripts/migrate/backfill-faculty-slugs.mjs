#!/usr/bin/env node
// Backfill faculty.department_slug from the existing department display name,
// using the same slugify() the content migration used.
//
// Run locally:
//   node scripts/migrate/backfill-faculty-slugs.mjs                 # dry-run (default)
//   node scripts/migrate/backfill-faculty-slugs.mjs --apply         # write matched slugs
//   node scripts/migrate/backfill-faculty-slugs.mjs --fixture f.json  # offline test data
//
// Env: NEXT_PUBLIC_SUPABASE_URL, and NEXT_PUBLIC_SUPABASE_ANON_KEY for the
// dry-run read (public read RLS) or SUPABASE_SERVICE_ROLE_KEY for --apply.
//
// The script never invents taxonomy: a derived slug is only written when it
// already exists among the DB's current (department, department_slug) pairs.
// Everything else — unmatched names, colliding variants, rows with no
// department at all — lands in scripts/migrate/backfill-review.csv.
//
// Schema note: migration 0003 defines department_slug as GENERATED ALWAYS from
// department, in which case no row can have a name without a slug and direct
// writes are rejected by Postgres. The script detects both situations and says
// so instead of failing cryptically; the fix then belongs on `department`.

import fs from "node:fs";
import path from "node:path";
import { PROJECT_URL, slugify } from "./lib.mjs";

const args = process.argv.slice(2);
const APPLY = args.includes("--apply");
const fixtureIdx = args.indexOf("--fixture");
const FIXTURE = fixtureIdx !== -1 ? args[fixtureIdx + 1] : null;
const REVIEW_OUT = path.resolve(process.cwd(), "scripts/migrate/backfill-review.csv");

const url = process.env.NEXT_PUBLIC_SUPABASE_URL || PROJECT_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

async function fetchAllFaculty() {
  const rows = [];
  const page = 500;
  for (let from = 0; ; from += page) {
    const res = await fetch(
      `${url}/rest/v1/faculty?select=id,name,designation,department,department_slug,institutes(name)&order=sort_order`,
      { headers: { apikey: key, Authorization: `Bearer ${key}`, Range: `${from}-${from + page - 1}` } },
    );
    if (!res.ok) throw new Error(`faculty fetch failed: ${res.status} ${await res.text()}`);
    const batch = await res.json();
    rows.push(...batch);
    if (batch.length < page) return rows;
  }
}

function loadRows() {
  if (FIXTURE) return JSON.parse(fs.readFileSync(FIXTURE, "utf8"));
  if (!key) {
    console.error("Set NEXT_PUBLIC_SUPABASE_ANON_KEY (dry-run) or SUPABASE_SERVICE_ROLE_KEY (--apply).");
    process.exit(1);
  }
  return fetchAllFaculty();
}

const csvRows = [["id", "name", "designation", "institute", "department", "reason", "detail"]];
function flag(row, reason, detail = "") {
  csvRows.push([
    row.id,
    row.name,
    row.designation ?? "",
    row.institutes?.name ?? "",
    row.department ?? "",
    reason,
    detail,
  ]);
}

const rows = await loadRows();
console.log(`faculty rows: ${rows.length}`);

// Existing taxonomy: every (slug ← name) pair already present in the DB.
const taxonomy = new Map(); // slug -> Set of names seen with that slug
for (const r of rows) {
  if (!r.department_slug) continue;
  if (!taxonomy.has(r.department_slug)) taxonomy.set(r.department_slug, new Set());
  taxonomy.get(r.department_slug).add(r.department ?? "");
}
console.log(`existing taxonomy entries: ${taxonomy.size}`);
for (const [slug, names] of taxonomy) {
  if (names.size > 1)
    console.log(`  WARN slug "${slug}" carries ${names.size} display names: ${[...names].join(" | ")}`);
  for (const name of names) {
    const derived = slugify(name);
    if (derived !== slug)
      console.log(
        `  WARN normalizer drift: slugify("${name}") = "${derived}" but the DB slug is "${slug}"\n` +
          `       (migration slugify maps "&" to "and"; the generated column in 0003 drops it)`,
      );
  }
}

// Candidates: a department display name but no slug.
const candidates = rows.filter((r) => r.department && !r.department_slug);
const noDepartment = rows.filter((r) => !r.department);
console.log(`\ncandidates (department set, slug missing): ${candidates.length}`);
console.log(`rows with no department at all: ${noDepartment.length}`);

if (candidates.length === 0 && noDepartment.length > 0) {
  console.log(
    "\nNo name-without-slug rows exist — consistent with department_slug being a generated\n" +
      "column (migration 0003). The rows above with no department cannot be backfilled from\n" +
      "the DB; they are flagged in the review CSV instead.",
  );
}

// Collisions: distinct display names that normalize to the same slug.
const byDerived = new Map();
for (const r of candidates) {
  const derived = slugify(r.department);
  if (!byDerived.has(derived)) byDerived.set(derived, new Map());
  const names = byDerived.get(derived);
  if (!names.has(r.department)) names.set(r.department, []);
  names.get(r.department).push(r);
}

const plan = []; // { row, slug }
for (const [derived, names] of byDerived) {
  const variantNames = [...names.keys()];
  const canonical = taxonomy.has(derived) ? [...taxonomy.get(derived)][0] : null;
  if (canonical) {
    // exact canonical-name rows are safe; only spelling variants need review
    for (const r of names.get(canonical) ?? []) plan.push({ row: r, slug: derived });
    const offVariants = variantNames.filter((n) => n !== canonical);
    if (offVariants.length) {
      console.log(
        `  COLLISION "${derived}": canonical "${canonical}" vs ${offVariants.map((n) => `"${n}"`).join(", ")}`,
      );
      for (const n of offVariants)
        for (const r of names.get(n)) flag(r, "variant-collision", `"${n}" vs canonical "${canonical}" → ${derived}`);
    }
  } else if (variantNames.length > 1) {
    console.log(`  COLLISION "${derived}" (no taxonomy entry) ← ${variantNames.map((n) => `"${n}"`).join(", ")}`);
    for (const rs of names.values()) for (const r of rs) flag(r, "variant-collision", `→ ${derived}`);
  } else {
    for (const rs of names.values())
      for (const r of rs) flag(r, "no-taxonomy-match", `derived "${derived}" not in existing taxonomy`);
  }
}

for (const r of noDepartment) flag(r, "no-department", "no display name to derive a slug from");

console.log(`\nbackfill plan: ${plan.length} row(s)`);
for (const { row, slug } of plan.slice(0, 20))
  console.log(`  ${row.id}  ${row.name}  "${row.department}" → ${slug}`);
if (plan.length > 20) console.log(`  … ${plan.length - 20} more`);

const flagged = csvRows.length - 1;
fs.writeFileSync(
  REVIEW_OUT,
  csvRows.map((r) => r.map((c) => `"${String(c).replace(/"/g, '""')}"`).join(",")).join("\n") + "\n",
);
console.log(`flagged for review: ${flagged} row(s) → ${path.relative(process.cwd(), REVIEW_OUT)}`);

if (!APPLY) {
  console.log("\nDry-run only. Re-run with --apply to write the plan.");
  process.exit(0);
}
if (FIXTURE) {
  console.error("--apply is refused with --fixture; run against the real database.");
  process.exit(1);
}
if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  console.error("--apply needs SUPABASE_SERVICE_ROLE_KEY (RLS: writes require the admin role).");
  process.exit(1);
}

let ok = 0;
for (const { row, slug } of plan) {
  const res = await fetch(`${url}/rest/v1/faculty?id=eq.${encodeURIComponent(row.id)}`, {
    method: "PATCH",
    headers: { apikey: key, Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
    body: JSON.stringify({ department_slug: slug }),
  });
  if (res.ok) {
    ok++;
    continue;
  }
  const body = await res.text();
  if (/generated/i.test(body)) {
    console.error(
      `\nAborting: Postgres refused the write because department_slug is a generated column\n` +
        `(migration 0003). Correct the department display names instead — the slug follows.\n${body}`,
    );
    process.exit(1);
  }
  console.error(`update failed for ${row.id}: ${res.status} ${body}`);
}
console.log(`applied: ${ok}/${plan.length}`);
