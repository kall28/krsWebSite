"use client";

import { useRef, useState } from "react";
import Heading from "./Heading";
import { LinkButton, SubmitButton } from "./Button";
import { site } from "@/lib/content";
import { budgets, validateContact, type ContactErrors, type ContactInput } from "@/lib/validate";

type Status = { kind: "idle" } | { kind: "sending" } | { kind: "ok" } | { kind: "error"; message: string; mailto?: boolean };

const field =
  "mt-2 block w-full border-0 border-b border-line bg-transparent px-4 py-3 text-base text-fg placeholder:text-muted/70 transition-colors focus:border-brass focus:outline-none aria-[invalid=true]:border-red-400";

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
    if (firstBad) { form.current?.querySelector<HTMLElement>(`[name="${firstBad}"]`)?.focus(); return; }

    setStatus({ kind: "sending" });
    try {
      const res = await fetch("/api/contact", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(values) });
      const data = await res.json().catch(() => ({}));
      if (res.ok) { setStatus({ kind: "ok" }); form.current?.reset(); return; }
      if (res.status === 422 && data.errors) { setErrors(data.errors); setStatus({ kind: "idle" }); return; }
      setStatus({
        kind: "error", mailto: true,
        message: data.error === "not_configured"
          ? "Our online form isn't switched on yet."
          : "Something went wrong sending your message.",
      });
    } catch {
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
    <p id={`${k}-err`} className="mt-2 min-h-5 text-sm font-medium">{errors[k]}</p>
  );
  const a11y = (k: keyof ContactInput) => ({ "aria-invalid": !!errors[k], "aria-describedby": errors[k] ? `${k}-err` : undefined, onBlur: () => onBlur(k) });

  return (
    <section id="contact" data-section className="relative overflow-hidden border-t border-line py-28 md:py-44">
      <div className="relative mx-auto max-w-[96rem] px-5 md:px-10">
        <p className="eyebrow mb-8" data-fade>Begin</p>
        <Heading text="Let’s make something _worth keeping._" className="max-w-6xl text-[clamp(3.4rem,10.5vw,11rem)]" />
        <div className="mt-12 flex flex-wrap items-center gap-4" data-fade>
          <LinkButton href={`mailto:${site.email}?subject=Project%20enquiry`} magnetic>Start a project</LinkButton>
          <LinkButton href="#form" variant="ghost">Write to us below</LinkButton>
        </div>
      </div>
      <div id="form" className="relative mx-auto mt-24 grid max-w-[96rem] gap-14 px-5 md:mt-36 md:px-10 lg:grid-cols-12">
        <div className="lg:col-span-5">
          <p className="max-w-md text-lg text-muted" data-fade>
            Tell us what you’re working on. We’ll reply within two working days with questions, a rough approach and next steps.
          </p>
          <dl className="mt-10 space-y-5" data-fade>
            <div><dt className="eyebrow">Email</dt><dd><a href={`mailto:${site.email}`} className="link-u font-display text-3xl italic text-brass md:text-4xl">{site.email}</a></dd></div>
            <div><dt className="eyebrow">Call</dt><dd className="flex flex-wrap gap-x-6">{site.phones.map((p) => <a key={p} href={`tel:${p.replace(/\s/g, "")}`} className="link-u text-lg">{p}</a>)}</dd></div>
            <div><dt className="eyebrow">Studio</dt><dd className="text-lg">{site.address}</dd></div>
          </dl>
        </div>

        <form ref={form} onSubmit={onSubmit} noValidate className="border border-line bg-surface p-6 md:p-10 lg:col-span-7" data-fade aria-label="Project enquiry form">
          <div className="grid gap-x-8 gap-y-2 sm:grid-cols-2">
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
    </section>
  );
}
