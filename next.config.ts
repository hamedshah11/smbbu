import type { NextConfig } from "next";

// Old-site URL redirects, sourced from the migration map (see CLAUDE.md rule 8).
// No migration map has been provided yet — add entries here as `{ source, destination, permanent: true }`.
// Never delete an entry once added.
const oldSiteRedirects: NonNullable<Awaited<ReturnType<NonNullable<NextConfig["redirects"]>>>> = [];

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
    return oldSiteRedirects;
  },
};

export default nextConfig;
