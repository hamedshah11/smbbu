import type { Metadata } from "next";
import { Breadcrumb } from "@/components/breadcrumb";
import { NewsEventsGrid } from "@/components/news-events-grid";
import { getNewsEvents } from "@/lib/queries";

export const metadata: Metadata = { title: "News & Events" };

export default async function EventsPage() {
  const items = await getNewsEvents(30);

  return (
    <section className="bg-bg-page">
      <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
        <Breadcrumb items={[{ label: "Home", href: "/" }, { label: "Events" }]} />
        <h1 className="mt-4 font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
          News & Events
        </h1>
        <p className="mt-3 max-w-2xl font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
          Campus news, outreach and faculty highlights from across the university.
        </p>
        <div className="mt-9">
          <NewsEventsGrid items={items} />
        </div>
      </div>
    </section>
  );
}
