alter table public.boats
  add column if not exists areas jsonb;

comment on column public.boats.areas is 'Optional saved display order for commissioning audit areas. Null keeps existing boats on the legacy area list; new boats created by the app save the current default area list.';
