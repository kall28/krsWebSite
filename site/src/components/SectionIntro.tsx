import Heading from "./Heading";

type SectionIntroProps = { index: string; eyebrow: string; title: string; aside?: string; className?: string };

/** Shared editorial section opener: index + eyebrow rule, oversized serif title, optional aside. */
const SectionIntro = ({ index, eyebrow, title, aside, className = "" }: SectionIntroProps) => (
  <div className={className}>
    <div className="flex items-center gap-4 border-t border-line pt-5" data-fade>
      <span className="eyebrow text-fg">{index}</span>
      <span className="eyebrow">{eyebrow}</span>
    </div>
    <div className="mt-12 grid gap-8 md:mt-16 lg:grid-cols-12 lg:items-end">
      <Heading text={title} className="text-[length:var(--text-huge)] lg:col-span-8" />
      {aside && <p className="max-w-sm text-muted lg:col-span-4 lg:justify-self-end" data-fade>{aside}</p>}
    </div>
  </div>
);

export default SectionIntro;
