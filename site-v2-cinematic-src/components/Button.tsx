import type { ReactNode } from "react";

const styles = {
  primary: "bg-fg text-bg hover:bg-brass",
  ghost: "border border-line text-fg hover:border-brass hover:text-brass",
} as const;

type Common = { magnetic?: boolean; variant?: keyof typeof styles; children: ReactNode; className?: string };

const base =
  "group inline-flex min-h-12 items-center justify-center gap-3 rounded-full px-8 text-[0.8rem] font-medium uppercase tracking-[0.16em] transition-colors duration-500 disabled:opacity-60 disabled:cursor-not-allowed";

const Arrow = () => (
  <svg aria-hidden="true" width="16" height="16" viewBox="0 0 16 16" fill="none" className="transition-transform duration-500 group-hover:translate-x-1">
    <path d="M1 8h13M9 3l5 5-5 5" stroke="currentColor" strokeWidth="1.4" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

export function LinkButton({ href, variant = "primary", children, className = "", magnetic }: Common & { href: string }) {
  return <a href={href} data-magnetic={magnetic ? "" : undefined} className={`${base} ${styles[variant]} ${className}`}>{children}<Arrow /></a>;
}

export function SubmitButton({ variant = "primary", children, className = "", disabled }: Common & { disabled?: boolean }) {
  return <button type="submit" disabled={disabled} className={`${base} ${styles[variant]} ${className}`}>{children}<Arrow /></button>;
}
