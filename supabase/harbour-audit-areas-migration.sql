-- Add shared defect areas to Harbour Audit Buddy.
-- Non-destructive: existing defects are retained and assigned to General.
begin;

alter table public.harbour_audit_defects
add column if not exists area_name text not null default 'General';

commit;
