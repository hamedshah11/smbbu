import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { GenericContentPage } from "@/components/generic-content-page";
import { getPageBySlug } from "@/lib/queries";

export const metadata: Metadata = { title: "Quality Enhancement Cell" };

export default async function QecPage() {
  const page = await getPageBySlug("quality-enhancement-cell");
  if (!page) notFound();

  return <GenericContentPage page={page} section="About" />;
}
