import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Breadcrumb } from "@/components/breadcrumb";
import { Chip } from "@/components/chip";
import { formatDateLong, formatDateShort, formatFileSize } from "@/lib/format";
import { getAnnouncementBySlug, getRelatedAnnouncements } from "@/lib/queries";
import { CATEGORY_LABEL, CATEGORY_TAB_LABEL } from "@/lib/types";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ category: string; slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const notice = await getAnnouncementBySlug(slug);
  return { title: notice?.title ?? "Notice" };
}

export default async function NoticeDetailPage({
  params,
}: {
  params: Promise<{ category: string; slug: string }>;
}) {
  const { category, slug } = await params;
  const notice = await getAnnouncementBySlug(slug);
  if (!notice || notice.category !== category) notFound();

  const related = await getRelatedAnnouncements(notice.category, notice.slug);

  return (
    <>
      <section className="bg-bg-page">
        <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
          <Breadcrumb
            items={[
              { label: "Home", href: "/" },
              { label: "Noticeboard", href: "/noticeboard" },
              { label: CATEGORY_TAB_LABEL[notice.category], href: `/noticeboard/${notice.category}` },
            ]}
          />
          <div className="mt-4 flex flex-wrap items-center gap-3">
            <Chip>{CATEGORY_LABEL[notice.category]}</Chip>
            <span className="font-mono text-[0.6875rem] font-medium text-text-faint">
              {formatDateLong(notice.published_at)}
              {notice.ref_number ? ` · REF: ${notice.ref_number}` : ""}
            </span>
          </div>
          <h1 className="mt-4 max-w-3xl font-display text-[1.625rem] font-extrabold leading-[1.1] tracking-[-0.02em] text-text-primary md:text-[2.25rem]">
            {notice.title}
          </h1>
          <div className="mt-6 max-w-3xl space-y-4 font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
            {notice.body.split("\n\n").map((para, i) => (
              <p key={i}>{para}</p>
            ))}
          </div>
        </div>
      </section>

      {notice.attachments.length > 0 && (
        <section className="bg-bg-tint">
          <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
            <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
              Attachments
            </p>
            <div className="mt-4 divide-y divide-hairline-on-tint">
              {notice.attachments.map((att, i) => (
                <div
                  key={att.url + i}
                  className="flex flex-col gap-3 py-4 sm:flex-row sm:items-center sm:justify-between"
                >
                  <div className="flex items-center gap-3">
                    <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-bg-page text-[0.625rem] font-bold text-pdf-icon">
                      PDF
                    </span>
                    <div>
                      <p className="font-display text-sm font-semibold text-text-primary">{att.name}</p>
                      <p className="font-mono text-[0.6875rem] text-text-faint">
                        {formatFileSize(att.size_kb)} · Uploaded {formatDateLong(notice.published_at)}
                      </p>
                    </div>
                  </div>
                  <a
                    href={att.url}
                    className={
                      i === 0
                        ? "inline-flex items-center justify-center rounded-full bg-green-primary px-6 py-2.5 font-display text-sm font-bold text-bg-page hover:bg-hairline-strong"
                        : "inline-flex items-center justify-center rounded-full border-[1.5px] border-green-primary px-6 py-2.5 font-display text-sm font-bold text-green-primary hover:bg-bg-pill-hover"
                    }
                  >
                    Download ↓
                  </a>
                </div>
              ))}
            </div>
          </div>
        </section>
      )}

      {related.length > 0 && (
        <section className="bg-bg-page">
          <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
            <h2 className="font-display text-[1.1875rem] font-bold text-text-primary">Related notices</h2>
            <div className="mt-4 border-t border-hairline-strong">
              {related.map((item) => (
                <Link
                  key={item.id}
                  href={`/noticeboard/${item.category}/${item.slug}`}
                  className="flex items-center gap-4 border-b border-hairline py-3 transition-colors hover:bg-bg-hover-row"
                >
                  <span className="font-mono text-[0.6875rem] font-medium text-text-faint">
                    {formatDateShort(item.published_at)}
                  </span>
                  <Chip>{CATEGORY_LABEL[item.category]}</Chip>
                  <span className="font-display text-sm font-semibold text-text-primary">{item.title}</span>
                </Link>
              ))}
            </div>
          </div>
        </section>
      )}
    </>
  );
}
