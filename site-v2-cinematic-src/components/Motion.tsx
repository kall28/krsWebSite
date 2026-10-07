"use client";

import { useEffect } from "react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import Lenis from "lenis";

gsap.registerPlugin(ScrollTrigger);

/**
 * All scroll choreography lives here; markup opts in through data attributes.
 * Everything is created inside gsap.matchMedia, so a viewport or motion-preference change
 * reverts it cleanly, and listeners are removed in each cleanup.
 */
export default function Motion() {
  useEffect(() => {
    const mm = gsap.matchMedia();
    const visible = (el: Element) => (el as HTMLElement).offsetParent !== null;
    const q = <T extends HTMLElement = HTMLElement>(s: string) => gsap.utils.toArray<T>(s).filter(visible);

    mm.add("(prefers-reduced-motion: no-preference)", () => {
      document.documentElement.classList.add("motion");

      // ── Lenis, driven by GSAP's ticker so ScrollTrigger and smooth scroll share one clock
      const lenis = new Lenis({ lerp: 0.09, wheelMultiplier: 0.9 });
      lenis.on("scroll", ScrollTrigger.update);
      const tick = (t: number) => lenis.raf(t * 1000);
      gsap.ticker.add(tick);
      gsap.ticker.lagSmoothing(0);
      const onLock = (e: Event) => ((e as CustomEvent<boolean>).detail ? lenis.stop() : lenis.start());
      window.addEventListener("krs:lock", onLock);

      // Anchor links glide through Lenis
      const onClick = (e: MouseEvent) => {
        const a = (e.target as Element).closest<HTMLAnchorElement>('a[href^="#"]');
        if (!a || e.defaultPrevented || e.metaKey || e.ctrlKey) return;
        const id = a.getAttribute("href")!.slice(1);
        const target = id ? document.getElementById(id) : null;
        if (id && !target) return;
        e.preventDefault();
        lenis.scrollTo(target ?? 0, {
          offset: target ? -70 : 0, duration: 1.6, easing: (t) => 1 - Math.pow(1 - t, 4),
          onComplete: () => { history.replaceState(null, "", id ? `#${id}` : location.pathname); if (target) { target.setAttribute("tabindex", "-1"); target.focus({ preventScroll: true }); } },
        });
      };
      document.addEventListener("click", onClick);

      // ── Staggered headline reveals (words rise out of a mask)
      q("[data-split]").forEach((el) =>
        gsap.fromTo(el.querySelectorAll(".word"), { yPercent: 115, y: 0 }, {
          yPercent: 0, y: 0, duration: 1.3, ease: "expo.out", stagger: 0.09, delay: el.hasAttribute("data-hero") ? 0.2 : 0,
          scrollTrigger: { trigger: el, start: "top 90%", once: true },
        }),
      );

      // ── Fade-ups, staggered when they arrive together
      ScrollTrigger.batch(q("[data-fade]"), {
        start: "top 92%", once: true,
        onEnter: (els) => gsap.fromTo(els, { opacity: 0, y: 28 }, { opacity: 1, y: 0, duration: 1, ease: "power3.out", stagger: 0.12, overwrite: true }),
      });

      // ── Statements: words light up as the paragraph crosses the screen
      q("[data-words]").forEach((el) =>
        gsap.fromTo(el.querySelectorAll("[data-w]"), { opacity: 0.16 }, {
          opacity: 1, ease: "none", stagger: 0.12,
          scrollTrigger: { trigger: el, start: "top 80%", end: "bottom 55%", scrub: true },
        }),
      );

      // ── Mask reveals: frame opens with a clip-path while the image inside settles from a zoom
      q("[data-reveal]").forEach((el) => {
        const inner = el.querySelector("[data-inner]");
        const tl = gsap.timeline({ scrollTrigger: { trigger: el, start: "top 88%", once: true } });
        tl.fromTo(el, { clipPath: "inset(100% 0% 0% 0%)" }, { clipPath: "inset(0% 0% 0% 0%)", duration: 1.5, ease: "expo.inOut" });
        if (inner) tl.fromTo(inner, { scale: 1.35 }, { scale: 1, duration: 2, ease: "expo.out" }, 0);
      });

      // ── Parallax depth: each layer drifts at its own speed
      q("[data-speed]").forEach((el) => {
        const s = parseFloat(el.dataset.speed ?? "8");
        gsap.fromTo(el, { yPercent: -s }, { yPercent: s, ease: "none", scrollTrigger: { trigger: el.closest("[data-section]") ?? el, start: "top bottom", end: "bottom top", scrub: 0.6 } });
      });

      // ── Hero: the stage recedes as you leave
      gsap.to("#top > div:nth-child(2)", { yPercent: -8, opacity: 0.35, ease: "none", scrollTrigger: { trigger: "#top", start: "top top", end: "bottom top", scrub: true } });

      // ── Nav backdrop + progress bar
      const nav = document.querySelector<HTMLElement>("[data-nav]");
      if (nav) ScrollTrigger.create({ start: 60, onUpdate: (s) => nav.toggleAttribute("data-solid", s.scroll() > 60) });
      const bar = document.querySelector<HTMLElement>("[data-progress]");
      if (bar) gsap.to(bar, { scaleX: 1, ease: "none", scrollTrigger: { start: 0, end: "max", scrub: 0.2 } });

      // ── Magnetic buttons (fine pointers only)
      const cleanups: (() => void)[] = [];
      if (matchMedia("(pointer: fine)").matches) {
        q("[data-magnetic]").forEach((el) => {
          const x = gsap.quickTo(el, "x", { duration: 0.6, ease: "power3" }), y = gsap.quickTo(el, "y", { duration: 0.6, ease: "power3" });
          const mv = (e: PointerEvent) => { const r = el.getBoundingClientRect(); x((e.clientX - (r.left + r.width / 2)) * 0.25); y((e.clientY - (r.top + r.height / 2)) * 0.35); };
          const lv = () => { x(0); y(0); };
          el.addEventListener("pointermove", mv); el.addEventListener("pointerleave", lv);
          cleanups.push(() => { el.removeEventListener("pointermove", mv); el.removeEventListener("pointerleave", lv); });
        });
      }

      // ── Small screens: gallery cards open as they arrive
      if (!matchMedia("(min-width: 1024px)").matches) {
        q("[data-card]").forEach((c) =>
          gsap.fromTo(c, { opacity: 0, y: 48 }, { opacity: 1, y: 0, duration: 1.1, ease: "power3.out", scrollTrigger: { trigger: c, start: "top 88%", once: true } }),
        );
        q("[data-gal-img]").forEach((el) =>
          gsap.fromTo(el, { xPercent: -3 }, { xPercent: 3, ease: "none", scrollTrigger: { trigger: el, start: "top bottom", end: "bottom top", scrub: 0.6 } }),
        );
      }

      const refresh = () => ScrollTrigger.refresh();
      window.addEventListener("load", refresh);

      return () => {
        cleanups.forEach((f) => f());
        document.removeEventListener("click", onClick);
        window.removeEventListener("krs:lock", onLock);
        window.removeEventListener("load", refresh);
        gsap.ticker.remove(tick);
        gsap.ticker.lagSmoothing(500, 33);
        lenis.destroy();
        document.documentElement.classList.remove("motion");
      };
    });

    // ── Desktop: pinned story, chapters swap as you scroll
    mm.add("(min-width: 1024px) and (prefers-reduced-motion: no-preference)", () => {
      const pin = document.querySelector<HTMLElement>("[data-story]");
      if (!pin) return;
      const texts = q("[data-st]"), imgs = q("[data-si]"), inners = q("[data-sin]");
      const prog = pin.querySelector("[data-sprog]");
      const n = texts.length;
      gsap.set(texts.slice(1), { autoAlpha: 0, y: 40 });
      gsap.set(imgs.slice(1), { clipPath: "inset(100% 0% 0% 0%)" });
      gsap.set(inners.slice(1), { scale: 1.3 });

      const tl = gsap.timeline({
        defaults: { ease: "none" },
        scrollTrigger: { trigger: pin, start: "top top", end: `+=${(n - 1) * 90}%`, pin: true, scrub: 0.7, anticipatePin: 1 },
      });
      for (let i = 1; i < n; i++) {
        const t = (i - 1) * 3 + 1; // one unit of hold before every change, so text stays readable
        tl.to(texts[i - 1], { autoAlpha: 0, y: -40, duration: 0.8 }, t)
          .to(imgs[i], { clipPath: "inset(0% 0% 0% 0%)", duration: 1.4, ease: "power2.inOut" }, t)
          .to(inners[i], { scale: 1, duration: 1.6 }, t)
          .to(inners[i - 1], { scale: 1.12, duration: 1.4 }, t)
          .to(texts[i], { autoAlpha: 1, y: 0, duration: 0.8 }, t + 1.3);
        if (prog) tl.to(prog, { scaleY: i / (n - 1), duration: 1.4 }, t);
      }
      tl.to({}, { duration: 1 });
    });

    // ── Desktop: vertical scroll drives the horizontal gallery
    mm.add("(min-width: 1024px) and (prefers-reduced-motion: no-preference)", () => {
      const wrap = document.querySelector<HTMLElement>("[data-gal]");
      const track = document.querySelector<HTMLElement>("[data-gal-track]");
      if (!wrap || !track) return;
      const count = document.querySelector<HTMLElement>("[data-gal-count]");
      const items = gsap.utils.toArray<HTMLElement>("[data-gal-item]");
      const dist = () => Math.max(0, track.scrollWidth - window.innerWidth);

      const slide = gsap.to(track, {
        x: () => -dist(), ease: "none",
        scrollTrigger: {
          trigger: wrap, start: "top top", end: () => `+=${dist()}`, pin: true, scrub: 0.8, invalidateOnRefresh: true, anticipatePin: 1,
          onUpdate: (s) => { if (count) count.textContent = String(Math.min(items.length, Math.round(s.progress * (items.length - 1)) + 1)).padStart(2, "0"); },
        },
      });

      items.forEach((li) => {
        const img = li.querySelector("[data-gal-img]");
        const card = li.querySelector("[data-card]");
        const st = { trigger: li, containerAnimation: slide, start: "left right", end: "right left", scrub: true };
        if (img) gsap.fromTo(img, { xPercent: -7 }, { xPercent: 7, ease: "none", scrollTrigger: st });
        if (card) gsap.fromTo(card, { opacity: 0.35, scale: 0.9 }, { opacity: 1, scale: 1, ease: "none", scrollTrigger: { ...st, start: "left 98%", end: "left 55%" } });
      });
    });

    // Pins were created after the triggers below them; re-measure in document order
    const raf = requestAnimationFrame(() => { ScrollTrigger.sort(); ScrollTrigger.refresh(); });

    return () => { cancelAnimationFrame(raf); mm.revert(); };
  }, []);

  return null;
}
