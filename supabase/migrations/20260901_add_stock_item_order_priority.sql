-- Adds the hidden ranking weight used by Stock Codes search results.
alter table public.stock_items
  add column if not exists order_count integer not null default 0 check (order_count >= 0);

-- Prevent codes that differ only by spaces, punctuation, or letter case.
do $$
begin
  if exists (
    select 1
    from public.stock_items
    group by regexp_replace(upper(stock_code), '[^A-Z0-9]', '', 'g')
    having count(*) > 1
  ) then
    raise exception 'Existing duplicate stock codes must be merged before the unique index can be created.';
  end if;
end $$;

drop index if exists public.stock_items_stock_code_idx;
create unique index if not exists stock_items_stock_code_normalized_uidx
  on public.stock_items ((regexp_replace(upper(stock_code), '[^A-Z0-9]', '', 'g')));
