"use client";

import { useEffect, useRef, useState } from "react";
import { nav } from "@/lib/content";
import { LogoMark } from "./Logo";
import { LinkButton } from "./Button";

export default function Nav() {
  const [open, setOpen] = useState(false);
  const btn = useRef<HTMLButtonElement>(null);
  const panel = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;
    document.body.style.overflow = "hidden";
    window.dispatchEvent(new CustomEvent("krs:lock", { detail: true }));
    panel.current?.querySelector<HTMLElement>("a")?.focus();
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") { setOpen(false); btn.current?.focus(); return; }
      if (e.key !== "Tab") return;
      const f = [btn.current, ...(panel.current?.querySelectorAll<HTMLElement>("a") ?? [])].filter(Boolean) as HTMLElement[];
      const first = f[0], last = f[f.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    };
    const mq = matchMedia("(min-width: 768px)");
    const onMq = () => mq.matches && setOpen(false);
    document.addEventListener("keydown", onKey);
    mq.addEventListener("change", onMq);
    return () => { document.body.style.overflow = ""; window.dispatchEvent(new CustomEvent("krs:lock", { detail: false })); document.removeEventListener("keydown", onKey); mq.removeEventListener("change", onMq); };
  }, [open]);

  return (
    <header data-nav className="fixed inset-x-0 top-0 z-50 transition-[background,backdrop-filter] duration-500 data-[solid]:bg-bg/70 data-[solid]:backdrop-blur-xl">
      <nav aria-label="Primary" className="relative z-[60] mx-auto flex h-20 max-w-[96rem] items-center justify-between px-5 md:px-10">
        <a href="#top" className="flex items-center gap-3" aria-label="KRS Infoserve, back to top">
          <LogoMark size={34} />
          <span className="font-display text-2xl font-medium tracking-tight">KRS <em className="text-muted">Infoserve</em></span>
        </a>

        <ul className="hidden items-center gap-9 md:flex">
          {nav.map((n) => (
            <li key={n.href}><a href={n.href} className="link-u eyebrow !text-fg py-2">{n.label}</a></li>
          ))}
        </ul>

        <div className="flex items-center gap-3">
          <LinkButton href="#contact" className="max-md:!hidden !min-h-10 !px-6">Start a project</LinkButton>
          <button ref={btn} type="button" aria-expanded={open} aria-controls="mobile-menu" onClick={() => setOpen((o) => !o)}
            className="relative grid h-11 w-11 place-items-center md:hidden">
            <span className="sr-only">{open ? "Close menu" : "Open menu"}</span>
            <span aria-hidden="true" className={`absolute h-px w-6 bg-current transition-transform duration-300 ${open ? "rotate-45" : "-translate-y-1"}`} />
            <span aria-hidden="true" className={`absolute h-px w-6 bg-current transition-transform duration-300 ${open ? "-rotate-45" : "translate-y-1"}`} />
          </button>
        </div>
      </nav>

      <div id="mobile-menu" ref={panel} hidden={!open} data-lenis-prevent
        className="fixed inset-0 z-[55] flex flex-col justify-between overflow-y-auto bg-bg px-5 pb-10 pt-28 md:hidden"
        onClick={(e) => (e.target as Element).closest("a") && setOpen(false)}>
        <ul className="flex flex-col">
          {nav.map((n, i) => (
            <li key={n.href} className="border-b border-line">
              <a href={n.href} className="display flex items-baseline gap-4 py-5 text-6xl">
                <span className="eyebrow !font-sans">0{i + 1}</span>{n.label}
              </a>
            </li>
          ))}
        </ul>
        <LinkButton href="#contact" className="mt-10 w-full">Start a project</LinkButton>
      </div>
    </header>
  );
}
