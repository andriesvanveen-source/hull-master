alter table public.boats
  add column if not exists completed_areas jsonb not null default '[]'::jsonb;

alter table public.defects
  add column if not exists callback_requested_at date;

comment on column public.boats.completed_areas is
  'Area names marked as audited for progress tracking. Existing boats remain incomplete until toggled.';

comment on column public.defects.callback_requested_at is
  'Date the commissioning engineer requested callback rectification and fresh sign-off.';
