import Image from "next/image";
import Heading from "./Heading";
import { projects } from "@/lib/content";

export default function Work() {
  return (
    <section id="work" data-section className="relative border-t border-line pt-28 md:pt-44">
      <div className="mx-auto flex max-w-[96rem] flex-wrap items-end justify-between gap-6 px-5 md:px-10">
        <div>
          <p className="eyebrow mb-6" data-fade>Selected work</p>
          <Heading text="Products in the hands of _real_ customers." className="max-w-5xl text-[clamp(3rem,8vw,8.5rem)]" />
        </div>
        <p className="eyebrow hidden lg:block" data-gal-hint><span data-gal-count>01</span> / 0{projects.length} · scroll →</p>
      </div>

      <div data-gal className="gal-wrap mt-16 pb-28 lg:mt-12 lg:pb-0">
        <ol data-gal-track className="gal-track flex flex-col gap-20 px-5 md:px-10 lg:gap-16 lg:pr-[10vw]">
          {projects.map((p, i) => {
            const light = "mockup" in p && p.mockup;
            return (
              <li key={p.name} data-gal-item className="lg:w-[46vw] lg:max-w-[56rem] lg:shrink-0">
                <article data-card>
                  <div className={`frame zoom relative aspect-[4/3] overflow-hidden ${light ? "bg-[#ececf1]" : "bg-surface"}`}>
                    <div data-gal-img className="absolute -inset-x-[8%] inset-y-0">
                      <Image src={p.img} alt={p.alt} fill sizes="(min-width:1024px) 50vw, 92vw" className={light ? "object-cover mix-blend-multiply" : "object-cover object-top"} />
                    </div>
                  </div>
                  <div className="mt-6 grid grid-cols-12 items-start gap-4">
                    <span className="font-display col-span-2 text-4xl italic text-brass">0{i + 1}</span>
                    <div className="col-span-10">
                      <h3 className="display text-5xl md:text-6xl">{p.name}</h3>
                      <p className="eyebrow mt-3">{p.kind}</p>
                      <p className="mt-4 max-w-md text-muted">{p.line}</p>
                    </div>
                  </div>
                </article>
              </li>
            );
          })}
        </ol>
      </div>
      <div className="mx-auto hidden h-px max-w-[96rem] bg-line lg:block" aria-hidden="true" />
    </section>
  );
}
