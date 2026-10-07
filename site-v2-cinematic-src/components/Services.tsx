import Heading from "./Heading";
import { services } from "@/lib/content";

const roman = ["I", "II", "III", "IV", "V", "VI"];

export default function Services() {
  return (
    <section id="services" data-section className="relative border-t border-line py-28 md:py-44">
      <div className="mx-auto max-w-[96rem] px-5 md:px-10">
        <p className="eyebrow mb-6" data-fade>Disciplines</p>
        <Heading text="Five crafts, _one_ studio." className="text-[clamp(3rem,8.5vw,9rem)]" />
        <ul className="mt-20 md:mt-28">
          {services.map((s, i) => (
            <li key={s.title} data-fade className="row border-t border-line last:border-b">
              <div className="grid grid-cols-12 items-baseline gap-x-4 gap-y-4 py-8 md:py-12">
                <span className="font-display col-span-2 text-2xl italic text-muted md:col-span-1">{roman[i]}</span>
                <h3 className="title display col-span-10 text-[clamp(2.2rem,5vw,5rem)] md:col-span-5">{s.title}</h3>
                <p className="col-span-12 text-muted md:col-span-4 md:col-start-7">{s.benefit}</p>
                <ul className="col-span-12 flex flex-wrap gap-2 md:col-span-2 md:col-start-11 md:justify-end" aria-label="Technologies">
                  {s.tags.map((t) => <li key={t} className="eyebrow border border-line px-3 py-1">{t}</li>)}
                </ul>
              </div>
            </li>
          ))}
        </ul>
      </div>
    </section>
  );
}
