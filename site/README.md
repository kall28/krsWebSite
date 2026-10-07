# KRS Infoserve site

Next.js (App Router) + TypeScript + Tailwind v4 + GSAP/ScrollTrigger.

    npm install
    npm run dev        # http://localhost:3000
    npm run build && npm start

Copy `.env.example` to `.env.local`:
- `CONTACT_WEBHOOK_URL` (server-only): any endpoint accepting a JSON POST. Without it the form says it is not switched on and offers a mailto fallback.
- `NEXT_PUBLIC_SITE_URL`: canonical URL for metadata.

Content lives in `src/lib/content.ts`; tokens in `src/app/globals.css` (`@theme`). Testimonials are labelled placeholders until real quotes are added.
