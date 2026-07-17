import Link from "next/link";
import { Chip } from "@/components/chip";
import { formatDateShort, isNew } from "@/lib/format";
import { CATEGORY_LABEL, type Announcement } from "@/lib/types";

export function NoticeRow({ notice }: { notice: Announcement }) {
  const hasAttachment = notice.attachments.length > 0;

  // A single chip element is repositioned between the mobile (stacked) and
  // desktop (columnar) layouts via grid-template-areas, so exactly one
  // category label ever renders per row.
  return (
    <Link
      href={`/noticeboard/${notice.category}/${notice.slug}`}
      className="grid grid-cols-[38px_1fr] [grid-template-areas:'date_chip'_'date_title'] items-center gap-x-3 gap-y-1 border-b border-hairline-on-tint py-[13px] transition-colors duration-150 hover:bg-bg-hover-row sm:grid-cols-[64px_110px_1fr_56px] sm:[grid-template-areas:'date_chip_title_pdf'] sm:gap-x-4 sm:gap-y-0 sm:px-2"
    >
      <span className="self-start font-mono text-[0.6875rem] font-medium text-text-faint [grid-area:date] sm:self-center">
        {formatDateShort(notice.published_at)}
      </span>
      <span className="justify-self-start [grid-area:chip]">
        <Chip onTint>{CATEGORY_LABEL[notice.category]}</Chip>
      </span>
      <span className="min-w-0 [grid-area:title]">
        <span className="font-display text-[0.875rem] font-semibold leading-[1.35] text-text-primary">
          {notice.title}{" "}
          {isNew(notice.published_at) && (
            <span className="whitespace-nowrap text-[8.5px] font-bold tracking-[0.1em] text-green-primary">
              ● NEW
            </span>
          )}
        </span>
      </span>
      {hasAttachment && (
        <span className="hidden shrink-0 font-display text-[0.78125rem] font-semibold text-pdf-icon [grid-area:pdf] sm:block">
          PDF ↓
        </span>
      )}
    </Link>
  );
}
