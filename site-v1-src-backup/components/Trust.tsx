import Heading from "./Heading";
import { clients, testimonials } from "@/lib/content";

export default function Trust() {
  return (
    <section id="trust" className="relative bg-surface py-28 md:py-40">
      <div className="mx-auto max-w-[90rem] px-5 md:px-10">
        <p className="eyebrow mb-5" data-fade>Clients</p>
        <Heading text="Teams across cinema, retail and fintech _trust us._" className="max-w-5xl text-[length:var(--text-huge)]" />

        <ul className="mt-14 flex flex-wrap gap-3 md:mt-20" aria-label="Clients and projects from our portfolio">
          {clients.map((c) => (
            <li key={c} data-fade className="glass display rounded-full px-6 py-3 text-xl md:text-2xl">{c}</li>
          ))}
        </ul>
        <p className="mt-4 text-sm text-muted">Names listed are projects from our portfolio.</p>

        <div className="mt-20 grid gap-4 md:mt-28 md:grid-cols-2">
          {testimonials.map((t) => (
            <blockquote key={t.quote} data-fade className="relative rounded-3xl border border-dashed border-white/25 p-8 md:p-10">
              <span className="absolute -top-3 left-6 rounded-full bg-cyan px-3 py-0.5 text-xs font-semibold text-black">Placeholder, not a real testimonial</span>
              <p className="display text-2xl text-fg/50 md:text-3xl !leading-tight">“{t.quote}”</p>
              <footer className="mt-6 text-sm text-muted">{t.who}</footer>
            </blockquote>
          ))}
        </div>
      </div>
    </section>
  );
}
