-- Keep a private rolling archive of the three most recently deleted boats.
-- The snapshot is captured before the defects are removed by ON DELETE CASCADE.

create table if not exists public.deleted_boat_backups (
  id bigint generated always as identity primary key,
  original_boat_id uuid not null,
  boat_name text not null,
  deleted_at timestamptz not null default now(),
  boat_data jsonb not null,
  defects_data jsonb not null default '[]'::jsonb
);

create index if not exists deleted_boat_backups_deleted_at_idx
  on public.deleted_boat_backups (deleted_at desc, id desc);

comment on table public.deleted_boat_backups is
  'Private rolling snapshots of the three most recently deleted boats and their defects.';

alter table public.deleted_boat_backups enable row level security;
revoke all on public.deleted_boat_backups from anon, authenticated;

create or replace function public.backup_boat_before_delete()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.deleted_boat_backups (
    original_boat_id,
    boat_name,
    boat_data,
    defects_data
  )
  values (
    old.id,
    old.name,
    to_jsonb(old),
    coalesce(
      (
        select jsonb_agg(to_jsonb(defect_row) order by defect_row.created_at, defect_row.id)
        from public.defects as defect_row
        where defect_row.boat_id = old.id
      ),
      '[]'::jsonb
    )
  );

  delete from public.deleted_boat_backups
  where id not in (
    select backup.id
    from public.deleted_boat_backups as backup
    order by backup.deleted_at desc, backup.id desc
    limit 3
  );

  return old;
end;
$$;

revoke all on function public.backup_boat_before_delete() from public;

drop trigger if exists backup_boat_before_delete on public.boats;
create trigger backup_boat_before_delete
before delete on public.boats
for each row
execute function public.backup_boat_before_delete();

create or replace function public.restore_deleted_boat_backup(backup_id bigint)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  backup_record public.deleted_boat_backups%rowtype;
  restored_boat_id uuid;
begin
  select *
  into backup_record
  from public.deleted_boat_backups
  where id = backup_id;

  if not found then
    raise exception 'Deleted boat backup % was not found', backup_id;
  end if;

  restored_boat_id := (backup_record.boat_data ->> 'id')::uuid;

  if exists (
    select 1
    from public.boats
    where id = restored_boat_id
       or name = backup_record.boat_data ->> 'name'
  ) then
    raise exception 'Boat % already exists and was not overwritten', backup_record.boat_name;
  end if;

  insert into public.boats (
    id,
    name,
    commissioning_engineer,
    areas,
    completed_areas,
    created_at,
    updated_at
  )
  values (
    restored_boat_id,
    backup_record.boat_data ->> 'name',
    coalesce(backup_record.boat_data ->> 'commissioning_engineer', ''),
    backup_record.boat_data -> 'areas',
    coalesce(backup_record.boat_data -> 'completed_areas', '[]'::jsonb),
    (backup_record.boat_data ->> 'created_at')::timestamptz,
    (backup_record.boat_data ->> 'updated_at')::timestamptz
  );

  insert into public.defects (
    id,
    boat_id,
    text,
    discipline,
    area,
    callback_requested_at,
    created_at,
    updated_at
  )
  select
    defect.id,
    restored_boat_id,
    defect.text,
    defect.discipline,
    defect.area,
    defect.callback_requested_at,
    defect.created_at,
    defect.updated_at
  from jsonb_to_recordset(backup_record.defects_data) as defect (
    id uuid,
    boat_id uuid,
    text text,
    discipline text,
    area text,
    callback_requested_at date,
    created_at timestamptz,
    updated_at timestamptz
  );

  return restored_boat_id;
end;
$$;

revoke all on function public.restore_deleted_boat_backup(bigint) from public, anon, authenticated;

comment on function public.restore_deleted_boat_backup(bigint) is
  'Restores one archived boat and all of its defects. Run only from the Supabase SQL editor.';
