alter table public.defects
  drop constraint if exists defects_area_allowed;

alter table public.defects
  drop constraint if exists defects_area_not_blank;

update public.defects
set area = btrim(area)
where area <> btrim(area);

alter table public.defects
  add constraint defects_area_not_blank check (length(btrim(area)) > 0);
