// Uploads the local asset bytes to Supabase Storage per upload-plan.json.
// Run wherever *.supabase.co is reachable (e.g. your machine, or an env whose
// network policy allows Supabase). Idempotent: upsert:true overwrites in place.
//
//   NEXT_PUBLIC_SUPABASE_URL=... SUPABASE_SERVICE_ROLE_KEY=... node scripts/migrate/upload.mjs
//
// A service-role key is recommended (anon uploads require a permissive storage
// policy). Buckets `images` and `pdfs` must already exist and be public-read.
import fs from "node:fs";
import path from "node:path";
import { createClient } from "@supabase/supabase-js";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL || "https://bdsatrlrmfefxyielppw.supabase.co";
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
if (!key) {
  console.error("Set SUPABASE_SERVICE_ROLE_KEY (preferred) or NEXT_PUBLIC_SUPABASE_ANON_KEY.");
  process.exit(1);
}
const supabase = createClient(url, key, { auth: { persistSession: false } });

const plan = JSON.parse(fs.readFileSync(path.resolve("scripts/migrate/out/upload-plan.json"), "utf8"));
const CT = {
  ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".png": "image/png", ".gif": "image/gif",
  ".webp": "image/webp", ".svg": "image/svg+xml", ".pdf": "application/pdf",
};
const CONCURRENCY = 8;

let ok = 0, fail = 0;
const failures = [];
const byBucket = {};

async function one(item) {
  const ext = path.extname(item.localPath).toLowerCase();
  try {
    const bytes = fs.readFileSync(path.resolve(item.localPath));
    const { error } = await supabase.storage
      .from(item.bucket)
      .upload(item.key, bytes, { upsert: true, contentType: CT[ext] || "application/octet-stream" });
    if (error) throw error;
    ok++;
    byBucket[item.bucket] = (byBucket[item.bucket] || 0) + 1;
  } catch (e) {
    fail++;
    failures.push({ key: `${item.bucket}/${item.key}`, error: e.message || String(e) });
  }
}

const queue = [...plan];
async function worker() {
  while (queue.length) {
    const item = queue.shift();
    await one(item);
    if ((ok + fail) % 100 === 0) console.log(`  ${ok + fail}/${plan.length}…`);
  }
}
console.log(`Uploading ${plan.length} files to ${url} …`);
await Promise.all(Array.from({ length: CONCURRENCY }, worker));

console.log("\nDone.");
console.log("Uploaded per bucket:", byBucket);
console.log(`OK: ${ok}  Failed: ${fail}`);
if (failures.length) {
  fs.writeFileSync("scripts/migrate/out/upload-failures.json", JSON.stringify(failures, null, 2));
  console.log("Failures written to scripts/migrate/out/upload-failures.json");
}
