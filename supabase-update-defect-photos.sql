-- One-photo defect attachments for Hull Master.
-- Run this once in Supabase SQL Editor.

alter table public.defects
add column if not exists photo_url text;

insert into storage.buckets (
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
)
values (
  'defect-photos',
  'defect-photos',
  true,
  10485760,
  array[
    'image/jpeg',
    'image/png',
    'image/webp',
    'image/heic',
    'image/heif'
  ]
)
on conflict (id) do update
set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

drop policy if exists "Shared app users can read defect photos" on storage.objects;
create policy "Shared app users can read defect photos"
on storage.objects for select
to anon, authenticated
using (bucket_id = 'defect-photos');

drop policy if exists "Shared app users can upload defect photos" on storage.objects;
create policy "Shared app users can upload defect photos"
on storage.objects for insert
to anon, authenticated
with check (bucket_id = 'defect-photos');

drop policy if exists "Shared app users can replace defect photos" on storage.objects;
create policy "Shared app users can replace defect photos"
on storage.objects for update
to anon, authenticated
using (bucket_id = 'defect-photos')
with check (bucket_id = 'defect-photos');

drop policy if exists "Shared app users can delete defect photos" on storage.objects;
create policy "Shared app users can delete defect photos"
on storage.objects for delete
to anon, authenticated
using (bucket_id = 'defect-photos');
