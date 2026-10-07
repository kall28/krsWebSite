import { LogoFull } from "./Logo";
import { nav, site } from "@/lib/content";

const Footer = () => (
  <footer className="overflow-hidden border-t border-line bg-bg px-5 pb-8 pt-20 md:px-10">
    <div className="mx-auto max-w-[90rem]">
      <div className="grid gap-12 md:grid-cols-12">
        <div className="md:col-span-6">
          <LogoFull />
          <p className="mt-6 max-w-sm text-muted">Web, mobile and brand studio helping businesses ship digital products people love.</p>
        </div>
        <nav aria-label="Footer" className="md:col-span-3">
          <p className="eyebrow mb-5">Explore</p>
          <ul className="space-y-2">
            {nav.map((n) => <li key={n.href}><a href={n.href} className="link-u">{n.label}</a></li>)}
            <li><a href="#contact" className="link-u">Contact</a></li>
          </ul>
        </nav>
        <address className="not-italic md:col-span-3">
          <p className="eyebrow mb-5">Studio</p>
          <p>{site.address}</p>
          <p className="mt-3"><a href={`mailto:${site.email}`} className="link-u">{site.email}</a></p>
          {site.phones.map((p) => <p key={p}><a href={`tel:${p.replace(/\s/g, "")}`} className="link-u">{p}</a></p>)}
        </address>
      </div>
      <p className="display mt-20 select-none text-[clamp(4rem,17vw,16rem)] leading-[0.8] text-fg/[0.08]" aria-hidden="true">KRS <em className="!text-inherit">Infoserve</em></p>
      <div className="mt-10 flex flex-wrap items-center justify-between gap-4 border-t border-line pt-6 text-sm text-muted">
        <p>© {new Date().getFullYear()} KRS Infoserve LLP. All rights reserved.</p>
        <a href="#top" className="link-u">Back to top ↑</a>
      </div>
    </div>
  </footer>
);

export default Footer;
