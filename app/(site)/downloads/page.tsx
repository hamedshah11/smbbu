import type { Metadata } from "next";
import Link from "next/link";
import { Breadcrumb } from "@/components/breadcrumb";
import { Chip } from "@/components/chip";
import { formatDateShort, formatFileSize } from "@/lib/format";
import { getDownloadCategories, getDownloads } from "@/lib/queries";

export const metadata: Metadata = { title: "Downloads" };

export default async function DownloadsPage({
  searchParams,
}: {
  searchParams: Promise<{ category?: string }>;
}) {
  const { category } = await searchParams;
  const [categories, downloads] = await Promise.all([
    getDownloadCategories(),
    getDownloads({ category }),
  ]);

  return (
    <section className="bg-bg-tint">
      <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
        <Breadcrumb items={[{ label: "Home", href: "/" }, { label: "Downloads" }]} />
        <h1 className="mt-4 font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
          Downloads
        </h1>
        <p className="mt-3 font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
          Forms, policies, prospectuses and reports available for download.
        </p>

        <div className="mt-6 flex flex-wrap items-center gap-2">
          <TabLink href="/downloads" active={!category}>
            All
          </TabLink>
          {categories.map((c) => (
            <TabLink key={c} href={`/downloads?category=${encodeURIComponent(c)}`} active={category === c}>
              {c}
            </TabLink>
          ))}
        </div>
      </div>

      <div className="mx-auto max-w-(--container-page) border-t border-hairline-strong px-5 pb-14 pt-4 md:px-10">
        <p className="pt-2 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
          {downloads.length} {downloads.length === 1 ? "file" : "files"}
        </p>
        {downloads.length === 0 ? (
          <p className="py-10 font-display text-sm text-text-secondary">No downloads found.</p>
        ) : (
          <div>
            {downloads.map((d) => (
              <div
                key={d.id}
                className="flex items-center gap-4 border-b border-hairline-on-tint py-[13px] transition-colors duration-150 hover:bg-bg-hover-row"
              >
                <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-bg-page text-[0.625rem] font-bold text-pdf-icon">
                  PDF
                </span>
                <span className="min-w-0 flex-1">
                  <span className="block font-display text-[0.875rem] font-semibold leading-[1.35] text-text-primary">
                    {d.title}
                  </span>
                  <span className="mt-0.5 flex flex-wrap items-center gap-2">
                    <Chip onTint>{d.category}</Chip>
                    <span className="font-mono text-[0.6875rem] text-text-faint">
                      {formatFileSize(d.file_size_kb)} · {formatDateShort(d.uploaded_at)}
                    </span>
                  </span>
                </span>
                <a
                  href={d.file_url}
                  className="hidden shrink-0 font-display text-[0.78125rem] font-semibold text-pdf-icon sm:block"
                >
                  Download ↓
                </a>
              </div>
            ))}
          </div>
        )}
      </div>
    </section>
  );
}

function TabLink({
  href,
  active,
  children,
}: {
  href: string;
  active: boolean;
  children: React.ReactNode;
}) {
  return (
    <Link
      href={href}
      className={
        active
          ? "rounded-full bg-green-primary px-4 py-2 font-display text-sm font-bold text-bg-page"
          : "rounded-full border border-hairline-on-tint px-4 py-2 font-display text-sm text-text-secondary hover:bg-bg-hover-row"
      }
    >
      {children}
    </Link>
  );
}
