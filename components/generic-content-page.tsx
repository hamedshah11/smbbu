import { Breadcrumb } from "@/components/breadcrumb";
import { CtaBand, type CtaBandProps } from "@/components/cta-band";
import { Photo } from "@/components/photo";
import { FadeUp } from "@/components/fade-up";
import { Prose, type FeatureListState } from "@/components/prose";
import { SectionNav } from "@/components/section-nav";
import { formatFileSize } from "@/lib/format";
import { splitSections } from "@/lib/markdown";
import { getDownloadsByPageSlug } from "@/lib/queries";
import type { Page, RelatedLink } from "@/lib/types";

export async function GenericContentPage({
  page,
  section,
  kicker,
  cta,
}: {
  page: Page;
  section: string;
  kicker?: string;
  cta?: CtaBandProps;
}) {
  const downloads = await getDownloadsByPageSlug(page.slug);
  const relatedLinks = (page.meta.related_links as RelatedLink[] | undefined) ?? [];
  const contact = page.meta.contact;
  const heroPhoto = page.meta.hero_photo_url ?? null;
  const { intro, sections } = splitSections(page.body);
  const showSectionNav = sections.length >= 3;
  const featureListState: FeatureListState = { used: false };

  const headerText = (
    <>
      <Breadcrumb
        items={[{ label: "Home", href: "/" }, { label: section, href: "/" }, { label: page.title }]}
      />
      <p className="mt-5 font-mono text-[0.625rem] font-medium uppercase tracking-[0.1em] text-text-faint">
        {kicker ?? section}
      </p>
      <h1 className="mt-3 font-display text-[1.9375rem] font-extrabold leading-[1.1] tracking-[-0.015em] text-text-primary md:text-[3.25rem] md:leading-[1.05] md:tracking-[-0.02em]">
        {page.title}
      </h1>
      {page.standfirst && (
        <p className="mt-5 max-w-2xl font-display text-base leading-[1.6] text-text-secondary">
          {page.standfirst}
        </p>
      )}
    </>
  );

  return (
    <>
      <section className="border-b border-hairline bg-bg-tint">
        {heroPhoto ? (
          <div className="mx-auto grid max-w-(--container-page) grid-cols-1 md:grid-cols-[1fr_500px]">
            <div className="px-5 pb-9 pt-8 md:px-10 md:pb-14 md:pt-11">{headerText}</div>
            <Photo src={heroPhoto} alt={page.title} className="min-h-64 md:min-h-full" />
          </div>
        ) : (
          <div className="mx-auto max-w-(--container-page) px-5 pb-9 pt-8 md:px-10 md:pb-14 md:pt-11">
            {headerText}
          </div>
        )}
      </section>

      <section className="bg-bg-page">
        <div className="mx-auto grid max-w-(--container-page) grid-cols-1 gap-10 px-5 py-9 md:grid-cols-12 md:px-10 md:py-14">
          <div className="md:col-span-8">
            {intro && (
              <FadeUp className="mb-10">
                <Prose content={intro} featureListState={featureListState} />
              </FadeUp>
            )}
            <div className="space-y-10">
              {sections.map((s) => (
                <section key={s.id} id={s.id} className="scroll-mt-44">
                  <FadeUp>
                    <Prose content={s.content} featureListState={featureListState} />
                  </FadeUp>
                </section>
              ))}
            </div>
          </div>

          <aside className="md:col-span-4">
            <div className="space-y-8 md:sticky md:top-44">
              {showSectionNav && (
                <FadeUp>
                  <SectionNav sections={sections.map(({ id, title }) => ({ id, title }))} />
                </FadeUp>
              )}

              {relatedLinks.length > 0 && (
                <FadeUp>
                  <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
                    Related Links
                  </p>
                  <ul className="mt-2">
                    {relatedLinks.map((link) => (
                      <li key={link.label}>
                        <a
                          href={link.url}
                          className="group flex items-center justify-between gap-3 border-b border-hairline py-3 font-display text-sm font-semibold text-text-primary transition-colors hover:text-green-primary"
                        >
                          {link.label}
                          <span
                            aria-hidden="true"
                            className="shrink-0 text-green-primary transition-transform duration-150 group-hover:translate-x-1"
                          >
                            →
                          </span>
                        </a>
                      </li>
                    ))}
                  </ul>
                </FadeUp>
              )}

              {downloads.length > 0 && (
                <FadeUp>
                  <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
                    Downloads
                  </p>
                  <ul className="mt-2">
                    {downloads.map((d) => (
                      <li key={d.id}>
                        <a
                          href={d.file_url}
                          className="group flex items-center gap-3 border-b border-hairline py-3"
                        >
                          <span className="shrink-0 text-[0.625rem] font-bold text-pdf-icon">PDF</span>
                          <span className="flex-1 font-display text-sm font-semibold text-text-primary transition-colors group-hover:text-green-primary">
                            {d.title}
                          </span>
                          <span className="shrink-0 font-mono text-[0.6875rem] text-text-faint">
                            {formatFileSize(d.file_size_kb)}
                          </span>
                        </a>
                      </li>
                    ))}
                  </ul>
                </FadeUp>
              )}

              {contact && (contact.email || contact.phone || contact.location) && (
                <FadeUp>
                  <div className="rounded-sm bg-bg-tint p-6">
                    <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
                      Office Contact
                    </p>
                    <dl className="mt-4 space-y-4">
                      {contact.email && (
                        <div>
                          <dt className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                            Email
                          </dt>
                          <dd className="mt-1">
                            <a
                              href={`mailto:${contact.email}`}
                              className="font-mono text-sm text-text-primary hover:text-green-primary"
                            >
                              {contact.email}
                            </a>
                          </dd>
                        </div>
                      )}
                      {contact.phone && (
                        <div>
                          <dt className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                            Phone
                          </dt>
                          <dd className="mt-1 font-mono text-sm text-text-primary">{contact.phone}</dd>
                        </div>
                      )}
                      {contact.location && (
                        <div>
                          <dt className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                            Location
                          </dt>
                          <dd className="mt-1 font-display text-sm text-text-secondary">
                            {contact.location}
                          </dd>
                        </div>
                      )}
                    </dl>
                  </div>
                </FadeUp>
              )}
            </div>
          </aside>
        </div>
      </section>

      <CtaBand {...cta} />
    </>
  );
}
