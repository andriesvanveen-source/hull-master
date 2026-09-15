-- Ensure Harbour Audit Buddy can store the additional dropdown areas.
-- Area names are supplied by the application and need no destructive data migration.
begin;

alter table public.harbour_audit_defects
add column if not exists area_name text not null default 'General';

update public.harbour_audit_defects
set area_name = 'General'
where area_name is null or btrim(area_name) = '';

commit;
