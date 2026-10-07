import Heading from "./Heading";
import { services } from "@/lib/content";

const icons = [
  <path key="w" d="M3 5h18v14H3zM3 9h18M7 7h.01M10 7h.01" />,
  <path key="m" d="M8 2h8a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1zM11 19h2" />,
  <path key="b" d="M12 3l2.5 5.5L20 9l-4 4 1 6-5-3-5 3 1-6-4-4 5.5-.5z" />,
  <path key="o" d="M3 17l6-6 4 4 8-8M15 7h6v6" />,
  <path key="c" d="M4 4h16v6H4zM4 14h7v6H4zM15 14h5v6h-5z" />,
];

const spans = ["md:col-span-4", "md:col-span-2", "md:col-span-2", "md:col-span-2", "md:col-span-2"];

export default function Services() {
  return (
    <section id="services" className="relative mx-auto max-w-[90rem] px-5 py-28 md:px-10 md:py-40">
      <p className="eyebrow mb-5" data-fade>What we do</p>
      <div className="flex flex-wrap items-end justify-between gap-8">
        <Heading text="Everything you need to _launch and grow._" className="max-w-4xl text-[length:var(--text-huge)]" />
        <p className="max-w-sm text-muted" data-fade>Each service exists to make something measurably easier for your customers, or for you.</p>
      </div>

      <ul className="mt-14 grid gap-4 md:mt-20 md:grid-cols-6">
        {services.map((s, i) => (
          <li key={s.title} data-fade className={spans[i]}>
            <div data-spot data-tilt className="spot glass group h-full rounded-3xl p-7 transition-colors duration-500 hover:border-cyan/40 md:min-h-[22rem] md:p-9">
            <div className="flex h-full flex-col">
              <div className="flex items-start justify-between">
                <span className="grid h-12 w-12 place-items-center rounded-2xl bg-cyan/10 text-cyan ring-1 ring-cyan/30 transition-transform duration-500 group-hover:-rotate-6 group-hover:scale-110">
                  <svg aria-hidden="true" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">{icons[i]}</svg>
                </span>
                <span className="eyebrow">0{i + 1}</span>
              </div>
              <div className="mt-auto pt-12">
                <h3 className="display text-[length:var(--text-big)]">{s.title}</h3>
                <p className="mt-3 max-w-md text-muted">{s.benefit}</p>
                <ul className="mt-5 flex flex-wrap gap-2" aria-label={`${s.title} technologies`}>
                  {s.tags.map((t) => <li key={t} className="rounded-full bg-white/5 px-3 py-1 text-xs text-muted ring-1 ring-line">{t}</li>)}
                </ul>
              </div>
            </div>
            </div>
          </li>
        ))}
      </ul>
    </section>
  );
}
