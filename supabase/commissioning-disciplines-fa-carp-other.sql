begin;

-- Preserve every existing FA and CARP record while allowing the combined
-- discipline and the new OTHER option for future edits and defects.
alter table public.defects
  drop constraint if exists defects_discipline_allowed;

alter table public.defects
  add constraint defects_discipline_allowed check (
    discipline is null
    or discipline in ('PLUM', 'ELEC', 'MECH', 'FA', 'CARP', 'FA/CARP', 'DECK', 'FIN', 'OTHER')
  );

alter table public.common_defects
  drop constraint if exists common_defects_discipline_allowed;

alter table public.common_defects
  add constraint common_defects_discipline_allowed check (
    discipline is null
    or discipline in ('PLUM', 'ELEC', 'MECH', 'FA', 'CARP', 'FA/CARP', 'DECK', 'FIN', 'OTHER')
  );

commit;
