import Link from "next/link";
import { Breadcrumb } from "@/components/breadcrumb";
import { DuotonePhoto } from "@/components/duotone-photo";
import { initials } from "@/lib/format";
import { getDepartments, getFaculty } from "@/lib/queries";
import type { FacultyMember } from "@/lib/types";

export async function FacultyDirectory({ department }: { department?: string }) {
  const departments = await getDepartments();
  const activeDepartment = department
    ? departments.find((d) => d.toLowerCase() === department.toLowerCase())
    : undefined;

  const members = await getFaculty({ department: activeDepartment });

  return (
    <section className="bg-bg-tint">
      <div className="mx-auto max-w-(--container-page) px-5 py-8 md:px-10 md:py-11">
        <Breadcrumb
          items={[
            { label: "Home", href: "/" },
            { label: "Faculty" },
          ]}
        />
        <div className="mt-4 flex items-start justify-between gap-4">
          <div>
            <h1 className="font-display text-[1.625rem] font-extrabold leading-[1.05] tracking-[-0.025em] text-text-primary md:text-[1.875rem]">
              Faculty directory
            </h1>
            <p className="mt-3 max-w-2xl font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
              Professors, associate professors and lecturers across all constituent institutes.
            </p>
          </div>
          <p className="hidden shrink-0 font-mono text-[0.6875rem] font-medium uppercase tracking-[0.08em] text-text-faint sm:block">
            {members.length} {members.length === 1 ? "member" : "members"}
          </p>
        </div>

        <div className="mt-6 flex flex-wrap items-center gap-2">
          <TabLink href="/faculty" active={!activeDepartment}>
            All
          </TabLink>
          {departments.map((d) => (
            <TabLink key={d} href={`/faculty/${d.toLowerCase()}`} active={activeDepartment === d}>
              {d}
            </TabLink>
          ))}
        </div>
      </div>

      <div className="mx-auto max-w-(--container-page) border-t border-hairline-on-tint px-5 pb-14 pt-8 md:px-10">
        <div className="hidden grid-cols-2 gap-x-8 gap-y-10 sm:grid md:grid-cols-4">
          {members.map((member) => (
            <FacultyCard key={member.id} member={member} />
          ))}
        </div>
        <div className="divide-y divide-hairline-on-tint sm:hidden">
          {members.map((member) => (
            <FacultyListRow key={member.id} member={member} />
          ))}
        </div>
      </div>
    </section>
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

function FacultyCard({ member }: { member: FacultyMember }) {
  return (
    <div>
      <DuotonePhoto
        src={member.photo_url}
        alt={member.name}
        className="duotone-thumb aspect-square w-full rounded-sm"
      />
      <p className="mt-4 font-display text-base font-bold text-text-primary">{member.name}</p>
      <p className="font-display text-sm text-text-secondary">{member.designation}</p>
      <p className="mt-1 font-mono text-[0.625rem] font-medium uppercase tracking-[0.05em] text-green-primary">
        {member.department}
      </p>
    </div>
  );
}

function FacultyListRow({ member }: { member: FacultyMember }) {
  return (
    <div className="flex items-center gap-4 py-4">
      <span className="flex h-12 w-12 shrink-0 items-center justify-center rounded-full bg-bg-chip-on-tint font-display text-sm font-bold text-green-primary">
        {initials(member.name)}
      </span>
      <div>
        <p className="font-display text-base font-bold text-text-primary">{member.name}</p>
        <p className="font-display text-sm text-text-secondary">{member.designation}</p>
        <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.05em] text-green-primary">
          {member.department}
        </p>
      </div>
    </div>
  );
}
