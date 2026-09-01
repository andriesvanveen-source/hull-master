# Hull Master

Hull Master is a single Next.js application containing four independent tools:

- `/commissioning` — commissioning defect log and PDF/Excel exports
- `/pdf-signoff` — R&C sign-off table PDF processor
- `/harbour-audit` — harbour audit and photo report tool
- `/stock-codes` — local-first stock-code catalogue with Supabase photo storage

## Requirements

- Node.js 20.9 or newer
- pnpm 11

## Local setup

```bash
pnpm install --frozen-lockfile
pnpm dev
```

Copy `.env.example` to `.env.local` and supply the configured Supabase values. Never commit `.env.local` or service-role credentials.

```text
NEXT_PUBLIC_SUPABASE_URL=...
NEXT_PUBLIC_SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

`SUPABASE_SERVICE_ROLE_KEY` is optional and is used only for PDF job metadata logging. PDF files are processed in memory and are not stored in Supabase.

## Supabase setup

Run these scripts in the Supabase SQL Editor as required:

1. `supabase-schema.sql` — commissioning base tables and policies
2. Files in `supabase/migrations/` in date order — commissioning additions
3. `supabase/pdf-signoff-schema.sql` — optional PDF job logging
4. `supabase/stock-codes-schema.sql` — stock items, categories, access policies, and image bucket

The Harbour Audit tool stores its working data and photos locally in the browser. Stock Codes saves locally first and then synchronizes its records and images to Supabase.

## Verification

```bash
pnpm lint
pnpm build
pnpm audit --prod
```

## Vercel

Import this repository as a Next.js project, configure the environment variables above, and deploy the `main` branch. Vercel needs no separate Python service or external build script.

The web-app manifest and all required runtime images and lookup data are checked into `public/`.
