import SectionIntro from "./SectionIntro";
import { steps } from "@/lib/content";

const Process = () => (
  <section id="process" className="relative bg-bg">
    <div className="mx-auto max-w-[90rem] px-5 pb-28 md:px-10 md:pb-40">
      <SectionIntro index="03" eyebrow="How it works" title="Four steps. _No surprises._" aside="You pay for work done, not setup. Choose full-time or hourly developers and follow progress in shared project tools." />

      <ol className="relative mt-16 grid gap-12 md:mt-24 md:grid-cols-2 lg:grid-cols-4 lg:gap-8">
        <span aria-hidden="true" className="absolute inset-x-0 top-0 hidden h-px bg-line lg:block" />
        <span aria-hidden="true" data-line className="absolute inset-x-0 top-0 hidden h-px bg-cyan lg:block" />
        {steps.map((s, i) => (
          <li key={s.title} data-step data-fade className="group relative border-t border-line pt-10 lg:border-0 lg:pr-4">
            <span aria-hidden="true" className="absolute -top-[3px] left-0 hidden h-[7px] w-[7px] rounded-full bg-line transition-colors duration-700 group-[.is-active]:bg-cyan lg:block" />
            <span className="display block text-[clamp(4rem,7vw,6.5rem)] leading-none text-fg in-[.motion]:text-fg/25 transition-colors duration-700 group-[.is-active]:text-fg">
              <em className="!text-inherit">0{i + 1}</em>
            </span>
            <h3 className="mt-8 text-xl font-medium">{s.title}</h3>
            <p className="mt-3 max-w-xs text-muted">{s.text}</p>
          </li>
        ))}
      </ol>
    </div>
  </section>
);

export default Process;
