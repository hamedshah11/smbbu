import { SiteHeader } from "@/components/site-header";
import { SiteFooter } from "@/components/site-footer";
import { getDepartments, getInstitutes } from "@/lib/queries";

export default async function SiteLayout({ children }: { children: React.ReactNode }) {
  const [institutes, departments] = await Promise.all([getInstitutes(), getDepartments()]);

  return (
    <>
      <SiteHeader institutes={institutes} departments={departments} />
      <main>{children}</main>
      <SiteFooter />
    </>
  );
}
