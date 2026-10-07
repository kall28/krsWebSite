import Cursor from "@/components/Cursor";
import Contact from "@/components/Contact";
import Footer from "@/components/Footer";
import Hero from "@/components/Hero";
import Motion from "@/components/Motion";
import Nav from "@/components/Nav";
import Process from "@/components/Process";
import Services from "@/components/Services";
import Trust from "@/components/Trust";
import Work from "@/components/Work";

export default function Home() {
  return (
    <>
      <a href="#main" className="sr-only z-[100] bg-cyan px-4 py-2 text-black focus:not-sr-only focus:fixed focus:left-4 focus:top-4">Skip to content</a>
      <div className="progress" data-progress aria-hidden="true" />
      <Cursor />
      <Nav />
      <main id="main">
        <Hero />
        <Services />
        <Work />
        <Process />
        <Trust />
        <Contact />
      </main>
      <Footer />
      <Motion />
    </>
  );
}
