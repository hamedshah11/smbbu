import Image from "next/image";
import Link from "next/link";
import { Facebook, Instagram, Linkedin, Twitter, Youtube } from "lucide-react";
import crest from "@/public/crest.png";

const COLUMNS = [
  {
    heading: "About",
    links: [
      { label: "The University", href: "/about/the-university" },
      { label: "Administration", href: "/administration" },
      { label: "Faculty", href: "/faculty" },
      { label: "Quality Enhancement Cell", href: "/qec" },
    ],
  },
  {
    heading: "Noticeboard",
    links: [
      { label: "Examinations", href: "/noticeboard/examination" },
      { label: "Admissions", href: "/noticeboard/admission" },
      { label: "Circulars", href: "/noticeboard/circular" },
      { label: "Jobs & Tenders", href: "/noticeboard/job" },
    ],
  },
  {
    heading: "Quick Links",
    links: [
      { label: "Downloads", href: "/downloads" },
      { label: "Events", href: "/events" },
      { label: "Directorate of Medical Education", href: "/dme" },
      { label: "Contact", href: "/contact" },
    ],
  },
];

const SOCIAL = [
  { label: "X (Twitter)", href: "https://x.com/smbbmulrk", Icon: Twitter },
  { label: "Facebook", href: "https://facebook.com/smbbmu2009", Icon: Facebook },
  { label: "YouTube", href: "https://youtube.com/@smbbmularkana-ji6nm", Icon: Youtube },
  { label: "Instagram", href: "https://instagram.com/smbbmu2009", Icon: Instagram },
  { label: "LinkedIn", href: "https://linkedin.com/company/smbbmu2009", Icon: Linkedin },
];

export function SiteFooter() {
  return (
    <footer className="bg-green-deep">
      <div className="mx-auto max-w-(--container-page) px-5 pb-10 pt-14 md:px-10">
        <div className="flex items-center gap-3">
          <Image src={crest} alt="SMBBMU crest" className="h-11 w-11 shrink-0" />
          <span>
            <span className="block font-display text-base font-extrabold uppercase text-text-on-dark">
              Shaheed Mohtarma Benazir Bhutto Medical University, Larkana
            </span>
            <span dir="rtl" className="block font-sindhi text-sm text-text-on-dark-soft">
              شہید محترمہ بینظیر بھٹو میڈیکل یونیورسٹی لاڑکاڻو
            </span>
          </span>
        </div>

        <div className="mt-8 border-t border-hairline-on-dark pt-10">
          <div className="grid grid-cols-2 gap-x-10 gap-y-10 md:grid-cols-4">
            {COLUMNS.map((col) => (
              <div key={col.heading}>
                <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.1em] text-green-soft">
                  {col.heading}
                </p>
                <ul className="mt-3 space-y-3">
                  {col.links.map((link) => (
                    <li key={link.href}>
                      <Link
                        href={link.href}
                        className="font-display text-sm text-text-on-dark-soft transition-colors hover:text-text-on-dark"
                      >
                        {link.label}
                      </Link>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
            <div>
              <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.1em] text-green-soft">
                Contact
              </p>
              <p className="mt-3 font-display text-sm text-text-on-dark-soft">
                SMBBMU, Airport Road,
                <br />
                Larkana 77150, Sindh, Pakistan
                <br />
                info@smbbmu.edu.pk
              </p>
              <div className="mt-4 flex gap-4">
                {SOCIAL.map(({ label, href, Icon }) => (
                  <a
                    key={label}
                    href={href}
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label={label}
                    className="text-text-on-dark-soft transition-colors hover:text-text-on-dark"
                  >
                    <Icon size={16} strokeWidth={1.75} aria-hidden="true" />
                  </a>
                ))}
              </div>
            </div>
          </div>
        </div>

        <div className="mt-10 flex flex-col gap-2 border-t border-hairline-on-dark pt-6 text-[0.75rem] text-text-on-dark-muted sm:flex-row sm:items-center sm:justify-between">
          <p>© 2026 Shaheed Mohtarma Benazir Bhutto Medical University. All rights reserved.</p>
          <p className="font-mono text-[0.6875rem] tracking-[0.05em]">LARKANA · SINDH · PAKISTAN</p>
        </div>
      </div>
    </footer>
  );
}
