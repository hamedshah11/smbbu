import type { Metadata } from "next";
import Link from "next/link";
import { Breadcrumb } from "@/components/breadcrumb";
import { formatFileSize } from "@/lib/format";
import { getDownloads, getPageBySlug } from "@/lib/queries";

export const metadata: Metadata = { title: "Policies" };

const POLICY_PAGE_SLUGS = ["scholarship-financial-aid-policy"];

export default async function PoliciesIndexPage() {
  const [policyDownloads, policyPages] = await Promise.all([
    getDownloads({ category: "Policies" }),
    Promise.all(POLICY_PAGE_SLUGS.map((slug) => getPageBySlug(slug))),
  ]);
  const pages = policyPages.filter((p) => p !== null);

  return (
    <section className="bg-bg-tint">
      <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
        <Breadcrumb items={[{ label: "Home", href: "/" }, { label: "Policies" }]} />
        <h1 className="mt-4 font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
          Policies
        </h1>
        <p className="mt-3 max-w-2xl font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
          University policies, rules and regulations governing students, faculty and staff.
        </p>
      </div>

      <div className="mx-auto max-w-(--container-page) border-t border-hairline-strong px-5 pb-14 pt-4 md:px-10">
        {pages.length > 0 && (
          <div className="mb-8">
            <p className="pt-2 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
              Policy pages
            </p>
            <div className="mt-2">
              {pages.map((page) => (
                <Link
                  key={page.slug}
                  href={`/policies/${page.slug}`}
                  className="flex items-center justify-between gap-4 border-b border-hairline-on-tint py-[13px] transition-colors duration-150 hover:bg-bg-hover-row"
                >
                  <span className="font-display text-[0.875rem] font-semibold leading-[1.35] text-text-primary">
                    {page.title}
                  </span>
                  <span className="shrink-0 font-display text-sm text-green-primary">→</span>
                </Link>
              ))}
            </div>
          </div>
        )}

        {policyDownloads.length > 0 && (
          <div>
            <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
              Policy documents
            </p>
            <div className="mt-2">
              {policyDownloads.map((d) => (
                <a
                  key={d.id}
                  href={d.file_url}
                  className="flex items-center gap-4 border-b border-hairline-on-tint py-[13px] transition-colors duration-150 hover:bg-bg-hover-row"
                >
                  <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-bg-page text-[0.625rem] font-bold text-pdf-icon">
                    PDF
                  </span>
                  <span className="flex-1 font-display text-[0.875rem] font-semibold leading-[1.35] text-text-primary">
                    {d.title}
                  </span>
                  <span className="shrink-0 font-mono text-[0.6875rem] text-text-faint">
                    {formatFileSize(d.file_size_kb)}
                  </span>
                </a>
              ))}
            </div>
          </div>
        )}
      </div>
    </section>
  );
}
