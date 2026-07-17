import Link from "next/link";
import { DuotonePhoto } from "@/components/duotone-photo";
import { formatDateLong } from "@/lib/format";
import type { Announcement } from "@/lib/types";

export function NewsEventsGrid({ items }: { items: Announcement[] }) {
  return (
    <div className="grid grid-cols-1 gap-10 sm:grid-cols-3">
      {items.map((item) => (
        <Link key={item.id} href={`/noticeboard/${item.category}/${item.slug}`} className="group block">
          <DuotonePhoto
            src={item.photo_url}
            alt={item.title}
            plain
            className="aspect-[4/3] w-full rounded-sm"
          />
          <p className="mt-4 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
            {formatDateLong(item.published_at)} · {item.kicker ?? item.category}
          </p>
          <p className="mt-2 font-display text-[1.1875rem] font-bold leading-[1.25] tracking-[-0.015em] text-text-primary group-hover:text-green-primary">
            {item.title}
          </p>
        </Link>
      ))}
    </div>
  );
}
