import Link from "next/link";

export function Breadcrumb({ items }: { items: { label: string; href?: string }[] }) {
  return (
    <nav className="flex flex-wrap items-center gap-2 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em]">
      {items.map((item, i) => (
        <span key={item.label} className="flex items-center gap-2">
          {i > 0 && <span className="text-text-faint">/</span>}
          {item.href ? (
            <Link href={item.href} className="text-green-primary hover:text-hairline-strong">
              {item.label}
            </Link>
          ) : (
            <span className="text-text-faint">{item.label}</span>
          )}
        </span>
      ))}
    </nav>
  );
}
