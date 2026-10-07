import Image from "next/image";
import Network from "./Network";
import Heading from "./Heading";
import { LinkButton } from "./Button";
import { clients } from "@/lib/content";

export default function Hero() {
  return (
    <section id="top" className="noise relative flex min-h-svh flex-col overflow-hidden pt-28">
      {/* ambient glow + grid */}
      <div aria-hidden="true" className="pointer-events-none absolute inset-0">
        <div className="grid-bg absolute inset-0" />
        <Network />
        <div className="blob -left-24 top-10 h-[28rem] w-[28rem] bg-indigo/40" />
        <div className="blob -right-24 top-1/3 h-[24rem] w-[24rem] bg-cyan/20 [animation-delay:-6s]" />
      </div>

      <div className="relative mx-auto grid w-full max-w-[90rem] flex-1 items-center gap-14 px-5 pb-14 md:px-10 lg:grid-cols-12 lg:gap-8">
        <div className="lg:col-span-7">
          <p className="glass mb-8 inline-flex items-center gap-2.5 rounded-full py-1.5 pl-2 pr-4 text-sm text-muted" data-fade>
            <span className="relative flex h-2.5 w-2.5 ml-1.5"><span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-cyan opacity-60" /><span className="relative h-2.5 w-2.5 rounded-full bg-cyan" /></span>
            Digital studio in Mumbai
          </p>
          <Heading as="h1" hero text="We design & build _digital products_ people love." className="text-[clamp(2.9rem,7.6vw,7.6rem)]" />
          <p className="mt-8 max-w-xl text-lg text-muted md:text-xl" data-fade>
            Web apps, mobile apps and brands for businesses that want to grow. Designed with care, built to last, supported long after launch.
          </p>
          <div className="mt-10 flex flex-wrap items-center gap-3" data-fade>
            <LinkButton href="#contact" magnetic>Start a project</LinkButton>
            <LinkButton href="#work" variant="ghost" magnetic>See our work</LinkButton>
          </div>
        </div>

        {/* Product window + floating phone, real client work */}
        <div className="relative mx-auto w-full max-w-xl pb-10 [perspective:1400px] lg:col-span-5 lg:max-w-none" data-hero-stage aria-label="Selected KRS projects">
          <div data-clip data-hero-window className="glass relative rounded-2xl p-2 shadow-[0_40px_80px_-30px_rgba(90,47,224,.5)]">
            <div className="flex items-center gap-1.5 px-2 pb-2 pt-1" aria-hidden="true">
              <span className="h-2.5 w-2.5 rounded-full bg-white/20" /><span className="h-2.5 w-2.5 rounded-full bg-white/20" /><span className="h-2.5 w-2.5 rounded-full bg-white/20" />
              <span className="ml-3 h-5 flex-1 rounded-full bg-white/5 px-3 text-[10px] leading-5 text-muted">cinepolis.co.id</span>
            </div>
            <div className="relative aspect-[16/11] overflow-hidden rounded-lg bg-black">
              <div className="absolute -inset-[8%]" data-parallax="5">
                <Image src="/work/cinepolis-home.jpg" alt="Cinépolis Indonesia home page" fill priority sizes="(min-width:1024px) 38vw, 90vw" className="object-cover object-top" />
              </div>
            </div>
          </div>
          <div data-clip data-hero-phone className="absolute -bottom-2 -left-2 w-[42%] rotate-[-4deg] overflow-hidden rounded-2xl bg-[#ececf1] shadow-[0_30px_60px_-20px_rgba(0,0,0,.9)] ring-1 ring-white/20 md:-left-8">
            <div className="relative aspect-square">
              <div className="absolute -inset-[6%]" data-parallax="8">
                <Image src="/work/cinema-app.jpg" alt="Cinema ticketing mobile app on two phones" fill sizes="(min-width:1024px) 16vw, 40vw" className="object-cover mix-blend-multiply" />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="marquee relative border-y border-line bg-black/30 py-5 backdrop-blur" aria-hidden="true">
        <div className="marquee-track flex w-max gap-14 whitespace-nowrap pr-14">
          {[...clients, ...clients].map((c, i) => (
            <span key={i} className="display flex items-center gap-14 text-xl text-muted">{c}<span className="text-cyan">✦</span></span>
          ))}
        </div>
      </div>
    </section>
  );
}
