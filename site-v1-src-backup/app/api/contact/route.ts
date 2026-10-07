import { NextResponse } from "next/server";
import { validateContact, type ContactInput } from "@/lib/validate";

// Delivery is deliberately provider-agnostic: set CONTACT_WEBHOOK_URL (server-only)
// to any endpoint that accepts a JSON POST (Slack/Zapier/Make/your own API).
// With no webhook configured we say so honestly instead of pretending to send.
export async function POST(req: Request) {
  let body: Partial<ContactInput> & { website?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "invalid_json" }, { status: 400 });
  }

  // Honeypot: bots fill the hidden field. Pretend success.
  if (body.website) return NextResponse.json({ ok: true });

  const input: ContactInput = {
    name: String(body.name ?? ""),
    email: String(body.email ?? ""),
    company: String(body.company ?? ""),
    budget: String(body.budget ?? ""),
    message: String(body.message ?? ""),
  };
  const errors = validateContact(input);
  if (Object.keys(errors).length) return NextResponse.json({ error: "validation", errors }, { status: 422 });

  const webhook = process.env.CONTACT_WEBHOOK_URL;
  if (!webhook) return NextResponse.json({ error: "not_configured" }, { status: 503 });

  try {
    const res = await fetch(webhook, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ ...input, source: "krsinfoserve.com", at: new Date().toISOString() }),
      signal: AbortSignal.timeout(8000),
    });
    if (!res.ok) throw new Error(String(res.status));
  } catch {
    return NextResponse.json({ error: "delivery_failed" }, { status: 502 });
  }
  return NextResponse.json({ ok: true });
}
