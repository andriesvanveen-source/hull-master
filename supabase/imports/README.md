# B8/C2 stock-code import

Run these files in the Supabase SQL editor in this order:

1. `../migrations/20260901_enforce_unique_stock_codes.sql`
2. `20260901_b8_c2_stock_codes.sql`

The first script combines the loose-items category names and installs the database-level duplicate-code rule. It deliberately stops if the database already contains duplicate normalized stock codes, so no existing item is deleted automatically.

The import contains 442 complete, unique records from both workbook sheets and the C2 Consumables document. Re-running it is safe: stock codes already present are skipped, and matching loose-item records are assigned to `Loose items/Skipper's pack`.
