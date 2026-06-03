create table if not exists public.common_defects (
  id bigserial primary key,
  area text not null,
  text text not null,
  discipline text not null default '',
  occurrence_count integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (area, text, discipline)
);

create index if not exists common_defects_area_count_idx
  on public.common_defects (area, occurrence_count desc, text);
