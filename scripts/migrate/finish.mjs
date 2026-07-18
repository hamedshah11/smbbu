// End-to-end migration finisher, HTTPS-only (works behind an HTTP proxy with
// no Postgres wire access). Requires SUPABASE_SERVICE_ROLE_KEY in env and the
// outputs of generate.mjs (out/rows.json, out/upload-plan.json).
//
//   node scripts/migrate/generate.mjs
//   NODE_EXTRA_CA_CERTS=/root/.ccr/ca-bundle.crt node scripts/migrate/finish.mjs
//
// Steps: snapshot current announcement categories → wipe content tables →
// insert all rows via PostgREST → diff categories vs snapshot → upload all
// storage files → write scripts/migrate/finish-report.json and
// scripts/migrate/category-changes.csv.
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

const OUT = path.resolve("scripts/migrate/out");
const rows = JSON.parse(fs.readFileSync(path.join(OUT, "rows.json"), "utf8"));
const plan = JSON.parse(fs.readFileSync(path.join(OUT, "upload-plan.json"), "utf8"));

async function rest(method, pathq, { body, prefer, range } = {}) {
  const headers = { ...AUTH, "Content-Type": "application/json" };
  if (prefer) headers.Prefer = prefer;
  if (range) {
    headers.Range = range;
    headers["Range-Unit"] = "items";
  }
  const res = await fetch(`${BASE}/rest/v1/${pathq}`, {
    method,
    headers,
    body: body !== undefined ? JSON.stringify(body) : undefined,
  });
  if (!res.ok && res.status !== 206 && res.status !== 416) {
    throw new Error(`${method} ${pathq} -> ${res.status}: ${(await res.text()).slice(0, 400)}`);
  }
  return res;
}

async function fetchAll(table, select) {
  const out = [];
  const page = 1000;
  for (let from = 0; ; from += page) {
    const res = await rest("GET", `${table}?select=${select}&order=slug.asc`, {
      range: `${from}-${from + page - 1}`,
    });
    if (res.status === 416) break;
    const chunk = await res.json();
    out.push(...chunk);
    if (chunk.length < page) break;
  }
  return out;
}

async function count(table) {
  const res = await rest("HEAD", `${table}?select=*`, { prefer: "count=exact", range: "0-0" });
  const cr = res.headers.get("content-range") || "";
  return parseInt(cr.split("/")[1], 10);
}

async function insertBatched(table, items, { prefer, batch = 100 } = {}) {
  const returned = [];
  for (let i = 0; i < items.length; i += batch) {
    const res = await rest("POST", table, {
      body: items.slice(i, i + batch),
      prefer: prefer || "return=minimal",
    });
    if (prefer === "return=representation") returned.push(...(await res.json()));
    process.stdout.write(`  ${table}: ${Math.min(i + batch, items.length)}/${items.length}\r`);
  }
  process.stdout.write("\n");
  return returned;
}

const report = { started_at: new Date().toISOString() };

// Re-run behaviour: once the DB phase has completed (category-changes.csv
// exists), re-runs skip straight to counts + uploads. The original category
// baseline is gone from the DB after the first wipe, so recomputing the diff
// on a re-run would produce garbage. Force a full redo with REDO_DB=1.
const csvPath = "scripts/migrate/category-changes.csv";
const snapshotPath = "scripts/migrate/prev-snapshot.json";
const dbPhaseDone = fs.existsSync(csvPath) && !process.env.REDO_DB;

if (dbPhaseDone) {
  console.log("DB phase already done (category-changes.csv exists) — skipping to counts + uploads.");
  report.db_phase = "skipped (already applied)";
} else {
  // 1. Snapshot current categories (the diff baseline). Persist it before the
  //    wipe so a crash never loses the baseline.
  console.log("Snapshotting current announcements…");
  const prev = fs.existsSync(snapshotPath)
    ? JSON.parse(fs.readFileSync(snapshotPath, "utf8"))
    : await fetchAll("announcements", "slug,category,title");
  fs.writeFileSync(snapshotPath, JSON.stringify(prev));
  console.log(`  snapshot: ${prev.length} rows`);
  report.snapshot_rows = prev.length;

  // 2. Wipe content tables (children before parents).
  console.log("Wiping content tables…");
  for (const t of ["downloads", "faculty", "announcements", "pages", "institutes"]) {
    await rest("DELETE", `${t}?id=not.is.null`);
  }

  // 3. Insert.
  console.log("Inserting…");
  const instReturned = await insertBatched("institutes", rows.institutes, {
    prefer: "return=representation",
  });
  const instIdBySlug = new Map(instReturned.map((r) => [r.slug, r.id]));
  const facultyRows = rows.faculty.map(({ institute_slug, ...rest }) => ({
    ...rest,
    institute_id: institute_slug ? (instIdBySlug.get(institute_slug) ?? null) : null,
  }));
  await insertBatched("faculty", facultyRows);
  await insertBatched("announcements", rows.announcements);
  await insertBatched("pages", rows.pages);
  await insertBatched("downloads", rows.downloads);

  // 4. Diff categories vs snapshot.
  console.log("Diffing categories vs snapshot…");
  const prevBySlug = new Map(prev.map((p) => [p.slug, p]));
  const changes = [];
  for (const a of rows.announcements) {
    const p = prevBySlug.get(a.slug);
    if (p && p.category !== a.category) {
      changes.push({ slug: a.slug, title: a.title, old: p.category, new: a.category });
    }
  }
  const newSlugs = new Set(rows.announcements.map((a) => a.slug));
  const removed = prev.filter((p) => !newSlugs.has(p.slug));
  const added = rows.announcements.filter((a) => !prevBySlug.has(a.slug));
  const pairs = {};
  for (const c of changes) pairs[`${c.old} -> ${c.new}`] = (pairs[`${c.old} -> ${c.new}`] || 0) + 1;
  report.category_changes = { total: changes.length, pairs, added: added.length, removed: removed.length };
  fs.writeFileSync(
    csvPath,
    "slug,old_category,new_category,title\n" +
      changes
        .map((c) => `"${c.slug}","${c.old}","${c.new}","${c.title.replace(/"/g, '""')}"`)
        .join("\n") +
      "\n",
  );
}

// 5. Row counts from the live database.
report.db_counts = {};
for (const t of ["institutes", "faculty", "announcements", "pages", "downloads"]) {
  report.db_counts[t] = await count(t);
}
console.log("DB counts:", report.db_counts);

// 6. Storage uploads.
console.log(`Uploading ${plan.length} files…`);
const CT = {
  ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".png": "image/png", ".gif": "image/gif",
  ".webp": "image/webp", ".svg": "image/svg+xml", ".pdf": "application/pdf",
};
const uploadStats = { ok: 0, failed: 0, by_group: {}, failures: [] };
const queue = [...plan];
async function uploadWorker() {
  while (queue.length) {
    const item = queue.shift();
    const ext = path.extname(item.localPath).toLowerCase();
    const key = item.key.split("/").map(encodeURIComponent).join("/");
    try {
      // Resumability: skip files that already exist (public buckets → HEAD).
      const head = await fetch(`${BASE}/storage/v1/object/public/${item.bucket}/${key}`, {
        method: "HEAD",
      });
      if (head.ok) {
        uploadStats.ok++;
        uploadStats.skipped = (uploadStats.skipped || 0) + 1;
        const group = item.key.includes("/") ? `${item.bucket}/${item.key.split("/")[0]}` : item.bucket;
        uploadStats.by_group[group] = (uploadStats.by_group[group] || 0) + 1;
        continue;
      }
      const bytes = fs.readFileSync(path.resolve(item.localPath));
      const res = await fetch(`${BASE}/storage/v1/object/${item.bucket}/${key}`, {
        method: "POST",
        headers: {
          ...AUTH,
          "Content-Type": CT[ext] || "application/octet-stream",
          "x-upsert": "true",
        },
        body: bytes,
      });
      if (!res.ok) throw new Error(`${res.status}: ${(await res.text()).slice(0, 200)}`);
      uploadStats.ok++;
      const group = item.key.includes("/") ? `${item.bucket}/${item.key.split("/")[0]}` : item.bucket;
      uploadStats.by_group[group] = (uploadStats.by_group[group] || 0) + 1;
    } catch (e) {
      uploadStats.failed++;
      uploadStats.failures.push({ key: `${item.bucket}/${item.key}`, error: String(e.message || e).slice(0, 200) });
    }
    const done = uploadStats.ok + uploadStats.failed;
    if (done % 100 === 0) console.log(`  uploads: ${done}/${plan.length}`);
  }
}
await Promise.all(Array.from({ length: 8 }, uploadWorker));
report.uploads = uploadStats;
console.log(`Uploads done. ok=${uploadStats.ok} failed=${uploadStats.failed}`);

report.finished_at = new Date().toISOString();
fs.writeFileSync("scripts/migrate/finish-report.json", JSON.stringify(report, null, 2));
console.log("Report written to scripts/migrate/finish-report.json");
if (uploadStats.failed > 0) console.log("Some uploads failed — see report failures list.");
