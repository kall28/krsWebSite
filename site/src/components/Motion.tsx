"use client";

import { useEffect } from "react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { ScrollToPlugin } from "gsap/ScrollToPlugin";
import { debug } from "@/lib/debug";

gsap.registerPlugin(ScrollTrigger, ScrollToPlugin);

const q = <T extends Element = HTMLElement>(selector: string) => gsap.utils.toArray<T>(selector);
const NAV_OFFSET = 64;

/** One place for all choreography. Elements opt in through data attributes. */
const Motion = () => {
  useEffect(() => {
    const mm = gsap.matchMedia();

    // Desktop hero: pin, lift the sculpture away, swap headlines, bring the showcase up from below.
    // Registered first with a higher refresh priority so triggers further down account for the pin spacing.
    mm.add("(min-width: 1024px) and (prefers-reduced-motion: no-preference)", () => {
      const stage = document.querySelector<HTMLElement>("[data-hero-stage]");
      if (!stage) return;
      const wordsA = q("[data-hero-a] h1 .word");
      const wordsB = q("[data-hero-b] [data-split-manual] .word");
      gsap.set(wordsB, { yPercent: 115, y: 0 });

      const timeline = gsap.timeline({
        defaults: { ease: "none" },
        scrollTrigger: {
          trigger: stage,
          start: "top top",
          end: "+=220%",
          pin: true,
          scrub: 1,
          anticipatePin: 1,
          refreshPriority: 1,
          invalidateOnRefresh: true,
          onToggle: (self) => debug("motion", `hero pin ${self.isActive ? "engaged" : "released"}`),
        },
      });

      timeline
        .to("[data-hero-copy]", { autoAlpha: 0, y: -40, duration: 0.16, ease: "power1.in" }, 0)
        .to("[data-sculpt]", { y: () => -window.innerHeight * 1.15, rotation: -9, scale: 0.9, duration: 0.5, ease: "power2.in" }, 0.02)
        .fromTo(wordsA, { y: 0 }, { y: (_i: number, el: HTMLElement) => -el.offsetHeight * 1.25, duration: 0.2, stagger: 0.03, ease: "power2.in", immediateRender: false }, 0.14)
        .to(wordsB, { yPercent: 0, duration: 0.22, stagger: 0.04, ease: "power3.out" }, 0.38)
        .fromTo("[data-hero-comp]", { y: () => window.innerHeight * 1.1 }, { y: 0, duration: 0.42, ease: "power3.out" }, 0.46)
        .fromTo("[data-hero-phone]", { y: 90 }, { y: 0, duration: 0.4, ease: "power2.out" }, 0.54)
        .to({}, { duration: 0.08 });

      debug("motion", "desktop hero sequence ready");
    });

    // Small screens: no pin. Sculpture drifts up, second headline and showcase reveal in flow.
    mm.add("(max-width: 1023px) and (prefers-reduced-motion: no-preference)", () => {
      gsap.fromTo("[data-hero-b] [data-split-manual] .word", { yPercent: 115, y: 0 }, {
        yPercent: 0, duration: 1.1, ease: "expo.out", stagger: 0.07,
        scrollTrigger: { trigger: "[data-hero-b]", start: "top 85%", once: true },
      });
      gsap.fromTo("[data-hero-comp]", { autoAlpha: 0, y: 60 }, {
        autoAlpha: 1, y: 0, duration: 1.2, ease: "power3.out",
        scrollTrigger: { trigger: "[data-hero-comp]", start: "top 92%", once: true },
      });
      gsap.to("[data-sculpt]", { yPercent: -22, ease: "none", scrollTrigger: { trigger: "[data-hero-a]", start: "top top", end: "bottom top", scrub: 0.6 } });
      debug("motion", "compact hero sequence ready");
    });

    mm.add("(prefers-reduced-motion: no-preference)", () => {
      const root = document.documentElement;
      root.classList.add("motion");

      // Hero intro, then a slow idle drift that pauses once the hero is off screen
      gsap.timeline({ defaults: { ease: "expo.out" } })
        .fromTo("[data-sculpt-idle]", { autoAlpha: 0, scale: 0.94 }, { autoAlpha: 1, scale: 1, duration: 2.2 }, 0.1)
        .fromTo("[data-hero-intro]", { autoAlpha: 0, y: 24 }, { autoAlpha: 1, y: 0, duration: 1.2, stagger: 0.12 }, 0.75);
      const idle = gsap.to("[data-sculpt-idle]", { y: -14, rotation: 1.2, duration: 5.5, ease: "sine.inOut", yoyo: true, repeat: -1 });
      ScrollTrigger.create({ trigger: "#top", start: "top top", end: "bottom top", onToggle: (self) => (self.isActive ? idle.play() : idle.pause()) });

      // Staggered word reveals
      q("[data-split]").forEach((el) => {
        gsap.fromTo(el.querySelectorAll(".word"), { yPercent: 115, y: 0 }, {
          yPercent: 0, duration: 1.2, ease: "expo.out", stagger: 0.08,
          delay: el.hasAttribute("data-hero") ? 0.2 : 0,
          scrollTrigger: { trigger: el, start: "top 88%", once: true },
        });
      });

      ScrollTrigger.batch("[data-fade]", {
        start: "top 92%", once: true,
        onEnter: (els) => gsap.fromTo(els, { opacity: 0, y: 24 }, { opacity: 1, y: 0, duration: 1, ease: "power3.out", stagger: 0.1, overwrite: true }),
      });

      q("[data-clip]").forEach((el) =>
        gsap.fromTo(el, { clipPath: "inset(0 0 100% 0)" }, { clipPath: "inset(0 0 0% 0)", duration: 1.4, ease: "expo.inOut", scrollTrigger: { trigger: el, start: "top 85%", once: true } }),
      );

      q("[data-parallax]").forEach((el) => {
        const amount = parseFloat(el.dataset.parallax ?? "6");
        gsap.fromTo(el, { yPercent: -amount }, { yPercent: amount, ease: "none", scrollTrigger: { trigger: el.parentElement, start: "top bottom", end: "bottom top", scrub: 0.6 } });
      });

      // Process: the rule fills with scroll and each step lights up as it is reached
      q("[data-line]").forEach((el) =>
        gsap.fromTo(el, { scaleX: 0 }, { scaleX: 1, ease: "none", transformOrigin: "left", scrollTrigger: { trigger: el.parentElement, start: "top 70%", end: "bottom 55%", scrub: true } }),
      );
      q("[data-step]").forEach((el) => ScrollTrigger.create({ trigger: el, start: "top 70%", toggleClass: { targets: el, className: "is-active" } }));

      const bar = document.querySelector<HTMLElement>("[data-progress]");
      if (bar) gsap.to(bar, { scaleX: 1, ease: "none", scrollTrigger: { start: 0, end: "max", scrub: 0.2 } });

      const handleAnchorClick = (e: MouseEvent) => {
        const link = (e.target as Element).closest<HTMLAnchorElement>('a[href^="#"]');
        if (!link || e.defaultPrevented || e.metaKey || e.ctrlKey) return;
        const id = link.getAttribute("href")!.slice(1);
        const target = id && id !== "top" ? document.getElementById(id) : null;
        if (id && id !== "top" && !target) return;
        e.preventDefault();
        debug("motion", `scroll to #${id || "top"}`);
        gsap.to(window, {
          scrollTo: { y: target ?? 0, offsetY: target ? NAV_OFFSET : 0, autoKill: true }, duration: 1.2, ease: "power3.inOut",
          onComplete: () => {
            history.replaceState(null, "", target ? `#${id}` : location.pathname);
            if (!target) return;
            target.setAttribute("tabindex", "-1");
            target.focus({ preventScroll: true });
          },
        });
      };
      document.addEventListener("click", handleAnchorClick);

      const refresh = () => ScrollTrigger.refresh();
      window.addEventListener("load", refresh);
      debug("motion", "shared motion ready");

      return () => {
        document.removeEventListener("click", handleAnchorClick);
        window.removeEventListener("load", refresh);
        root.classList.remove("motion");
      };
    });

    // Nav gets a solid backdrop after leaving the very top, with or without motion
    const nav = document.querySelector<HTMLElement>("[data-nav]");
    const handleScroll = () => nav?.toggleAttribute("data-solid", window.scrollY > 40);
    handleScroll();
    window.addEventListener("scroll", handleScroll, { passive: true });

    return () => {
      window.removeEventListener("scroll", handleScroll);
      mm.revert();
    };
  }, []);

  return null;
};

export default Motion;
