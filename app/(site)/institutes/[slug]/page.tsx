import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Breadcrumb } from "@/components/breadcrumb";
import { Chip } from "@/components/chip";
import { FacultyAvatar } from "@/components/faculty-avatar";
import { InstituteLogo } from "@/components/institute-logo";
import { Photo } from "@/components/photo";
import { initials } from "@/lib/format";
import { getFacultyByInstitute, getInstituteBySlug, getInstitutes } from "@/lib/queries";

export async function generateStaticParams() {
  const institutes = await getInstitutes();
  return institutes.map((i) => ({ slug: i.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const institute = await getInstituteBySlug(slug);
  return { title: institute?.name ?? "Institute" };
}

export default async function InstitutePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const institute = await getInstituteBySlug(slug);
  if (!institute) notFound();

  const faculty = await getFacultyByInstitute(institute.id, 5);

  return (
    <>
      <section className="border-b border-hairline">
        <div className="mx-auto grid max-w-(--container-page) grid-cols-1 md:grid-cols-[1fr_500px]">
          <div className="flex flex-col justify-center px-5 py-11 md:px-10 md:py-16">
            <Breadcrumb
              items={[
                { label: "Home", href: "/" },
                { label: "Institutes", href: "/#institutes" },
                { label: institute.code },
              ]}
            />
            <InstituteLogo
              logoUrl={institute.logo_url}
              code={institute.code}
              name={institute.name}
              className="mt-5 h-16 w-16"
            />
            <div className="mt-5 flex flex-wrap items-center gap-3">
              <Chip>{institute.is_constituent ? "Constituent College" : "Institute"}</Chip>
              <span className="font-mono text-[0.6875rem] font-medium text-text-faint">
                {institute.established_year ? `EST. ${institute.established_year} · ` : ""}
                {institute.city.toUpperCase()}
              </span>
            </div>
            <h1 className="mt-5 font-display text-[1.9375rem] font-extrabold leading-[1.1] tracking-[-0.015em] text-text-primary md:text-[3.25rem] md:leading-[1.05] md:tracking-[-0.02em]">
              {institute.name}
            </h1>
            <p className="mt-5 max-w-lg font-display text-base leading-[1.6] text-text-secondary">
              {institute.description}
            </p>
          </div>
          <Photo
            src={institute.hero_photo_url}
            alt={`${institute.name} campus`}
            className="min-h-64 md:min-h-full"
          />
        </div>
      </section>

      <section className="bg-bg-tint">
        <div className="mx-auto grid max-w-(--container-page) grid-cols-1 gap-10 px-5 py-11 md:grid-cols-2 md:px-10 md:py-16">
          <div>
            <h2 className="font-display text-[1.1875rem] font-bold text-text-primary">Programmes offered</h2>
            <div className="mt-4 divide-y divide-hairline-on-tint border-t border-hairline-strong">
              {institute.programmes.map((p, i) => (
                <div key={i} className="flex items-center gap-4 py-3">
                  <span className="w-8 shrink-0 font-mono text-[0.625rem] font-medium uppercase text-text-faint">
                    {p.level}
                  </span>
                  <span className="flex-1 font-display text-sm font-semibold text-text-primary">
                    {p.name}
                  </span>
                  <span className="shrink-0 font-mono text-[0.6875rem] uppercase text-text-faint">
                    {p.duration}
                  </span>
                </div>
              ))}
            </div>
          </div>
          <div>
            <h2 className="font-display text-[1.1875rem] font-bold text-text-primary">Key contacts</h2>
            <div className="mt-4 divide-y divide-hairline-on-tint border-t border-hairline-strong">
              {institute.principal_name && (
                <div className="py-3">
                  <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                    Principal
                  </p>
                  <p className="mt-1 font-display text-sm font-bold text-text-primary">
                    {institute.principal_name}
                  </p>
                  {institute.principal_email && (
                    <p className="font-display text-sm text-text-secondary">{institute.principal_email}</p>
                  )}
                </div>
              )}
              {institute.vice_principal_name && (
                <div className="py-3">
                  <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                    Vice Principal (Academics)
                  </p>
                  <p className="mt-1 font-display text-sm font-bold text-text-primary">
                    {institute.vice_principal_name}
                  </p>
                  {institute.vice_principal_email && (
                    <p className="font-display text-sm text-text-secondary">
                      {institute.vice_principal_email}
                    </p>
                  )}
                </div>
              )}
              {institute.student_affairs_office && (
                <div className="py-3">
                  <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                    Student Affairs Office
                  </p>
                  <p className="mt-1 font-display text-sm text-text-secondary">
                    {institute.student_affairs_office}
                  </p>
                </div>
              )}
            </div>
          </div>
        </div>
      </section>

      {faculty.length > 0 && (
        <section className="bg-bg-page">
          <div className="mx-auto max-w-(--container-page) px-5 py-11 md:px-10 md:py-16">
            <div className="flex items-center justify-between">
              <h2 className="font-display text-[1.1875rem] font-bold text-text-primary">Faculty</h2>
              <Link
                href="/faculty"
                className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary hover:text-hairline-strong"
              >
                Full directory →
              </Link>
            </div>
            <div className="mt-6 grid grid-cols-2 gap-x-8 gap-y-8 sm:grid-cols-3 md:grid-cols-5">
              {faculty.map((member) => (
                <div key={member.id} className="text-center sm:text-left">
                  <FacultyAvatar
                    photoUrl={member.photo_url}
                    name={member.name}
                    className="mx-auto aspect-square w-20 rounded-full text-sm sm:mx-0 sm:w-full sm:rounded-sm sm:text-xl"
                  />
                  <p className="mt-3 font-display text-sm font-bold text-text-primary sm:hidden">
                    {initials(member.name)}
                  </p>
                  <p className="mt-3 hidden font-display text-sm font-bold text-text-primary sm:block">
                    {member.name}
                  </p>
                  <p className="font-display text-xs text-text-secondary">{member.designation}</p>
                </div>
              ))}
            </div>
          </div>
        </section>
      )}
    </>
  );
}
