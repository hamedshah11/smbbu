#!/usr/bin/env node
// Assign faculty-level departments and missing institute links for the rows
// migration 0003 left department-less, and flag the rest for manual review.
//
//   node scripts/migrate/assign-faculty-departments.mjs          # dry-run report
//   node scripts/migrate/assign-faculty-departments.mjs --emit   # also write the
//        migration SQL and the Introduction-rows review CSV into the repo
//
// The DB rows carry no scrape metadata, but sort_order was assigned as the
// 1-based index over migration-input/faculty.json (generate.mjs), so the
// source file identifies every row. The emitted migration targets rows by
// sort_order with a null-guard, so it can never clobber a value an admin has
// since filled in.
//
// With NEXT_PUBLIC_SUPABASE_URL + NEXT_PUBLIC_SUPABASE_ANON_KEY set, the
// dry-run also fetches the live rows and reports how many targets are already
// correct versus needing the backfill.

import fs from "node:fs";
import path from "node:path";
import { INPUT_DIR, PROJECT_URL, slugify } from "./lib.mjs";

const EMIT = process.argv.includes("--emit");
const MIGRATION_OUT = path.resolve(process.cwd(), "supabase/migrations/0006_assign_faculty_departments_and_institutes.sql");
const CSV_OUT = path.resolve(process.cwd(), "scripts/migrate/introduction-review.csv");

// -------------------------------------------------------------------------
// (a) guard: slugify() must reproduce the DB's generated department_slug for
// every department display name that exists after migration 0003.
// -------------------------------------------------------------------------
// Rename map copied from 0003 (junk values CMC/GMMMC/Bibi Aseefa Dental
// College/Introduction are nulled there, not renamed).
const RENAMES = {
  medicine: "Faculty of Medicine",
  surgery: "Faculty of Surgery",
  "DEPARTEMENT OF PULMONOLOGY": "Department of Pulmonology",
  "DEPARTMENT OF ANESTHESIOLOGY": "Department of Anesthesiology",
  "DEPARTMENT OF BIOCHEMISTRY": "Department of Biochemistry",
  "DEPARTMENT OF CARDIOLOGY": "Department of Cardiology",
  "DEPARTMENT OF DERMATOLOGY": "Department of Dermatology",
  "DEPARTMENT OF E.N.T": "Department of E.N.T",
  "DEPARTMENT OF GYNECOLOGY & OBSTETRICS": "Department of Gynecology & Obstetrics",
  "DEPARTMENT OF MEDICINE": "Department of Medicine",
  "DEPARTMENT OF NUEROLOGY": "Department of Neurology",
  "DEPARTMENT OF ORTHOPAEDIC SURGERY": "Department of Orthopaedic Surgery",
  "DEPARTMENT OF PATHOLOGY": "Department of Pathology",
  "DEPARTMENT OF PHYSIOLOGY": "Department of Physiology",
  "DEPARTMENT OF UROLOGY": "Department of Urology",
  NEUROSURGERY: "Department of Neurosurgery",
  "FORENSIC MEDICINE": "Department of Forensic Medicine",
};
const NULLED = new Set(["CMC", "GMMMC", "Bibi Aseefa Dental College", "Introduction"]);

// The generated column expression from 0003, verbatim semantics.
const dbSlug = (d) => d.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "");

const source = JSON.parse(fs.readFileSync(path.join(INPUT_DIR, "faculty.json"), "utf8"));

const taxonomyNames = new Set();
for (const f of source) {
  // same department fallback generate.mjs used at insert time
  const raw = f.department || (f.category ? f.category.replace(/^campus:/, "") : "General");
  if (!raw || NULLED.has(raw)) continue;
  taxonomyNames.add(RENAMES[raw] ?? raw);
}
let drift = 0;
for (const name of taxonomyNames) {
  if (slugify(name) !== dbSlug(name)) {
    drift++;
    console.log(`ROUND-TRIP FAIL: slugify("${name}") = "${slugify(name)}" vs DB "${dbSlug(name)}"`);
  }
}
console.log(`(a) slug round-trip over ${taxonomyNames.size} taxonomy names: ${drift === 0 ? "all identical" : `${drift} MISMATCHES`}`);
if (drift > 0) process.exit(1);

// -------------------------------------------------------------------------
// (b) faculty-level departments from the published-faculty rosters.
// -------------------------------------------------------------------------
const FACULTY_BY_CATEGORY = {
  basic: "Faculty of Basic Medical Sciences",
  medicine: "Faculty of Medicine",
  surgery: "Faculty of Surgery",
  community: "Faculty of Community Medicine & Public Health Sciences",
};

const deptTargets = new Map(); // faculty name -> sort_orders
// -------------------------------------------------------------------------
// (c) institute links for rows whose scraped department was an institute name.
// -------------------------------------------------------------------------
const INSTITUTE_BY_DEPT = { CMC: "CMC", GMMMC: "GMMMC", "Bibi Aseefa Dental College": "BADC" };
const instTargets = new Map(); // institute code -> sort_orders
const introductionRows = [];

source.forEach((f, i) => {
  const sortOrder = i + 1; // generate.mjs assigned sort_order this way
  const facultyName = FACULTY_BY_CATEGORY[f.category];
  // (b): only rows 0003 nulled — an explicit real department (e.g. a Dean row
  // on the same roster) is left alone.
  if (facultyName && (f.department === "CMC" || f.department === "GMMMC")) {
    if (!deptTargets.has(facultyName)) deptTargets.set(facultyName, []);
    deptTargets.get(facultyName).push(sortOrder);
  }
  const code = INSTITUTE_BY_DEPT[f.department];
  if (code) {
    if (!instTargets.has(code)) instTargets.set(code, []);
    instTargets.get(code).push(sortOrder);
  }
  if (f.department === "Introduction") {
    introductionRows.push({ sortOrder, name: f.name, designation: f.designation ?? "", roster: f.category ?? "" });
  }
});

console.log("\n(b) department assignments by bucket:");
let bTotal = 0;
for (const [name, orders] of deptTargets) {
  bTotal += orders.length;
  console.log(`  ${String(orders.length).padStart(4)}  ${name}  → ${dbSlug(name)}`);
}
console.log(`  ${String(bTotal).padStart(4)}  total`);

console.log("\n(c) institute-link targets by original scraped department:");
for (const [code, orders] of instTargets) console.log(`  ${String(orders.length).padStart(4)}  ${code}`);
console.log(`\nIntroduction rows left untouched, flagged for review: ${introductionRows.length}`);

// -------------------------------------------------------------------------
// Live cross-check (optional): already correct vs needing backfill.
// -------------------------------------------------------------------------
const url = process.env.NEXT_PUBLIC_SUPABASE_URL || PROJECT_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
if (key) {
  try {
    const res = await fetch(`${url}/rest/v1/faculty?select=sort_order,department,institute_id&order=sort_order&limit=1000`, {
      headers: { apikey: key, Authorization: `Bearer ${key}` },
    });
    if (!res.ok) throw new Error(`${res.status} ${await res.text()}`);
    const live = new Map((await res.json()).map((r) => [r.sort_order, r]));
    console.log("\nlive cross-check:");
    for (const [name, orders] of deptTargets) {
      const set = orders.filter((o) => live.get(o)?.department == null).length;
      console.log(`  (b) ${name}: ${set} to set, ${orders.length - set} already have a department`);
    }
    for (const [code, orders] of instTargets) {
      const missing = orders.filter((o) => live.get(o)?.institute_id == null).length;
      console.log(`  (c) ${code}: ${orders.length - missing} already linked, ${missing} to backfill`);
    }
  } catch (e) {
    console.log(`\nlive cross-check skipped (${e.message.slice(0, 120)})`);
  }
} else {
  console.log("\nlive cross-check skipped: NEXT_PUBLIC_SUPABASE_ANON_KEY not set.");
}

if (!EMIT) {
  console.log("\nDry-run only. Re-run with --emit to write the migration SQL and review CSV.");
  process.exit(0);
}

// -------------------------------------------------------------------------
// Emit the migration + review CSV.
// -------------------------------------------------------------------------
const wrap = (nums) => {
  const lines = [];
  for (let i = 0; i < nums.length; i += 20) lines.push("    " + nums.slice(i, i + 20).join(", "));
  return lines.join(",\n");
};
const qs = (s) => s.replace(/'/g, "''");

let sql = `-- Assign faculty-level departments and missing institute links for the rows
-- migration 0003 left department-less. Rows are addressed by sort_order, which
-- generate.mjs assigned as the 1-based index over migration-input/faculty.json;
-- the lists below are emitted by scripts/migrate/assign-faculty-departments.mjs
-- from that same file. Null-guards keep the migration from overwriting values
-- an admin has filled in since. department_slug is generated from department
-- (0003), so it follows automatically. The 93 "Introduction" rows are left
-- untouched; see scripts/migrate/introduction-review.csv.

`;
for (const [name, orders] of deptTargets) {
  sql += `-- ${orders.length} members scraped from the ${qs(name)} roster\n`;
  sql += `update faculty set department = '${qs(name)}'\n  where department is null and sort_order in (\n${wrap(orders)}\n  );\n\n`;
}
for (const [code, orders] of instTargets) {
  sql += `-- ${orders.length} rows whose scraped department was the ${code} institute name\n`;
  sql += `update faculty set institute_id = (select id from institutes where code = '${code}')\n  where institute_id is null and sort_order in (\n${wrap(orders)}\n  );\n\n`;
}
fs.writeFileSync(MIGRATION_OUT, sql);
console.log(`\nwrote ${path.relative(process.cwd(), MIGRATION_OUT)}`);

const csv = [["sort_order", "name", "designation", "roster"]]
  .concat(introductionRows.map((r) => [r.sortOrder, r.name, r.designation, r.roster]))
  .map((row) => row.map((c) => `"${String(c).replace(/"/g, '""')}"`).join(","))
  .join("\n");
fs.writeFileSync(CSV_OUT, csv + "\n");
console.log(`wrote ${path.relative(process.cwd(), CSV_OUT)} (${introductionRows.length} rows)`);
