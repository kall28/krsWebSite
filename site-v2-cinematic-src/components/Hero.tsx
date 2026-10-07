import Image from "next/image";
import Heading from "./Heading";
import { LinkButton } from "./Button";

export default function Hero() {
  return (
    <section id="top" data-section className="grain relative flex min-h-svh flex-col overflow-hidden pt-24">
      <div aria-hidden="true" className="pointer-events-none absolute inset-0 bg-[radial-gradient(60%_50%_at_75%_30%,rgba(201,168,106,.12),transparent_70%)]" />

      <div className="relative mx-auto flex w-full max-w-[96rem] flex-1 flex-col justify-end px-5 pb-10 md:px-10">
        {/* Layered imagery: a large frame, a small framed phone and a hairline, each at its own depth */}
        <div className="relative mt-6 aspect-[4/3] w-full md:absolute md:right-10 md:top-6 md:mt-0 md:aspect-auto md:h-[42svh] md:w-[58%]">
          <div data-reveal data-speed="6" className="absolute inset-0 overflow-hidden bg-surface">
            <div data-inner className="absolute inset-0">
              <Image src="/work/cinepolis-home.jpg" alt="Cinépolis Indonesia home page, designed and built by KRS" fill priority sizes="(min-width:768px) 66vw, 100vw" className="object-cover object-top" />
            </div>
            <div aria-hidden="true" className="absolute inset-0 bg-gradient-to-r from-bg/70 via-transparent to-transparent" />
          </div>
          <div data-reveal data-speed="18" className="absolute -bottom-8 left-3 z-10 w-[34%] max-w-60 md:bottom-auto md:top-10 md:w-[22%] overflow-hidden bg-[#ececf1] shadow-[0_40px_80px_-20px_rgba(0,0,0,.9)] md:-left-10">
            <div className="relative aspect-square">
              <div data-inner className="absolute inset-0">
                <Image src="/work/cinema-app.jpg" alt="Cinema ticketing mobile app on two phones" fill sizes="(min-width:768px) 18vw, 34vw" className="object-cover mix-blend-multiply" />
              </div>
            </div>
          </div>
        </div>

        <div className="relative z-20 mt-16 md:mt-0 md:pt-[30svh]">
          <p className="eyebrow mb-6" data-fade>Digital studio · Mumbai</p>
          <Heading as="h1" hero text="Modern technology. Classical _composition._" className="max-w-[16ch] text-[clamp(3.2rem,9.4vw,11rem)]" />
        </div>
      </div>

      <div className="relative mx-auto flex w-full max-w-[96rem] flex-wrap items-end justify-between gap-8 border-t border-line px-5 py-8 md:px-10">
        <p className="max-w-md text-muted" data-fade>
          Websites, apps and brands for businesses that want to be remembered. Designed with care, built to last, supported long after launch.
        </p>
        <div className="flex flex-wrap items-center gap-3" data-fade>
          <LinkButton href="#work" magnetic>See our work</LinkButton>
          <LinkButton href="#contact" variant="ghost">Start a project</LinkButton>
        </div>
        <a href="#studio" aria-label="Scroll to the studio section" className="group hidden items-center gap-4 md:flex">
          <span className="eyebrow">Scroll</span>
          <span className="relative block h-14 w-px overflow-hidden bg-line"><span className="cue absolute inset-0 bg-brass" /></span>
        </a>
      </div>
    </section>
  );
}
