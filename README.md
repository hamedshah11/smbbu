# SMBBMU Website Rebuild

Official website rebuild for Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana. Next.js 15 App Router, TypeScript, Tailwind CSS, Supabase.

See `CLAUDE.md` for the full design system and conventions.

## Getting started

```bash
npm install
npm run dev
```

Open [http://localhost:3210](http://localhost:3210) (or the port Next.js prints).

Without Supabase credentials configured, the site runs on the local seed data in `lib/seed-data.ts` (same content as `supabase/migrations/0002_seed.sql`), so every template is viewable out of the box.

## Connecting Supabase

1. Create a Supabase project.
2. Run the SQL in `supabase/migrations/0001_init.sql` then `supabase/migrations/0002_seed.sql` against it (via the SQL editor or `supabase db push`).
3. Create Storage buckets `pdfs` and `images`.
4. Copy `.env.local.example` to `.env.local` and fill in `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY`.
5. Restart the dev server — `lib/queries.ts` automatically switches from seed data to live Supabase queries once those env vars are present.

## Data access

All data access goes through typed functions in `lib/queries.ts`. Components never import the Supabase client directly (see `lib/supabase.ts`).

## Old-site redirects

`next.config.ts` has an `oldSiteRedirects` array wired up but empty — no migration map of old-site URLs has been provided yet. Add entries there once available; per CLAUDE.md, redirects are never deleted once added.

## Admin panel

Not yet built. `CLAUDE.md` specifies `/admin/*` as a separate route group with Supabase auth and plain shadcn styling (the public design tokens don't apply there).
