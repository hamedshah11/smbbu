export function formatDateShort(iso: string): string {
  const d = new Date(iso);
  const dd = String(d.getUTCDate()).padStart(2, "0");
  const mm = String(d.getUTCMonth() + 1).padStart(2, "0");
  return `${dd}.${mm}`;
}

export function formatDateLong(iso: string): string {
  const d = new Date(iso);
  return d.toLocaleDateString("en-GB", {
    day: "numeric",
    month: "long",
    year: "numeric",
    timeZone: "UTC",
  });
}

export function formatDateKicker(iso: string): string {
  const d = new Date(iso);
  return d
    .toLocaleDateString("en-GB", { day: "2-digit", month: "short", year: "numeric", timeZone: "UTC" })
    .toUpperCase()
    .replace(/,/g, "");
}

export function formatFileSize(sizeKb: number | null): string {
  if (!sizeKb) return "";
  if (sizeKb < 1024) return `${sizeKb} KB`;
  return `${(sizeKb / 1024).toFixed(1)} MB`;
}

export function initials(name: string): string {
  const words = name
    .replace(/\b(Prof|Dr)\.?\s*/gi, "")
    .split(" ")
    .filter(Boolean);
  return words
    .slice(0, 2)
    .map((w) => w[0])
    .join("")
    .toUpperCase();
}

export function isNew(iso: string, days = 7): boolean {
  const published = new Date(iso).getTime();
  const now = Date.now();
  return now - published <= days * 24 * 60 * 60 * 1000;
}
