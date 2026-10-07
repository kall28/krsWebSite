import { LogoFull } from "./Logo";
import { nav, site } from "@/lib/content";

export default function Footer() {
  return (
    <footer className="overflow-hidden border-t border-line px-5 pb-8 pt-20 md:px-10">
      <div className="mx-auto max-w-[96rem]">
        <p className="display text-[clamp(5rem,26vw,24rem)] font-bold leading-[0.78] text-fg/[0.07]" aria-hidden="true">KRS</p>
        <div className="mt-16 grid gap-10 border-t border-line pt-10 md:grid-cols-4">
          <div className="md:col-span-2">
            <LogoFull />
            <p className="mt-3 max-w-sm text-muted">Web, mobile and brand studio helping businesses ship digital products people love.</p>
          </div>
          <nav aria-label="Footer">
            <p className="eyebrow mb-4 text-muted">Explore</p>
            <ul className="space-y-2">
              {nav.map((n) => <li key={n.href}><a href={n.href} className="link-u">{n.label}</a></li>)}
              <li><a href="#contact" className="link-u">Contact</a></li>
            </ul>
          </nav>
          <address className="not-italic">
            <p className="eyebrow mb-4 text-muted">Studio</p>
            <p>{site.address}</p>
            <p className="mt-3"><a href={`mailto:${site.email}`} className="link-u">{site.email}</a></p>
            {site.phones.map((p) => <p key={p}><a href={`tel:${p.replace(/\s/g, "")}`} className="link-u">{p}</a></p>)}
          </address>
        </div>
        <div className="mt-12 flex flex-wrap items-center justify-between gap-4 text-sm text-muted">
          <p>© {new Date().getFullYear()} KRS Infoserve LLP. All rights reserved.</p>
          <a href="#top" className="link-u">Back to top ↑</a>
        </div>
      </div>
    </footer>
  );
}
