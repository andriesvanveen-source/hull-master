+create table if not exists public.pdf_signoff_jobs (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  discipline text,
  file_count integer not null default 0,
  total_tables integer not null default 0,
  status text not null default 'completed'
);

create table if not exists public.pdf_signoff_job_files (
  id uuid primary key default gen_random_uuid(),
  job_id uuid not null references public.pdf_signoff_jobs(id) on delete cascade,
  created_at timestamptz not null default now(),
  source_file_name text not null,
  output_file_name text not null,
  page_count integer not null default 0,
  table_count integer not null default 0
);

alter table public.pdf_signoff_jobs enable row level security;
alter table public.pdf_signoff_job_files enable row level security;

create policy "Allow anon job inserts"
on public.pdf_signoff_jobs
for insert
to anon
with check (true);

create policy "Allow anon job file inserts"
on public.pdf_signoff_job_files
for insert
to anon
with check (true);

create policy "Allow anon job reads"
on public.pdf_signoff_jobs
for select
to anon
using (true);

create policy "Allow anon job file reads"
on public.pdf_signoff_job_files
for select
to anon
using (true);

