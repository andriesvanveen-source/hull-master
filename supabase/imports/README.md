# Stock Codes repeated-orders import

Run these files in the Supabase SQL editor in this order:

1. `../migrations/20260901_add_stock_item_order_priority.sql`
2. `20260901_selected_originators_repeated_orders.sql`

The migration adds the hidden `order_count` field and database-level duplicate-code protection. It deliberately stops if duplicate normalized codes already exist, so it does not delete existing records automatically.

The import contains 661 complete, unique stock-code records across nine categories. Existing matching codes are updated; new codes are inserted. The application uses `order_count` only for result ordering and never displays it.
