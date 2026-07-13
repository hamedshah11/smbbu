import type { Metadata } from "next";
import { FacultyDirectory } from "@/components/faculty-directory";

export const metadata: Metadata = { title: "Faculty Directory" };

export default function FacultyPage() {
  return <FacultyDirectory />;
}
