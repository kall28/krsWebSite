import type { Metadata, Viewport } from "next";
import { Instrument_Serif, Inter_Tight } from "next/font/google";
import { site } from "@/lib/content";
import "./globals.css";

const display = Instrument_Serif({ subsets: ["latin"], weight: "400", style: ["normal", "italic"], variable: "--font-display", display: "swap" });
const sans = Inter_Tight({ subsets: ["latin"], variable: "--font-sans", display: "swap" });

const description =
  "KRS Infoserve is a Mumbai digital studio building web applications, mobile apps, brand identities and online marketing for ambitious businesses.";

export const metadata: Metadata = {
  metadataBase: new URL(site.url),
  title: { default: "KRS Infoserve | Web, mobile & brand studio in Mumbai", template: "%s | KRS Infoserve" },
  description,
  alternates: { canonical: "/" },
  openGraph: { title: "KRS Infoserve", description, type: "website", siteName: site.name, locale: "en_IN", images: [{ url: "/work/cinepolis-home.jpg", width: 2880, height: 1484, alt: "Cinépolis Indonesia website by KRS Infoserve" }] },
  twitter: { card: "summary_large_image", title: "KRS Infoserve", description },
};

export const viewport: Viewport = { themeColor: "#070d24", width: "device-width", initialScale: 1 };

const jsonLd = {
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  name: site.name,
  url: site.url,
  email: site.email,
  telephone: site.phones[0],
  address: { "@type": "PostalAddress", streetAddress: "Ahish Complex, Dahisar (East)", addressLocality: "Mumbai", addressCountry: "IN" },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning className={`${display.variable} ${sans.variable}`}>
      <head>
        {/* Hide-then-reveal styles apply only when motion is allowed; avoids a flash and keeps no-JS / reduced-motion content visible */}
        <script dangerouslySetInnerHTML={{ __html: `if(!matchMedia('(prefers-reduced-motion: reduce)').matches)document.documentElement.classList.add('motion')` }} />
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      </head>
      <body>{children}</body>
    </html>
  );
}
