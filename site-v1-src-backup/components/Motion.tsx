"use client";

import { useEffect } from "react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { ScrollToPlugin } from "gsap/ScrollToPlugin";

gsap.registerPlugin(ScrollTrigger, ScrollToPlugin);

/** One place for all scroll choreography. Elements opt in through data attributes. */
export default function Motion() {
  useEffect(() => {
    const mm = gsap.matchMedia();

    mm.add("(prefers-reduced-motion: no-preference)", () => {
      const root = document.documentElement;
      root.classList.add("motion");
      const q = <T extends Element = HTMLElement>(s: string) => gsap.utils.toArray<T>(s);

      // Heading word reveals
      q("[data-split]").forEach((el) => {
        gsap.fromTo(el.querySelectorAll(".word"), { yPercent: 110, y: 0 }, {
          yPercent: 0, y: 0, duration: 1.1, ease: "expo.out", stagger: 0.07,
          delay: el.hasAttribute("data-hero") ? 0.15 : 0,
          scrollTrigger: { trigger: el, start: "top 90%", once: true },
        });
      });

      // Fade-up blocks, staggered when they arrive together
      ScrollTrigger.batch("[data-fade]", {
        start: "top 92%", once: true,
        onEnter: (els) => gsap.fromTo(els, { opacity: 0, y: 24 }, { opacity: 1, y: 0, duration: 0.9, ease: "power3.out", stagger: 0.1, overwrite: true }),
      });

      // Image wipe-in
      q("[data-clip]").forEach((el) =>
        gsap.fromTo(el, { clipPath: "inset(0 0 100% 0)" }, { clipPath: "inset(0 0 0% 0)", duration: 1.3, ease: "expo.inOut", scrollTrigger: { trigger: el, start: "top 88%", once: true } }),
      );

      // Subtle image drift inside its frame
      q("[data-parallax]").forEach((el) => {
        const amt = parseFloat(el.dataset.parallax ?? "8");
        gsap.fromTo(el, { yPercent: -amt }, { yPercent: amt, ease: "none", scrollTrigger: { trigger: el.parentElement, start: "top bottom", end: "bottom top", scrub: 0.6 } });
      });

      // Hero: window starts tilted in 3D and settles flat, then recedes as the page scrolls; the phone floats faster (depth)
      const stage = document.querySelector<HTMLElement>("[data-hero-stage]");
      if (stage) {
        gsap.fromTo("[data-hero-window]", { rotateX: 14, rotateY: -16, transformOrigin: "50% 100%" }, { rotateX: 0, rotateY: 0, duration: 1.8, ease: "expo.out", delay: 0.3 });
        gsap.to(stage, { yPercent: -4, scale: 0.94, ease: "none", scrollTrigger: { trigger: "#top", start: "top top", end: "bottom top", scrub: 0.6 } });
        gsap.to("[data-hero-phone]", { yPercent: -70, rotate: 2, ease: "none", scrollTrigger: { trigger: "#top", start: "top top", end: "bottom top", scrub: 0.6 } });
      }

      // Work images on small screens: vertical drift + wipe reveal
      q("[data-card]").forEach((card) => {
        if (matchMedia("(min-width: 1024px)").matches) return;
        const img = card.querySelector<HTMLElement>("[data-vpar]");
        if (img) gsap.fromTo(img, { yPercent: -6 }, { yPercent: 6, ease: "none", scrollTrigger: { trigger: card, start: "top bottom", end: "bottom top", scrub: 0.6 } });
        gsap.fromTo(card, { clipPath: "inset(12% 6% 0% 6% round 2rem)" }, { clipPath: "inset(0% 0% 0% 0% round 2rem)", ease: "none", scrollTrigger: { trigger: card, start: "top 95%", end: "top 55%", scrub: true } });
      });

      // Process line draws with scroll
      q("[data-line]").forEach((el) =>
        gsap.fromTo(el, { scaleX: 0 }, { scaleX: 1, ease: "none", transformOrigin: "left", scrollTrigger: { trigger: el.parentElement, start: "top 75%", end: "bottom 60%", scrub: true } }),
      );

      // Nav gets a backdrop after leaving the hero
      const nav = document.querySelector<HTMLElement>("[data-nav]");
      if (nav) ScrollTrigger.create({ start: 40, onUpdate: (s) => nav.toggleAttribute("data-solid", s.scroll() > 40) });

      // Smooth anchor scrolling
      const onClick = (e: MouseEvent) => {
        const a = (e.target as Element).closest<HTMLAnchorElement>('a[href^="#"]');
        if (!a || e.defaultPrevented || e.metaKey || e.ctrlKey) return;
        const id = a.getAttribute("href")!.slice(1);
        const target = id ? document.getElementById(id) : document.body;
        if (!target) return;
        e.preventDefault();
        gsap.to(window, {
          scrollTo: { y: id ? target : 0, offsetY: 72, autoKill: true }, duration: 1.2, ease: "power3.inOut",
          onComplete: () => { history.replaceState(null, "", id ? `#${id}` : location.pathname); if (id) { target.setAttribute("tabindex", "-1"); target.focus({ preventScroll: true }); } },
        });
      };
      document.addEventListener("click", onClick);

      // Cursor-follow spotlight on bento cards
      const onMove = (e: PointerEvent) => {
        const c = (e.target as Element).closest<HTMLElement>("[data-spot]");
        if (!c) return;
        const r = c.getBoundingClientRect();
        c.style.setProperty("--mx", `${e.clientX - r.left}px`);
        c.style.setProperty("--my", `${e.clientY - r.top}px`);
      };
      document.addEventListener("pointermove", onMove);

      // Scroll progress bar
      const bar = document.querySelector<HTMLElement>("[data-progress]");
      if (bar) gsap.to(bar, { scaleX: 1, ease: "none", scrollTrigger: { start: 0, end: "max", scrub: 0.2 } });

      // Card tilt + magnetic buttons (fine pointers only)
      const fine = matchMedia("(pointer: fine)").matches;
      const tilt = (e: PointerEvent) => {
        const c = (e.target as Element).closest<HTMLElement>("[data-spot]");
        if (!c) return;
        const r = c.getBoundingClientRect();
        c.style.setProperty("--ry", `${((e.clientX - r.left) / r.width - 0.5) * 8}deg`);
        c.style.setProperty("--rx", `${-((e.clientY - r.top) / r.height - 0.5) * 8}deg`);
      };
      const untilt = (e: PointerEvent) => { const c = (e.target as Element).closest<HTMLElement>("[data-spot]"); c?.style.setProperty("--rx", "0deg"); c?.style.setProperty("--ry", "0deg"); };
      const magnets = fine ? q("[data-magnetic]").map((el) => {
        const x = gsap.quickTo(el, "x", { duration: 0.5, ease: "power3" }), y = gsap.quickTo(el, "y", { duration: 0.5, ease: "power3" });
        const mv = (e: PointerEvent) => { const r = el.getBoundingClientRect(); x((e.clientX - (r.left + r.width / 2)) * 0.3); y((e.clientY - (r.top + r.height / 2)) * 0.4); };
        const lv = () => { x(0); y(0); };
        el.addEventListener("pointermove", mv); el.addEventListener("pointerleave", lv);
        return () => { el.removeEventListener("pointermove", mv); el.removeEventListener("pointerleave", lv); };
      }) : [];
      if (fine) { document.addEventListener("pointermove", tilt); document.addEventListener("pointerout", untilt); }

      const refresh = () => ScrollTrigger.refresh();
      window.addEventListener("load", refresh);
      return () => {
        document.removeEventListener("click", onClick);
        document.removeEventListener("pointermove", onMove);
        document.removeEventListener("pointermove", tilt); document.removeEventListener("pointerout", untilt); magnets.forEach((f) => f());
        window.removeEventListener("load", refresh);
        root.classList.remove("motion");
      };
    });

    // Desktop: pin the Work row and scrub it sideways
    mm.add("(min-width: 1024px) and (prefers-reduced-motion: no-preference)", () => {
      const wrap = document.querySelector<HTMLElement>("[data-hscroll]");
      const track = document.querySelector<HTMLElement>("[data-htrack]");
      if (!wrap || !track) return;
      const dist = () => Math.max(0, track.scrollWidth - window.innerWidth + 80);
      const slide = gsap.to(track, { x: () => -dist(), ease: "none", scrollTrigger: { trigger: wrap, start: "top top", end: () => `+=${dist()}`, pin: true, scrub: 0.6, invalidateOnRefresh: true, anticipatePin: 1 } });
      // Inside the sideways row: images slide against the motion, cards scale up as they reach the centre
      gsap.utils.toArray<HTMLElement>("[data-card]").forEach((card) => {
        const li = card.parentElement!;
        const img = card.querySelector<HTMLElement>("[data-hpar]");
        const st = { trigger: li, containerAnimation: slide, start: "left right", end: "right left", scrub: true };
        if (img) gsap.fromTo(img, { xPercent: -7 }, { xPercent: 7, ease: "none", scrollTrigger: st });
        gsap.fromTo(card, { scale: 0.88, opacity: 0.5 }, { scale: 1, opacity: 1, ease: "none", scrollTrigger: { ...st, start: "left 95%", end: "left 45%" } });
      });
    });

    return () => mm.revert();
  }, []);

  return null;
}
