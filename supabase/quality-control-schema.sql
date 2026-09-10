-- Shared Quality Control storage. Non-destructive: no tables or audit data are dropped.

create table if not exists public.quality_control_boats (
  id text primary key,
  name text not null unique check (length(btrim(name)) > 0),
  model text not null check (model in ('B5', 'B8', 'B9', 'C1', 'C2', 'C5')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.quality_control_areas (
  boat_id text not null references public.quality_control_boats(id) on delete cascade,
  area_name text not null check (length(btrim(area_name)) > 0),
  inspector text not null default '',
  sort_order integer not null default 0,
  updated_at timestamptz not null default now(),
  primary key (boat_id, area_name)
);

create table if not exists public.quality_control_defects (
  id text primary key,
  boat_id text not null references public.quality_control_boats(id) on delete cascade,
  area_name text not null check (length(btrim(area_name)) > 0),
  item text not null check (length(btrim(item)) > 0),
  failure_mode text not null check (length(btrim(failure_mode)) > 0),
  description text not null check (length(btrim(description)) > 0),
  code smallint check (code between 1 and 10),
  discipline text not null default '',
  concern boolean not null default false,
  repaired_by text not null default '',
  repaired_date text not null default '',
  team_leader_check text not null default '',
  qc_rwk text not null default '',
  qc_acc text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.quality_control_defects add column if not exists repaired_by text not null default '';
alter table public.quality_control_defects add column if not exists repaired_date text not null default '';
alter table public.quality_control_defects add column if not exists team_leader_check text not null default '';
alter table public.quality_control_defects add column if not exists qc_rwk text not null default '';
alter table public.quality_control_defects add column if not exists qc_acc text not null default '';

create index if not exists quality_control_boats_model_idx on public.quality_control_boats(model, name);
create index if not exists quality_control_areas_boat_idx on public.quality_control_areas(boat_id, sort_order);
create index if not exists quality_control_defects_boat_idx on public.quality_control_defects(boat_id);
create index if not exists quality_control_defects_area_idx on public.quality_control_defects(boat_id, area_name);

create or replace function public.set_quality_control_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end;
$$;

drop trigger if exists set_quality_control_boats_updated_at on public.quality_control_boats;
create trigger set_quality_control_boats_updated_at before update on public.quality_control_boats
for each row execute function public.set_quality_control_updated_at();
drop trigger if exists set_quality_control_areas_updated_at on public.quality_control_areas;
create trigger set_quality_control_areas_updated_at before update on public.quality_control_areas
for each row execute function public.set_quality_control_updated_at();
drop trigger if exists set_quality_control_defects_updated_at on public.quality_control_defects;
create trigger set_quality_control_defects_updated_at before update on public.quality_control_defects
for each row execute function public.set_quality_control_updated_at();

create or replace function public.touch_quality_control_boat()
returns trigger language plpgsql as $$
declare target_boat_id text;
begin
  if tg_op = 'DELETE' then target_boat_id := old.boat_id; else target_boat_id := new.boat_id; end if;
  update public.quality_control_boats set updated_at = now() where id = target_boat_id;
  if tg_op = 'DELETE' then return old; else return new; end if;
end;
$$;
drop trigger if exists touch_quality_control_boat_from_area on public.quality_control_areas;
create trigger touch_quality_control_boat_from_area after insert or update or delete on public.quality_control_areas
for each row execute function public.touch_quality_control_boat();
drop trigger if exists touch_quality_control_boat_from_defect on public.quality_control_defects;
create trigger touch_quality_control_boat_from_defect after insert or update or delete on public.quality_control_defects
for each row execute function public.touch_quality_control_boat();

alter table public.quality_control_boats enable row level security;
alter table public.quality_control_areas enable row level security;
alter table public.quality_control_defects enable row level security;
drop policy if exists "quality control boats shared access" on public.quality_control_boats;
drop policy if exists "quality control areas shared access" on public.quality_control_areas;
drop policy if exists "quality control defects shared access" on public.quality_control_defects;
create policy "quality control boats shared access" on public.quality_control_boats for all to anon, authenticated using (true) with check (true);
create policy "quality control areas shared access" on public.quality_control_areas for all to anon, authenticated using (true) with check (true);
create policy "quality control defects shared access" on public.quality_control_defects for all to anon, authenticated using (true) with check (true);

grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on public.quality_control_boats to anon, authenticated;
grant select, insert, update, delete on public.quality_control_areas to anon, authenticated;
grant select, insert, update, delete on public.quality_control_defects to anon, authenticated;

alter table public.quality_control_boats replica identity full;
alter table public.quality_control_areas replica identity full;
alter table public.quality_control_defects replica identity full;
do $$ begin alter publication supabase_realtime add table public.quality_control_boats; exception when duplicate_object then null; end $$;
do $$ begin alter publication supabase_realtime add table public.quality_control_areas; exception when duplicate_object then null; end $$;
do $$ begin alter publication supabase_realtime add table public.quality_control_defects; exception when duplicate_object then null; end $$;

insert into public.quality_control_boats (id, name, model) values
  ('qc-reference-b5152','B5152','B5'), ('qc-reference-b5153','B5153','B5'),
  ('qc-reference-b5154','B5154','B5'), ('qc-reference-b5155','B5155','B5'),
  ('qc-reference-b5156','B5156','B5'), ('qc-reference-b8126','B8126','B8'),
  ('qc-reference-b8127','B8127','B8'), ('qc-reference-b8128','B8128','B8'),
  ('qc-reference-b8129','B8129','B8'), ('qc-reference-b8130','B8130','B8'),
  ('qc-reference-b9074','B9074','B9'), ('qc-reference-b9075','B9075','B9'),
  ('qc-reference-b9076','B9076','B9'), ('qc-reference-b9077','B9077','B9'),
  ('qc-reference-b9078','B9078','B9'), ('qc-reference-c1071','C1071','C1'),
  ('qc-reference-c1073','C1073','C1'), ('qc-reference-c1074','C1074','C1'),
  ('qc-reference-c1075','C1075','C1'), ('qc-reference-c1076','C1076','C1'),
  ('qc-reference-c2022','C2022','C2'), ('qc-reference-c2023','C2023','C2'),
  ('qc-reference-c2024','C2024','C2'), ('qc-reference-c2025','C2025','C2'),
  ('qc-reference-c2026','C2026','C2'), ('qc-reference-c5001','C5001','C5'),
  ('qc-reference-c5002','C5002','C5'), ('qc-reference-c5003','C5003','C5'),
  ('qc-reference-c5004','C5004','C5'), ('qc-reference-c5005','C5005','C5')
on conflict (id) do update set name = excluded.name, model = excluded.model;
