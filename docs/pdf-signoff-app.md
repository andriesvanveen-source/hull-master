+# R&C Sign Off PDF Tool

Local-first Next.js application for adding the updated R&C sign-off table beside each defect photo in commissioning exception report PDFs.

## Stack

- Next.js 15 app router
- React 18
- Supabase metadata logging
- Server-side PDF processing using `pdf-lib`
- Vercel-ready project structure

## Local Setup

```bash
pnpm install
pnpm dev
```

Open `http://localhost:3000/pdf-signoff`, upload one or more PDF exception reports, enter an optional discipline, then download the updated PDFs. The same JavaScript processor runs locally and on Vercel; no Python runtime is required.

## Supabase

Run `supabase/pdf-signoff-schema.sql` in your Supabase SQL editor. Then set:

```bash
NEXT_PUBLIC_SUPABASE_URL=...
NEXT_PUBLIC_SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

The app only logs job metadata: file names, page counts, and table counts. Uploaded PDFs are processed locally by the server route and are not stored in Supabase.

## Vercel Notes

The PDF processor is implemented in `lib/pdfSignoffProcessor.js` and called by the Node.js route at `app/api/process/route.js`, so the repository is self-contained for Vercel deployment.
