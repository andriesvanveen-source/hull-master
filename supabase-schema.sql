-- Hull Master shared Supabase schema
-- Run this in Supabase SQL Editor for project:
-- https://zlbzipopreklfnmaczbu.supabase.co

create extension if not exists pgcrypto;

create table if not exists public.boats (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint boats_name_format check (name ~ '^C[0-9]{3,5}$'),
  constraint boats_name_unique unique (name)
);

create table if not exists public.defects (
  id uuid primary key default gen_random_uuid(),
  boat_id uuid not null references public.boats(id) on delete cascade,
  text text not null,
  discipline text,
  area text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint defects_text_not_blank check (length(btrim(text)) > 0),
  constraint defects_discipline_allowed check (
    discipline is null
    or discipline in ('PLUM', 'ELEC', 'MECH', 'FA', 'DECK', 'CARP')
  ),
  constraint defects_area_allowed check (
    area in (
      'Saloon',
      'Aft Cockpit',
      'Fwd Cockpit Lounge & Deck',
      'Stbd Engine',
      'Port Engine',
      'Stbd Fwd Cabin & Heads',
      'Stbd Mid Cabin & Heads',
      'Stbd Aft Cabin & Heads',
      'Port Fwd Cabin & Heads',
      'Port Mid Cabin & Heads',
      'Port Aft Cabin & Heads',
      'Crew Cabin'
    )
  )
);

create table if not exists public.common_defects (
  id uuid primary key default gen_random_uuid(),
  text text not null,
  discipline text,
  created_at timestamptz not null default now(),
  constraint common_defects_text_unique unique (text),
  constraint common_defects_text_not_blank check (length(btrim(text)) > 0),
  constraint common_defects_discipline_allowed check (
    discipline is null
    or discipline in ('PLUM', 'ELEC', 'MECH', 'FA', 'DECK', 'CARP')
  )
);

create index if not exists defects_boat_id_created_at_idx
  on public.defects (boat_id, created_at);

create index if not exists defects_boat_id_area_created_at_idx
  on public.defects (boat_id, area, created_at);

create index if not exists boats_updated_at_idx
  on public.boats (updated_at desc);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create or replace function public.normalize_boat()
returns trigger
language plpgsql
as $$
begin
  new.name = upper(btrim(new.name));
  return new;
end;
$$;

create or replace function public.normalize_defect()
returns trigger
language plpgsql
as $$
begin
  new.text = btrim(new.text);
  new.discipline = nullif(btrim(new.discipline), '');
  return new;
end;
$$;

create or replace function public.normalize_common_defect()
returns trigger
language plpgsql
as $$
begin
  new.text = btrim(new.text);
  new.discipline = nullif(btrim(new.discipline), '');
  return new;
end;
$$;

drop trigger if exists set_boats_updated_at on public.boats;
create trigger set_boats_updated_at
before update on public.boats
for each row
execute function public.set_updated_at();

drop trigger if exists normalize_boat_before_write on public.boats;
create trigger normalize_boat_before_write
before insert or update on public.boats
for each row
execute function public.normalize_boat();

drop trigger if exists set_defects_updated_at on public.defects;
create trigger set_defects_updated_at
before update on public.defects
for each row
execute function public.set_updated_at();

drop trigger if exists normalize_defect_before_write on public.defects;
create trigger normalize_defect_before_write
before insert or update on public.defects
for each row
execute function public.normalize_defect();

drop trigger if exists normalize_common_defect_before_write on public.common_defects;
create trigger normalize_common_defect_before_write
before insert or update on public.common_defects
for each row
execute function public.normalize_common_defect();

create or replace function public.touch_boat_from_defect()
returns trigger
language plpgsql
as $$
begin
  if tg_op = 'DELETE' then
    update public.boats set updated_at = now() where id = old.boat_id;
    return old;
  end if;

  update public.boats set updated_at = now() where id = new.boat_id;
  return new;
end;
$$;

drop trigger if exists touch_boat_after_defect_change on public.defects;
create trigger touch_boat_after_defect_change
after insert or update or delete on public.defects
for each row
execute function public.touch_boat_from_defect();

alter table public.boats enable row level security;
alter table public.defects enable row level security;
alter table public.common_defects enable row level security;

drop policy if exists "Shared app users can read boats" on public.boats;
create policy "Shared app users can read boats"
on public.boats for select
to anon, authenticated
using (true);

drop policy if exists "Shared app users can create boats" on public.boats;
create policy "Shared app users can create boats"
on public.boats for insert
to anon, authenticated
with check (true);

drop policy if exists "Shared app users can update boats" on public.boats;
create policy "Shared app users can update boats"
on public.boats for update
to anon, authenticated
using (true)
with check (true);

drop policy if exists "Shared app users can delete boats" on public.boats;
create policy "Shared app users can delete boats"
on public.boats for delete
to anon, authenticated
using (true);

drop policy if exists "Shared app users can read defects" on public.defects;
create policy "Shared app users can read defects"
on public.defects for select
to anon, authenticated
using (true);

drop policy if exists "Shared app users can create defects" on public.defects;
create policy "Shared app users can create defects"
on public.defects for insert
to anon, authenticated
with check (true);

drop policy if exists "Shared app users can update defects" on public.defects;
create policy "Shared app users can update defects"
on public.defects for update
to anon, authenticated
using (true)
with check (true);

drop policy if exists "Shared app users can delete defects" on public.defects;
create policy "Shared app users can delete defects"
on public.defects for delete
to anon, authenticated
using (true);

drop policy if exists "Shared app users can read common defects" on public.common_defects;
create policy "Shared app users can read common defects"
on public.common_defects for select
to anon, authenticated
using (true);

drop policy if exists "Shared app users can manage common defects" on public.common_defects;
create policy "Shared app users can manage common defects"
on public.common_defects for all
to authenticated
using (true)
with check (true);

grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on public.boats to anon, authenticated;
grant select, insert, update, delete on public.defects to anon, authenticated;
grant select on public.common_defects to anon, authenticated;
grant insert, update, delete on public.common_defects to authenticated;

do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'boats'
  ) then
    alter publication supabase_realtime add table public.boats;
  end if;

  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'defects'
  ) then
    alter publication supabase_realtime add table public.defects;
  end if;
end;
$$;
