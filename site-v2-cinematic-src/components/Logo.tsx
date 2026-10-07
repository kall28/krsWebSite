import Image from "next/image";

/** The brand icon has dark nodes, so it sits on a bone tile to stay legible on the dark theme. */
export function LogoMark({ size = 36 }: { size?: number }) {
  return (
    <span className="grid shrink-0 place-items-center rounded-full bg-fg" style={{ width: size, height: size }}>
      <Image src="/brand/krs-icon.png" alt="" width={size} height={size} className="p-[4px]" />
    </span>
  );
}

export function LogoFull() {
  return (
    <span className="inline-block bg-fg px-5 py-3">
      <Image src="/brand/krs-logo.png" alt="KRS Infoserve LLP" width={962} height={250} className="h-9 w-auto" />
    </span>
  );
}
