import Image from "next/image";
import SectionIntro from "./SectionIntro";
import { projects } from "@/lib/content";

type Project = (typeof projects)[number];

const CaseLink = ({ project }: { project: Project }) => {
  if (project.url) {
    return (
      <a href={project.url} target="_blank" rel="noopener noreferrer" className="link-u mt-8 inline-flex items-center gap-2 text-sm font-medium">
        Visit live site<span aria-hidden="true">↗</span><span className="sr-only">(opens in a new tab)</span>
      </a>
    );
  }
  return <a href="#contact" className="link-u mt-8 inline-block text-sm font-medium">Start a similar project →</a>;
};

const CaseMeta = ({ project, index }: { project: Project; index: number }) => (
  <div className="flex items-center gap-4">
    <span className="eyebrow text-fg">{String(index + 1).padStart(2, "0")}</span>
    <span className="h-px w-8 bg-line" aria-hidden="true" />
    <span className="eyebrow">{project.kind}</span>
  </div>
);

const WideCase = ({ project, index }: { project: Project; index: number }) => (
  <article className="grid gap-x-8 gap-y-10 lg:grid-cols-12">
    <div data-clip className="relative aspect-[48/25] overflow-hidden rounded-lg bg-surface lg:col-span-12">
      <div data-parallax="3" className="absolute inset-x-0 -inset-y-[4%]">
        <Image src={project.img} alt={project.alt} fill sizes="(min-width:1440px) 1360px, 94vw" className="object-cover object-top" />
      </div>
    </div>
    <header className="lg:col-span-6" data-fade>
      <CaseMeta project={project} index={index} />
      <h3 className="display mt-6 text-[clamp(2.6rem,5vw,4.75rem)]">{project.name}</h3>
    </header>
    <div className="lg:col-span-4 lg:col-start-9 lg:pt-12" data-fade>
      <p className="text-lg text-muted">{project.line}</p>
      <CaseLink project={project} />
    </div>
  </article>
);

const MockupCase = ({ project, index, reverse }: { project: Project; index: number; reverse: boolean }) => (
  <article className="grid items-center gap-x-8 gap-y-10 lg:grid-cols-12">
    <div data-clip className={`relative aspect-[5/4] overflow-hidden rounded-lg bg-ivory lg:col-span-7 ${reverse ? "lg:order-2 lg:col-start-6" : ""}`}>
      <div data-parallax="3" className="absolute inset-0">
        <Image src={project.img} alt={project.alt} fill sizes="(min-width:1024px) 55vw, 94vw" className="object-contain p-[5%]" />
      </div>
    </div>
    <div className={`lg:col-span-4 ${reverse ? "lg:order-1 lg:col-start-1" : "lg:col-start-9"}`} data-fade>
      <CaseMeta project={project} index={index} />
      <h3 className="display mt-6 text-[clamp(2.6rem,5vw,4.75rem)]">{project.name}</h3>
      <p className="mt-6 text-lg text-muted">{project.line}</p>
      <CaseLink project={project} />
    </div>
  </article>
);

const Work = () => {
  let mockupCount = 0;
  return (
    <section id="work" className="relative bg-bg">
      <div className="mx-auto max-w-[90rem] px-5 py-28 md:px-10 md:py-40">
        <SectionIntro index="02" eyebrow="Selected work" title="Products in the hands of _real customers._" aside="Four projects, from high-volume consumer booking to B2B procurement and field sales." />

        <ol className="mt-20 space-y-28 md:mt-28 md:space-y-40">
          {projects.map((project, index) => {
            const reverse = project.mockup ? mockupCount++ % 2 === 1 : false;
            return (
              <li key={project.name}>
                {project.mockup
                  ? <MockupCase project={project} index={index} reverse={reverse} />
                  : <WideCase project={project} index={index} />}
              </li>
            );
          })}
        </ol>
      </div>
    </section>
  );
};

export default Work;
