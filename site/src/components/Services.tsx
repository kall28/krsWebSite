import SectionIntro from "./SectionIntro";
import { services } from "@/lib/content";

const Services = () => (
  <section id="services" className="theme-ivory relative">
    <div className="mx-auto max-w-[90rem] px-5 py-28 md:px-10 md:py-40">
      <SectionIntro index="01" eyebrow="What we do" title="Everything you need to _launch and grow._" aside="Each service exists to make something measurably easier for your customers, or for you." />

      <ul className="mt-16 grid border-l border-t border-line sm:grid-cols-2 md:mt-24 lg:grid-cols-3">
        {services.map((s, i) => (
          <li key={s.title} data-fade className="flex min-h-[19rem] flex-col border-b border-r border-line p-7 transition-colors duration-500 hover:bg-fg/[0.03] md:p-10">
            <span className="eyebrow">0{i + 1}</span>
            <h3 className="display mt-auto pt-14 text-[length:var(--text-big)]">{s.title}</h3>
            <p className="mt-4 max-w-sm text-muted">{s.benefit}</p>
            <ul className="mt-6 flex flex-wrap gap-x-3 gap-y-1 text-xs uppercase tracking-[0.14em] text-muted" aria-label={`${s.title} technologies`}>
              {s.tags.map((t, ti) => (
                <li key={t} className="flex items-center gap-3">{ti > 0 && <span aria-hidden="true" className="h-px w-3 bg-line" />}{t}</li>
              ))}
            </ul>
          </li>
        ))}
        <li data-fade className="flex min-h-[19rem] flex-col justify-between border-b border-r border-line bg-fg p-7 text-on-fg md:p-10">
          <span className="eyebrow !text-on-fg/60">Not sure yet?</span>
          <div>
            <p className="display text-[length:var(--text-big)]">Tell us the problem. We’ll suggest the shape of the solution.</p>
            <a href="#contact" className="link-u mt-6 inline-block text-sm font-medium">Start a conversation →</a>
          </div>
        </li>
      </ul>
    </div>
  </section>
);

export default Services;
