alter table public.boats
  add column if not exists commissioning_engineer text not null default 'Andries Van Veen';

update public.boats
set commissioning_engineer = 'Andries Van Veen'
where commissioning_engineer is null
  or btrim(commissioning_engineer) = '';
