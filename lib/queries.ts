import { isSupabaseConfigured, supabase } from "./supabase";
import * as seed from "./seed-data";
import type {
  Announcement,
  AnnouncementCategory,
  Department,
  Download,
  FacultyMember,
  Institute,
  Page,
} from "./types";

// The seed-data fallback exists so the site renders during local development
// before Supabase is connected. It must never silently serve placeholder
// content in production.
if (!isSupabaseConfigured && process.env.NODE_ENV === "production") {
  throw new Error(
    "Supabase is not configured: set NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY. " +
      "The seed-data fallback in lib/queries.ts is disabled in production builds.",
  );
}

const PAGE_SIZE = 9;

function sortByPublishedDesc(items: Announcement[]) {
  return [...items].sort(
    (a, b) => new Date(b.published_at).getTime() - new Date(a.published_at).getTime(),
  );
}

export async function getLatestAnnouncement(): Promise<Announcement | null> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase
      .from("announcements")
      .select("*")
      .not("published_at", "is", null)
      .lte("published_at", new Date().toISOString())
      .order("published_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    return data;
  }
  return sortByPublishedDesc(seed.announcements)[0] ?? null;
}

export async function getNoticeboard(opts: {
  category?: AnnouncementCategory;
  search?: string;
  page?: number;
  pageSize?: number;
}): Promise<{ items: Announcement[]; total: number }> {
  const page = opts.page ?? 1;
  const pageSize = opts.pageSize ?? PAGE_SIZE;
  const noticeboardCategories: AnnouncementCategory[] = [
    "examination",
    "admission",
    "circular",
    "job",
    "tender",
  ];

  if (isSupabaseConfigured && supabase) {
    let query = supabase
      .from("announcements")
      .select("*", { count: "exact" })
      .not("published_at", "is", null)
      .lte("published_at", new Date().toISOString())
      .in("category", opts.category ? [opts.category] : noticeboardCategories)
      .order("published_at", { ascending: false })
      .range((page - 1) * pageSize, page * pageSize - 1);

    if (opts.search) {
      query = query.ilike("title", `%${opts.search}%`);
    }

    const { data, count } = await query;
    return { items: data ?? [], total: count ?? 0 };
  }

  let items = sortByPublishedDesc(
    seed.announcements.filter((a) => noticeboardCategories.includes(a.category)),
  );
  if (opts.category) {
    items = items.filter((a) => a.category === opts.category);
  }
  if (opts.search) {
    const q = opts.search.toLowerCase();
    items = items.filter((a) => a.title.toLowerCase().includes(q));
  }
  const total = items.length;
  const start = (page - 1) * pageSize;
  return { items: items.slice(start, start + pageSize), total };
}

export async function getAnnouncementBySlug(slug: string): Promise<Announcement | null> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase.from("announcements").select("*").eq("slug", slug).maybeSingle();
    return data;
  }
  return seed.announcements.find((a) => a.slug === slug) ?? null;
}

export async function getRelatedAnnouncements(
  category: AnnouncementCategory,
  excludeSlug: string,
  limit = 3,
): Promise<Announcement[]> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase
      .from("announcements")
      .select("*")
      .eq("category", category)
      .neq("slug", excludeSlug)
      .order("published_at", { ascending: false })
      .limit(limit);
    return data ?? [];
  }
  return sortByPublishedDesc(
    seed.announcements.filter((a) => a.category === category && a.slug !== excludeSlug),
  ).slice(0, limit);
}

export async function getNewsEvents(limit = 3): Promise<Announcement[]> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase
      .from("announcements")
      .select("*")
      .in("category", ["news", "event"])
      .not("published_at", "is", null)
      .lte("published_at", new Date().toISOString())
      .order("published_at", { ascending: false })
      .limit(limit);
    return data ?? [];
  }
  const now = Date.now();
  return sortByPublishedDesc(
    seed.announcements.filter(
      (a) => (a.category === "news" || a.category === "event") && new Date(a.published_at).getTime() <= now,
    ),
  ).slice(0, limit);
}

export async function getHomeFeed(): Promise<{ hero: Announcement | null; newsEvents: Announcement[] }> {
  const items = await getNewsEvents(4);
  return { hero: items[0] ?? null, newsEvents: items.slice(1) };
}

export async function getInstitutes(): Promise<Institute[]> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase.from("institutes").select("*").order("sort_order");
    return data ?? [];
  }
  return [...seed.institutes].sort((a, b) => a.sort_order - b.sort_order);
}

export async function getInstituteBySlug(slug: string): Promise<Institute | null> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase.from("institutes").select("*").eq("slug", slug).maybeSingle();
    return data;
  }
  return seed.institutes.find((i) => i.slug === slug) ?? null;
}

export async function getFacultyByInstitute(
  instituteId: string,
  limit?: number,
): Promise<FacultyMember[]> {
  if (isSupabaseConfigured && supabase) {
    let query = supabase
      .from("faculty")
      .select("*")
      .eq("institute_id", instituteId)
      .order("sort_order");
    if (limit) query = query.limit(limit);
    const { data } = await query;
    return data ?? [];
  }
  const items = seed.faculty
    .filter((f) => f.institute_id === instituteId)
    .sort((a, b) => a.sort_order - b.sort_order);
  return limit ? items.slice(0, limit) : items;
}

export async function getFaculty(opts: {
  departmentSlug?: string;
}): Promise<FacultyMember[]> {
  if (isSupabaseConfigured && supabase) {
    let query = supabase.from("faculty").select("*").order("sort_order");
    if (opts.departmentSlug) query = query.eq("department_slug", opts.departmentSlug);
    const { data } = await query;
    return data ?? [];
  }
  let items = [...seed.faculty].sort((a, b) => a.sort_order - b.sort_order);
  if (opts.departmentSlug) items = items.filter((f) => f.department_slug === opts.departmentSlug);
  return items;
}

export async function getDepartments(): Promise<Department[]> {
  const all = isSupabaseConfigured && supabase
    ? ((await supabase.from("faculty").select("department, department_slug")).data ?? [])
    : seed.faculty;
  const bySlug = new Map<string, string>();
  for (const f of all) {
    if (f.department && f.department_slug) bySlug.set(f.department_slug, f.department);
  }
  return Array.from(bySlug, ([slug, name]) => ({ slug, name })).sort((a, b) =>
    a.name.localeCompare(b.name),
  );
}

export async function getPageBySlug(slug: string): Promise<Page | null> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase.from("pages").select("*").eq("slug", slug).maybeSingle();
    return data;
  }
  return seed.pages.find((p) => p.slug === slug) ?? null;
}

export async function getVCMessage(): Promise<Page | null> {
  return getPageBySlug("vc-message");
}

export async function getDownloadsByPageSlug(slug: string): Promise<Download[]> {
  if (isSupabaseConfigured && supabase) {
    const { data } = await supabase
      .from("downloads")
      .select("*")
      .eq("page_slug", slug)
      .order("uploaded_at", { ascending: false });
    return data ?? [];
  }
  return seed.downloads.filter((d) => d.page_slug === slug);
}

export async function getDownloads(opts: { category?: string } = {}): Promise<Download[]> {
  if (isSupabaseConfigured && supabase) {
    let query = supabase.from("downloads").select("*").order("uploaded_at", { ascending: false });
    if (opts.category) query = query.eq("category", opts.category);
    const { data } = await query;
    return data ?? [];
  }
  let items = [...seed.downloads].sort(
    (a, b) => new Date(b.uploaded_at).getTime() - new Date(a.uploaded_at).getTime(),
  );
  if (opts.category) items = items.filter((d) => d.category === opts.category);
  return items;
}

export async function getDownloadCategories(): Promise<string[]> {
  const items = await getDownloads();
  return Array.from(new Set(items.map((d) => d.category))).sort();
}
