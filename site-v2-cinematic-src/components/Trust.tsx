import { clients } from "@/lib/content";

export default function Trust() {
  return (
    <section id="clients" aria-label="Clients" className="marquee overflow-hidden border-y border-line py-10">
      <div className="marquee-track flex w-max gap-16 whitespace-nowrap pr-16" aria-hidden="true">
        {[...clients, ...clients].map((c, i) => (
          <span key={i} className="display flex items-center gap-16 text-5xl text-muted md:text-7xl">{c}<span className="text-brass">✦</span></span>
        ))}
      </div>
      <ul className="sr-only">{clients.map((c) => <li key={c}>{c}</li>)}</ul>
    </section>
  );
}
