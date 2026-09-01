-- Run this before the B8/C2 stock-code import.
-- It combines the loose-items category names and prevents codes that differ
-- only by spaces, punctuation, or letter case from being stored twice.

do $$
declare
  canonical_id uuid := '10000000-0000-4000-8000-000000000004';
  duplicate_ids uuid[];
begin
  insert into public.stock_categories (id, name)
  values (canonical_id, '__stock_category_merge__')
  on conflict (id) do nothing;

  select array_agg(id)
    into duplicate_ids
  from public.stock_categories
  where id <> canonical_id
    and lower(regexp_replace(name, '\s+', ' ', 'g')) in (
      E'skipper''s pack',
      'loose items',
      E'loose items/skipper''s pack'
    );

  if duplicate_ids is not null then
    update public.stock_items
      set category_id = canonical_id
      where category_id = any(duplicate_ids);
    delete from public.stock_categories where id = any(duplicate_ids);
  end if;

  update public.stock_categories
    set name = E'Loose items/Skipper''s pack'
    where id = canonical_id;
end $$;

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
