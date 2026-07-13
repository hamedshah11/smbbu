import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { GenericContentPage } from "@/components/generic-content-page";
import { getPageBySlug } from "@/lib/queries";

export const metadata: Metadata = { title: "Administration" };

export default async function AdministrationPage() {
  const page = await getPageBySlug("administration");
  if (!page) notFound();

  return <GenericContentPage page={page} section="About" />;
}
