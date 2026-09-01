drop policy if exists "stock items public delete" on public.stock_items;
create policy "stock items public delete"
on public.stock_items for delete to anon, authenticated
using (true);

drop policy if exists "stock item images public delete" on storage.objects;
create policy "stock item images public delete"
on storage.objects for delete to anon, authenticated
using (bucket_id = 'stock-item-images');
