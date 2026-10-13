begin;

-- Preserve every existing record, including rows that contain older discipline
-- labels. NOT VALID still enforces this list for every new or updated row.
alter table public.defects
  drop constraint if exists defects_discipline_allowed;

alter table public.defects
  add constraint defects_discipline_allowed check (
    discipline is null
    or discipline in ('PLUM', 'ELEC', 'MECH', 'FA', 'CARP', 'FA/CARP', 'DECK', 'FIN', 'OTHER')
  ) not valid;

alter table public.common_defects
  drop constraint if exists common_defects_discipline_allowed;

alter table public.common_defects
  add constraint common_defects_discipline_allowed check (
    discipline is null
    or discipline in ('PLUM', 'ELEC', 'MECH', 'FA', 'CARP', 'FA/CARP', 'DECK', 'FIN', 'OTHER')
  ) not valid;

commit;
