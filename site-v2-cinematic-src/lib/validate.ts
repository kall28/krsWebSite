export type ContactInput = {
  name: string;
  email: string;
  company: string;
  budget: string;
  message: string;
};
export type ContactErrors = Partial<Record<keyof ContactInput, string>>;

export const budgets = ["Not sure yet", "Under ₹2 lakh", "₹2–5 lakh", "₹5–15 lakh", "₹15 lakh+"];

const EMAIL = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;

export function validateContact(v: ContactInput): ContactErrors {
  const e: ContactErrors = {};
  const name = v.name.trim();
  if (name.length < 2) e.name = "Please tell us your name.";
  else if (name.length > 100) e.name = "That name is too long.";
  if (!EMAIL.test(v.email.trim()) || v.email.length > 200) e.email = "Enter a valid email address.";
  if (v.company.length > 120) e.company = "Keep this under 120 characters.";
  if (v.budget && !budgets.includes(v.budget)) e.budget = "Choose one of the options.";
  const msg = v.message.trim();
  if (msg.length < 10) e.message = "Tell us a little more (at least 10 characters).";
  else if (msg.length > 3000) e.message = "Please keep it under 3000 characters.";
  return e;
}
