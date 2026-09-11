-- Quality Control audit import for B9 boats.
-- Renames existing reference audits to _QC3 and adds _HO_Audit boats.
-- Idempotent and non-destructive: existing defects are not overwritten.
begin;
update public.quality_control_boats set name='B9078_QC3' where id='qc-reference-b9078';
update public.quality_control_boats set name='B9077_QC3' where id='qc-reference-b9077';
update public.quality_control_boats set name='B9076_QC3' where id='qc-reference-b9076';
update public.quality_control_boats set name='B9075_QC3' where id='qc-reference-b9075';
update public.quality_control_boats set name='B9074_QC3' where id='qc-reference-b9074';
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b9074','B9074_HO_Audit','B9') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Owner''S Heads',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Study',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Stbd Aft Cabin',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Aft Cockpit',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Fwd Cockpit & Foredeck',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Flybridge',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Stbd Hull',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Port Fwd Cabin',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Port Fwd Heads',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Port Passage',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Port Deck',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Stb Deck',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9074','Saloon',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b9074-r5','qc-handover-b9074','Owner''S Heads','Ceiling','Sealer','Yellow sealer as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r6','qc-handover-b9074','Owner''S Heads','Waste tank','Damage','Visible holes ontop inside locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r7','qc-handover-b9074','Owner''S Heads','Floor','Cleaning','Stains in tracking',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r16','qc-handover-b9074','Study','LED Courtesy lights at stairways','Proud/Alignment','Proud courtesy light cover',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r17','qc-handover-b9074','Study','Vinyl ceiling','Proud/Alignment','Visible wires above hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r18','qc-handover-b9074','Study','Frame','Damage','Poor spray on capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b9074-r19','qc-handover-b9074','Study','Staircase','Cleaning','Stains in tracking',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r20','qc-handover-b9074','Study','Vents','Cleaning','Clean vent',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r23','qc-handover-b9074','Stbd Aft Cabin','Vinyl ceiling','Damage','Cuts on vinyl ceiling',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r24','qc-handover-b9074','Stbd Aft Cabin','Vinyl ceiling','Proud/Alignment','Stepping ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r25','qc-handover-b9074','Stbd Aft Cabin','Inspection lids','Damage','Over drilled toggle holes',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r26','qc-handover-b9074','Stbd Aft Cabin','Aft area','Cleaning','Clean as marked',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r27','qc-handover-b9074','Stbd Aft Cabin','Ceiling Liner','Scratches','Buff entire liners',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r46','qc-handover-b9074','Aft Cockpit','Table','Repairs','Dent on table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r47','qc-handover-b9074','Aft Cockpit','Locker lids','Operational','Stb engine room lid chaffing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r48','qc-handover-b9074','Aft Cockpit','Locker lids','Scratches','Scratches on stb engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r49','qc-handover-b9074','Aft Cockpit','Folding swimming ladder c/w teak steps','Damage','Rust on nuts and check operation',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r50','qc-handover-b9074','Aft Cockpit','Ceiling','Repairs','Poor repair at davit motor',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r51','qc-handover-b9074','Aft Cockpit','Lockers','Loose','Loose hinges on chubby locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r55','qc-handover-b9074','Fwd Cockpit & Foredeck','Fwd cockpit door','Sealer','Neaten sealer at fwd door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r56','qc-handover-b9074','Fwd Cockpit & Foredeck','Locker lids','Damage','Chip at stb locker hinge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r57','qc-handover-b9074','Fwd Cockpit & Foredeck','Locker lids','Loose','Loose rubber on stb lid',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r58','qc-handover-b9074','Fwd Cockpit & Foredeck','Guard wires across bow and stern','Damage','Rust on fwd rail',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r62','qc-handover-b9074','Flybridge','Helmstation steps','Scratches','Scratches on flybridge steps',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r63','qc-handover-b9074','Flybridge','Lockers','Loose','Loose hinges and proud on life raft locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r64','qc-handover-b9074','Flybridge','Helmstation','Voids','Bubble on grey GRP top surface + scratches',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r65','qc-handover-b9074','Flybridge','Table','Sealer','Seal table base below table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r66','qc-handover-b9074','Flybridge','Table','Repairs','Repairs + scratches around table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r67','qc-handover-b9074','Flybridge','PERSPEX','Damage','Scratches on perspex check all',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9074-r68','qc-handover-b9074','Flybridge','Midship area','Cracks','Crack outboard of port fwd settee',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r69','qc-handover-b9074','Flybridge','BBQ','Damage','Scratches on entire corian',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9074-r70','qc-handover-b9074','Flybridge','Deck flange','Repairs','Repairs and scratches around entire corian coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r71','qc-handover-b9074','Flybridge','Ceiling','Proud/Alignment','Visible wires at ceiling',7,'Electrical',false,'','','','',''),
  ('qc-handover-b9074-r83','qc-handover-b9074','Stbd Hull','Aft area','Scratches','Dull on entire aft section',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r84','qc-handover-b9074','Stbd Hull','Aft area','Pinholes','Pinholes above aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r85','qc-handover-b9074','Stbd Hull','Midship area','Scratches','Scratches entire midship section',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r86','qc-handover-b9074','Stbd Hull','Fwd area','Scratches','Scratches entire fwd section',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r124','qc-handover-b9074','Port Fwd Cabin','Fwd area','Damage','Chip on fore peak bow thruster insp lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r125','qc-handover-b9074','Port Fwd Cabin','window surround','Cracks','Crack at bottom aft on hull window surround + dull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r126','qc-handover-b9074','Port Fwd Cabin','Cabin Door','Cleaning','Remove plastic from cabin door mirrow',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r127','qc-handover-b9074','Port Fwd Cabin','Hanging locker','Missing part','Fit insp panel inside hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r128','qc-handover-b9074','Port Fwd Cabin','Cabin Door','Loose','Cabin door handle loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r129','qc-handover-b9074','Port Fwd Cabin','Gas detectors in each hull connected to alarm in saloon','Cleaning','Residue on carbon alarm',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r135','qc-handover-b9074','Port Fwd Heads','Under-basin locker with toilet roll holder','Proud/Alignment','Adjust center basin locker door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r136','qc-handover-b9074','Port Fwd Heads','window surround','Scratches','Scratches on window surround at bottom fwd corner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r137','qc-handover-b9074','Port Fwd Heads','Ceiling','Cleaning','Koki marks on ceiling above waste tank locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r158','qc-handover-b9074','Port Passage','Magazine locker/shelf locker','Loose','Re-fit insp panel inside shelf locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r159','qc-handover-b9074','Port Passage','Magazine locker/shelf locker','Cleaning','Clean inside shelf locker insp',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r160','qc-handover-b9074','Port Passage','Staircase','Scratches','Scratches on stairway botton GRP',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r168','qc-handover-b9074','Port Fwd Cabin','Floor insp','Loose','Wire loose on fuel tank in floor insp',7,'Electrical',false,'','','','',''),
  ('qc-handover-b9074-r169','qc-handover-b9074','Port Fwd Cabin','Window surrounds','Repairs','Poor repair at bottom fwd hull side surrounds + sctatches at aft corner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r170','qc-handover-b9074','Port Fwd Cabin','Ceiling Liner','Scratches','Buff entire inboard ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r171','qc-handover-b9074','Port Fwd Cabin','Window surrounds','Scratches','Scratches on at cabin window surrounds at bottom inboard of outboard window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r172','qc-handover-b9074','Port Fwd Cabin','Inspection lids','Damage','Damage & chip visible on inboard insp lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r173','qc-handover-b9074','Port Fwd Cabin','2 x LED reading lamps over bunk','Loose','Aft outboard reading light loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r194','qc-handover-b9074','Port Deck','Targawing','Sealer','Neaten sealer in recess above targa wing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r195','qc-handover-b9074','Port Deck','Decklid','Scratches','Buffing compound + dull on decklid, Buff entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r196','qc-handover-b9074','Port Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Excess sika on top stantion gate palican hook',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r197','qc-handover-b9074','Port Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','Bottle screw nut loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r198','qc-handover-b9074','Port Deck','Fuel tank','Cleaning','Clean all deck valve caps',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r199','qc-handover-b9074','Port Deck','Flush Hatch over cabins','Scratches','Scratches + residue on fwd deck hatch',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9074-r200','qc-handover-b9074','Port Deck','Deck flange','Scratches','Scratches by fwd pulpit seat stantion base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r201','qc-handover-b9074','Port Deck','Bows','Scratches','Scratches & dull on bow GRP',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r202','qc-handover-b9074','Port Deck','Bows','Sealer','Sealer touch up on fwd biw deck joint',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r208','qc-handover-b9074','Stb Deck','Decklid','Scratches','Buffing compound + dull on decklid, Buff entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r209','qc-handover-b9074','Stb Deck','Floor','Spills','Primer spill on deck by fwd side window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r210','qc-handover-b9074','Stb Deck','Fuel tank','Cleaning','Clean all deck valve caps',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r211','qc-handover-b9074','Stb Deck','Flush Hatch over cabins','Scratches','Scratches + residue on fwd deck hatch',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9074-r212','qc-handover-b9074','Stb Deck','Bows','Repairs','Bow GRP wavey',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r223','qc-handover-b9074','Saloon','Large bowl s/s sink','Scratches','Scratches on sink',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r224','qc-handover-b9074','Saloon','Vinyl ceiling','Cleaning','Spills and stains on vinyl panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9074-r225','qc-handover-b9074','Saloon','Formica Bulkheads','Damage','Deep scratch on Formica stbd side below window',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9074-r226','qc-handover-b9074','Saloon','Fwd area','Scratches','Scratches below morse control',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r227','qc-handover-b9074','Saloon','Galley lockers','Spills','Spills and stains below port speakers',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9074-r228','qc-handover-b9074','Saloon','Windows','Damage','Primer damaged on window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9074-r229','qc-handover-b9074','Saloon','Companion door','Damage','Paint damaged on door frame',9,'Spray Painting',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b9075','B9075_HO_Audit','B9') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Saloon',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Aftcockpit',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Stbd Fwd Heads',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Study',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Stbd Aft Cabin',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Port Fwd Cabin',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Port Heads',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Port Aft Cabin',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Fwd Cockpit & Foredeck',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Stbd Side Deck',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9075','Port Side Deck',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b9075-r5','qc-handover-b9075','Saloon','Fwd cockpit door','Cleaning','Clean around fwd cockpit door surrounds',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r6','qc-handover-b9075','Saloon','window surround','Scratches','Scratches at top of stb fwd window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r7','qc-handover-b9075','Saloon','window surround','Cleaning','Clean at bottom of stb fwd window mullion',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r8','qc-handover-b9075','Saloon','window surround','Scratches','Scratches at bottom of port window surronnd',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r9','qc-handover-b9075','Saloon','Ceiling Liner','Scratches','Scratches on ceiling liner recess (X2)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r10','qc-handover-b9075','Saloon','Vinyl ceiling','Cleaning','Clean all vinyl ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r11','qc-handover-b9075','Saloon','AC Outlets','Damage','Clip broken on cover below TV locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r12','qc-handover-b9075','Saloon','Draw locker','Cleaning','Stains on edging at top of 2nd draw front',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r13','qc-handover-b9075','Saloon','Galley lockers','Spills','Spill inside galley sink',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r14','qc-handover-b9075','Saloon','corian','Scratches','Scratches on outboard on galley corian',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9075-r38','qc-handover-b9075','Aftcockpit','Companion door','Cleaning','Clean port and stb sides of CWD',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r39','qc-handover-b9075','Aftcockpit','Table','Scratches','Scratches on aft cockpit table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r40','qc-handover-b9075','Aftcockpit','Targawing','Scratches','Dull around stb targa wind hand rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r41','qc-handover-b9075','Aftcockpit','Transom','Spills','Gelcoat spill at bottom outboard of Stb transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r42','qc-handover-b9075','Aftcockpit','Transom','Cracks','Crack in tracking at bottom outboard of Stb transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r43','qc-handover-b9075','Aftcockpit','Aft area','Spills','Spills on aft bridge deck flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r44','qc-handover-b9075','Aftcockpit','Aft area','Missing part','Cable tie missing on ceiling shacle',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9075-r45','qc-handover-b9075','Aftcockpit','Decklid','Scratches','Buff entire aft deck lid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r46','qc-handover-b9075','Aftcockpit','Vinyl ceiling','Cleaning','Clean all vinyl ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r47','qc-handover-b9075','Aftcockpit','side deck step','Spills','Spills on tracking by port side deck step tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r48','qc-handover-b9075','Aftcockpit','Floating step','Cleaning','Remove green sticker from port floating step',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r49','qc-handover-b9075','Aftcockpit','Decklid','Scratches','Scuff marks at aft of aft mooring cleat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r50','qc-handover-b9075','Aftcockpit','Fuel deck fillers','Cleaning','Clean all deck valve caps (Port & Stb )',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r51','qc-handover-b9075','Aftcockpit','Folding swimming ladder c/w teak steps','Cleaning','Tape residue on bottom of swim ladder',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r52','qc-handover-b9075','Aftcockpit','Transom shower (cold only)','Proud/Alignment','Screw proud on transom shower frame',5,'Plumbing',false,'','','','',''),
  ('qc-handover-b9075-r76','qc-handover-b9075','Stbd Fwd Heads','Double towel rail','Loose','Loose rails at bases',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r77','qc-handover-b9075','Stbd Fwd Heads','Dividers','Loose','Loose shower divider',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r78','qc-handover-b9075','Stbd Fwd Heads','Under-basin locker with toilet roll holder','Proud/Alignment','Proud hinges',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r79','qc-handover-b9075','Stbd Fwd Heads','Fwd area','Cleaning','Clean spills as marked + stain on blind',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r80','qc-handover-b9075','Stbd Fwd Heads','Sliding or hinged heads door','Loose','Loose door lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r85','qc-handover-b9075','Study','Draw locker','Defect','Outboard drawer chaffing on shoe locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r86','qc-handover-b9075','Study','Sliding entrance door with lock','Loose','Loose bird catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r87','qc-handover-b9075','Study','Vanity table/desk with storage locker and mirror under lid','Loose','Desk rattling when engine is idling',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r88','qc-handover-b9075','Study','Vanity table/desk with storage locker and mirror under lid','Proud/Alignment','Visible wires at study desk',7,'Electrical',false,'','','','',''),
  ('qc-handover-b9075-r89','qc-handover-b9075','Study','Frame','Damage','Dents on capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b9075-r96','qc-handover-b9075','Stbd Aft Cabin','window surround','Scratches','Scratches on all window surrounds',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9075-r97','qc-handover-b9075','Stbd Aft Cabin','Windows','Damage','Scratches on all windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9075-r98','qc-handover-b9075','Stbd Aft Cabin','Bunk Drawers','Operational','Bunk drawer not soft closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r114','qc-handover-b9075','Port Fwd Cabin','Window blinds','Loose','hullside blind loose fwd',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r115','qc-handover-b9075','Port Fwd Cabin','Lockers','Cleaning','clean inside forepeak locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r116','qc-handover-b9075','Port Fwd Cabin','Hatch','Loose','hatch cover trim sagging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r127','qc-handover-b9075','Port Heads','Ceiling','Sealer','entire heads sealer pulling yellow',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r128','qc-handover-b9075','Port Heads','Window blinds','Loose','blind loose as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r129','qc-handover-b9075','Port Heads','Dedicated trashcan locker','Loose','catch loose of bin locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r130','qc-handover-b9075','Port Heads','Basin module','Sealer','yellow sealer inside basin',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r149','qc-handover-b9075','Port Aft Cabin','Hanging locker','Loose','top hinge loose of door n wood visible by hinge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r150','qc-handover-b9075','Port Aft Cabin','Hanging locker','Loose','top catch loose of door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r151','qc-handover-b9075','Port Aft Cabin','Sliding or hinged heads door','Loose','catch block loose of cabin sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r152','qc-handover-b9075','Port Aft Cabin','Bunk Drawers','Operational','bunk draw opens when locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r153','qc-handover-b9075','Port Aft Cabin','Bunktop/Double berth','Damage','deep scratches on formica of bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9075-r154','qc-handover-b9075','Port Aft Cabin','Window blinds','Damage','aft outboard blind slats damage',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9075-r155','qc-handover-b9075','Port Aft Cabin','Vinyl ceiling','Cleaning','marks on panels as marked',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9075-r188','qc-handover-b9075','Fwd Cockpit & Foredeck','Locker lids','Operational','genset locker lid creeqs when stepping on',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9075-r189','qc-handover-b9075','Fwd Cockpit & Foredeck','Drinks holders - 2 in fwd cockpit and 1 at helm','Sealer','neaten sealer around port cupholder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9075-r190','qc-handover-b9075','Fwd Cockpit & Foredeck','Locker lids','Loose','perco loose of stb locker lid',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9075-r198','qc-handover-b9075','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','bottle screw nuts loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9075-r199','qc-handover-b9075','Stbd Side Deck','Mooring cleats','Loose','fwd cleat loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9075-r200','qc-handover-b9075','Stbd Side Deck','Hatch','Loose','hinges loose of fwd hatch',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9075-r205','qc-handover-b9075','Port Side Deck','GRP','Spills','sika spills on grp as marked',10,'Cleaning',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b9076','B9076_HO_Audit','B9') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Saloon',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Stbd Fwd Heads',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Stbd Study & Passage',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Aft Cockpit',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Stbd Hull',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Port Hull',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Forward Cockpit',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Stbd Side Deck',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Port Side Deck',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Flybridge',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Port Fwd Cabin',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Port Passage',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Port Heds',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9076','Port Aft Cabin',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b9076-r4','qc-handover-b9076','Saloon','Ceiling Liner','Scratches','dull on entire ceiling liner at companion way door + fwd side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r5','qc-handover-b9076','Saloon','Vinyl ceiling','Operational','vynil ceiling panels not flush ( check all )',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r6','qc-handover-b9076','Saloon','Stowage space under floorboards','Missing part','bolt below floorboard fwd of companion way door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r7','qc-handover-b9076','Saloon','Galley lockers','Cleaning','clean all galley locker doors + pencil markings inside at catches',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r8','qc-handover-b9076','Saloon','Basin module','Sealer','seal at counter top surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r9','qc-handover-b9076','Saloon','Under-basin locker with toilet roll holder','Loose','catch at galley basin locker drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r10','qc-handover-b9076','Saloon','Table','Scratches','on table bases',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r11','qc-handover-b9076','Saloon','Fwd cockpit door','Scratches','fwd cockpit door (check entire)',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9076-r12','qc-handover-b9076','Saloon','Floor','Loose','floor creaking at STB passage floor',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r13','qc-handover-b9076','Saloon','Fwd cockpit door','Sealer','loose sealer at fwd cockpit door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r40','qc-handover-b9076','Stbd Fwd Heads','Basin module','Sealer','sealer smears on basin',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r41','qc-handover-b9076','Stbd Fwd Heads','Ceiling Liner','Cleaning','compound on ceiling surround outboards of divider',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r42','qc-handover-b9076','Stbd Fwd Heads','Sliding or hinged heads door','Operational','sliding door not aligned with catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r44','qc-handover-b9076','Stbd Study & Passage','Staircase','Cleaning','entire stairway tracking + smooth surface aft of Manuel bilge pump',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r45','qc-handover-b9076','Stbd Study & Passage','Vinyl ceiling','Damage','popper on outboard vynil panel + clean',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r46','qc-handover-b9076','Stbd Study & Passage','Ceiling Liner','Scratches','dull on entire inboard vynil panel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r47','qc-handover-b9076','Stbd Study & Passage','Sliding entrance door with lock','Loose','catch on sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r77','qc-handover-b9076','Aft Cockpit','Folding swimming ladder c/w teak steps','Loose','bottom bolts on swim ladder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r78','qc-handover-b9076','Aft Cockpit','Deck flange','scratches','poor repairs above STB transom + dull on entire sugar scoop',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r79','qc-handover-b9076','Aft Cockpit','Windows','sealer','poor sealer on STB transom window surround',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r80','qc-handover-b9076','Aft Cockpit','Decklid','scratches','dull on entire aft decklid coating coaming surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r81','qc-handover-b9076','Aft Cockpit','Doors','cleaning','clean pencil markings on chubby locker door hinges',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r82','qc-handover-b9076','Aft Cockpit','Floor','void','Aft of settee at Davit',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-b9076-r83','qc-handover-b9076','Aft Cockpit','Table','repair','dent on table as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r113','qc-handover-b9076','Stbd Hull','Hull windows','Cleaning','clean neuprene on hull window + clean portlights',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r114','qc-handover-b9076','Stbd Hull','Deck flange','Scratches','dull on entire hull (aft to fwd)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r115','qc-handover-b9076','Stbd Hull','Windows','Cleaning','hull sealer joints',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r116','qc-handover-b9076','Stbd Hull','Deck flange','repair','poor repairs on deck flange aft side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r118','qc-handover-b9076','Port Hull','Deck flange','scratches','dull on entire hull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r153','qc-handover-b9076','Forward Cockpit','S/S cupholder','Sealer','poor sealer on STB cupholder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r154','qc-handover-b9076','Forward Cockpit','Mooring cleats','Sealer','loose sealer at STB mooring cleats inboard of bow',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r155','qc-handover-b9076','Forward Cockpit','Deck flange','Scratches','dull fwd of deck flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r156','qc-handover-b9076','Forward Cockpit','Gas solenoid shut-off valve with control & warning light at cooker','Operational','gas locker lid not staying when lifting',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r160','qc-handover-b9076','Stbd Side Deck','Decklid','Scratches','dull on entire decklid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r161','qc-handover-b9076','Stbd Side Deck','Deck flange','Scratches','dull on entire tow rail inboard + outboard smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r162','qc-handover-b9076','Stbd Side Deck','Hatch','Cleaning','smears on fwd deck hatch covers',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r165','qc-handover-b9076','Port Side Deck','Decklid','Scratches','dull on entire decklid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r166','qc-handover-b9076','Port Side Deck','Deck flange','Scratches','dull on inboard + outboard of deck flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r172','qc-handover-b9076','Flybridge','Flybridge steps','Scratches','on Flybridge stairway smooth surface + top side surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r173','qc-handover-b9076','Flybridge','Flybridge steps','Track repairs','hairline aft of floating steps',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r174','qc-handover-b9076','Flybridge','Ceiling Liner','Scratches','dull on GRP ceiling panels',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r175','qc-handover-b9076','Flybridge','Helmstation','Scratches','on grey helm pod',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r176','qc-handover-b9076','Flybridge','Decklid','Scratches','on aft decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r177','qc-handover-b9076','Flybridge','Stowage space under floorboards','Damage','poor flinger cut out on storage lid aft of table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9076-r178','qc-handover-b9076','Flybridge','Targawing','Scratches','dull on STB + port Targa wing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r190','qc-handover-b9076','Port Fwd Cabin','LED overhead lighting','Loose','Fore peak touch light loose at inboard side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r191','qc-handover-b9076','Port Fwd Cabin','Fwd area','Incorrect','Incorrect screw fittex on botton fore peak door hinge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r192','qc-handover-b9076','Port Fwd Cabin','Window blinds','Missing part','Hull blind not fitted',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r193','qc-handover-b9076','Port Fwd Cabin','Bunktop/Double berth','Cleaning','Exsess cradle residue inside bunk insp',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9076-r194','qc-handover-b9076','Port Fwd Cabin','Vents','Damage','Paint touch up on aft vent',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b9076-r195','qc-handover-b9076','Port Fwd Cabin','Door frames','Cleaning','Spills on cabin door frame',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9076-r196','qc-handover-b9076','Port Fwd Cabin','Window blinds','Cleaning','Pencil marks by hull blind brackets',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9076-r197','qc-handover-b9076','Port Fwd Cabin','Bilges','Damage','Chips on pump locker lids',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r202','qc-handover-b9076','Port Passage','Magazine locker/shelf locker','Proud/Alignment','Inboard locker door chaffing at bottom end',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r203','qc-handover-b9076','Port Passage','Magazine locker/shelf locker','Damage','Screws burred inside shelf locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r228','qc-handover-b9076','Port Heds','Waste tank','Loose','Bottom fwd toggle plate loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r229','qc-handover-b9076','Port Heds','Dedicated trashcan locker','Loose','Bin locker catch loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r230','qc-handover-b9076','Port Heds','Under-basin locker with toilet roll holder','Damage','Screws burred inside basin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r231','qc-handover-b9076','Port Heds','Floor','Cleaning','Exess sika on heads floor joints',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9076-r232','qc-handover-b9076','Port Heds','Cabin Door','Cleaning','Sticker residue on inboard side of heads door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9076-r238','qc-handover-b9076','Port Aft Cabin','Hanging locker','Cleaning','Pencil markes by hanging locler top hinge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9076-r239','qc-handover-b9076','Port Aft Cabin','Fan','Loose','Fan loose by top bracket',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r240','qc-handover-b9076','Port Aft Cabin','Ceiling liner','Scratches','Buff entier inboard liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9076-r241','qc-handover-b9076','Port Aft Cabin','Window blinds','Missing part','Fit cabin blind palmets',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9076-r242','qc-handover-b9076','Port Aft Cabin','Vinyl panels','Cleaning','Pen marks on aft vinyl panel outboard end',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-b9076-r243','qc-handover-b9076','Port Aft Cabin','Bunk Drawers','Operational','Bunk draw not fully closing',3,'Joinery/Carp',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b9077','B9077_HO_Audit','B9') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Port Fwd Cabin',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Port Fwd Heads',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Port Passage',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Port Aft Cabin',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Owner''S Heads',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Stbd Owner''S Cabin',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Saloon',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Aft Cockpit',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Flybridge',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Port Side Deck',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Stbd Side Deck',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Fwd Cockpit & Foredeck',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Stbd Hull',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9077','Port Hull',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b9077-r4','qc-handover-b9077','Port Fwd Cabin','2 x LED reading lamps over bunk','Loose','outboard reading light',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r5','qc-handover-b9077','Port Fwd Cabin','Bunktop/Double berth','Scratches','deep Scratches on bunk liner (check entire)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r6','qc-handover-b9077','Port Fwd Cabin','Window blinds','Loose','hull window blind cover',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r7','qc-handover-b9077','Port Fwd Cabin','Formica Bulkheads','Cleaning','excess sealer about inboard reading light',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r8','qc-handover-b9077','Port Fwd Cabin','Light switch','Proud/Alignment','skew lobby light switch cover',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r11','qc-handover-b9077','Port Fwd Heads','Ceiling','Sealer','yellow sealer fwd of holding tank',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r12','qc-handover-b9077','Port Passage','Hanging locker','Cleaning','glue spills inside hanging locker in passage',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r13','qc-handover-b9077','Port Passage','Floor','Proud/Alignment','floorboard proud when stepping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r14','qc-handover-b9077','Port Passage','Staircase','Cleaning','steps tracking (check all)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r40','qc-handover-b9077','Port Aft Cabin','Sliding entrance door with lock','Proud/Alignment','door catch plate not flush on door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r41','qc-handover-b9077','Port Aft Cabin','Hanging locker','Loose','hinges on hanging locker door (top + bottom)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r42','qc-handover-b9077','Port Aft Cabin','Vinyl ceiling','Cleaning','glue markings on all vynil panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r43','qc-handover-b9077','Port Aft Cabin','Bunk Liners','Scratches','inboard GRP at bunk',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r79','qc-handover-b9077','Owner''S Heads','Windows','Scratches','on hull window+ portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9077-r80','qc-handover-b9077','Owner''S Heads','Ceiling Liner','Scratches','on outboard ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r81','qc-handover-b9077','Owner''S Heads','Basin module','cleaning','excess in basin on GRP',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9077-r84','qc-handover-b9077','Stbd Owner''S Cabin','Hanging locker','damage','visible hole below bottom hinge at inboard hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r85','qc-handover-b9077','Stbd Owner''S Cabin','Sliding entrance door with lock','loose','catch on sliding door + clean entire door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r86','qc-handover-b9077','Stbd Owner''S Cabin','Staircase','cleaning','compound on stairway tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r87','qc-handover-b9077','Stbd Owner''S Cabin','Sliding entrance door with lock','damage','poor finish on sliding door capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b9077-r88','qc-handover-b9077','Stbd Owner''S Cabin','CABIN/ STUDY/PASSAGE','missing','inspection at at study locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r89','qc-handover-b9077','Stbd Owner''S Cabin','Windows','scratches','on hull window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9077-r90','qc-handover-b9077','Stbd Owner''S Cabin','Window blinds','damage','on hull window blind',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r91','qc-handover-b9077','Stbd Owner''S Cabin','window surround','scratches','transom window surround + inboard liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r118','qc-handover-b9077','Saloon','Fwd cockpit door','Scratches','On fwd cockpit door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9077-r119','qc-handover-b9077','Saloon','Ceiling Liner','Scratches','scratches on entire ceiling liner surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r120','qc-handover-b9077','Saloon','Vinyl ceiling','proud','proud vynil ceiling panels + clean',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r121','qc-handover-b9077','Saloon','Inspection lids','cleaning','excess at fwd galley inspection catch(port stairway)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r122','qc-handover-b9077','Saloon','Galley lockers','scratches','on entire corion',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9077-r123','qc-handover-b9077','Saloon','Galley lockers','missing','edging at port aft saloon window',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r124','qc-handover-b9077','Saloon','Draw locker','Damage','edging at port locker drawer below C02',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r125','qc-handover-b9077','Saloon','Galley lockers','operational','galley locker drawers opening while locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r126','qc-handover-b9077','Saloon','Lockers','loose','fire locker door top hinge + chaffing bottom side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9077-r154','qc-handover-b9077','Aft Cockpit','Locker lids','Operational','port engine room lid knocking at perco',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r155','qc-handover-b9077','Aft Cockpit','Floor','Scratches','on + above port transom steps at transom showerrr',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r156','qc-handover-b9077','Aft Cockpit','Folding swimming ladder c/w teak steps','Operational','swim ladder chaffing when operating+ loose bolts',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r157','qc-handover-b9077','Aft Cockpit','Deck flange','Scratches','on entire sugar scoop',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r158','qc-handover-b9077','Aft Cockpit','Decklid','Scratches','on entire aft decklid coamings',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r159','qc-handover-b9077','Aft Cockpit','Table','Scratches','On entire table surround + clean bottom side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r160','qc-handover-b9077','Aft Cockpit','Transom','Cracks','outboard of STB transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r161','qc-handover-b9077','Aft Cockpit','Deck flange','Scratches','STB transom tow rail flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r192','qc-handover-b9077','Flybridge','Flybridge steps','Scratches','Om Flybridge steps coamings',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r193','qc-handover-b9077','Flybridge','Settee','Cleaning','overspray on settee smooth surface above steps',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r194','qc-handover-b9077','Flybridge','Floor','Spills','on top step at Flybridge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r195','qc-handover-b9077','Flybridge','Lockers','Loose','life raft locker door hinges',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r196','qc-handover-b9077','Flybridge','Vinyl ceiling','Proud/Alignment','aft vynil panels Stepping + clean',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r197','qc-handover-b9077','Flybridge','Windows','Cleaning','masking tape fwd of windshield on stainless steel',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r199','qc-handover-b9077','Port Side Deck','Decklid','Scratches','on entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r200','qc-handover-b9077','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','spills on entire guard rails + bases',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r204','qc-handover-b9077','Stbd Side Deck','Decklid','Scratches','on entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r205','qc-handover-b9077','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','spills on entire guard rails + bases',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r206','qc-handover-b9077','Stbd Side Deck','Hatch','Missing part','fit no steps labels on all hatches',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r209','qc-handover-b9077','Fwd Cockpit & Foredeck','Locker lids','Scratches','on port locker lid surround as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r210','qc-handover-b9077','Fwd Cockpit & Foredeck','Anchor bow roller fitting','Cleaning','remove plastic on anchor chain roller',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r211','qc-handover-b9077','Fwd Cockpit & Foredeck','Decklid','Pinholes','fwd on decklid coaming + scratches',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r212','qc-handover-b9077','Fwd Cockpit & Foredeck','Windows','Spills','on fwd saloon windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9077-r215','qc-handover-b9077','Stbd Hull','Deck flange','Scratches','on entire hull top + bottom side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9077-r216','qc-handover-b9077','Stbd Hull','Deck flange','Sealer','poor sealer on outboard tow rail',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r217','qc-handover-b9077','Stbd Hull','Windows','Sealer','poor window sealer on window joints',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9077-r219','qc-handover-b9077','Port Hull','Deck flange','Scratches','on entire hull top + bottom flange ( from fwd to aft)',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b9078','B9078_HO_Audit','B9') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Aft Cockpit',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Port Side Deck',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Stbd Side Deck',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Flybridge',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Fwd Cockpit & Foredeck',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Stbd Hull',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Port Aft Cabin',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Port Heads',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Port Passage',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Stbd Study & Passage',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b9078','Stbd Aft Cabin',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b9078-r5','qc-handover-b9078','Aft Cockpit','Transom','Sealer','Neaten starboard bumper rubber sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r6','qc-handover-b9078','Aft Cockpit','Folding swimming ladder c/w teak steps','Loose','Loose bolts on swim ladder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r7','qc-handover-b9078','Aft Cockpit','Folding swimming ladder c/w teak steps','Sealer','Neaten sealer at swim ladder base spills on all stainless steel',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r8','qc-handover-b9078','Aft Cockpit','window module','Sealer','Neaten sealer at Starboard window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r9','qc-handover-b9078','Aft Cockpit','Companion door','Sealer','Neaten sealer below companionway door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r10','qc-handover-b9078','Aft Cockpit','Vinyl ceiling','Damage','Vinyl damaged above companionway door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r11','qc-handover-b9078','Aft Cockpit','Ceiling','Proud/Alignment','Velcro visible at removable ceiling',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r12','qc-handover-b9078','Aft Cockpit','Ceiling','Incorrect','Switch incorrect fitted wrong way around',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r13','qc-handover-b9078','Aft Cockpit','Floor','Track repairs','bubble in tracking aft of settee',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-b9078-r16','qc-handover-b9078','Port Side Deck','Hatch','Cleaning','overspray and forward perspect plus handles decked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r17','qc-handover-b9078','Port Side Deck','Targawing','Sealer','seal blowers by tigerwing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r18','qc-handover-b9078','Port Side Deck','Targawing','Scratches','buffing tire decklet',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r20','qc-handover-b9078','Stbd Side Deck','Hatch','Cleaning','overspray and forward perspect plus handles decked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r21','qc-handover-b9078','Stbd Side Deck','Targawing','Sealer','seal blowers by tigerwing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r22','qc-handover-b9078','Stbd Side Deck','Targawing','Scratches','buffing tire decklet',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r25','qc-handover-b9078','Flybridge','Doors','Proud/Alignment','Liferaft locker door proud',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r26','qc-handover-b9078','Flybridge','Doors','Sealer','Neaten sealer below liferaft locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r27','qc-handover-b9078','Flybridge','Fwd area','Scratches','Scratches on helm grey panel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r28','qc-handover-b9078','Flybridge','Locker lids','Sealer','neaten sealer inside basin locker underneath Corrain Lid',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r29','qc-handover-b9078','Flybridge','Staircase','Scratches','Scratches on entire steps smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r30','qc-handover-b9078','Flybridge','PERSPEX','Sealer','Neaten Sealer aft by port windshield',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r35','qc-handover-b9078','Fwd Cockpit & Foredeck','Doors','Loose','Loose handles on forward cockpit door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r36','qc-handover-b9078','Fwd Cockpit & Foredeck','Door surround','Scratches','Scratches on forward cockpit door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b9078-r37','qc-handover-b9078','Fwd Cockpit & Foredeck','Locker lids','Damage','Screws protruding port of locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r38','qc-handover-b9078','Fwd Cockpit & Foredeck','CLEANING','Cleaning','Remove laser foam on dive bottles holder',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b9078-r45','qc-handover-b9078','Stbd Hull','deck Join','Sealer','neaten deck join sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b9078-r46','qc-handover-b9078','Stbd Hull','Deck flange','repairs','Poor repiars below blower cover as mark',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r47','qc-handover-b9078','Stbd Hull','Deck flange','scratches','poor repairs and scratches on aft deck join coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r109','qc-handover-b9078','Port Aft Cabin','formica','damage','Outboard bunk Formica step squeaking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r110','qc-handover-b9078','Port Aft Cabin','formica','damage','Floor below bunk step squeaking outboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r111','qc-handover-b9078','Port Aft Cabin','formica','damage','Bunk top Formica squeaking inboard & outboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r112','qc-handover-b9078','Port Aft Cabin','door','loose','Door handle loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r117','qc-handover-b9078','Port Heads','door','cleaning','Remove plastic from door Top Side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r118','qc-handover-b9078','Port Heads','basin tap','scratches','Scratches on basin tap',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r119','qc-handover-b9078','Port Heads','doors','operational','Centre locked door knocks',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r124','qc-handover-b9078','Port Passage','door','operational','Inboard Locker Door Chaffed',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r151','qc-handover-b9078','Stbd Study & Passage','Floor','Cleaning','Stains On Stairway Tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b9078-r152','qc-handover-b9078','Stbd Study & Passage','Formica Bulkheads','Cleaning','Clean All formica bulkheads and vinyl panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r157','qc-handover-b9078','Stbd Aft Cabin','Window blinds','Operational','Adjust All Blinds',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b9078-r158','qc-handover-b9078','Stbd Aft Cabin','Doors','Loose','Loose Catch On Sliding Door',3,'Joinery/Carp',false,'','','','','')
on conflict (id) do nothing;
commit;
select model, count(*) as audits from public.quality_control_boats where model='B9' group by model;
