import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { NoticeboardListing } from "@/components/noticeboard-listing";
import { CATEGORY_TAB_LABEL, NOTICEBOARD_CATEGORIES, type AnnouncementCategory } from "@/lib/types";

export function generateStaticParams() {
  return NOTICEBOARD_CATEGORIES.map((category) => ({ category }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ category: string }>;
}): Promise<Metadata> {
  const { category } = await params;
  if (!NOTICEBOARD_CATEGORIES.includes(category as AnnouncementCategory)) return {};
  return { title: CATEGORY_TAB_LABEL[category as AnnouncementCategory] };
}

export default async function NoticeboardCategoryPage({
  params,
  searchParams,
}: {
  params: Promise<{ category: string }>;
  searchParams: Promise<{ q?: string; page?: string }>;
}) {
  const { category } = await params;
  if (!NOTICEBOARD_CATEGORIES.includes(category as AnnouncementCategory)) notFound();

  const sp = await searchParams;
  return <NoticeboardListing category={category as AnnouncementCategory} searchParams={sp} />;
}
