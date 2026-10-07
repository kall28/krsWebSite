import SectionIntro from "./SectionIntro";
import { clients, testimonials } from "@/lib/content";

const Trust = () => (
  <section id="trust" className="theme-ivory relative">
    <div className="mx-auto max-w-[90rem] px-5 py-28 md:px-10 md:py-40">
      <SectionIntro index="04" eyebrow="Clients" title="Teams across cinema, retail and fintech _trust us._" />

      <ul className="mt-16 grid grid-cols-2 border-l border-t border-line md:mt-24 md:grid-cols-5" aria-label="Clients and projects from our portfolio">
        {clients.map((c) => (
          <li key={c} data-fade className="flex min-h-28 items-center justify-center border-b border-r border-line px-4 text-center md:min-h-36">
            <span className="display text-xl text-fg/70 transition-colors duration-300 hover:text-fg md:text-2xl">{c}</span>
          </li>
        ))}
      </ul>
      <p className="mt-4 text-sm text-muted">Names listed are projects from our portfolio.</p>

      <div className="mt-20 grid gap-px border border-line bg-line md:mt-28 md:grid-cols-2">
        {testimonials.map((t) => (
          <figure key={t.quote} data-fade className="relative flex flex-col justify-between gap-10 bg-ivory p-8 md:p-12">
            <span className="eyebrow self-start rounded-full border border-dashed border-fg/40 px-3 py-1 !text-fg">Placeholder, not a real testimonial</span>
            <blockquote className="display text-2xl leading-snug text-fg/55 md:text-3xl">“{t.quote}”</blockquote>
            <figcaption className="text-sm text-muted">{t.who}</figcaption>
          </figure>
        ))}
      </div>
    </div>
  </section>
);

export default Trust;
