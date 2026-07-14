// Shared helpers for the SMBBMU content migration.
import fs from "node:fs";
import path from "node:path";

export const PROJECT_URL = "https://bdsatrlrmfefxyielppw.supabase.co";
export const INPUT_DIR = path.resolve(process.cwd(), "migration-input");
export const OUT_DIR = path.resolve(process.cwd(), "scripts/migrate/out");
export const REVIEW_PATH = path.resolve(process.cwd(), "migration-review.csv");

// Public storage URL for an object (buckets are public-read).
export function pub(bucket, key) {
  const encoded = key.split("/").map(encodeURIComponent).join("/");
  return `${PROJECT_URL}/storage/v1/object/public/${bucket}/${encoded}`;
}

export function readJson(name) {
  return JSON.parse(fs.readFileSync(path.join(INPUT_DIR, name), "utf8"));
}

export function slugify(s) {
  return String(s)
    .toLowerCase()
    .replace(/&/g, " and ")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

// SQL literal helpers — escape single quotes by doubling.
export function q(v) {
  if (v === null || v === undefined || v === "") return "NULL";
  return `'${String(v).replace(/'/g, "''")}'`;
}
// For NOT NULL text columns: empty/undefined becomes '' rather than NULL.
export function qNN(v) {
  if (v === null || v === undefined) return "''";
  return `'${String(v).replace(/'/g, "''")}'`;
}
export function qJson(v) {
  return `'${JSON.stringify(v).replace(/'/g, "''")}'::jsonb`;
}
export function qInt(v) {
  if (v === null || v === undefined || v === "" || Number.isNaN(Number(v))) return "NULL";
  return String(parseInt(v, 10));
}
export function qTs(iso) {
  return iso ? `'${iso}'` : "NULL";
}

// Defensive date parse → ISO timestamp at 09:00Z, or null.
export function parseDate(raw) {
  if (!raw) return null;
  const s = String(raw).trim();
  let m = s.match(/^(\d{4})-(\d{2})-(\d{2})$/); // YYYY-MM-DD
  if (m) return `${m[1]}-${m[2]}-${m[3]}T09:00:00Z`;
  m = s.match(/^(\d{2})-(\d{2})-(\d{4})$/); // MM-DD-YYYY
  if (m) return `${m[3]}-${m[1]}-${m[2]}T09:00:00Z`;
  const d = new Date(s);
  if (!Number.isNaN(d.getTime())) return d.toISOString().replace(/\.\d+Z$/, "Z");
  return null;
}

export function excerpt(body, n = 200) {
  if (!body) return null;
  const clean = String(body).replace(/\s+/g, " ").trim();
  if (clean.length <= n) return clean;
  return clean.slice(0, n).replace(/\s+\S*$/, "") + "…";
}

// Normalise a filename for fuzzy matching (drop ext, non-alnum → -).
export function normName(s) {
  return String(s)
    .toLowerCase()
    .replace(/\.[a-z0-9]+$/i, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}
export function numericId(s) {
  const m = String(s).match(/(\d{8,})/);
  return m ? m[1] : null;
}

export function basenameFromUrl(u) {
  try {
    return decodeURIComponent(String(u).split("?")[0].split("#")[0].split("/").pop());
  } catch {
    return String(u).split("/").pop();
  }
}

// Simple review-log accumulator.
export class Review {
  constructor() {
    this.rows = [["entity", "identifier", "reason", "detail"]];
  }
  add(entity, identifier, reason, detail = "") {
    this.rows.push([entity, identifier, reason, String(detail).replace(/\s+/g, " ").slice(0, 300)]);
  }
  write() {
    const csv = this.rows
      .map((r) => r.map((c) => `"${String(c).replace(/"/g, '""')}"`).join(","))
      .join("\n");
    fs.writeFileSync(REVIEW_PATH, csv + "\n");
    return this.rows.length - 1;
  }
}

export function writeSql(name, sql) {
  fs.mkdirSync(OUT_DIR, { recursive: true });
  fs.writeFileSync(path.join(OUT_DIR, name), sql);
}
