export const site = {
  name: "KRS Infoserve",
  url: process.env.NEXT_PUBLIC_SITE_URL ?? "https://www.krsinfoserve.com",
  email: "info@krsinfoserve.com",
  phones: ["+91 72080 51453", "+91 86525 58889"],
  address: "Ahish Complex, Dahisar (East), Mumbai, India",
};

export const nav = [
  { href: "#services", label: "Services" },
  { href: "#work", label: "Work" },
  { href: "#process", label: "Process" },
  { href: "#trust", label: "Clients" },
];

export const services = [
  {
    title: "Web applications",
    benefit: "Ship a product your customers can use on day one, and that your team can keep extending without rewrites.",
    tags: ["ASP.NET", "Node", "React", "jQuery"],
  },
  {
    title: "Mobile apps",
    benefit: "Put your service in your customers' pockets, on Android, iOS or both from a single hybrid codebase.",
    tags: ["Android", "iOS", "Hybrid"],
  },
  {
    title: "Brand identity",
    benefit: "Look like the business you are becoming. Logos, print collateral and stationery that all say the same thing.",
    tags: ["Logo", "Print", "Stationery"],
  },
  {
    title: "Online marketing",
    benefit: "Be found in a crowded internet by the people who are already looking for what you offer.",
    tags: ["SEO", "Campaigns", "Social"],
  },
  {
    title: "Content management",
    benefit: "Update your site yourself, without calling a developer. We shape the CMS around how your team works.",
    tags: ["Custom CMS", "Admin tools"],
  },
];

export const projects = [
  {
    name: "Cinépolis Indonesia",
    kind: "Web booking & mobile app",
    line: "An end-to-end movie ticketing flow, from picking a show and seats to snacks and payment, built for high-volume booking days.",
    img: "/work/cinepolis-booking.jpg",
    alt: "Cinépolis Indonesia food and beverage selection step in the online booking flow",
    w: 2880,
    h: 1484,
  },
  {
    name: "Renepay",
    kind: "B2B procurement platform",
    line: "A cloud platform where companies and suppliers request, negotiate and pay for goods in one place.",
    img: "/work/renepay.jpg",
    alt: "Renepay marketing site showing the hero and how it works section",
    w: 1688,
    h: 1624,
    mockup: true,
  },
  {
    name: "Richfeel",
    kind: "Field-sales mobile app",
    line: "A day-to-day app for sales teams: targets, routes, retailer visits and expenses in one thumb-friendly screen.",
    img: "/work/richfeel-app.jpg",
    alt: "Richfeel sales app splash screen beside the home dashboard with targets and shortcuts",
    w: 1688,
    h: 1624,
    mockup: true,
  },
  {
    name: "Black Eagle Books",
    kind: "Online bookstore",
    line: "A warm, browsable bookshop with publishing and author sections for an independent Odia-language publisher.",
    img: "/work/black-eagle.jpg",
    alt: "Black Eagle Books home page with a library aisle hero image",
    w: 2838,
    h: 1500,
  },
];

export const steps = [
  { title: "Discover", text: "We start with your customers and your constraints: goals, audience, budget and what success looks like. You get a short, clear brief we both sign off." },
  { title: "Design", text: "Structure first, then look and feel. You review real screens and clickable flows early, when changes are cheap." },
  { title: "Build", text: "Pair-sized teams of developers and designers ship in short cycles. You see working software every week, not a reveal at the end." },
  { title: "Launch & support", text: "We handle release, then stay. We follow a client until they no longer need our help." },
];

export const clients = [
  "Cinépolis", "Carnival Cinemas", "Cinemax", "Ticketplease", "Richfeel",
  "Renepay", "Black Eagle Books", "Atul", "Boupon", "InfiAuction",
];

export const testimonials = [
  { quote: "Placeholder: a short quote about how the project was run and what changed for the business afterwards.", who: "Client name, role, company" },
  { quote: "Placeholder: a second quote, ideally about communication and delivery, from a different type of client.", who: "Client name, role, company" },
];
