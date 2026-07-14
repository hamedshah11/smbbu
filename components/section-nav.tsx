"use client";

import { useEffect, useState } from "react";
import { cn } from "@/lib/utils";

type NavSection = { id: string; title: string };

export function SectionNav({ sections }: { sections: NavSection[] }) {
  const [active, setActive] = useState(sections[0]?.id);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        const visible = entries
          .filter((e) => e.isIntersecting)
          .sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top);
        if (visible[0]) setActive(visible[0].target.id);
      },
      // Top offset clears the sticky site header; the bottom offset keeps the
      // active section the one in the upper part of the viewport.
      { rootMargin: "-160px 0px -55% 0px" },
    );
    for (const section of sections) {
      const el = document.getElementById(section.id);
      if (el) observer.observe(el);
    }
    return () => observer.disconnect();
  }, [sections]);

  return (
    <nav aria-label="On this page">
      <p className="font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] text-text-faint">
        On this page
      </p>
      <ul className="mt-3 space-y-2">
        {sections.map((section) => (
          <li key={section.id}>
            <a
              href={`#${section.id}`}
              aria-current={active === section.id ? "true" : undefined}
              className={cn(
                "group relative inline-block py-0.5 font-mono text-[0.625rem] font-medium uppercase tracking-[0.08em] transition-colors",
                active === section.id
                  ? "text-green-primary"
                  : "text-text-muted hover:text-text-primary",
              )}
            >
              {section.title}
              <span
                aria-hidden="true"
                className="absolute bottom-0 left-0 h-px w-full origin-left scale-x-0 bg-green-primary transition-transform duration-300 group-hover:scale-x-100"
              />
            </a>
          </li>
        ))}
      </ul>
    </nav>
  );
}
