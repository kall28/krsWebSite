"use client";

import { useEffect, useRef, useState } from "react";
import { nav } from "@/lib/content";
import { LogoMark } from "./Logo";

const Nav = () => {
  const [open, setOpen] = useState(false);
  const btn = useRef<HTMLButtonElement>(null);
  const panel = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;
    document.body.style.overflow = "hidden";
    panel.current?.querySelector<HTMLElement>("a")?.focus();
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === "Escape") { setOpen(false); btn.current?.focus(); return; }
      if (e.key !== "Tab") return;
      const focusable = [btn.current, ...(panel.current?.querySelectorAll<HTMLElement>("a") ?? [])].filter(Boolean) as HTMLElement[];
      const first = focusable[0], last = focusable[focusable.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    };
    const mq = matchMedia("(min-width: 768px)");
    const handleBreakpoint = () => mq.matches && setOpen(false);
    document.addEventListener("keydown", handleKeyDown);
    mq.addEventListener("change", handleBreakpoint);
    return () => { document.body.style.overflow = ""; document.removeEventListener("keydown", handleKeyDown); mq.removeEventListener("change", handleBreakpoint); };
  }, [open]);

  const handleToggle = () => setOpen((o) => !o);
  const handlePanelClick = (e: React.MouseEvent) => (e.target as Element).closest("a") && setOpen(false);

  return (
    <header data-nav className="group/nav fixed inset-x-0 top-0 z-50">
      <nav aria-label="Primary" className="relative z-[60] flex h-16 w-full items-center justify-between border-b border-transparent px-5 transition-[background-color,border-color] duration-500 md:px-10 group-data-[solid]/nav:border-line group-data-[solid]/nav:bg-bg/80 group-data-[solid]/nav:backdrop-blur-xl">
        <a href="#top" className="flex items-center gap-2.5 text-lg font-semibold tracking-tight" aria-label="KRS Infoserve, back to top">
          <LogoMark size={30} />
          KRS<span className="hidden font-normal text-muted sm:inline">Infoserve</span>
        </a>

        <ul className="hidden items-center gap-8 md:flex">
          {nav.map((n) => (
            <li key={n.href}><a href={n.href} className="link-u text-sm text-fg/75 transition-colors hover:text-fg">{n.label}</a></li>
          ))}
        </ul>

        <div className="flex items-center gap-2">
          <a href="#contact" className="hidden min-h-10 items-center rounded-full border border-line px-5 text-sm transition-colors hover:border-fg/60 hover:bg-fg/5 md:inline-flex">Start a project</a>
          <button ref={btn} type="button" aria-expanded={open} aria-controls="mobile-menu" onClick={handleToggle}
            className="relative grid h-10 w-10 place-items-center rounded-full border border-line md:hidden">
            <span className="sr-only">{open ? "Close menu" : "Open menu"}</span>
            <span aria-hidden="true" className={`absolute h-px w-4 bg-current transition-transform duration-300 ${open ? "rotate-45" : "-translate-y-1"}`} />
            <span aria-hidden="true" className={`absolute h-px w-4 bg-current transition-transform duration-300 ${open ? "-rotate-45" : "translate-y-1"}`} />
          </button>
        </div>
      </nav>

      <div id="mobile-menu" ref={panel} hidden={!open} onClick={handlePanelClick}
        className="fixed inset-0 z-[55] flex flex-col justify-between bg-bg px-5 pb-10 pt-28 md:hidden">
        <ul className="flex flex-col">
          {nav.map((n, i) => (
            <li key={n.href} className="border-b border-line">
              <a href={n.href} className="display flex items-baseline gap-4 py-5 text-5xl">
                <span className="eyebrow !font-sans">0{i + 1}</span>{n.label}
              </a>
            </li>
          ))}
        </ul>
        <a href="#contact" className="inline-flex min-h-12 w-full items-center justify-center rounded-full bg-fg font-medium text-on-fg">Start a project</a>
      </div>
    </header>
  );
};

export default Nav;
