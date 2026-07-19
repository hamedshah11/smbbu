import Image from "next/image";
import { cn } from "@/lib/utils";

export function Photo({
  src,
  alt,
  className,
}: {
  src: string | null;
  alt: string;
  className?: string;
}) {
  return (
    <div
      className={cn("relative bg-gradient-to-br from-green-soft/40 to-green-deep/50", className)}
      role={src ? undefined : "img"}
      aria-label={src ? undefined : alt}
    >
      {src && <Image src={src} alt={alt} fill sizes="100vw" className="object-cover" />}
    </div>
  );
}
