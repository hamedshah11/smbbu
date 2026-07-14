import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { GenericContentPage } from "@/components/generic-content-page";
import { getPageBySlug } from "@/lib/queries";

export const metadata: Metadata = { title: "Directorate of Medical Education" };

export default async function DmePage() {
  const page = await getPageBySlug("directorate-of-medical-education");
  if (!page) notFound();

  return (
    <GenericContentPage
      page={page}
      section="About"
      kicker="About — Directorate"
      cta={{
        heading: "Looking for notices from this office?",
        primary: { label: "Browse circulars", href: "/noticeboard/circular" },
        secondary: { label: "Contact the university", href: "/contact" },
      }}
    />
  );
}
