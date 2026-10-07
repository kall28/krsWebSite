import Image from "next/image";
import Heading from "./Heading";
import { LinkButton } from "./Button";
import { hero } from "@/lib/content";
import { sculpture } from "@/lib/sculpture";

type SculptureLayerProps = { layer: "back" | "front" };

/** The ribbon is rendered as two aligned layers: faces behind the text plane and faces in front of it. */
const SculptureLayer = ({ layer }: SculptureLayerProps) => (
  <div
    data-sculpt
    aria-hidden="true"
    className={`pointer-events-none absolute left-1/2 top-[44%] w-[min(118vw,36rem)] -translate-x-1/2 -translate-y-1/2 md:w-[min(80vw,46rem)] lg:top-[49%] lg:w-[min(52vw,56rem,86vh)] ${layer === "front" ? "z-20" : "z-0"}`}
  >
    <div data-sculpt-idle>
      <Image
        src={sculpture[layer]}
        alt=""
        width={sculpture.width}
        height={sculpture.height}
        sizes="(min-width:1024px) 54vw, (min-width:768px) 80vw, 118vw"
        loading="eager"
        fetchPriority="high"
        className="h-auto w-full select-none"
        draggable={false}
      />
    </div>
  </div>
);

const Showcase = () => {
  const { showcase } = hero;
  return (
    <figure data-hero-comp className="pointer-events-auto relative mx-auto mt-12 w-full max-w-4xl lg:mt-[5vh] lg:w-[min(60vw,100vh)] lg:max-w-none">
      <a href="#work" aria-label={`${showcase.name}, ${showcase.kind}. Jump to selected work`} className="group block rounded-xl">
        <div className="overflow-hidden rounded-xl border border-line bg-surface shadow-[0_60px_120px_-50px_rgba(0,0,0,.9)]">
          <div className="flex h-8 items-center gap-1.5 border-b border-line px-3" aria-hidden="true">
            <span className="h-2 w-2 rounded-full bg-fg/20" /><span className="h-2 w-2 rounded-full bg-fg/20" /><span className="h-2 w-2 rounded-full bg-fg/20" />
            <span className="ml-3 rounded-full bg-fg/5 px-3 text-[10px] leading-5 text-muted">{showcase.domain}</span>
          </div>
          <Image
            src={showcase.desktop.src}
            alt={showcase.desktop.alt}
            width={showcase.desktop.w}
            height={showcase.desktop.h}
            sizes="(min-width:1024px) 60vw, 92vw"
            className="h-auto w-full transition-transform duration-[1200ms] ease-[var(--ease-out-expo)] group-hover:scale-[1.02]"
          />
        </div>
        <div data-hero-phone className="absolute -bottom-[9%] -right-[2%] w-[30%] rounded-2xl bg-ivory p-1.5 shadow-[0_40px_80px_-30px_rgba(0,0,0,.9)] md:-right-[4%]">
          <Image src={showcase.mobile.src} alt={showcase.mobile.alt} width={showcase.mobile.w} height={showcase.mobile.h} sizes="(min-width:1024px) 18vw, 30vw" className="h-auto w-full rounded-xl" />
        </div>
      </a>
      <figcaption className="mt-5 flex max-w-[66%] flex-wrap items-baseline gap-x-3 text-sm text-muted">
        <span className="eyebrow">Featured</span>
        <span className="text-fg">{showcase.name}</span>
        <span>{showcase.kind}</span>
      </figcaption>
    </figure>
  );
};

const Hero = () => (
  <section id="top" aria-label="Introduction" className="relative">
    <div aria-hidden="true" className="hero-gradient pointer-events-none absolute inset-0" />

    <div data-hero-stage className="relative motion-lg:h-svh motion-lg:overflow-hidden">
      {/* Scene A: headline woven through the sculpture */}
      <div data-hero-a className="relative isolate flex min-h-svh flex-col items-center justify-center overflow-hidden px-5 pb-28 pt-28 text-center md:px-10 motion-lg:absolute motion-lg:inset-0 motion-lg:overflow-visible">
        <SculptureLayer layer="back" />
        <Heading as="h1" hero text={hero.headline} className="relative z-10 text-[length:var(--text-mega)] !leading-[0.9]" />
        <SculptureLayer layer="front" />

        <div data-hero-copy className="relative z-30 mt-10 md:mt-12">
          <div data-hero-intro className="flex flex-col items-center">
            <p className="max-w-md text-lg text-fg/85 md:text-xl">{hero.support}</p>
            <div className="mt-8 flex flex-wrap items-center justify-center gap-3">
              <LinkButton href={hero.primary.href}>{hero.primary.label}</LinkButton>
              <LinkButton href={hero.secondary.href} variant="ghost">{hero.secondary.label}</LinkButton>
            </div>
          </div>
        </div>

        <div data-hero-copy className="absolute inset-x-5 bottom-7 z-30 flex items-end justify-between md:inset-x-10" aria-hidden="true">
          <span data-hero-intro className="eyebrow">Digital studio · Mumbai</span>
          <span data-hero-intro className="eyebrow hidden items-center gap-3 md:flex">Scroll<span className="h-px w-10 bg-fg/40" /></span>
        </div>
      </div>

      {/* Scene B: the follow-up line and a real project composition */}
      <div data-hero-b className="relative px-5 pb-28 pt-4 md:px-10 motion-lg:pointer-events-none motion-lg:absolute motion-lg:inset-0 motion-lg:flex motion-lg:flex-col motion-lg:items-center motion-lg:pb-0 motion-lg:pt-[13vh]">
        <Heading text={hero.followUp} reveal="manual" className="text-center text-[length:var(--text-huge)]" />
        <Showcase />
      </div>
    </div>
  </section>
);

export default Hero;
