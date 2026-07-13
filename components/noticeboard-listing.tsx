import Link from "next/link";
import { Breadcrumb } from "@/components/breadcrumb";
import { NoticeRow } from "@/components/notice-row";
import { Pagination } from "@/components/pagination";
import { getNoticeboard } from "@/lib/queries";
import { CATEGORY_TAB_LABEL, NOTICEBOARD_CATEGORIES, type AnnouncementCategory } from "@/lib/types";

const PAGE_SIZE = 9;

export async function NoticeboardListing({
  category,
  searchParams,
}: {
  category?: AnnouncementCategory;
  searchParams: { q?: string; page?: string };
}) {
  const search = searchParams.q?.trim() || undefined;
  const page = Math.max(1, Number(searchParams.page) || 1);
  const { items, total } = await getNoticeboard({ category, search, page, pageSize: PAGE_SIZE });
  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE));
  const basePath = category ? `/noticeboard/${category}` : "/noticeboard";

  return (
    <>
      <section className="bg-bg-tint">
        <div className="mx-auto max-w-(--container-page) px-5 pb-8 pt-8 md:px-10 md:pb-10 md:pt-11">
          <Breadcrumb
            items={[
              { label: "Home", href: "/" },
              category
                ? { label: "Noticeboard", href: "/noticeboard" }
                : { label: "Noticeboard" },
              ...(category ? [{ label: CATEGORY_TAB_LABEL[category] }] : []),
            ]}
          />
          <h1 className="mt-4 font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
            Noticeboard
          </h1>
          <p className="mt-3 font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
            Results, timetables, circulars and public notices — updated daily.
          </p>

          <div className="mt-6 flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
            <div className="flex flex-wrap items-center gap-2">
              <TabLink href="/noticeboard" active={!category}>
                All
              </TabLink>
              {NOTICEBOARD_CATEGORIES.map((c) => (
                <TabLink key={c} href={`/noticeboard/${c}`} active={category === c}>
                  {CATEGORY_TAB_LABEL[c]}
                </TabLink>
              ))}
            </div>
            <form action={basePath} className="w-full md:w-64">
              <input
                type="search"
                name="q"
                defaultValue={search}
                placeholder="Search notices..."
                className="w-full rounded-full border border-hairline-on-tint bg-bg-page px-4 py-2 font-display text-sm text-text-primary placeholder:text-text-faint focus:border-green-primary focus:outline-none"
              />
            </form>
          </div>
        </div>

        <div className="mx-auto max-w-(--container-page) border-t border-hairline-strong px-5 pb-14 pt-4 md:px-10">
          <p className="pt-2 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
            {total} {total === 1 ? "notice" : "notices"} · Most recent first
          </p>
          {items.length === 0 ? (
            <p className="py-10 font-display text-sm text-text-secondary">
              No notices found{search ? ` for “${search}”` : ""}.
            </p>
          ) : (
            <div>
              {items.map((notice) => (
                <NoticeRow key={notice.id} notice={notice} />
              ))}
            </div>
          )}
          <Pagination basePath={basePath} currentPage={page} totalPages={totalPages} search={search} />
        </div>
      </section>
    </>
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
