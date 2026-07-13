import { Breadcrumb } from "@/components/breadcrumb";
import { Prose } from "@/components/prose";
import { formatFileSize } from "@/lib/format";
import { getDownloadsByPageSlug } from "@/lib/queries";
import type { Page, RelatedLink } from "@/lib/types";

export async function GenericContentPage({
  page,
  section,
}: {
  page: Page;
  section: string;
}) {
  const downloads = await getDownloadsByPageSlug(page.slug);
  const relatedLinks = (page.meta.related_links as RelatedLink[] | undefined) ?? [];
  const hasSidebar = relatedLinks.length > 0 || downloads.length > 0;

  return (
    <section className="bg-bg-page">
      <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
        <Breadcrumb
          items={[{ label: "Home", href: "/" }, { label: section, href: "/" }, { label: page.title }]}
        />
        <div className={hasSidebar ? "mt-4 grid grid-cols-1 gap-10 md:grid-cols-[1fr_320px]" : "mt-4"}>
          <div>
            <h1 className="font-display text-[1.625rem] font-extrabold leading-[1.1] tracking-[-0.02em] text-text-primary md:text-[2.25rem]">
              {page.title}
            </h1>
            {page.standfirst && (
              <p className="mt-4 max-w-2xl font-display text-base leading-[1.6] text-text-secondary">
                {page.standfirst}
              </p>
            )}
            <div className="mt-8">
              <Prose content={page.body} />
            </div>
          </div>

          {hasSidebar && (
            <aside className="h-fit rounded-sm bg-bg-tint p-6">
              {relatedLinks.length > 0 && (
                <div>
                  <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
                    Related Links
                  </p>
                  <ul className="mt-3 divide-y divide-hairline-on-tint">
                    {relatedLinks.map((link) => (
                      <li key={link.label} className="py-2">
                        <a
                          href={link.url}
                          className="font-display text-sm font-semibold text-green-primary hover:text-hairline-strong"
                        >
                          {link.label} →
                        </a>
                      </li>
                    ))}
                  </ul>
                </div>
              )}
              {downloads.length > 0 && (
                <div className="mt-6">
                  <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
                    Downloads
                  </p>
                  <ul className="mt-3 divide-y divide-hairline-on-tint">
                    {downloads.map((d) => (
                      <li key={d.id} className="flex items-center gap-3 py-2">
                        <span className="text-[0.625rem] font-bold text-pdf-icon">PDF</span>
                        <a
                          href={d.file_url}
                          className="flex-1 font-display text-sm font-semibold text-text-primary hover:text-green-primary"
                        >
                          {d.title}
                        </a>
                        <span className="font-mono text-[0.6875rem] text-text-faint">
                          {formatFileSize(d.file_size_kb)}
                        </span>
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </aside>
          )}
        </div>
      </div>
    </section>
  );
}
