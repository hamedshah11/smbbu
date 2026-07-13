import Link from "next/link";
import { cn } from "@/lib/utils";

type PillButtonProps = {
  href: string;
  children: React.ReactNode;
  variant?: "primary" | "secondary";
  external?: boolean;
  className?: string;
};

export function PillButton({
  href,
  children,
  variant = "secondary",
  external = false,
  className,
}: PillButtonProps) {
  const classes = cn(
    "inline-flex shrink-0 items-center justify-center whitespace-nowrap rounded-full font-display text-[0.78125rem] font-bold transition-colors duration-150",
    variant === "primary"
      ? "bg-green-primary px-[22px] py-3 text-bg-page hover:bg-hairline-strong max-sm:px-[18px] max-sm:py-3"
      : "border-[1.5px] border-green-primary px-[22px] py-[11px] text-green-primary hover:bg-bg-pill-hover",
    className,
  );

  if (external) {
    return (
      <a href={href} target="_blank" rel="noopener noreferrer" className={classes}>
        {children}
      </a>
    );
  }

  return (
    <Link href={href} className={classes}>
      {children}
    </Link>
  );
}
