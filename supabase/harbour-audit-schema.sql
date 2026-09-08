-- Shared Harbour Audit Buddy storage.
-- This script is non-destructive: it creates missing objects and never drops audit data.

create table if not exists public.harbour_audits (
  id text primary key,
  title text not null check (length(btrim(title)) > 0),
  auditor text not null default '',
  created_label text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.harbour_audit_defects (
  id text primary key,
  audit_id text not null references public.harbour_audits(id) on delete cascade,
  description text not null check (length(btrim(description)) > 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.harbour_audit_photos (
  id text primary key,
  defect_id text not null references public.harbour_audit_defects(id) on delete cascade,
  file_name text not null default 'Audit photo.jpg',
  image_path text not null unique,
  created_at timestamptz not null default now()
);

create index if not exists harbour_audits_updated_at_idx on public.harbour_audits(updated_at desc);
create index if not exists harbour_audit_defects_audit_id_idx on public.harbour_audit_defects(audit_id);
create index if not exists harbour_audit_photos_defect_id_idx on public.harbour_audit_photos(defect_id);

create or replace function public.set_harbour_audit_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_harbour_audits_updated_at on public.harbour_audits;
create trigger set_harbour_audits_updated_at
before update on public.harbour_audits
for each row execute function public.set_harbour_audit_updated_at();

drop trigger if exists set_harbour_audit_defects_updated_at on public.harbour_audit_defects;
create trigger set_harbour_audit_defects_updated_at
before update on public.harbour_audit_defects
for each row execute function public.set_harbour_audit_updated_at();

alter table public.harbour_audits enable row level security;
alter table public.harbour_audit_defects enable row level security;
alter table public.harbour_audit_photos enable row level security;

drop policy if exists "harbour audits shared access" on public.harbour_audits;
drop policy if exists "harbour audit defects shared access" on public.harbour_audit_defects;
drop policy if exists "harbour audit photos shared access" on public.harbour_audit_photos;
create policy "harbour audits shared access" on public.harbour_audits for all to anon, authenticated using (true) with check (true);
create policy "harbour audit defects shared access" on public.harbour_audit_defects for all to anon, authenticated using (true) with check (true);
create policy "harbour audit photos shared access" on public.harbour_audit_photos for all to anon, authenticated using (true) with check (true);

grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on public.harbour_audits to anon, authenticated;
grant select, insert, update, delete on public.harbour_audit_defects to anon, authenticated;
grant select, insert, update, delete on public.harbour_audit_photos to anon, authenticated;

insert into storage.buckets (id, name, public)
values ('harbour-audit-photos', 'harbour-audit-photos', true)
on conflict (id) do update set public = true;

drop policy if exists "harbour audit images shared read" on storage.objects;
drop policy if exists "harbour audit images shared insert" on storage.objects;
drop policy if exists "harbour audit images shared update" on storage.objects;
drop policy if exists "harbour audit images shared delete" on storage.objects;
create policy "harbour audit images shared read" on storage.objects for select to anon, authenticated using (bucket_id = 'harbour-audit-photos');
create policy "harbour audit images shared insert" on storage.objects for insert to anon, authenticated with check (bucket_id = 'harbour-audit-photos');
create policy "harbour audit images shared update" on storage.objects for update to anon, authenticated using (bucket_id = 'harbour-audit-photos') with check (bucket_id = 'harbour-audit-photos');
create policy "harbour audit images shared delete" on storage.objects for delete to anon, authenticated using (bucket_id = 'harbour-audit-photos');

alter table public.harbour_audits replica identity full;
alter table public.harbour_audit_defects replica identity full;
alter table public.harbour_audit_photos replica identity full;

do $$
begin
  alter publication supabase_realtime add table public.harbour_audits;
exception when duplicate_object then null;
end $$;
do $$
begin
  alter publication supabase_realtime add table public.harbour_audit_defects;
exception when duplicate_object then null;
end $$;
do $$
begin
  alter publication supabase_realtime add table public.harbour_audit_photos;
exception when duplicate_object then null;
end $$;
