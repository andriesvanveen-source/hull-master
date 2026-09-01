create extension if not exists pgcrypto;

create table if not exists public.stock_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  created_at timestamptz not null default now()
);

create table if not exists public.stock_items (
  id uuid primary key default gen_random_uuid(),
  stock_code text not null,
  description text not null,
  search_terms text[] not null default '{}',
  category_id uuid not null references public.stock_categories(id),
  image_path text,
  image_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists stock_items_category_id_idx on public.stock_items(category_id);
create unique index if not exists stock_items_stock_code_normalized_uidx
  on public.stock_items ((regexp_replace(upper(stock_code), '[^A-Z0-9]', '', 'g')));

insert into public.stock_categories (id, name) values
  ('10000000-0000-4000-8000-000000000001', 'Electrical'),
  ('10000000-0000-4000-8000-000000000002', 'Plumbing'),
  ('10000000-0000-4000-8000-000000000003', 'Mechanical'),
  ('10000000-0000-4000-8000-000000000004', E'Loose items/Skipper''s pack'),
  ('10000000-0000-4000-8000-000000000005', 'Other')
on conflict (name) do nothing;

alter table public.stock_categories enable row level security;
alter table public.stock_items enable row level security;

drop policy if exists "stock categories public read" on public.stock_categories;
drop policy if exists "stock categories public insert" on public.stock_categories;
drop policy if exists "stock items public read" on public.stock_items;
drop policy if exists "stock items public insert" on public.stock_items;
drop policy if exists "stock items public update" on public.stock_items;
drop policy if exists "stock items public delete" on public.stock_items;

create policy "stock categories public read" on public.stock_categories for select to anon, authenticated using (true);
create policy "stock categories public insert" on public.stock_categories for insert to anon, authenticated with check (true);
create policy "stock items public read" on public.stock_items for select to anon, authenticated using (true);
create policy "stock items public insert" on public.stock_items for insert to anon, authenticated with check (true);
create policy "stock items public update" on public.stock_items for update to anon, authenticated using (true) with check (true);
create policy "stock items public delete" on public.stock_items for delete to anon, authenticated using (true);

insert into storage.buckets (id, name, public)
values ('stock-item-images', 'stock-item-images', true)
on conflict (id) do update set public = true;

drop policy if exists "stock item images public read" on storage.objects;
drop policy if exists "stock item images public insert" on storage.objects;
drop policy if exists "stock item images public update" on storage.objects;
drop policy if exists "stock item images public delete" on storage.objects;

create policy "stock item images public read" on storage.objects for select to anon, authenticated using (bucket_id = 'stock-item-images');
create policy "stock item images public insert" on storage.objects for insert to anon, authenticated with check (bucket_id = 'stock-item-images');
create policy "stock item images public update" on storage.objects for update to anon, authenticated using (bucket_id = 'stock-item-images') with check (bucket_id = 'stock-item-images');
create policy "stock item images public delete" on storage.objects for delete to anon, authenticated using (bucket_id = 'stock-item-images');
