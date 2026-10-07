import Heading from "./Heading";
import { steps } from "@/lib/content";

export default function Process() {
  return (
    <section id="process" className="relative mx-auto max-w-[90rem] px-5 py-28 md:px-10 md:py-40">
      <p className="eyebrow mb-5" data-fade>How it works</p>
      <div className="flex flex-wrap items-end justify-between gap-8">
        <Heading text="Four steps. _No surprises._" className="text-[length:var(--text-huge)]" />
        <p className="max-w-sm text-muted" data-fade>You pay for work done, not setup. Choose full-time or hourly developers and follow progress in shared project tools.</p>
      </div>

      <ol className="relative mt-16 grid gap-10 md:mt-24 lg:grid-cols-4 lg:gap-6">
        <span aria-hidden="true" className="absolute left-0 right-0 top-0 hidden h-px bg-line lg:block" />
        <span aria-hidden="true" data-line="x" className="absolute left-0 right-0 top-0 hidden h-px bg-cyan lg:block" />
        {steps.map((s, i) => (
          <li key={s.title} data-fade className="relative border-t border-line pt-8 lg:border-0 lg:pr-6">
            <span className="display block text-[5.5rem] leading-none text-transparent [-webkit-text-stroke:1px_rgba(255,255,255,.28)]">0{i + 1}</span>
            <h3 className="display mt-6 text-[length:var(--text-big)]">{s.title}</h3>
            <p className="mt-3 text-muted">{s.text}</p>
          </li>
        ))}
      </ol>
    </section>
  );
}
