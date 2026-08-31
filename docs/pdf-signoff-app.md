+# R&C Sign Off PDF Tool

Local-first Next.js application for adding the updated R&C sign-off table beside each defect photo in commissioning exception report PDFs.

## Stack

- Next.js 14 app router
- React 18
- Supabase metadata logging
- Python PDF worker using `pypdf` and `reportlab`
- Vercel-ready project structure

## Local Setup

```bash
pnpm install
pnpm dev
```

Open `http://localhost:3000`, upload one or more PDF exception reports, enter an optional discipline, then download the updated PDFs.

The local PDF worker uses:

```text
C:\Users\andvee\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe
```

Override it in `.env.local` if needed:

```bash
PDF_PROCESSOR_PYTHON=C:\Path\To\python.exe
```

## Supabase

Run `supabase/schema.sql` in your Supabase SQL editor. Then set:

```bash
NEXT_PUBLIC_SUPABASE_URL=...
NEXT_PUBLIC_SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

The app only logs job metadata: file names, page counts, and table counts. Uploaded PDFs are processed locally by the server route and are not stored in Supabase.

## Vercel Notes

The current local build uses a Python worker launched from the Next.js API route. For Vercel deployment, the same logic can be moved to a Python serverless function or a separate worker endpoint, then called from the Next app. Supabase is already isolated behind environment variables and the schema in `supabase/schema.sql`.

