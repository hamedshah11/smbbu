import Image from "next/image";
import { cn } from "@/lib/utils";
import { initials } from "@/lib/format";

export function FacultyAvatar({
  photoUrl,
  name,
  className,
}: {
  photoUrl: string | null;
  name: string;
  className?: string;
}) {
  if (photoUrl) {
    return (
      <div className={cn("relative overflow-hidden", className)}>
        <Image src={photoUrl} alt={name} fill sizes="100vw" className="object-cover" />
      </div>
    );
  }

  return (
    <div
      className={cn(
        "flex items-center justify-center bg-bg-chip-on-tint font-display text-base font-bold text-green-primary",
        className,
      )}
      role="img"
      aria-label={name}
    >
      {initials(name)}
    </div>
  );
}
