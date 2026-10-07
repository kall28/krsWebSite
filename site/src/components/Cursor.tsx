"use client";

import { useEffect, useRef } from "react";
import gsap from "gsap";

/** Dot cursor that trails the pointer and swells over interactive elements. Fine pointers + motion allowed only. */
export default function Cursor() {
  const el = useRef<HTMLDivElement>(null);
  useEffect(() => {
    if (!matchMedia("(pointer: fine) and (prefers-reduced-motion: no-preference)").matches) return;
    const node = el.current!;
    document.documentElement.classList.add("cursor-on");
    node.style.opacity = "0";
    const x = gsap.quickTo(node, "x", { duration: 0.35, ease: "power3" });
    const y = gsap.quickTo(node, "y", { duration: 0.35, ease: "power3" });
    const move = (e: PointerEvent) => {
      node.style.opacity = "1"; x(e.clientX); y(e.clientY);
      node.classList.toggle("big", !!(e.target as Element).closest("a,button,[data-hover]"));
    };
    const leave = () => (node.style.opacity = "0");
    addEventListener("pointermove", move);
    document.addEventListener("pointerleave", leave);
    return () => { removeEventListener("pointermove", move); document.removeEventListener("pointerleave", leave); document.documentElement.classList.remove("cursor-on"); };
  }, []);
  return <div ref={el} className="cursor" aria-hidden="true" />;
}
