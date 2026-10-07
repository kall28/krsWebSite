import Image from "next/image";
import { Statement } from "./Heading";

export default function Intro() {
  return (
    <section id="studio" data-section className="relative py-32 md:py-48">
      <div className="mx-auto grid max-w-[96rem] grid-cols-12 gap-x-4 gap-y-20 px-5 md:px-10">
        <p className="eyebrow col-span-12 md:col-span-2" data-fade>The studio</p>
        <Statement className="col-span-12 text-[clamp(2rem,4.6vw,4.6rem)] !leading-[1.08] md:col-span-10"
          text="We are a small studio in Mumbai. Every screen is composed the way a gallery wall is hung: one idea at a time, with room to breathe, and engineered underneath to be fast, accessible and easy to grow." />

        <figure className="col-span-8 col-start-1 md:col-span-4 md:col-start-3">
          <div data-reveal className="frame zoom relative aspect-[3/4] overflow-hidden rounded-t-[999px] bg-surface">
            <div data-inner data-speed="8" className="absolute -inset-y-[8%] inset-x-0">
              <Image src="/work/black-eagle.jpg" alt="Black Eagle Books home page with a library aisle hero image" fill sizes="(min-width:768px) 33vw, 66vw" className="object-cover" />
            </div>
          </div>
          <figcaption className="eyebrow mt-4">Black Eagle Books, online bookstore</figcaption>
        </figure>

        <div className="col-span-12 flex flex-col justify-end gap-8 md:col-span-4 md:col-start-8 md:pb-6">
          <figure className="w-3/4 self-end md:w-full">
            <div data-reveal className="frame zoom relative aspect-square overflow-hidden rounded-full bg-[#ececf1]">
              <div data-inner data-speed="12" className="absolute -inset-[6%]">
                <Image src="/work/richfeel-app.jpg" alt="Richfeel sales app on two phones" fill sizes="(min-width:768px) 28vw, 60vw" className="object-cover mix-blend-multiply" />
              </div>
            </div>
            <figcaption className="eyebrow mt-4">Richfeel, field-sales app</figcaption>
          </figure>
          <p className="max-w-sm text-muted" data-fade>
            Strategy, design, engineering and support under one roof, so the thing you approve is the thing that ships.
          </p>
        </div>
      </div>
    </section>
  );
}
