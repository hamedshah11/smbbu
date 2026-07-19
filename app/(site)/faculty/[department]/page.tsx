import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { FacultyDirectory } from "@/components/faculty-directory";
import { getDepartments } from "@/lib/queries";

export async function generateStaticParams() {
  const departments = await getDepartments();
  return departments.map((d) => ({ department: d.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ department: string }>;
}): Promise<Metadata> {
  const { department } = await params;
  const departments = await getDepartments();
  const match = departments.find((d) => d.slug === department);
  return { title: match ? `${match.name} Faculty` : "Faculty Directory" };
}

export default async function FacultyDepartmentPage({
  params,
}: {
  params: Promise<{ department: string }>;
}) {
  const { department } = await params;
  const departments = await getDepartments();
  const match = departments.find((d) => d.slug === department);
  if (!match) notFound();
  return <FacultyDirectory departmentSlug={match.slug} />;
}
