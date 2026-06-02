-- Allow all Hull Master boat models: B5, B8, B9, C1, C2, C5.
-- Run this once in Supabase SQL Editor after the original schema.

alter table public.boats
drop constraint if exists boats_name_format;

alter table public.boats
add constraint boats_name_format
check (name ~ '^(B5|B8|B9|C1|C2|C5)[0-9]{3}$');
