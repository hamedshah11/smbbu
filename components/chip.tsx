import { cn } from "@/lib/utils";

export function Chip({
  children,
  onTint = false,
  className,
}: {
  children: React.ReactNode;
  onTint?: boolean;
  className?: string;
}) {
  return (
    <span
      className={cn(
        "inline-flex items-center rounded-full px-[9px] py-[5px] text-[9px] font-semibold uppercase tracking-[0.09em] text-green-primary max-sm:px-2 max-sm:py-1",
        onTint ? "bg-bg-chip-on-tint" : "bg-bg-chip",
        className,
      )}
    >
      {children}
    </span>
  );
}
