import Contact from "@/components/Contact";
import Footer from "@/components/Footer";
import Hero from "@/components/Hero";
import Motion from "@/components/Motion";
import Nav from "@/components/Nav";
import Process from "@/components/Process";
import Services from "@/components/Services";
import Trust from "@/components/Trust";
import Work from "@/components/Work";

const Home = () => (
  <>
    <a href="#main" className="sr-only z-[100] bg-cyan px-4 py-2 text-ink focus:not-sr-only focus:fixed focus:left-4 focus:top-4">Skip to content</a>
    <div className="progress" data-progress aria-hidden="true" />
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

export default Home;
