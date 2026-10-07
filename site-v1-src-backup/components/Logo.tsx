import Image from "next/image";

/** The brand icon has indigo nodes, so it sits on a light tile to stay legible on the dark theme. */
export function LogoMark({ size = 36 }: { size?: number }) {
  return (
    <span className="grid shrink-0 place-items-center rounded-xl bg-white shadow-[0_0_24px_-4px_rgba(41,200,255,.6)]" style={{ width: size, height: size }}>
      <Image src="/brand/krs-icon.png" alt="" width={size} height={size} className="p-[3px]" />
    </span>
  );
}

export function LogoFull() {
  return (
    <span className="inline-block rounded-2xl bg-white px-5 py-3">
      <Image src="/brand/krs-logo.png" alt="KRS Infoserve LLP" width={962} height={250} className="h-10 w-auto" />
    </span>
  );
}
