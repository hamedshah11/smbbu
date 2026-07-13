import Link from "next/link";

function pageHref(basePath: string, page: number, search?: string) {
  const params = new URLSearchParams();
  if (search) params.set("q", search);
  if (page > 1) params.set("page", String(page));
  const qs = params.toString();
  return qs ? `${basePath}?${qs}` : basePath;
}

export function Pagination({
  basePath,
  currentPage,
  totalPages,
  search,
}: {
  basePath: string;
  currentPage: number;
  totalPages: number;
  search?: string;
}) {
  if (totalPages <= 1) return null;

  const pages = Array.from({ length: totalPages }, (_, i) => i + 1);

  return (
    <nav className="mt-10 flex items-center justify-center gap-2">
      <Link
        href={pageHref(basePath, Math.max(1, currentPage - 1), search)}
        aria-disabled={currentPage === 1}
        className="flex h-9 w-9 items-center justify-center rounded-full border border-hairline-on-tint text-text-secondary hover:bg-bg-hover-row aria-disabled:pointer-events-none aria-disabled:opacity-40"
      >
        ‹
      </Link>
      {pages.map((p) => (
        <Link
          key={p}
          href={pageHref(basePath, p, search)}
          className={
            p === currentPage
              ? "flex h-9 w-9 items-center justify-center rounded-full bg-green-primary font-display text-sm font-bold text-bg-page"
              : "flex h-9 w-9 items-center justify-center rounded-full border border-hairline-on-tint font-display text-sm text-text-secondary hover:bg-bg-hover-row"
          }
        >
          {p}
        </Link>
      ))}
      <Link
        href={pageHref(basePath, Math.min(totalPages, currentPage + 1), search)}
        aria-disabled={currentPage === totalPages}
        className="flex h-9 w-9 items-center justify-center rounded-full border border-hairline-on-tint text-text-secondary hover:bg-bg-hover-row aria-disabled:pointer-events-none aria-disabled:opacity-40"
      >
        ›
      </Link>
    </nav>
  );
}
