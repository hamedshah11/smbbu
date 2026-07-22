"use client";

import { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import crest from "@/public/crest.png";
import { cn } from "@/lib/utils";
import type { Department, Institute } from "@/lib/types";

type LinkItem = { label: string; href: string; external?: boolean };

const UTILITY_LINKS: LinkItem[] = [
  { label: "QEC", href: "/qec" },
  { label: "DME", href: "/dme" },
  { label: "Policies", href: "/policies" },
  { label: "SMBBMU Library Blog", href: "https://smbbmulibraries.blogspot.com", external: true },
  { label: "Student Resources", href: "/downloads" },
  // TODO: placeholder — replace with the client's real webmail URL when provided.
  { label: "Webmail", href: "https://mail.google.com", external: true },
  { label: "Tenders", href: "/noticeboard/tender" },
  { label: "Contact", href: "/contact" },
];

const NOTICEBOARD_LINKS: LinkItem[] = [
  { label: "All notices", href: "/noticeboard" },
  { label: "Examinations", href: "/noticeboard/examination" },
  { label: "Admissions", href: "/noticeboard/admission" },
  { label: "Circulars", href: "/noticeboard/circular" },
  { label: "Jobs", href: "/noticeboard/job" },
  { label: "Tenders", href: "/noticeboard/tender" },
];

const ABOUT_LINKS: LinkItem[] = [
  { label: "The University", href: "/about/the-university" },
  { label: "Quality Enhancement Cell", href: "/qec" },
  { label: "Directorate of Medical Education", href: "/dme" },
];

const ADMISSIONS_LINKS: LinkItem[] = [
  { label: "MBBS / BDS", href: "http://admissions.smbbmu.edu.pk", external: true },
  { label: "Nursing", href: "http://admissions.smbbmu.edu.pk", external: true },
  { label: "PHARM-D / DPT", href: "http://admissions.smbbmu.edu.pk", external: true },
  { label: "Postgraduate", href: "/noticeboard/admission" },
];

type NavItem =
  | { label: string; href: string; dropdown?: never }
  | { label: string; href: string; dropdown: LinkItem[] };

function buildNavItems(institutes: Institute[], departments: Department[]): NavItem[] {
  return [
    { label: "Home", href: "/" },
    { label: "About", href: "/about/the-university", dropdown: ABOUT_LINKS },
    { label: "Administration", href: "/administration" },
    { label: "Admissions", href: "/noticeboard/admission", dropdown: ADMISSIONS_LINKS },
    {
      label: "Institutes",
      href: "/#institutes",
      dropdown: institutes.map((i) =>
        i.website_url
          ? { label: i.name, href: i.website_url, external: true }
          : { label: i.name, href: `/institutes/${i.slug}` },
      ),
    },
    {
      label: "Faculty",
      href: "/faculty",
      dropdown: [
        { label: "All Faculty", href: "/faculty" },
        ...departments.map((d) => ({ label: d.name, href: `/faculty/${d.slug}` })),
      ],
    },
    { label: "Noticeboard", href: "/noticeboard", dropdown: NOTICEBOARD_LINKS },
    { label: "Events", href: "/events" },
  ];
}

export function SiteHeader({
  institutes,
  departments,
}: {
  institutes: Institute[];
  departments: Department[];
}) {
  const [mobileOpen, setMobileOpen] = useState(false);
  const pathname = usePathname();
  const navItems = buildNavItems(institutes, departments);

  return (
    <div className="sticky top-0 z-50 bg-bg-page">
      <div className="border-b border-hairline">
        <div className="mx-auto flex max-w-(--container-page) items-center justify-end gap-6 px-5 py-2 md:px-10">
          {UTILITY_LINKS.map((link) =>
            link.external ? (
              <a
                key={link.label}
                href={link.href}
                target="_blank"
                rel="noopener noreferrer"
                className="hidden font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-muted transition-colors hover:text-text-primary md:inline-block"
              >
                {link.label}
              </a>
            ) : (
              <Link
                key={link.label}
                href={link.href}
                className="hidden font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-muted transition-colors hover:text-text-primary md:inline-block"
              >
                {link.label}
              </Link>
            ),
          )}
          <button
            type="button"
            aria-label="Toggle menu"
            onClick={() => setMobileOpen((v) => !v)}
            className="ml-auto flex flex-col gap-[5px] md:hidden"
          >
            <span className="h-[2px] w-6 bg-text-primary" />
            <span className="h-[2px] w-6 bg-text-primary" />
          </button>
        </div>
      </div>

      <div className="border-b border-hairline-strong">
        <div className="mx-auto flex max-w-(--container-page) items-center justify-between gap-6 px-5 py-5 md:px-10">
          <Link href="/" className="flex items-center gap-4">
            <Image
              src={crest}
              alt="SMBBMU crest"
              className="h-16 w-16 shrink-0 md:h-20 md:w-20"
              priority
            />
            <span className="leading-tight">
              <span className="block font-display text-[0.95rem] font-extrabold uppercase leading-tight text-text-primary">
                Shaheed Mohtarma Benazir Bhutto
              </span>
              <span className="block font-display text-[0.95rem] font-extrabold uppercase leading-tight text-text-primary">
                Medical University
              </span>
              <span dir="rtl" className="mt-1 block font-sindhi text-sm text-text-secondary">
                شہید محترمہ بینظیر بھٹو میڈیکل یونیورسٹی لاڑکاڻو
              </span>
            </span>
          </Link>

          <PillCta />
        </div>

        <nav className="mx-auto hidden max-w-(--container-page) items-center gap-7 px-10 md:flex">
          {navItems.map((item) => (
            <NavDropdown key={item.label} item={item} active={isActive(pathname, item.href)} />
          ))}
        </nav>
      </div>

      {mobileOpen && (
        <nav className="border-b border-hairline-strong bg-bg-page md:hidden">
          <ul className="mx-auto max-w-(--container-page) px-5 py-2">
            {navItems.map((item) => (
              <li key={item.label} className="border-b border-hairline last:border-0">
                <Link
                  href={item.href}
                  className="block py-3 font-display text-[0.8125rem] font-semibold uppercase tracking-[0.05em] text-text-primary"
                  onClick={() => setMobileOpen(false)}
                >
                  {item.label}
                </Link>
              </li>
            ))}
          </ul>
        </nav>
      )}
    </div>
  );
}

function isActive(pathname: string, href: string) {
  if (href === "/") return pathname === "/";
  const base = href.split("#")[0];
  return base !== "/" && pathname.startsWith(base);
}

function NavDropdown({ item, active }: { item: NavItem; active: boolean }) {
  const subLinkClass =
    "block px-4 py-2 font-display text-[0.8125rem] text-text-secondary hover:bg-bg-chip hover:text-green-primary";

  return (
    <div className="group relative py-4">
      <Link
        href={item.href}
        className={cn(
          "font-display text-[0.71875rem] font-semibold uppercase tracking-[0.07em] transition-colors",
          active ? "font-bold text-green-primary" : "text-text-primary hover:text-green-primary",
        )}
      >
        {item.label}
      </Link>
      {active && <span className="absolute -bottom-px left-0 h-[2px] w-full bg-green-primary" />}
      {item.dropdown && (
        <div className="invisible absolute left-0 top-full z-10 min-w-56 rounded-md border border-hairline bg-bg-page py-2 opacity-0 shadow-lg transition-all duration-150 group-hover:visible group-hover:opacity-100">
          {item.dropdown.map((sub) =>
            sub.external ? (
              <a
                key={sub.label}
                href={sub.href}
                target="_blank"
                rel="noopener noreferrer"
                className={subLinkClass}
              >
                {sub.label} ↗
              </a>
            ) : (
              <Link key={sub.label} href={sub.href} className={subLinkClass}>
                {sub.label}
              </Link>
            ),
          )}
        </div>
      )}
    </div>
  );
}

function PillCta() {
  return (
    <Link
      href="/noticeboard/admission"
      className="hidden shrink-0 items-center justify-center whitespace-nowrap rounded-full bg-green-primary px-[22px] py-3 font-display text-[0.78125rem] font-bold text-bg-page transition-colors hover:bg-hairline-strong sm:inline-flex"
    >
      Apply — July 2026 →
    </Link>
  );
}
