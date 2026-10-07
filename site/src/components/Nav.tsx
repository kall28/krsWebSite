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
    return () => { document.body.style.overflow = ""; document.removeEventListener("keydown", onKey); mq.removeEventListener("change", onMq); };
  }, [open]);

  return (
    <header data-nav className="fixed inset-x-0 top-0 z-50">
      <nav aria-label="Primary" className="glass relative z-[60] flex h-16 w-full items-center justify-between !border-x-0 !border-t-0 px-4 transition-[background,box-shadow] duration-500 md:px-8 lg:px-12 [[data-nav][data-solid]_&]:bg-black/60 [[data-nav][data-solid]_&]:shadow-[0_10px_40px_-10px_rgba(0,0,0,.8)]">
        <a href="#top" className="flex items-center gap-2 font-[family-name:var(--font-display)] text-xl font-bold tracking-tight" aria-label="KRS Infoserve, back to top">
          <LogoMark size={34} />
          KRS<span className="hidden font-normal text-muted sm:inline">Infoserve</span>
        </a>

        <ul className="hidden items-center gap-1 md:flex">
          {nav.map((n) => (
            <li key={n.href}><a href={n.href} className="rounded-full px-4 py-2 text-sm text-muted transition-colors hover:bg-white/10 hover:text-fg">{n.label}</a></li>
          ))}
        </ul>

        <div className="flex items-center gap-2">
          <LinkButton href="#contact" className="max-md:!hidden !min-h-10 !px-5 !text-sm">Start a project</LinkButton>
          <button ref={btn} type="button" aria-expanded={open} aria-controls="mobile-menu" onClick={() => setOpen((o) => !o)}
            className="relative grid h-10 w-10 place-items-center rounded-full bg-white/10 md:hidden">
            <span className="sr-only">{open ? "Close menu" : "Open menu"}</span>
            <span aria-hidden="true" className={`absolute h-px w-4 bg-current transition-transform duration-300 ${open ? "rotate-45" : "-translate-y-1"}`} />
            <span aria-hidden="true" className={`absolute h-px w-4 bg-current transition-transform duration-300 ${open ? "-rotate-45" : "translate-y-1"}`} />
          </button>
        </div>
      </nav>

      <div id="mobile-menu" ref={panel} hidden={!open}
        className="fixed inset-0 z-[55] flex flex-col justify-between bg-bg/95 px-5 pb-10 pt-28 backdrop-blur-xl md:hidden"
        onClick={(e) => (e.target as Element).closest("a") && setOpen(false)}>
        <ul className="flex flex-col">
          {nav.map((n, i) => (
            <li key={n.href} className="border-b border-line">
              <a href={n.href} className="display flex items-baseline gap-4 py-5 text-5xl">
                <span className="eyebrow !font-sans">0{i + 1}</span>{n.label}
              </a>
            </li>
          ))}
        </ul>
        <LinkButton href="#contact" className="w-full">Start a project</LinkButton>
      </div>
    </header>
  );
}
