import Image from "next/image";

/** The brand icon has indigo nodes, so it sits on an ivory tile to stay legible on midnight. */
export const LogoMark = ({ size = 36 }: { size?: number }) => (
  <span className="grid shrink-0 place-items-center rounded-lg bg-ivory" style={{ width: size, height: size }}>
    <Image src="/brand/krs-icon.png" alt="" width={size} height={size} className="p-[3px]" />
  </span>
);

export const LogoFull = () => (
  <span className="inline-block rounded-xl bg-ivory px-5 py-3">
    <Image src="/brand/krs-logo.png" alt="KRS Infoserve LLP" width={962} height={250} className="h-9 w-auto" />
  </span>
);
