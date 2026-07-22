import Link from "next/link";
import { Breadcrumb } from "@/components/breadcrumb";
import { FacultyAvatar } from "@/components/faculty-avatar";
import { getDepartments, getFaculty } from "@/lib/queries";
import type { FacultyMember } from "@/lib/types";

type DepartmentGroup = {
  slug: string;
  name: string | null;
  members: FacultyMember[];
};

function groupByDepartment(members: FacultyMember[]): DepartmentGroup[] {
  const groups: DepartmentGroup[] = [];
  const bySlug = new Map<string, DepartmentGroup>();
  for (const member of members) {
    // slug when present, else the display name — rows with neither share the trailing headerless group
    const key = member.department_slug ?? member.department ?? "";
    let group = bySlug.get(key);
    if (!group) {
      group = { slug: key, name: member.department, members: [] };
      bySlug.set(key, group);
      groups.push(group);
    }
    group.members.push(member);
  }
  // members without a department sink to the end, under no header
  return groups.sort((a, b) => Number(a.name === null) - Number(b.name === null));
}

export async function FacultyDirectory({ departmentSlug }: { departmentSlug?: string }) {
  const departments = await getDepartments();
  const activeDepartment = departmentSlug
    ? departments.find((d) => d.slug === departmentSlug)
    : undefined;

  const members = await getFaculty({ departmentSlug: activeDepartment?.slug });
  const groups = groupByDepartment(members);

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
            <TabLink key={d.slug} href={`/faculty/${d.slug}`} active={activeDepartment?.slug === d.slug}>
              {d.name}
            </TabLink>
          ))}
        </div>
      </div>

      <div className="mx-auto max-w-(--container-page) space-y-12 border-t border-hairline-on-tint px-5 pb-14 pt-8 md:px-10">
        {groups.map((group) => (
          <section key={group.slug || "no-department"}>
            {group.name && (
              <h2 className="border-b border-hairline-on-tint pb-3 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-green-primary">
                {group.name}
              </h2>
            )}
            <div className="mt-5 divide-y divide-hairline-on-tint sm:grid sm:grid-cols-2 sm:gap-x-8 sm:gap-y-10 sm:divide-y-0 md:grid-cols-4">
              {group.members.map((member) => (
                <FacultyMemberItem key={member.id} member={member} />
              ))}
            </div>
          </section>
        ))}
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

function FacultyMemberItem({ member }: { member: FacultyMember }) {
  return (
    <div className="flex items-center gap-4 py-4 sm:block sm:py-0">
      <FacultyAvatar
        photoUrl={member.photo_url}
        name={member.name}
        className="h-12 w-12 shrink-0 rounded-full text-sm sm:aspect-square sm:h-auto sm:w-full sm:rounded-sm sm:text-2xl"
      />
      <div className="sm:mt-4">
        <p className="font-display text-base font-bold text-text-primary">{member.name}</p>
        <p className="font-display text-sm text-text-secondary">{member.designation}</p>
      </div>
    </div>
  );
}
