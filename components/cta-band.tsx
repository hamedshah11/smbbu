import Link from "next/link";

export type CtaBandProps = {
  heading?: string;
  primary?: { label: string; href: string };
  secondary?: { label: string; href: string };
};

const DEFAULTS = {
  heading: "Looking for notices from this office?",
  primary: { label: "Browse the noticeboard", href: "/noticeboard" },
  secondary: { label: "Contact the university", href: "/contact" },
};

export function CtaBand({
  heading = DEFAULTS.heading,
  primary = DEFAULTS.primary,
  secondary = DEFAULTS.secondary,
}: CtaBandProps) {
  return (
    <section className="border-b border-hairline-on-dark bg-green-deep">
      <div className="mx-auto flex max-w-(--container-page) flex-col gap-6 px-5 py-11 md:flex-row md:items-center md:justify-between md:px-10 md:py-16">
        <h2 className="max-w-xl font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-on-dark md:text-[1.875rem]">
          {heading}
        </h2>
        <div className="flex flex-wrap gap-3 md:shrink-0">
          <Link
            href={primary.href}
            className="inline-flex items-center justify-center whitespace-nowrap rounded-full bg-text-on-dark px-[22px] py-3 font-display text-[0.78125rem] font-bold text-green-deep transition-colors hover:bg-green-soft"
          >
            {primary.label}
          </Link>
          <Link
            href={secondary.href}
            className="inline-flex items-center justify-center whitespace-nowrap rounded-full border-[1.5px] border-green-soft px-[22px] py-[11px] font-display text-[0.78125rem] font-bold text-text-on-dark transition-colors hover:bg-hairline-on-dark"
          >
            {secondary.label}
          </Link>
        </div>
      </div>
    </section>
  );
}
