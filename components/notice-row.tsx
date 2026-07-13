import Link from "next/link";
import { Chip } from "@/components/chip";
import { formatDateShort, isNew } from "@/lib/format";
import { CATEGORY_LABEL, type Announcement } from "@/lib/types";

export function NoticeRow({ notice }: { notice: Announcement }) {
  const hasAttachment = notice.attachments.length > 0;

  return (
    <Link
      href={`/noticeboard/${notice.category}/${notice.slug}`}
      className="grid grid-cols-[38px_1fr_auto] items-center gap-3 border-b border-hairline-on-tint px-0 py-[13px] transition-colors duration-150 hover:bg-bg-hover-row sm:grid-cols-[64px_110px_1fr_56px] sm:gap-4 sm:px-2"
    >
      <span className="font-mono text-[0.6875rem] font-medium text-text-faint">
        {formatDateShort(notice.published_at)}
      </span>
      <span className="hidden sm:block">
        <Chip onTint>{CATEGORY_LABEL[notice.category]}</Chip>
      </span>
      <span className="col-span-2 min-w-0 sm:col-span-1">
        <span className="block sm:hidden">
          <Chip onTint className="mb-1">
            {CATEGORY_LABEL[notice.category]}
          </Chip>
        </span>
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
        <span className="hidden shrink-0 font-display text-[0.78125rem] font-semibold text-pdf-icon sm:block">
          PDF ↓
        </span>
      )}
    </Link>
  );
}
