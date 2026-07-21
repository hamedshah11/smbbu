import Image from "next/image";
import { cn } from "@/lib/utils";

export function InstituteLogo({
  logoUrl,
  code,
  name,
  className,
}: {
  logoUrl: string | null;
  code: string;
  name: string;
  className?: string;
}) {
  if (logoUrl) {
    return (
      <div className={cn("relative shrink-0 overflow-hidden rounded-sm bg-bg-page", className)}>
        <Image src={logoUrl} alt={`${name} logo`} fill sizes="100px" className="object-contain" />
      </div>
    );
  }

  return (
    <div
      className={cn(
        "flex shrink-0 items-center justify-center rounded-full border border-green-primary bg-bg-chip-on-tint font-mono text-[9px] font-bold text-green-primary",
        className,
      )}
      role="img"
      aria-label={`${name} logo`}
    >
      {code}
    </div>
  );
}
