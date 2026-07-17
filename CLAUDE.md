# CLAUDE.md — SMBBMU Website Rebuild

Official website rebuild for Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, Sindh, Pakistan. Public university site: news, noticeboard (exam results, admissions, circulars, jobs, tenders), events, faculty, institutes, static content. Primary audience is students on mobile phones checking notices — speed and scannability beat decoration.

## Stack

- Next.js 15, App Router, TypeScript. **Every public page is server-rendered** (SSR or static + revalidation). No client-side data fetching on public pages.
- Tailwind CSS. All design tokens below are defined in the Tailwind config / CSS variables — never hardcode a hex in a component.
- Supabase: Postgres, Auth (admin only), Storage (buckets: `pdfs`, `images`).
- Deployed on Vercel.

## Non-negotiable conventions

1. **Read this file at the start of every session.**
2. Data access goes through typed functions in `/lib/queries.ts` only. Components never import the Supabase client directly.
3. Components live in `/components`, shadcn/ui as the base layer, styled to the tokens below.
4. Design references live in `/design-reference/` (approved HTML + PNG exports per template). Match them. **If a reference file and this document disagree, this document wins.**
5. Urdu/Sindhi text renders in `--font-sindhi` (Noto Nastaliq Urdu), `dir="rtl"`, never in the Latin fonts.
6. Every image has meaningful `alt` text. Notices link their PDFs with file size shown.
7. All dates display as `DD.MM` in mono within rows/feeds, and long-form ("11 July 2026") in detail pages.
8. Old-site URLs must keep working — redirects are defined in `next.config.ts` from the migration map. Never delete a redirect.
9. Commit after every completed page/feature with a descriptive message.
10. No new colors, fonts, sizes, or spacing values. If a design need isn't covered by the tokens, stop and flag it — don't invent.

## Page templates (the whole site is these 8)

| # | Template | Route(s) |
|---|---|---|
| 1 | Homepage | `/` |
| 2 | Noticeboard listing | `/noticeboard`, `/noticeboard/[category]` |
| 3 | Notice detail | `/noticeboard/[category]/[slug]` |
| 4 | Faculty directory | `/faculty`, `/faculty/[department]` |
| 5 | Institute profile | `/institutes/[slug]` |
| 6 | Generic content page | `/about/*`, `/administration/*`, `/qec`, `/dme`, `/policies/*`, etc. |
| 7 | Downloads | `/downloads` |
| 8 | Contact | `/contact` |

Admin panel: `/admin/*` route group, Supabase auth (email/password, no public signup), plain shadcn styling — the token system below applies to the public site only. Admin priority: a clerk posts a notice with a PDF in under one minute.

## Data model (summary)

`announcements` (title, slug, category enum [examination, admission, circular, job, tender, news, event], body, published_at, attachments jsonb) · `faculty` (name, designation, department, institute_id, photo_url) · `institutes` (name, slug, city, description, logo_url, is_constituent) · `pages` (slug, title, body) · `downloads` (title, file_url, category) · RLS: public read on published, writes require admin role.

---

# Design tokens — approved direction (source of truth)

## Colors

### Brand
| Token | Hex | Role |
|---|---|---|
| `green-primary` | `#256B2F` | Primary green — links, chips text, pills, nav accent, focus |
| `green-deep` | `#12251A` | Dark green — footer, VC message band |
| `green-soft` | `#7FB889` | Green on dark — footer column labels, kickers on `green-deep` |
| `gold-accent` | `#C9A24B` | Gold — VC name, portrait ring (`rgba(201,162,75,.5)`) |

### Backgrounds
| Token | Hex | Role |
|---|---|---|
| `bg-page` | `#FCFCFA` | Page / white sections |
| `bg-tint` | `#F4F6F1` | Tint band — noticeboard |
| `bg-tint-strong` | `#EFF3EC` | Tint band — institutes |
| `bg-chip` | `#E9F2EA` | Chip background on white sections |
| `bg-chip-on-tint` | `#E1EBE0` | Chip background on tint bands |
| `bg-hover-row` | `#EBEFE6` | Notice row hover (tint band) |
| `bg-hover-row-alt` | `#E9EFE4` | Institute row hover |
| `bg-pill-hover` | `#E9F2EA` | Outline pill hover fill |

### Text
| Token | Hex | Role |
|---|---|---|
| `text-primary` | `#15192B` | Headlines, notice titles, body emphasis |
| `text-secondary` | `#4A5068` | Standfirst, body copy |
| `text-muted` | `#6B7280` | Utility links, captions, cities |
| `text-faint` | `#9AA0AB` | Mono dates, meta rows |
| `text-on-dark` | `#F5F3EA` | Cream — headings/quotes on `green-deep` |
| `text-on-dark-soft` | `rgba(245,243,234,.75)` | Footer links |
| `text-on-dark-muted` | `rgba(245,243,234,.45)` | Copyright |
| `pdf-icon` | `#B03A2E` | PDF download affordance |

### Borders
| Token | Hex | Role |
|---|---|---|
| `hairline` | `#E8E9E4` | Dividers on white |
| `hairline-on-tint` | `#E2E5DD` | Dividers on `bg-tint` |
| `hairline-on-tint-strong` | `#DDE3D8` | Dividers on `bg-tint-strong` |
| `hairline-strong` | `#15192B` | 1px structural rules (nav bottom, feed header) |
| `hairline-on-dark` | `rgba(245,243,234,.15)` | Footer rules |

### Chips
All category chips share one treatment — text `green-primary`, bg `bg-chip` (`bg-chip-on-tint` on tint bands). Categories: `EXAMS`, `ADMISSIONS`, `CIRCULAR`, `JOBS`, `TENDER`.

### Links
Default `#256B2F` → hover `#15192B`. On dark: `rgba(245,243,234,.75)` → hover `#F5F3EA`.

## Typography

```css
--font-display: 'Archivo', 'Helvetica Neue', Arial, sans-serif;      /* display + UI + body */
--font-serif:   'Source Serif 4', Georgia, 'Times New Roman', serif; /* VC quote only */
--font-mono:    'JetBrains Mono', ui-monospace, 'SF Mono', Menlo, monospace; /* dates, kickers, meta */
--font-sindhi:  'Noto Nastaliq Urdu', serif;                         /* bilingual name, RTL */
```

### Scale (1rem = 16px)
| Style | Family | Size | Weight | LH | Tracking |
|---|---|---|---|---|---|
| Display headline (desktop) | display | 3.25rem | 800 | 1.05 | -0.02em |
| Display headline (mobile) | display | 1.9375rem | 800 | 1.1 | -0.015em |
| Section heading (desktop) | display | 1.875rem | 800 | 1.05 | -0.025em |
| Section heading (mobile) | display | 1.625rem | 800 | 1.05 | -0.025em |
| VC quote (desktop) | serif | 1.875rem | 500 | 1.35 | -0.005em |
| VC quote (mobile) | serif | 1.25rem | 500 | 1.45 | 0 |
| Standfirst | display | 1rem | 400 | 1.6 | 0 |
| Body | display | 0.84375rem | 400 | 1.6 | 0 |
| Notice row title | display | 0.875rem | 600 | 1.35 | 0 |
| Card headline | display | 1.1875rem | 700 | 1.25 | -0.015em |
| Mono date | mono | 0.6875rem | 500 | 1 | 0 |
| Mono kicker/meta | mono | 0.59–0.625rem | 500 | 1 | +0.08–0.12em |
| Chip label | display | 0.5625rem | 600–700 | 1 | +0.09–0.12em |
| Nav item | display | 0.71875rem | 600 (active 700) | 1 | +0.07em |
| Pill button | display | 0.78125rem | 700 | 1 | 0 |

**Display tracking rule: never tighter than -0.02em at weight 800** (corrected from -0.035em, which merged words).

## Spacing & layout

- Base unit 4px. Max content width **1200px** centered; gutters 40px desktop / 20px mobile.
- 12-column grid. Hero split `1fr / 500px`, photo bleeds to page edge. Noticeboard `3 / 9`. Institutes 2-col, `gap: 0 56px`.
- Section padding: desktop 44–64px top / 48–68px bottom; mobile 26–36px / 30–40px.
- Heading → content gap 20–28px. Card/column gap 40px. Footer: 4 columns, gap 40px, 56px top padding.

## Components

**Chip** — padding 5px 9px (mobile 4px 8px), radius 100px; text 9px/600/+0.09em `green-primary`; bg per band.

**Pill quick-link** — Primary (Fee Payment, Results): bg `green-primary`, text `#FCFCFA`, 12px 22px (mobile 12px 18px), radius 100px, hover bg `#15192B`. Secondary (Downloads, Financial Aid, Alumni): transparent, 1.5px solid `green-primary`, 11px 22px, hover `bg-pill-hover`. Strip sits directly under hero, gap 12px (mobile 8px, scrollable).

**Notice row** — desktop grid `64px date / 110px chip / 1fr title / 56px PDF`, gap 16px, padding 13px 8px, 1px `hairline-on-tint` divider. Mobile flex, date col 38px, padding 13px 0. Hover `bg-hover-row`, transition .15s. NEW badge: `● NEW` 8.5px/700/+0.1em `green-primary`.

**Duotone photo treatment** — applies **only** to faculty headshots and small institute/thumbnail images. The homepage hero and news/event story images render in **full colour** (no grayscale, no overlays). There is no `screen` hero overlay anymore, since the hero is no longer duotone.
```css
/* duotone (faculty headshots, institute + news thumbnails) */
img { filter: grayscale(1) contrast(1.06); }
/* overlay 1 */ background: linear-gradient(160deg, rgba(18,37,26,.55), rgba(37,107,47,.35)); mix-blend-mode: multiply;
/* thumbnails: overlay 1 at .5/.3 alpha */
/* full colour (homepage hero, news/event story images): no filter, no overlay */
```

## Section bands & rhythm (homepage, top → bottom)

1. Utility bar — white, hairline bottom
2. Header + nav — white, `hairline-strong` nav rule
3. Hero — white, split, photo bleeds right
4. Quick-links pill strip — white, hairlines top+bottom
5. Noticeboard — tint `#F4F6F1`
6. News & Events — white
7. VC message — deep green `#12251A`
8. Institutes — tint `#EFF3EC`
9. Footer — deep green `#12251A`

**Rule: no two adjacent sections share a background. Pages open light and close dark.** Inner pages follow the same rhythm principle with their own band orders per the design references.
