import { readFileSync } from "node:fs";
import path from "node:path";
import type { NextConfig } from "next";

type RedirectEntry = { source: string; destination: string; permanent: boolean };

// Old-site URL redirects (CLAUDE.md rule 8). Never delete an entry.
//
// The old site lived at smbbmu.edu.pk/beta/. Static patterns live in this
// file; the per-slug announcement/news detail redirects (whose category is
// not in the old path) live in redirects-generated.json, produced by
// `scripts/migrate/gen-redirects.mjs` from the live announcements table.
//
// Old URLs with NO equivalent page yet — intentionally not redirected so
// they don't point at a 404. Add them here once the pages exist:
//   /beta/alumni                                  (no /alumni page yet)
//   /beta/oric                                    (no ORIC page)
//   /beta/convocation                             (no convocation page)
//   /beta/campuses/college-of-medical-technology  (no institutes row)
//   /beta/campuses/sukkur-college-of-nursing      (no institutes row)
const oldSiteRedirects: RedirectEntry[] = [
  // The /beta root itself (Next strips trailing slashes before matching).
  { source: "/beta", destination: "/", permanent: true },

  // Noticeboard listings. Old listing pages paginated as a trailing path
  // segment (/beta/announcements/all/3); the unused :page param becomes
  // ?page=3 on the destination, which the noticeboard listing understands.
  { source: "/beta/announcements/all", destination: "/noticeboard", permanent: true },
  { source: "/beta/announcements/all/:page", destination: "/noticeboard", permanent: true },
  { source: "/beta/announcements/examination", destination: "/noticeboard/examination", permanent: true },
  { source: "/beta/announcements/examination/:page", destination: "/noticeboard/examination", permanent: true },
  { source: "/beta/announcements/admission", destination: "/noticeboard/admission", permanent: true },
  { source: "/beta/announcements/admission/:page", destination: "/noticeboard/admission", permanent: true },
  { source: "/beta/announcements/tender", destination: "/noticeboard/tender", permanent: true },
  { source: "/beta/announcements/tender/:page", destination: "/noticeboard/tender", permanent: true },
  // Old "notifications" tab = general circulars.
  { source: "/beta/announcements/notifications", destination: "/noticeboard/circular", permanent: true },
  { source: "/beta/announcements/notifications/:page", destination: "/noticeboard/circular", permanent: true },
  // Old "other" tab was a catch-all with no counterpart in the new category
  // enum (and the crawl found no notice filed only under it) — the all-notices
  // view is the faithful superset.
  { source: "/beta/announcements/other", destination: "/noticeboard", permanent: true },
  { source: "/beta/announcements/other/:page", destination: "/noticeboard", permanent: true },
  { source: "/beta/jobs", destination: "/noticeboard/job", permanent: true },
  { source: "/beta/jobs/:page", destination: "/noticeboard/job", permanent: true },

  // News & events listing (paginated the same way).
  { source: "/beta/newsandevents/events", destination: "/events", permanent: true },
  { source: "/beta/newsandevents/events/:page", destination: "/events", permanent: true },

  // Campuses → institutes. Old campus slugs differ from the stored institute
  // slugs in places; this mapping is validated against the live institutes
  // table on every gen-redirects.mjs run.
  { source: "/beta/campuses/benazir-college-of-nursing-larkana", destination: "/institutes/benazir-college-of-nursing", permanent: true },
  { source: "/beta/campuses/bibi-aseefa-dental-college-larkana", destination: "/institutes/bibi-aseefa-dental-college-larkana", permanent: true },
  { source: "/beta/campuses/department-of-pharmacy", destination: "/institutes/institute-of-pharmacy", permanent: true },
  { source: "/beta/campuses/institute-of-physiotherapy", destination: "/institutes/institute-of-physiotherapy-and-rehabilitation-sciences", permanent: true },

  // Faculty rosters → department pages (department_slug values, migration
  // 0003/0006), validated against the live faculty table by gen-redirects.mjs.
  { source: "/beta/faculty", destination: "/faculty", permanent: true },
  { source: "/beta/faculty/index/basic", destination: "/faculty/faculty-of-basic-medical-sciences", permanent: true },
  { source: "/beta/faculty/index/medicine", destination: "/faculty/faculty-of-medicine", permanent: true },
  { source: "/beta/faculty/index/surgery", destination: "/faculty/faculty-of-surgery", permanent: true },
  { source: "/beta/faculty/index/community", destination: "/faculty/faculty-of-community-medicine-public-health-sciences", permanent: true },
  // Dental and foreign faculty have no department roster on the new site
  // (their members carry no department_slug) — the directory is the superset.
  { source: "/beta/faculty/index/dental", destination: "/faculty", permanent: true },
  { source: "/beta/faculty/index/foreign", destination: "/faculty", permanent: true },

  // Static pages.
  { source: "/beta/about", destination: "/about/the-university", permanent: true },
  { source: "/beta/administration", destination: "/administration", permanent: true },
  // Old per-office pages (registrar-office, directorate-of-finance, …) have
  // no individual pages yet; the administration landing covers the section.
  { source: "/beta/administration/:office", destination: "/administration", permanent: true },
  { source: "/beta/admissions/post-graduate", destination: "/about/postgraduate-admissions", permanent: true },
  { source: "/beta/affiliated-colleges", destination: "/about/affiliated-colleges", permanent: true },
  { source: "/beta/annualreport", destination: "/about/annual-report", permanent: true },
  { source: "/beta/contactus", destination: "/contact", permanent: true },
  { source: "/beta/dme", destination: "/dme", permanent: true },
  { source: "/beta/downloads", destination: "/downloads", permanent: true },
  { source: "/beta/financialaids", destination: "/policies/scholarship-financial-aid-policy", permanent: true },
  { source: "/beta/policies", destination: "/policies", permanent: true },
  { source: "/beta/qec", destination: "/qec", permanent: true },
  { source: "/beta/studentResources/index", destination: "/about/student-resources", permanent: true },
];

// Per-slug announcement/news redirects — see scripts/migrate/gen-redirects.mjs.
const generatedRedirects: RedirectEntry[] = JSON.parse(
  readFileSync(path.join(process.cwd(), "redirects-generated.json"), "utf8"),
);

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "**.supabase.co",
        pathname: "/storage/v1/object/public/**",
      },
    ],
  },
  async redirects() {
    return [...oldSiteRedirects, ...generatedRedirects];
  },
};

export default nextConfig;
