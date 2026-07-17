import Image from "next/image";
import { cn } from "@/lib/utils";

export function DuotonePhoto({
  src,
  alt,
  plain = false,
  className,
}: {
  src: string | null;
  alt: string;
  /** Render the image in full colour (no grayscale/duotone overlays). */
  plain?: boolean;
  className?: string;
}) {
  return (
    <div
      className={cn(
        "relative bg-gradient-to-br from-green-soft/40 to-green-deep/50",
        !plain && "duotone",
        className,
      )}
      role={src ? undefined : "img"}
      aria-label={src ? undefined : alt}
    >
      {src && <Image src={src} alt={alt} fill sizes="100vw" className="object-cover" />}
    </div>
  );
}
