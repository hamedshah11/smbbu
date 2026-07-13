import Image from "next/image";
import { cn } from "@/lib/utils";

export function DuotonePhoto({
  src,
  alt,
  hero = false,
  className,
}: {
  src: string | null;
  alt: string;
  hero?: boolean;
  className?: string;
}) {
  return (
    <div
      className={cn(
        "duotone relative bg-gradient-to-br from-green-soft/40 to-green-deep/50",
        hero && "duotone-hero",
        className,
      )}
      role={src ? undefined : "img"}
      aria-label={src ? undefined : alt}
    >
      {src && <Image src={src} alt={alt} fill sizes="100vw" className="object-cover" />}
    </div>
  );
}
