-- Prevent a stale offline device from recreating a deliberately deleted audit.
-- This is non-destructive and preserves all existing active audit data.
begin;

alter table public.harbour_audits
add column if not exists deleted_at timestamptz;

create index if not exists harbour_audits_deleted_at_idx
on public.harbour_audits (deleted_at)
where deleted_at is not null;

commit;
