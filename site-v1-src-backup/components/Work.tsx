import Image from "next/image";
import Heading from "./Heading";
import { projects } from "@/lib/content";

export default function Work() {
  return (
    <section id="work" className="relative bg-surface pt-28 md:pt-40">
      <div className="mx-auto max-w-[90rem] px-5 md:px-10">
        <p className="eyebrow mb-5" data-fade>Selected work</p>
        <Heading text="Products in the hands of _real customers._" className="max-w-5xl text-[length:var(--text-huge)]" />
        <p className="mt-6 hidden text-sm text-muted lg:block" data-fade>Keep scrolling: the row moves sideways →</p>
      </div>

      {/* Desktop: pinned and driven sideways by scroll. Mobile/tablet: plain vertical stack. */}
      <div data-hscroll className="mt-12 overflow-hidden pb-28 lg:flex lg:h-screen lg:items-center lg:pb-0">
        <ol data-htrack className="flex flex-col gap-6 px-5 md:px-10 lg:w-max lg:flex-row lg:gap-8">
          {projects.map((p, i) => {
            const light = "mockup" in p && p.mockup;
            return (
              <li key={p.name} className="lg:w-[62vw] lg:max-w-[64rem] lg:shrink-0">
                <article data-hover data-card className="group grid h-full overflow-hidden rounded-[2rem] border border-line bg-bg md:grid-cols-12 lg:grid-cols-1 lg:grid-rows-[auto_1fr]">
                  <div className={`relative aspect-[4/3] overflow-hidden md:col-span-7 md:aspect-auto md:min-h-[24rem] lg:aspect-[16/8] lg:min-h-0 ${light ? "bg-[#ececf1]" : "bg-black"}`}>
                    <div className="absolute -inset-x-[10%] -inset-y-[8%] lg:-inset-y-0" data-hpar data-vpar>
                    <Image src={p.img} alt={p.alt} fill sizes="(min-width:1024px) 62vw, (min-width:768px) 58vw, 92vw"
                      className={`transition-transform duration-[1200ms] ease-[var(--ease-out-expo)] group-hover:scale-[1.05] ${light ? "object-cover mix-blend-multiply" : "object-cover object-top"}`} />
                    </div>
                  </div>
                  <div className="flex flex-col justify-between gap-8 p-7 md:col-span-5 md:p-10 lg:flex-row lg:items-end lg:p-8">
                    <div>
                      <div className="mb-4 flex items-center gap-3">
                        <span className="eyebrow">0{i + 1} / 0{projects.length}</span>
                        <span className="rounded-full bg-cyan/10 px-3 py-1 text-xs text-cyan ring-1 ring-cyan/30">{p.kind}</span>
                      </div>
                      <h3 className="display text-4xl md:text-5xl">{p.name}</h3>
                    </div>
                    <p className="max-w-sm text-muted">{p.line}</p>
                  </div>
                </article>
              </li>
            );
          })}
        </ol>
      </div>
    </section>
  );
}
