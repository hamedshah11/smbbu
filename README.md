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

**The seed fallback is development-only.** In production (`NODE_ENV=production`, which includes `npm run build`), missing Supabase env vars throw at startup with a clear error rather than silently serving placeholder content — so a production build requires `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` to be set.

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

## Sustainable ops setup

Three pieces remove all manual DB/deploy steps:

1. **Claude Code environment** (for working sessions): allow `*.supabase.co`
   + `api.supabase.com` in the environment's network policy, and set
   `SUPABASE_DB_PASSWORD` + `SUPABASE_SERVICE_ROLE_KEY` as environment
   variables. Claude can then run `supabase db push` and
   `scripts/migrate/upload.mjs` directly.
2. **CI** (`.github/workflows/db-migrations.yml`): applies
   `supabase/migrations/**` automatically on push to main. Requires repo
   secrets `SUPABASE_ACCESS_TOKEN` and `SUPABASE_DB_PASSWORD`.
3. **Vercel**: auto-deploys the site on push; set the two
   `NEXT_PUBLIC_SUPABASE_*` env vars in the Vercel project.

Day-to-day content changes (notices, PDFs, faculty) belong in the /admin
panel (to be built), not in migrations. Bulk imports like
`scripts/migrate/` are one-time operations.
