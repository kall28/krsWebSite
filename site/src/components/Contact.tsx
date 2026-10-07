"use client";

import { useRef, useState } from "react";
import Heading from "./Heading";
import { SubmitButton } from "./Button";
import { site } from "@/lib/content";
import { debug } from "@/lib/debug";
import { budgets, validateContact, type ContactErrors, type ContactInput } from "@/lib/validate";

type Status = { kind: "idle" } | { kind: "sending" } | { kind: "ok" } | { kind: "error"; message: string; mailto?: boolean };

const field =
  "mt-1 block w-full rounded-none border-0 border-b border-line bg-transparent px-0 py-3 text-lg text-fg placeholder:text-muted/60 transition-colors focus:border-cyan focus:outline-none focus-visible:outline-none aria-[invalid=true]:border-red-400";

export default function Contact() {
  const form = useRef<HTMLFormElement>(null);
  const [errors, setErrors] = useState<ContactErrors>({});
  const [status, setStatus] = useState<Status>({ kind: "idle" });

  const read = (): ContactInput & { website: string } => {
    const d = new FormData(form.current!);
    const g = (k: string) => String(d.get(k) ?? "");
    return { name: g("name"), email: g("email"), company: g("company"), budget: g("budget"), message: g("message"), website: g("website") };
  };

  const onBlur = (k: keyof ContactInput) => {
    const e = validateContact(read());
    setErrors((prev) => ({ ...prev, [k]: e[k] }));
  };

  async function onSubmit(ev: React.FormEvent) {
    ev.preventDefault();
    const values = read();
    const e = validateContact(values);
    setErrors(e);
    const firstBad = Object.keys(e).find((k) => e[k as keyof ContactErrors]);
    if (firstBad) { debug("contact", "client validation failed", Object.keys(e)); form.current?.querySelector<HTMLElement>(`[name="${firstBad}"]`)?.focus(); return; }

    setStatus({ kind: "sending" });
    try {
      const res = await fetch("/api/contact", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(values) });
      const data = await res.json().catch(() => ({}));
      debug("contact", `submit -> ${res.status}`, data);
      if (res.ok) { setStatus({ kind: "ok" }); form.current?.reset(); return; }
      if (res.status === 422 && data.errors) { setErrors(data.errors); setStatus({ kind: "idle" }); return; }
      setStatus({
        kind: "error", mailto: true,
        message: data.error === "not_configured"
          ? "Our online form isn't switched on yet."
          : "Something went wrong sending your message.",
      });
    } catch (error) {
      debug("contact", "network error", error);
      setStatus({ kind: "error", mailto: true, message: "We couldn't reach the server. Check your connection." });
    }
  }

  const mailto = () => {
    const v = read();
    const body = `${v.message}\n\n${v.name}${v.company ? `, ${v.company}` : ""}${v.budget ? `\nBudget: ${v.budget}` : ""}`;
    return `mailto:${site.email}?subject=${encodeURIComponent("Project enquiry")}&body=${encodeURIComponent(body)}`;
  };

  // Space is always reserved so validating on blur never shifts the layout mid-click
  const err = (k: keyof ContactInput) => (
    <p id={`${k}-err`} className="mt-2 min-h-5 text-sm font-medium text-red-300">{errors[k]}</p>
  );
  const a11y = (k: keyof ContactInput) => ({ "aria-invalid": !!errors[k], "aria-describedby": errors[k] ? `${k}-err` : undefined, onBlur: () => onBlur(k) });

  return (
    <section id="contact" className="relative overflow-hidden bg-bg py-28 md:py-40">
      <div aria-hidden="true" className="hero-gradient pointer-events-none absolute inset-0 opacity-70" />
      <div className="relative mx-auto max-w-[90rem] px-5 md:px-10">
        <div className="flex items-center gap-4 border-t border-line pt-5" data-fade>
          <span className="eyebrow text-fg">05</span>
          <span className="eyebrow">Say hello</span>
        </div>
        <Heading text={"Have an idea?\n_Let’s make it real._"} className="mt-12 text-[length:var(--text-mega)] !leading-[0.92] md:mt-16" />

        <div className="mt-20 grid gap-16 md:mt-28 lg:grid-cols-12 lg:gap-8">
          <div className="lg:col-span-4">
            <p className="max-w-sm text-lg text-muted" data-fade>
              Tell us what you’re working on. We’ll reply within two working days with questions, a rough approach and next steps.
            </p>
            <dl className="mt-12 space-y-8" data-fade>
              <div><dt className="eyebrow">Email</dt><dd className="mt-2"><a href={`mailto:${site.email}`} className="link-u display text-3xl text-cyan md:text-4xl">{site.email}</a></dd></div>
              <div><dt className="eyebrow">Call</dt><dd className="mt-2 flex flex-wrap gap-x-6">{site.phones.map((p) => <a key={p} href={`tel:${p.replace(/\s/g, "")}`} className="link-u text-lg">{p}</a>)}</dd></div>
              <div><dt className="eyebrow">Studio</dt><dd className="mt-2 text-lg">{site.address}</dd></div>
            </dl>
          </div>

        <form ref={form} onSubmit={onSubmit} noValidate className="lg:col-span-7 lg:col-start-6" data-fade aria-label="Project enquiry form">
          <div className="grid gap-x-10 gap-y-4 sm:grid-cols-2">
            <div>
              <label htmlFor="name" className="eyebrow">Name</label>
              <input id="name" name="name" autoComplete="name" required placeholder="Your name" className={field} {...a11y("name")} />
              {err("name")}
            </div>
            <div>
              <label htmlFor="email" className="eyebrow">Email</label>
              <input id="email" name="email" type="email" autoComplete="email" required placeholder="you@company.com" className={field} {...a11y("email")} />
              {err("email")}
            </div>
            <div>
              <label htmlFor="company" className="eyebrow">Company <span className="normal-case tracking-normal opacity-70">(optional)</span></label>
              <input id="company" name="company" autoComplete="organization" placeholder="Company" className={field} {...a11y("company")} />
              {err("company")}
            </div>
            <div>
              <label htmlFor="budget" className="eyebrow">Budget <span className="normal-case tracking-normal opacity-70">(optional)</span></label>
              <select id="budget" name="budget" defaultValue="" className={field} {...a11y("budget")}>
                <option value="">Select a range</option>
                {budgets.map((b) => <option key={b}>{b}</option>)}
              </select>
              {err("budget")}
            </div>
            <div className="sm:col-span-2">
              <label htmlFor="message" className="eyebrow">Project</label>
              <textarea id="message" name="message" rows={4} required placeholder="What are you building, and what does success look like?" className={`${field} resize-y`} {...a11y("message")} />
              {err("message")}
            </div>
            {/* Honeypot: hidden from people and assistive tech */}
            <div aria-hidden="true" className="absolute -left-[9999px]"><label>Website<input name="website" tabIndex={-1} autoComplete="off" /></label></div>
          </div>

          <div className="mt-10 flex flex-wrap items-center gap-5">
            <SubmitButton disabled={status.kind === "sending"}>{status.kind === "sending" ? "Sending…" : "Send message"}</SubmitButton>
            <p role="status" aria-live="polite" className="max-w-sm text-sm font-medium">
              {status.kind === "ok" && "Thanks, your message is on its way. We’ll be in touch soon."}
              {status.kind === "error" && (
                <>
                  {status.message}{" "}
                  {status.mailto && <a href={mailto()} className="underline underline-offset-4">Email us instead</a>}
                </>
              )}
              {Object.values(errors).some(Boolean) && status.kind === "idle" && "Please fix the highlighted fields."}
            </p>
          </div>
        </form>
        </div>
      </div>
    </section>
  );
}
