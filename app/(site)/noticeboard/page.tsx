import type { Metadata } from "next";
import { NoticeboardListing } from "@/components/noticeboard-listing";

export const metadata: Metadata = { title: "Noticeboard" };

export default async function NoticeboardPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; page?: string }>;
}) {
  const params = await searchParams;
  return <NoticeboardListing searchParams={params} />;
}
