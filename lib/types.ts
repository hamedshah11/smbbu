export type AnnouncementCategory =
  | "examination"
  | "admission"
  | "circular"
  | "job"
  | "tender"
  | "news"
  | "event";

export type Attachment = {
  name: string;
  url: string;
  size_kb: number;
};

export type Announcement = {
  id: string;
  title: string;
  slug: string;
  category: AnnouncementCategory;
  ref_number: string | null;
  body: string;
  excerpt: string | null;
  kicker: string | null;
  photo_url: string | null;
  attachments: Attachment[];
  published_at: string;
  created_at: string;
};

export type Programme = {
  level: string;
  name: string;
  duration: string;
};

export type Institute = {
  id: string;
  name: string;
  code: string;
  slug: string;
  city: string;
  description: string;
  website_url: string | null;
  logo_url: string | null;
  hero_photo_url: string | null;
  is_constituent: boolean;
  established_year: number | null;
  programmes: Programme[];
  principal_name: string | null;
  principal_email: string | null;
  vice_principal_name: string | null;
  vice_principal_email: string | null;
  student_affairs_office: string | null;
  sort_order: number;
};

export type FacultyMember = {
  id: string;
  name: string;
  designation: string;
  department: string;
  institute_id: string | null;
  photo_url: string | null;
  email: string | null;
  sort_order: number;
};

export type RelatedLink = {
  label: string;
  url: string;
};

export type Page = {
  id: string;
  slug: string;
  title: string;
  standfirst: string | null;
  body: string;
  meta: Record<string, unknown> & {
    related_links?: RelatedLink[];
    name?: string;
    title?: string;
  };
  updated_at: string;
};

export type Download = {
  id: string;
  title: string;
  file_url: string;
  category: string;
  file_size_kb: number | null;
  page_slug: string | null;
  uploaded_at: string;
};

export const CATEGORY_LABEL: Record<AnnouncementCategory, string> = {
  examination: "Exams",
  admission: "Admissions",
  circular: "Circular",
  job: "Jobs",
  tender: "Tender",
  news: "News",
  event: "Event",
};

export const NOTICEBOARD_CATEGORIES: AnnouncementCategory[] = [
  "examination",
  "admission",
  "circular",
  "job",
  "tender",
];

export const CATEGORY_TAB_LABEL: Record<AnnouncementCategory, string> = {
  examination: "Examinations",
  admission: "Admissions",
  circular: "Circulars",
  job: "Jobs",
  tender: "Tenders",
  news: "News",
  event: "Events",
};
