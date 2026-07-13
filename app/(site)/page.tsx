import Link from "next/link";
import { Chip } from "@/components/chip";
import { PillButton } from "@/components/pill-button";
import { DuotonePhoto } from "@/components/duotone-photo";
import { NoticeRow } from "@/components/notice-row";
import { NewsEventsGrid } from "@/components/news-events-grid";
import { formatDateLong } from "@/lib/format";
import { getHomeFeed, getInstitutes, getNoticeboard, getVCMessage } from "@/lib/queries";

export default async function HomePage() {
  const [{ hero, newsEvents }, { items: notices }, institutes, vcMessage] = await Promise.all([
    getHomeFeed(),
    getNoticeboard({ page: 1, pageSize: 8 }),
    getInstitutes(),
    getVCMessage(),
  ]);

  return (
    <>
      {hero && (
        <section className="border-b border-hairline">
          <div className="mx-auto grid max-w-(--container-page) grid-cols-1 md:grid-cols-[1fr_500px]">
            <div className="flex flex-col justify-center px-5 py-11 md:px-10 md:py-16">
              <div className="flex items-center gap-3">
                <Chip>{hero.kicker ?? hero.category}</Chip>
                <span className="font-mono text-[0.6875rem] font-medium text-text-faint">
                  {formatDateLong(hero.published_at).toUpperCase()}
                </span>
              </div>
              <h1 className="mt-5 font-display text-[1.9375rem] font-extrabold leading-[1.1] tracking-[-0.015em] text-text-primary md:text-[3.25rem] md:leading-[1.05] md:tracking-[-0.02em]">
                {hero.title}
              </h1>
              <p className="mt-5 max-w-lg font-display text-base leading-[1.6] text-text-secondary">
                {hero.excerpt}
              </p>
              <Link
                href={`/noticeboard/${hero.category}/${hero.slug}`}
                className="mt-6 inline-flex w-fit items-center gap-1 border-b border-green-primary font-display text-sm font-semibold text-green-primary hover:text-hairline-strong"
              >
                Read the story →
              </Link>
            </div>
            <DuotonePhoto
              src={hero.photo_url}
              alt={hero.title}
              hero
              className="min-h-64 md:min-h-full"
            />
          </div>
        </section>
      )}

      <section className="border-b border-hairline">
        <div className="mx-auto flex max-w-(--container-page) items-center gap-2 overflow-x-auto px-5 py-4 md:px-10">
          <span className="mr-1 shrink-0 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
            Quick →
          </span>
          <PillButton href="https://finex.smbbmu.edu.pk/web/fees/online" variant="primary" external>
            Fee Payment
          </PillButton>
          <PillButton href="/noticeboard/examination" variant="primary">
            Results
          </PillButton>
          <PillButton href="/downloads">Downloads</PillButton>
          <PillButton href="/policies/scholarship-financial-aid-policy">Financial Aid</PillButton>
          <PillButton href="/alumni">Alumni</PillButton>
        </div>
      </section>

      <section className="bg-bg-tint">
        <div className="mx-auto grid max-w-(--container-page) grid-cols-1 gap-8 px-5 py-11 md:grid-cols-[3fr_9fr] md:px-10 md:py-16">
          <div>
            <h2 className="font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
              Notice board
            </h2>
            <p className="mt-3 font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
              Results, timetables, circulars and public notices — updated daily.
            </p>
            <ul className="mt-6 hidden gap-1 sm:flex sm:flex-col">
              {[
                { label: "All", href: "/noticeboard" },
                { label: "Examinations", href: "/noticeboard/examination" },
                { label: "Admissions", href: "/noticeboard/admission" },
                { label: "Circulars", href: "/noticeboard/circular" },
                { label: "Jobs", href: "/noticeboard/job" },
                { label: "Tenders", href: "/noticeboard/tender" },
              ].map((c) => (
                <li key={c.href}>
                  <Link
                    href={c.href}
                    className="block py-1 font-display text-sm text-text-secondary hover:text-green-primary"
                  >
                    {c.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
          <div>
            <div className="flex items-center justify-between border-b border-hairline-strong pb-3">
              <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
                Most recent first
              </p>
              <Link
                href="/noticeboard"
                className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary hover:text-hairline-strong"
              >
                Archive →
              </Link>
            </div>
            {notices.map((notice) => (
              <NoticeRow key={notice.id} notice={notice} />
            ))}
          </div>
        </div>
      </section>

      <section className="bg-bg-page">
        <div className="mx-auto max-w-(--container-page) px-5 py-11 md:px-10 md:py-16">
          <div className="flex items-center justify-between">
            <h2 className="font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
              News & Events
            </h2>
            <Link
              href="/events"
              className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary hover:text-hairline-strong"
            >
              All stories →
            </Link>
          </div>
          <div className="mt-7">
            <NewsEventsGrid items={newsEvents} />
          </div>
        </div>
      </section>

      {vcMessage && (
        <section className="bg-green-deep">
          <div className="mx-auto max-w-(--container-page) px-5 py-14 md:px-10 md:py-16">
            <p className="font-mono text-[0.6875rem] font-medium uppercase tracking-[0.1em] text-green-soft">
              Vice Chancellor
            </p>
            <blockquote className="mt-6 max-w-3xl font-serif text-[1.25rem] font-medium leading-[1.45] text-text-on-dark md:text-[1.875rem] md:leading-[1.35] md:tracking-[-0.005em]">
              &ldquo;{vcMessage.body}&rdquo;
            </blockquote>
            <div className="mt-8 flex items-center justify-between gap-4">
              <div className="flex items-center gap-4">
                <span
                  className="flex h-14 w-14 shrink-0 items-center justify-center rounded-full border text-[10px] font-bold text-gold-accent"
                  style={{ borderColor: "var(--gold-accent-ring)" }}
                >
                  VC
                </span>
                <div>
                  <p className="font-display text-base font-bold text-gold-accent">
                    {vcMessage.meta.name as string}
                  </p>
                  <p className="font-display text-sm text-text-on-dark-soft">
                    {vcMessage.meta.title as string}
                  </p>
                </div>
              </div>
              <Link
                href="/about/vc-message"
                className="hidden shrink-0 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-soft hover:text-text-on-dark sm:block"
              >
                Full message →
              </Link>
            </div>
          </div>
        </section>
      )}

      <section id="institutes" className="bg-bg-tint-strong">
        <div className="mx-auto max-w-(--container-page) px-5 py-11 md:px-10 md:py-16">
          <div className="flex items-center justify-between">
            <h2 className="font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
              Eight institutes, one university.
            </h2>
          </div>
          <div className="mt-7 grid grid-cols-1 gap-x-14 gap-y-0 md:grid-cols-2">
            {institutes.map((institute) => (
              <Link
                key={institute.id}
                href={`/institutes/${institute.slug}`}
                className="flex items-center gap-4 border-b border-hairline-on-tint-strong py-4 transition-colors hover:bg-bg-hover-row-alt"
              >
                <span className="flex h-11 w-11 shrink-0 items-center justify-center rounded-full border border-green-primary text-[9px] font-bold text-green-primary">
                  {institute.code}
                </span>
                <span className="font-display text-[0.9375rem] font-bold text-text-primary">
                  {institute.name}
                </span>
                <span className="ml-auto shrink-0 font-mono text-[0.6875rem] uppercase tracking-[0.05em] text-text-muted">
                  {institute.city}
                </span>
              </Link>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
