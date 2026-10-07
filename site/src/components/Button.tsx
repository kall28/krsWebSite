import type { ReactNode } from "react";

const styles = {
  primary: "bg-fg text-on-fg hover:bg-cyan hover:text-ink",
  ghost: "border border-line text-fg hover:border-fg/60 hover:bg-fg/5",
} as const;

type Common = { variant?: keyof typeof styles; children: ReactNode; className?: string };

const base =
  "group inline-flex min-h-12 items-center justify-center gap-3 rounded-full px-7 text-[0.95rem] font-medium transition-colors duration-300 disabled:cursor-not-allowed disabled:opacity-60";

const Arrow = () => (
  <svg aria-hidden="true" width="16" height="16" viewBox="0 0 16 16" fill="none" className="transition-transform duration-300 group-hover:translate-x-1">
    <path d="M1 8h13M9 3l5 5-5 5" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

export const LinkButton = ({ href, variant = "primary", children, className = "" }: Common & { href: string }) => (
  <a href={href} className={`${base} ${styles[variant]} ${className}`}>{children}<Arrow /></a>
);

export const SubmitButton = ({ variant = "primary", children, className = "", disabled }: Common & { disabled?: boolean }) => (
  <button type="submit" disabled={disabled} className={`${base} ${styles[variant]} ${className}`}>{children}<Arrow /></button>
);
