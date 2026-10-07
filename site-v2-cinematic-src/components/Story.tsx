import Image from "next/image";
import Heading from "./Heading";
import { steps } from "@/lib/content";

// One image per chapter, drawn from real client work
const imgs = [
  { src: "/work/cinepolis-booking.jpg", alt: "Cinépolis booking flow, the discovery of a complex journey", light: false },
  { src: "/work/renepay.jpg", alt: "Renepay marketing site, structure and interface design", light: true },
  { src: "/work/richfeel-app.jpg", alt: "Richfeel sales app, shipped in short cycles", light: true },
  { src: "/work/black-eagle.jpg", alt: "Black Eagle Books, launched and supported", light: false },
];
const numerals = ["I", "II", "III", "IV"];

const Pic = ({ i, sizes }: { i: number; sizes: string }) => (
  <Image src={imgs[i].src} alt={imgs[i].alt} fill sizes={sizes} className={imgs[i].light ? "object-cover mix-blend-multiply" : "object-cover object-top"} />
);

export default function Story() {
  return (
    <section id="process" data-section className="relative border-t border-line bg-surface">
      <div className="mx-auto max-w-[96rem] px-5 pb-16 pt-28 md:px-10 md:pt-44 lg:pb-8">
        <p className="eyebrow mb-6" data-fade>Process</p>
        <Heading text="From first question to _lasting_ support." className="max-w-5xl text-[clamp(3rem,8vw,8.5rem)]" />
      </div>

      {/* Desktop + motion: pinned, chapters change as you scroll */}
      <div className="story-pin">
        <div data-story className="relative h-svh overflow-hidden">
          <div className="mx-auto grid h-full max-w-[96rem] grid-cols-12 items-center gap-x-6 px-10">
            <div className="relative col-span-5 h-[26rem]">
              {steps.map((s, i) => (
                <div key={s.title} data-st className="absolute inset-0 flex flex-col justify-center">
                  <span className="font-display text-[9rem] italic leading-none text-brass/80">{numerals[i]}</span>
                  <h3 className="display mt-2 text-7xl">{s.title}</h3>
                  <p className="mt-6 max-w-md text-lg text-muted">{s.text}</p>
                </div>
              ))}
            </div>
            <div className="col-span-1 flex h-[60vh] justify-center" aria-hidden="true">
              <span className="relative block h-full w-px bg-line"><span data-sprog className="absolute inset-0 origin-top scale-y-0 bg-brass" /></span>
            </div>
            <div className="col-span-6 flex justify-end">
              <div className="frame relative aspect-[4/5] h-[72svh] max-w-full overflow-hidden bg-bg">
                {imgs.map((im, i) => (
                  <div key={im.src} data-si className="absolute inset-0 overflow-hidden" style={im.light ? { background: "#ececf1" } : undefined}>
                    <div data-sin className="absolute inset-0"><Pic i={i} sizes="40vw" /></div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Mobile, tablet, reduced motion: plain stack */}
      <ol className="story-stack mx-auto max-w-[96rem] space-y-24 px-5 pb-28 md:px-10">
        {steps.map((s, i) => (
          <li key={s.title} className="grid gap-8 md:grid-cols-2 md:items-center">
            <div className="relative aspect-[4/3] overflow-hidden" data-reveal style={imgs[i].light ? { background: "#ececf1" } : { background: "#0a0908" }}>
              <div data-inner className="absolute inset-0"><Pic i={i} sizes="(min-width:768px) 45vw, 92vw" /></div>
            </div>
            <div>
              <span className="font-display text-7xl italic text-brass/80">{numerals[i]}</span>
              <h3 className="display mt-1 text-5xl">{s.title}</h3>
              <p className="mt-4 text-muted">{s.text}</p>
            </div>
          </li>
        ))}
      </ol>
    </section>
  );
}
