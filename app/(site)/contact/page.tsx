import type { Metadata } from "next";
import { Breadcrumb } from "@/components/breadcrumb";

export const metadata: Metadata = { title: "Contact" };

const DEPARTMENT_CONTACTS = [
  { department: "Registrar's Office", extension: "EXT 101", email: "registrar@smbbmu.edu.pk" },
  { department: "Controller of Examinations", extension: "EXT 210", email: "coe@smbbmu.edu.pk" },
  { department: "Directorate of Admissions", extension: "EXT 145", email: "admissions@smbbmu.edu.pk" },
  { department: "Directorate of Finance", extension: "EXT 160", email: "finance@smbbmu.edu.pk" },
  { department: "Quality Enhancement Cell", extension: "EXT 188", email: "qec@smbbmu.edu.pk" },
  { department: "Directorate of Medical Education", extension: "EXT 192", email: "dme@smbbmu.edu.pk" },
];

export default function ContactPage() {
  return (
    <>
      <section className="bg-bg-page">
        <div className="mx-auto grid max-w-(--container-page) grid-cols-1 px-5 py-8 md:grid-cols-[1fr_500px] md:px-10 md:py-11">
          <div>
            <Breadcrumb items={[{ label: "Home", href: "/" }, { label: "Contact" }]} />
            <h1 className="mt-4 font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
              Contact us
            </h1>

            <div className="mt-8 space-y-6">
              <div>
                <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                  Address
                </p>
                <p className="mt-2 font-display text-base leading-[1.6] text-text-secondary">
                  Shaheed Mohtarma Benazir Bhutto Medical University
                  <br />
                  Airport Road, Larkana 77150
                  <br />
                  Sindh, Pakistan
                </p>
              </div>
              <div>
                <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                  Phone
                </p>
                <p className="mt-2 font-mono text-base text-text-primary">+92 74 9410 703</p>
                <p className="font-mono text-base text-text-primary">+92 74 9410 704</p>
              </div>
              <div>
                <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                  Email
                </p>
                <p className="mt-2 font-mono text-base text-text-primary">info@smbbmu.edu.pk</p>
              </div>
              <div>
                <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                  Office Hours
                </p>
                <p className="mt-2 font-display text-base text-text-secondary">
                  Monday – Friday, 8:30 – 16:00 PKT
                </p>
              </div>
            </div>
          </div>
          <div
            role="img"
            aria-label="Map showing SMBBMU location on Airport Road, Larkana"
            className="mt-8 flex min-h-64 flex-col items-center justify-center gap-3 bg-bg-tint md:mt-0"
          >
            <span className="flex h-9 w-9 items-center justify-center rounded-full border-2 border-green-primary">
              <span className="h-2.5 w-2.5 rounded-full bg-green-primary" />
            </span>
            <p className="text-center font-mono text-[0.6875rem] uppercase tracking-[0.05em] text-text-muted">
              Map — Airport Road, Larkana
              <br />
              27.5490° N, 68.2264° E
            </p>
          </div>
        </div>
      </section>

      <section className="bg-bg-tint">
        <div className="mx-auto max-w-(--container-page) px-5 py-11 md:px-10 md:py-16">
          <h2 className="font-display text-[1.1875rem] font-bold text-text-primary">Department contacts</h2>
          <div className="mt-4 divide-y divide-hairline-on-tint border-t border-hairline-strong">
            {DEPARTMENT_CONTACTS.map((c) => (
              <div key={c.department} className="flex flex-wrap items-center justify-between gap-2 py-4">
                <p className="font-display text-base font-bold text-text-primary">{c.department}</p>
                <div className="flex items-center gap-4">
                  <span className="font-mono text-[0.6875rem] uppercase tracking-[0.05em] text-text-faint">
                    {c.extension}
                  </span>
                  <a
                    href={`mailto:${c.email}`}
                    className="font-mono text-sm text-green-primary hover:text-hairline-strong"
                  >
                    {c.email}
                  </a>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
