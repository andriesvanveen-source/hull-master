-- Quality Control audit import for C2 boats.
-- Renames existing reference audits to _QC3 and adds _HO_Audit boats.
-- Idempotent and non-destructive: existing defects are not overwritten.
begin;
update public.quality_control_boats set name='C2026_QC3' where id='qc-reference-c2026';
update public.quality_control_boats set name='C2025_QC3' where id='qc-reference-c2025';
update public.quality_control_boats set name='C2024_QC3' where id='qc-reference-c2024';
update public.quality_control_boats set name='C2023_QC3' where id='qc-reference-c2023';
update public.quality_control_boats set name='C2022_QC3' where id='qc-reference-c2022';
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c2022','C2022_HO_Audit','C2') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Port Fwd Cabin',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Port Fwd Heads',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Port Passage',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Port Mid Heads',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Port Mid Cabin',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Port Aft Heads',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Port Aft Cabin',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2022','Flybridge',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c2022-r5','qc-handover-c2022','Port Fwd Cabin','window surround','Repairs','poor repair fwd on window surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2022-r6','qc-handover-c2022','Port Fwd Cabin','Sliding hatch over forward cockpit steps','Loose','outboard clip on hatch + clean surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r7','qc-handover-c2022','Port Fwd Cabin','2 x LED reading lamps over bunk','Cleaning','pencil markings at reading lights',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r8','qc-handover-c2022','Port Fwd Cabin','Vinyl ceiling','Damage','on ceiling panel above bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r9','qc-handover-c2022','Port Fwd Cabin','Formica Bulkheads','Loose','poor touch up outboard aft of bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r10','qc-handover-c2022','Port Fwd Cabin','Floor','Sealer','poor sealer on floor joints',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r11','qc-handover-c2022','Port Fwd Cabin','Bunk Drawers','Proud/Alignment','adjust locker drawers at bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r12','qc-handover-c2022','Port Fwd Cabin','Bunktop/Double berth','Loose','inboard + outboard bunk Fiddle''s',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r13','qc-handover-c2022','Port Fwd Cabin','Door surround','Sealer','missing sealer + poor sealer on heads door surround + fwd at cabin door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r14','qc-handover-c2022','Port Fwd Cabin','Magazine locker/shelf locker','Proud/Alignment','skew rail about hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r15','qc-handover-c2022','Port Fwd Cabin','USB outlets in each cabin','Loose','outlet inboard above hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r16','qc-handover-c2022','Port Fwd Cabin','Hanging locker','Missing part','screws on hanging locker door catches + loose hinges (check all)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r17','qc-handover-c2022','Port Fwd Cabin','Hanging locker','Loose','inspection inside hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r42','qc-handover-c2022','Port Fwd Heads','Shower bulkhead module','Cleaning','fwd + aft bulkheads',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r43','qc-handover-c2022','Port Fwd Heads','LED overhead lighting','Missing part','strip light clip above at vanity',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r44','qc-handover-c2022','Port Fwd Heads','Hatch','Loose','hatch liner proud + loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r45','qc-handover-c2022','Port Fwd Heads','Sliding entrance door with lock','Missing part','sliver cap at door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r46','qc-handover-c2022','Port Fwd Heads','Coat hook','Loose','coat hook base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r47','qc-handover-c2022','Port Fwd Heads','Under-basin locker with toilet roll holder','Loose','hinges on basin locker door + clean pencil markings',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r53','qc-handover-c2022','Port Passage','Floor','Sealer','poor sealer on floor surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r54','qc-handover-c2022','Port Passage','Staircase','Sealer','poor sealer on top stairway',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r59','qc-handover-c2022','Port Mid Heads','Formica Bulkheads','Cleaning','entire heads gloos Formica surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r60','qc-handover-c2022','Port Mid Heads','Hatch','Damage','hatch clip + clean liner',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r61','qc-handover-c2022','Port Mid Heads','Vanity table/desk with storage locker and mirror under lid','Proud/Alignment','visible gap at top fwd + aft side of vanity',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r62','qc-handover-c2022','Port Mid Heads','Window blinds','Loose','aft blind tac',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r63','qc-handover-c2022','Port Mid Heads','Holding tanks','Missing part','toggle on holding tank',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r64','qc-handover-c2022','Port Mid Heads','Floor','Spills','on entire floor tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2022-r68','qc-handover-c2022','Port Mid Cabin','Hatch','Incorrect','placement of escape label',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r69','qc-handover-c2022','Port Mid Cabin','Cabin Door','Sealer','missing sealerr on door surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r70','qc-handover-c2022','Port Mid Cabin','Floor','Sealer','poor sealer on floor joints',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r71','qc-handover-c2022','Port Mid Cabin','Vinyl ceiling','Cleaning','clean all vynil ceiling panels lo',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r72','qc-handover-c2022','Port Mid Cabin','Cabin Door','Proud/Alignment','cabin door proud top outboard side when closed',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r81','qc-handover-c2022','Port Aft Heads','Sliding entrance door with lock','Missing part','sliding door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r82','qc-handover-c2022','Port Aft Heads','Sliding entrance door with lock','Missing part','screws on bottom door guides',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r83','qc-handover-c2022','Port Aft Heads','Sliding entrance door with lock','damage','top aft door capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2022-r84','qc-handover-c2022','Port Aft Heads','Basin module','loose','hinges on basin locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r85','qc-handover-c2022','Port Aft Heads','Automatic shower drain pumps','loose','loose shower rose base',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c2022-r86','qc-handover-c2022','Port Aft Heads','Window blinds','cleaning','pencil markings on blind catches',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r87','qc-handover-c2022','Port Aft Heads','window surround','loose','transom PVC surround',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c2022-r88','qc-handover-c2022','Port Aft Heads','Formica Bulkheads','cleaning','smears on gloss Formica surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r93','qc-handover-c2022','Port Aft Cabin','Door surround','Repairs','poor + unfinished repairs on gullwing surround (check entire)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2022-r94','qc-handover-c2022','Port Aft Cabin','Doors','Loose','Gullwing door catch at bottom guide',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2022-r95','qc-handover-c2022','Port Aft Cabin','Doors','Loose','gas strut on gullwing + clean entire gulling',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2022-r96','qc-handover-c2022','Port Aft Cabin','Floor','Cleaning','spills + residue on cabin floor',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r97','qc-handover-c2022','Port Aft Cabin','Staircase','Sealer','poor sealer at top stairway',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r98','qc-handover-c2022','Port Aft Cabin','Hanging locker','Damage','hanging locker top edging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r99','qc-handover-c2022','Port Aft Cabin','Bunk Drawers','Loose','catch block inside drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r100','qc-handover-c2022','Port Aft Cabin','Fan','Cleaning','debris inside on fan blades',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r101','qc-handover-c2022','Port Aft Cabin','Holding tanks','Proud/Alignment','holding tank door + loose hinges',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r102','qc-handover-c2022','Port Aft Cabin','Window blinds','Operational','hullo window blind knocking on outlet when closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2022-r119','qc-handover-c2022','Flybridge','Bimini','scratches','lm entire Bimini surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2022-r120','qc-handover-c2022','Flybridge','Lewmar genoa cars with pin stop','Cleaning','all spin blocks + Genoa tracks',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2022-r121','qc-handover-c2022','Flybridge','Decklid','Cleaning','remove all yellow tape from components',4,'Deckfitting',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c2023','C2023_HO_Audit','C2') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Port Fwd Cabin',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Port Fwd Heads',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Port Passage',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Port Aft Cabin',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Contractor',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Stbd Fwd Heads',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Stbd Fwd Cabin',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Stbd Passage',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Stbd Aft Heads',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Stbd Aft Cabin',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Saloon',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Aft Cockpit',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Stbd Side Deck',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Port Side Deck',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Forward Cockpit',14) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Flybridge',15) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Stbd Hull',16) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2023','Port Hull',17) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c2023-r4','qc-handover-c2023','Port Fwd Cabin','Bunktop/Double berth','Cleaning','clean entire bunk top',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r5','qc-handover-c2023','Port Fwd Cabin','Vinyl ceiling','Cleaning','clean all vynil ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r6','qc-handover-c2023','Port Fwd Cabin','Bunktop/Double berth','Loose','outboard bunk fiddle loose + inboard damaged bottom side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r7','qc-handover-c2023','Port Fwd Cabin','Cabin Door','Operational','adjust door when closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r8','qc-handover-c2023','Port Fwd Cabin','12v outlet socket at helm station','Cleaning','remove all plastic on light switches + outlets',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r9','qc-handover-c2023','Port Fwd Cabin','Cabin Door','Damage','missing touch up on Striker plate + clean pencil markings',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r10','qc-handover-c2023','Port Fwd Cabin','Hanging locker','Damage','visible hole inside hanging locker at inspection',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r11','qc-handover-c2023','Port Fwd Cabin','Bunktop/Double berth','Damage','on bunk top lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r14','qc-handover-c2023','Port Fwd Heads','Coat hook','Loose','coat hook at fwd bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r15','qc-handover-c2023','Port Fwd Heads','Sliding entrance door with lock','Damage','poor edging at door pelmet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r16','qc-handover-c2023','Port Fwd Heads','Shower bulkhead module','Loose','loose top shower rail base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r17','qc-handover-c2023','Port Fwd Heads','window surround','Damage','damage edging at window blind',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r18','qc-handover-c2023','Port Fwd Heads','window surround','Damage','on PVC window surround',9,'Spray Painting',true,'','','','',''),
  ('qc-handover-c2023-r22','qc-handover-c2023','Port Passage','Settee','Damage','below nav settee',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r23','qc-handover-c2023','Port Passage','Light switch','Cleaning','remove Plastic on light switches',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r24','qc-handover-c2023','Port Passage','Hanging locker','Loose','hinges on fwd hanging locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r25','qc-handover-c2023','Port Passage','Floor','Loose','floor creaking at floor lid',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c2023-r40','qc-handover-c2023','Port Aft Cabin','Light switch','Loose','light switch cover',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r41','qc-handover-c2023','Port Aft Cabin','Vinyl ceiling','Sealer','missing sealer outboard of hatch at joint top side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r42','qc-handover-c2023','Port Aft Cabin','Hatch','Damage','damage hatch anodizer (replace)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r43','qc-handover-c2023','Port Aft Cabin','Bunktop/Double berth','Cleaning','multiple spills on entire bunk top',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r44','qc-handover-c2023','Port Aft Cabin','Hanging locker','Damage','inside hanging locker inboard of heads door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r45','qc-handover-c2023','Port Aft Cabin','Bunktop/Double berth','Damage','on bunk finger cut out',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r46','qc-handover-c2023','Port Aft Cabin','Bunktop/Double berth','Cleaning','entire bunk fiddle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r47','qc-handover-c2023','Port Aft Cabin','Bunktop/Double berth','Loose','bunk inspection at engine fire suppression',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r48','qc-handover-c2023','Port Aft Cabin','Magazine locker/shelf locker','Damage','edging on magazine Locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r49','qc-handover-c2023','Port Aft Cabin','Staircase','Damage','below stairway on aft Formica at gullwing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r50','qc-handover-c2023','Port Aft Cabin','Vanity table/desk with storage locker and mirror under lid','Operational','outboard vanity lid not opening all the way + damage at hinge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r54','qc-handover-c2023','Contractor','Sliding entrance door with lock','Missing part','missing frosting on sliding door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2023-r55','qc-handover-c2023','Contractor','Floor','Missing part','corion sump',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r56','qc-handover-c2023','Contractor','corian','Cracks','on corion top at vanity',8,'Perspex/Windows',true,'','','','',''),
  ('qc-handover-c2023-r57','qc-handover-c2023','Contractor','Vanity locker with mirror','Loose','loose hinges on vanity locker doors',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r58','qc-handover-c2023','Contractor','Basin module','Loose','on basin locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r59','qc-handover-c2023','Contractor','Dedicated trashcan locker','Loose','hinges on bunk locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r60','qc-handover-c2023','Contractor','Sliding entrance door with lock','Damage','deep Scratches on sliding door + damage edges',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2023-r61','qc-handover-c2023','Contractor','Sliding entrance door with lock','Sealer','poor sealer at sliding door magnets + top joints',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r62','qc-handover-c2023','Contractor','Window blinds','Loose','loose blind tac',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r63','qc-handover-c2023','Contractor','Sliding entrance door with lock','damage','visible hole at top sliding door rail',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r64','qc-handover-c2023','Contractor','Portlight in transom','loose','transom Portlight not staying up',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r73','qc-handover-c2023','Stbd Fwd Heads','Coat hook','Loose','coat hook base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r74','qc-handover-c2023','Stbd Fwd Heads','Perspex','Loose','Perspex divider bottom catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r75','qc-handover-c2023','Stbd Fwd Heads','Under-basin locker with toilet roll holder','Loose','loose Toilet roll holder',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r76','qc-handover-c2023','Stbd Fwd Heads','Holding tanks','operational','waste tank locker door not closing smoothly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r82','qc-handover-c2023','Stbd Fwd Cabin','Bunktop/Double berth','cleaning','clean inside gas locker inspection',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r83','qc-handover-c2023','Stbd Fwd Cabin','Hatch','operational','adjust hatch when operating',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r84','qc-handover-c2023','Stbd Fwd Cabin','Cabin Door','Damage','poor touch up on Striker plate',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r85','qc-handover-c2023','Stbd Fwd Cabin','Cabin Door','Sealer','poor sealer at top capping outboard side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r89','qc-handover-c2023','Stbd Passage','Formica Bulkheads','Cleaning','excess glue aft at bulkhead joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r90','qc-handover-c2023','Stbd Passage','Staircase','Cleaning','clean entire aft stairway',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r91','qc-handover-c2023','Stbd Passage','Formica Bulkheads','Damage','on outboard Formica top side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r112','qc-handover-c2023','Stbd Aft Heads','Shower bulkhead module','loose','shower rail base',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c2023-r113','qc-handover-c2023','Stbd Aft Heads','Formica Bulkheads','Cleaning','entire gloss Formica surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r114','qc-handover-c2023','Stbd Aft Heads','Vanity locker with mirror','loose','hinge on aft vanity locker door at hinge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r115','qc-handover-c2023','Stbd Aft Heads','corian','crack','on corion top',8,'Perspex/Windows',true,'','','','',''),
  ('qc-handover-c2023-r118','qc-handover-c2023','Stbd Aft Cabin','Bunk Drawers','proud/alignment','bottom outboard drawer to be aligned',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r119','qc-handover-c2023','Stbd Aft Cabin','Chain-and-wire steering system c/w bulkhead steering unit and brake','cleaning','clean inside at steering chain inspection + at fridge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r120','qc-handover-c2023','Stbd Aft Cabin','Bunktop/Double berth','Cleaning','remove fibre glass tabbing at inboard inspection at pipes',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r121','qc-handover-c2023','Stbd Aft Cabin','Bunk Liners','Voids','Bubble on bunk top aft side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r122','qc-handover-c2023','Stbd Aft Cabin','Bunktop/Double berth','damage','on bunk top Formica',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r123','qc-handover-c2023','Stbd Aft Cabin','Bunktop/Double berth','damage','bunk fiddle + clean entire',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r124','qc-handover-c2023','Stbd Aft Cabin','Solids','damage','on door capping surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2023-r125','qc-handover-c2023','Stbd Aft Cabin','Vanity locker with mirror','Operational','vanity lid not opening all the way + angled',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r126','qc-handover-c2023','Stbd Aft Cabin','Hatch','Loose','hatch vynil panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r127','qc-handover-c2023','Stbd Aft Cabin','Magazine locker/shelf locker','Damage','visible hole outboard aft magazine locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r128','qc-handover-c2023','Stbd Aft Cabin','Fuel tank','Cleaning','entire surround at fuel tank',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2023-r129','qc-handover-c2023','Stbd Aft Cabin','Floor','Damage','On floorboard + damage bottom side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r151','qc-handover-c2023','Saloon','Vinyl ceiling','Cleaning','clean all vynil ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r152','qc-handover-c2023','Saloon','AC/DC locker','Damage','On AC/DC edging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r153','qc-handover-c2023','Saloon','Microwave locker','Damage','edging at microwave locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r154','qc-handover-c2023','Saloon','Floor','Damage','Om saloon floor at battery locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r155','qc-handover-c2023','Saloon','Ceiling','Damage','damage on ceiling grounds ( check all)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r156','qc-handover-c2023','Saloon','Dish and cutlery drying recess with drainage','Proud/Alignment','adjust dish washer drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r157','qc-handover-c2023','Saloon','Forward access to foredeck c/w watertight Lewmar door','Loose','handles on fwd cockpit door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r158','qc-handover-c2023','Saloon','Window blinds','Cleaning','all mullions',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r159','qc-handover-c2023','Saloon','Nav desk','Damage','visible holes at nav desk arm outboard side + damage edging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r160','qc-handover-c2023','Saloon','Ceiling','Repairs','loose crestima fwd at mast + aft at EVI',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r161','qc-handover-c2023','Saloon','Locker lids','Cleaning','clean inside battery lockers + storage lockers',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2023-r162','qc-handover-c2023','Saloon','Ceiling','Loose','valcro on centre ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r163','qc-handover-c2023','Saloon','Floating step','Sealer','missing sealer below settee at companion way door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2023-r186','qc-handover-c2023','Aft Cockpit','Floor','Damage','damage in tracking on walkthrough tracking (centre + aft)',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c2023-r187','qc-handover-c2023','Aft Cockpit','Floor','Cleaning','spills on entire aft cockpit tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r188','qc-handover-c2023','Aft Cockpit','Fridge/Freezer locker','Spills','fwd of aft cockpit fridge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r189','qc-handover-c2023','Aft Cockpit','Lockers','Operational','chubby locker door knocking when closing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r190','qc-handover-c2023','Aft Cockpit','Floor','Scratches','On aft cockpit waterlines',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r191','qc-handover-c2023','Aft Cockpit','Table','Damage','below team table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r192','qc-handover-c2023','Aft Cockpit','Table','Sealer','proud teflons below table + incorrect bolts fitted',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r193','qc-handover-c2023','Aft Cockpit','Ceiling','Loose','poor folding on all vynil ceiling panels edges',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r194','qc-handover-c2023','Aft Cockpit','Companion door','Proud/Alignment','bolts at valence',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r195','qc-handover-c2023','Aft Cockpit','Floor','Loose','bolts at aft panels fwd of Davit',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r196','qc-handover-c2023','Aft Cockpit','Locker lids','Loose','port engine lid squeeking when walked on',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r197','qc-handover-c2023','Aft Cockpit','Deck flange','Repairs','poor repairs + spills at lift platform handle',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r198','qc-handover-c2023','Aft Cockpit','Floor','Cleaning','inside sump inspection',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r199','qc-handover-c2023','Aft Cockpit','Transom','Repairs','poor repair at port transom surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r200','qc-handover-c2023','Aft Cockpit','Vinyl ceiling','Cleaning','clean all vynil ceiling panels',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r219','qc-handover-c2023','Stbd Side Deck','Decklid','scratches','On entire decklid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r220','qc-handover-c2023','Stbd Side Deck','Deck flange','sealer','poor sealer at aft deck flange + clean tape residue fwd side',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r221','qc-handover-c2023','Stbd Side Deck','Helmstation','Scratches','outboard of helm',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r222','qc-handover-c2023','Stbd Side Deck','Floor','cleaning','stains on fwd tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r223','qc-handover-c2023','Stbd Side Deck','Hatch','Scratches','on all side deck hatches',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2023-r228','qc-handover-c2023','Port Side Deck','Decklid','Scratches','on entire decklid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r229','qc-handover-c2023','Port Side Deck','Hatch','Scratches','On fwd heads + midship heads deck hatch',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2023-r230','qc-handover-c2023','Port Side Deck','Floor','Spills','On entire side deck tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r231','qc-handover-c2023','Port Side Deck','Deck flange','Repairs','at stancion fwd of aft mooring cleat + clean spills in tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r232','qc-handover-c2023','Port Side Deck','Hatch','Scratches','on all side deck hatches',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2023-r242','qc-handover-c2023','Forward Cockpit','Trampoline','Damage','neaten trampoline ropes + clean entire trampoline',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r243','qc-handover-c2023','Forward Cockpit','Locker lids','Sealer','missing sealer inside step locker inboard side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r244','qc-handover-c2023','Forward Cockpit','Settee','Scratches','on entire settee surrounds',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r245','qc-handover-c2023','Forward Cockpit','Floor','Cleaning','clean entire tracking sump fwd of door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2023-r246','qc-handover-c2023','Forward Cockpit','Settee','Track repairs','sand marks in tracking fwd of fire locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r261','qc-handover-c2023','Flybridge','Settee','scratches','on settee surround aft of table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r262','qc-handover-c2023','Flybridge','Windows','scratches','on skyscreen on Bimini',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2023-r299','qc-handover-c2023','Stbd Hull','Windows','cleaning','all hull window + surrounds',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2023-r300','qc-handover-c2023','Stbd Hull','Stbd hull side','scratches','dull on entire hull from fwd to aft side (top + bottom)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r301','qc-handover-c2023','Stbd Hull','chain plate','sealer','yellow sealer at chainplate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r302','qc-handover-c2023','Stbd Hull','Guard wires with stanchions, bases, port & starboard side gates','cleaning','clean all stanchions gates + bases',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r306','qc-handover-c2023','Port Hull','Portlight hull side','scratches','scratches + dull top side above at hull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2023-r307','qc-handover-c2023','Port Hull','chain plate','sealer','yellow sealer at chainplate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2023-r308','qc-handover-c2023','Port Hull','Portlight hull side','spills','on aft hull bottom side + dull on entire hull',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c2024','C2024_HO_Audit','C2') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2024','Port Mid Cabin',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2024','Port Aft Cabin',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2024','Port Aft Heads',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2024','Stbd Side Deck',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2024','Port Side Deck',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2024','Forepeak',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c2024-r4','qc-handover-c2024','Port Mid Cabin','Cabin Door','Operational','adjust door handle when operating',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r5','qc-handover-c2024','Port Mid Cabin','Bunktop/Double berth','Damage','damage on bunk top aft side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r6','qc-handover-c2024','Port Mid Cabin','Ceiling','Cleaning','remove excess crestima at ceiling grounds aft side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r7','qc-handover-c2024','Port Mid Cabin','Hatch','Cleaning','clean hatch surround',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2024-r8','qc-handover-c2024','Port Mid Cabin','Ceiling','Proud/Alignment','ceiling poppers proud + clean entire vynil panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r9','qc-handover-c2024','Port Mid Cabin','Solids','Damage','poor spray on cabin door capping surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2024-r43','qc-handover-c2024','Port Aft Cabin','2 x LED reading lamps over bunk','Loose','aft reading light bases at headboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r44','qc-handover-c2024','Port Aft Cabin','Bunktop/Double berth','Loose','loose + neaten vynil behind vynil boards',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r45','qc-handover-c2024','Port Aft Cabin','Hanging locker','Loose','loose hinges on hanging locker door fwd side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r46','qc-handover-c2024','Port Aft Cabin','Bunk Drawers','Operational','bunk drawer push lock not latching smoothly + clean spills on entire bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r47','qc-handover-c2024','Port Aft Cabin','Floor','Damage','On floorboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r48','qc-handover-c2024','Port Aft Cabin','Ceiling Liner','Cleaning','remove pencil markings at CO2',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r49','qc-handover-c2024','Port Aft Cabin','Staircase','Sealer','missing sealerr outboard at steps',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r50','qc-handover-c2024','Port Aft Cabin','Bunktop/Double berth','Sealer','missing sealer aft of bunk drawer outboard side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r51','qc-handover-c2024','Port Aft Cabin','Deck flange','Scratches','dull on entire gullwing flange surrround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r52','qc-handover-c2024','Port Aft Cabin','Solids','Damage','poor spray on entire capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2024-r53','qc-handover-c2024','Port Aft Cabin','Window blinds','Loose','gullwing blind not clipped in',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r54','qc-handover-c2024','Port Aft Cabin','Cabin Door','Loose','loose gullwing gas strut',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2024-r58','qc-handover-c2024','Port Aft Heads','Under-basin locker with toilet roll holder','Loose','toilet roll holder',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r59','qc-handover-c2024','Port Aft Heads','Windows','Scratches','on hull window + portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2024-r60','qc-handover-c2024','Port Aft Heads','window surround','Cleaning','transom window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r61','qc-handover-c2024','Port Aft Heads','Floor','Cleaning','clean entire heads tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r62','qc-handover-c2024','Port Aft Heads','Sliding entrance door with lock','Sealer','missing sealer at heads sliding door top side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r78','qc-handover-c2024','Stbd Side Deck','Deck flange','scratches','dull on entire tow rail inboard + outboard smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r79','qc-handover-c2024','Stbd Side Deck','Decklid','scratches','dull on entire decklid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r85','qc-handover-c2024','Port Side Deck','Decklid','Scratches','dull on entire decklid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r86','qc-handover-c2024','Port Side Deck','Deck flange','Scratches','dull inboard or entire tow rail smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r87','qc-handover-c2024','Port Side Deck','Bows','Cracks','crack at fwd pulpit seat base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2024-r88','qc-handover-c2024','Port Side Deck','Floating step','cracks','star crack below bottom step tracking',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c2024-r120','qc-handover-c2024','Forepeak','Holding tanks','damage','damage cleat at holding tank',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r121','qc-handover-c2024','Forepeak','Locker lids','spills','spills on forepeak bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2024-r122','qc-handover-c2024','Forepeak','Hatch','loose','loose Rubber on hatch',4,'Deckfitting',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c2025','C2025_HO_Audit','C2') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Saloon',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Stbd Fwd Heads',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Stbd Fwd Cabin',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Stbd Passage',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Stbd Aft Heads',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Stbd Aft Cabin',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Fwd Cabin',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Fwd Heads',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Fwd Passage',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Mid Cabin',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Mid Heads',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Aft Heads',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Aft Cabin',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Flybridge',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Stbd Side Deck',14) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Side Deck',15) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Fwd Cockpit & Foredeck',16) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Port Hull',17) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Stbd Hull',18) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2025','Aft Cockpit',19) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c2025-r4','qc-handover-c2025','Saloon','Fwd cockpit door','Operational','centre door handle knocking + handle not semi-locking',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2025-r5','qc-handover-c2025','Saloon','Galley lockers','Sealer','poor sealer at main corion surround below main window',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r6','qc-handover-c2025','Saloon','Vinyl ceiling','Cleaning','clean all ceiling vynil panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r7','qc-handover-c2025','Saloon','Floor','Proud/Alignment','storage locker lid aft of nav desk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r8','qc-handover-c2025','Saloon','Floor','Damage','below battery locker lid',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2025-r9','qc-handover-c2025','Saloon','Draw locker','Operational','dishwasher locker drawer not soft closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r10','qc-handover-c2025','Saloon','Gas oven','Operational','gas oven drawer not soft closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r11','qc-handover-c2025','Saloon','Settee','Damage','below cushion settee',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r12','qc-handover-c2025','Saloon','Companion door','Operational','port companion way door difficult closing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2025-r13','qc-handover-c2025','Saloon','Floor','Sealer','poor floor sealer at STB aft step',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r14','qc-handover-c2025','Saloon','Nav desk','Loose','loose hinge at nav desk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r41','qc-handover-c2025','Stbd Fwd Heads','Window blinds','Loose','blind lever aft on blind',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r42','qc-handover-c2025','Stbd Fwd Heads','Ceiling','Sealer','poor sealer at outboard ceiling + remove spills',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r43','qc-handover-c2025','Stbd Fwd Heads','Basin module','Damage','edging at basin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r44','qc-handover-c2025','Stbd Fwd Heads','Floor','Proud/Alignment','floorboard difficult to open',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r45','qc-handover-c2025','Stbd Fwd Heads','Sliding entrance door with lock','Loose','loose bottom rail at sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r49','qc-handover-c2025','Stbd Fwd Cabin','Bunktop/Double berth','Damage','damage on bunk top Formica',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r50','qc-handover-c2025','Stbd Fwd Cabin','Bunktop/Double berth','Loose','aft Step at bunk creeking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r51','qc-handover-c2025','Stbd Fwd Cabin','LED Overhead lighting','Damage','damage light switch aft of bunk in lobby',7,'Electrical',false,'','','','',''),
  ('qc-handover-c2025-r52','qc-handover-c2025','Stbd Fwd Cabin','Solids','Damage','damage door capping surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2025-r53','qc-handover-c2025','Stbd Fwd Cabin','Magazine locker/shelf locker','Loose','bookshelf at cabink door + clean vynil panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r57','qc-handover-c2025','Stbd Passage','Floor','Sealer','poor sealer in passage',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r58','qc-handover-c2025','Stbd Passage','Formica Bulkheads','Damage','sweep scratches on outboard Formica bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r59','qc-handover-c2025','Stbd Passage','Manual bilge pumps with (keel sump)','Damage','on Manuel bilge pump handle',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c2025-r60','qc-handover-c2025','Stbd Passage','Staircase','Damage','below fwd stairway on Formica',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r79','qc-handover-c2025','Stbd Aft Heads','Floor','sealer','poor sealer below basin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r80','qc-handover-c2025','Stbd Aft Heads','sliding door','damage','Visible holes at striker plate',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r81','qc-handover-c2025','Stbd Aft Heads','Draw locker','operational','drawer locker above basin locker doors not operating smoothly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r91','qc-handover-c2025','Stbd Aft Cabin','Draw locker','Operational','inboard top drawer locker opening while locked + bottom drawer not flush',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r92','qc-handover-c2025','Stbd Aft Cabin','Locker lids','Damage','On outboard vanity lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r93','qc-handover-c2025','Stbd Aft Cabin','Hanging locker','Missing part','missing screws on outboard bottom locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r94','qc-handover-c2025','Stbd Aft Cabin','Hanging locker','Missing part','screw on inboard hanging locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r95','qc-handover-c2025','Stbd Aft Cabin','Magazine locker/shelf locker','Missing part','missing inboard bookshelf panel poppers',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r96','qc-handover-c2025','Stbd Aft Cabin','Window blinds','Cleaning','remove spill transom hull window blind',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r97','qc-handover-c2025','Stbd Aft Cabin','Staircase','Sealer','poor sealer at stairway aft joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r120','qc-handover-c2025','Port Fwd Cabin','Windows','scratches','on port hull window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2025-r121','qc-handover-c2025','Port Fwd Cabin','2 x LED reading lamps over bunk','sealer','missing touch up behind outboard reading light',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r122','qc-handover-c2025','Port Fwd Cabin','Bunktop/Double berth','cleaning','spills on headboard fabric',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r123','qc-handover-c2025','Port Fwd Cabin','Solids','damage','on outboard door capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2025-r124','qc-handover-c2025','Port Fwd Cabin','Cabin Door','cleaning','pencil markings above cabin door Formica',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r129','qc-handover-c2025','Port Fwd Heads','Ceiling','loose','ceiling centre edging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r130','qc-handover-c2025','Port Fwd Heads','Windows','scratches','on hull window + portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2025-r134','qc-handover-c2025','Port Fwd Passage','Staircase','Loose','Formica block fwd above stairway',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r135','qc-handover-c2025','Port Fwd Passage','Vinyl ceiling','Cleaning','spills on outboard vynil panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r158','qc-handover-c2025','Port Mid Cabin','Fan','Cleaning','clean fan blades',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r159','qc-handover-c2025','Port Mid Cabin','Ceiling','Cleaning','entire vynil ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r165','qc-handover-c2025','Port Mid Heads','corian','scratches','On corion surround',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2025-r166','qc-handover-c2025','Port Mid Heads','window surround','Damage','On fwd PVC',9,'Spray Painting',true,'','','','',''),
  ('qc-handover-c2025-r167','qc-handover-c2025','Port Mid Heads','Perspex','Cleaning','remove sealer at Perspex joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r168','qc-handover-c2025','Port Mid Heads','Windows','Scratches','on hull window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2025-r199','qc-handover-c2025','Port Aft Heads','Sliding entrance door with lock','Damage','sliding door rail screws not flush and not sized',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r200','qc-handover-c2025','Port Aft Heads','Sliding entrance door with lock','Damage','visible holes on top door capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r201','qc-handover-c2025','Port Aft Heads','Ceiling','Damage','ceiling aft of sliding door rail',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r205','qc-handover-c2025','Port Aft Cabin','Floor','Proud/Alignment','floorboard in lobby',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r206','qc-handover-c2025','Port Aft Cabin','Lockers','Damage','damage Formica on inboard inspection locker lid edge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r207','qc-handover-c2025','Port Aft Cabin','Draw locker','Damage','deep scratch on bunk drawer at push lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r208','qc-handover-c2025','Port Aft Cabin','Ceiling','Scratches','spills + dull on ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r209','qc-handover-c2025','Port Aft Cabin','Staircase','Sealer','missing sealer at stairway top coaming + remove overspray',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r210','qc-handover-c2025','Port Aft Cabin','Ceiling','Cleaning','clean entire ceiling panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2025-r211','qc-handover-c2025','Port Aft Cabin','Deck flange','Scratches','on gullwing as marked + remove spills',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r233','qc-handover-c2025','Flybridge','Table','scratches','on table surround + clean bottom side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r234','qc-handover-c2025','Flybridge','Bimini','Scratches','dull on entire Bimini surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r241','qc-handover-c2025','Stbd Side Deck','Deck flange','Flowcoat','poor flowcoat on deck flange joint (check entire)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r242','qc-handover-c2025','Stbd Side Deck','deck Join','Scratches','dull on entire decklid coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r243','qc-handover-c2025','Stbd Side Deck','Hatch','Scratches','on all side deck hatches',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2025-r246','qc-handover-c2025','Port Side Deck','Decklid','Scratches','dull on entire decklid coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r247','qc-handover-c2025','Port Side Deck','Hatch','Spills','on forepeak hatch surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r248','qc-handover-c2025','Port Side Deck','Hatch','Scratches','on all side deck hatches',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2025-r255','qc-handover-c2025','Fwd Cockpit & Foredeck','Vinyl ceiling','Cleaning','clean all vynil ceiling panels',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2025-r256','qc-handover-c2025','Fwd Cockpit & Foredeck','Lockers','Cleaning','clean generator + step locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r257','qc-handover-c2025','Fwd Cockpit & Foredeck','Windows','Cleaning','clean fwd saloon windows l',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2025-r273','qc-handover-c2025','Port Hull','Deck flange','scratches','dull on entire hull from aft to fwd side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r274','qc-handover-c2025','Port Hull','Guard wires with stanchions, bases, port & starboard side gates','cleaning','clean all stanchions',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2025-r279','qc-handover-c2025','Stbd Hull','Guard wires with stanchions, bases, port & starboard side gates','cleaning','clean all stanchion bases',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r310','qc-handover-c2025','Aft Cockpit','Floor','Porosity','porosity In tracking aft of helm steps',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r311','qc-handover-c2025','Aft Cockpit','Floor','Porosity','porosity In tracking fwd of STB engine room',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r312','qc-handover-c2025','Aft Cockpit','Transom','cleaning','clean STB + port bumper rubbers',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2025-r313','qc-handover-c2025','Aft Cockpit','Table','damage','damage on aft cockpit table + dull on entire',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r314','qc-handover-c2025','Aft Cockpit','Settee','spills','spills on lift raft locker tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r315','qc-handover-c2025','Aft Cockpit','Locker lids','spills','inside fire locker surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2025-r316','qc-handover-c2025','Aft Cockpit','Settee','sealer','damage on lift raft locker below table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2025-r317','qc-handover-c2025','Aft Cockpit','Helmstation','proud','clips on engine starter display',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2025-r318','qc-handover-c2025','Aft Cockpit','Settee','missing','missing cushion clip at port settee',4,'Deckfitting',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c2026','C2026_HO_Audit','C2') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Stbd Fwd Heads',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Stbd Passage',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Owner''S Heads',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Study',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Stbd Aft Cabin',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Saloon',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Aft Cockpit',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Stbd Hull',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-c2026','Port Hull',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c2026-r5','qc-handover-c2026','Stbd Fwd Heads','Sliding entrance door with lock','Loose','Loose sliding door bottom guide',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r6','qc-handover-c2026','Stbd Fwd Heads','Vanity locker with mirror','Operational','Vanity locker chaffing when opening',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r7','qc-handover-c2026','Stbd Fwd Heads','Window blinds','Proud/Alignment','Blind pulling skew when closed at blind tacs',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r8','qc-handover-c2026','Stbd Fwd Heads','corian','Scratches','Scratches on counter',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2026-r12','qc-handover-c2026','Stbd Fwd Heads','Light switch','Loose','Loose heads light switch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r13','qc-handover-c2026','Stbd Fwd Heads','Inspection lids','Missing part','Missing screw on toggle plate at headboard inspection',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r14','qc-handover-c2026','Stbd Fwd Heads','Bunk Drawers','Loose','Loose push locks at underbank drawers',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r15','qc-handover-c2026','Stbd Fwd Heads','Cabin Door','Operational','Cabin door not latching correctly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r16','qc-handover-c2026','Stbd Fwd Heads','Bilges','Cleaning','Excess sealer and clean label on forward inspection',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2026-r17','qc-handover-c2026','Stbd Fwd Heads','Inspection lids','Cleaning','Clean inside headboard inspection',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2026-r21','qc-handover-c2026','Stbd Passage','Bilges','Damage','Visible holes on bulkhead in bilge inspection',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r39','qc-handover-c2026','Owner''S Heads','Formica Bulkheads','Sealer','Neaten joint sealer forward of vanity',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r40','qc-handover-c2026','Owner''S Heads','Vanity locker with mirror','Damage','Damaged catch on vanity',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r41','qc-handover-c2026','Owner''S Heads','corian','Scratches','Scratches on Corian top',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c2026-r42','qc-handover-c2026','Owner''S Heads','Formica Bulkheads','Damage','Damaged Formica at sliding door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r46','qc-handover-c2026','Study','Draw locker','Operational','Bottom inboard drawer opening while locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r47','qc-handover-c2026','Study','Light switch','Loose','Loose light switches',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r48','qc-handover-c2026','Study','Vanity table/desk with storage locker and mirror under lid','Loose','Vanity desk loose at hinges plus proud push lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r52','qc-handover-c2026','Stbd Aft Cabin','Light switch','Loose','Loose light switch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r53','qc-handover-c2026','Stbd Aft Cabin','AC Outlets','incorrect','Outlet fitted upside down',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r54','qc-handover-c2026','Stbd Aft Cabin','Hullside vinyl panels','Missing part','Missing and broken poppers on inboard inspections',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r55','qc-handover-c2026','Stbd Aft Cabin','Bunktop/Double berth','Cracks','Crack at bulkhead in bunk top inspection',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r73','qc-handover-c2026','Saloon','Companion door','Operational','Loose handle on companionway door plus adjust door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r74','qc-handover-c2026','Saloon','Draw locker','Operational','Drawer below additional fridge opening while locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r75','qc-handover-c2026','Saloon','Galley lockers','Operational','Adjust catches on under basin lockers',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r76','qc-handover-c2026','Saloon','Draw locker','missing','Missing catch on microwave locker drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r77','qc-handover-c2026','Saloon','Fwd cockpit door','Damages','Scratches on forward cockpit door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c2026-r78','qc-handover-c2026','Saloon','Inspection lids','Proud','Aft battery locker lid warped',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r79','qc-handover-c2026','Saloon','Inspection lids','Damage','Overspray on all lids edges',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r80','qc-handover-c2026','Saloon','Vinyl ceiling','cleaning','Clean all spills on ceilings',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2026-r81','qc-handover-c2026','Saloon','Pop up lights','Loose','Loose downlights at base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c2026-r110','qc-handover-c2026','Aft Cockpit','Table','Missing','Missing cup holder on table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r111','qc-handover-c2026','Aft Cockpit','Table','Flowcoat','Spills plus neaten sealer and flange around table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r112','qc-handover-c2026','Aft Cockpit','BBQ Locker','Proud/Alignment','Barbecue locker not touching rubbers when closed',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r113','qc-handover-c2026','Aft Cockpit','Aft area','Damage','Damaged diamonds aft of main walkway',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c2026-r114','qc-handover-c2026','Aft Cockpit','Folding swimming ladder c/w teak steps','Sealer','Excess sealer at swim platform base',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r115','qc-handover-c2026','Aft Cockpit','Doors','Operational','Gullwing door not catching',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r116','qc-handover-c2026','Aft Cockpit','Guard wires across bow and stern','Proud/Alignment','Port and Starboard lifeline rails need to be tensioned plus loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r117','qc-handover-c2026','Aft Cockpit','Inspection lids','Proud/Alignment','Starboard aft inspection lid proud',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r118','qc-handover-c2026','Aft Cockpit','Inspection lids','Scratches','Starboard aft inspection lid scratches around lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r119','qc-handover-c2026','Aft Cockpit','Vinyl ceiling','Cleaning','Spills on all ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c2026-r120','qc-handover-c2026','Aft Cockpit','Vinyl ceiling','Loose','Vinyl ceilings flimsy',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r121','qc-handover-c2026','Aft Cockpit','Vinyl ceiling','Missing part','Cleat missing at port aft ceiling',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r143','qc-handover-c2026','Stbd Hull','Deck flange','Sealer','Neaten off deck joint sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r144','qc-handover-c2026','Stbd Hull','chafe plate','Sealer','Neaten sealer around all chafeplates',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r145','qc-handover-c2026','Stbd Hull','Deck flange','Scratches','Scratches on deck joint forward of chain plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r146','qc-handover-c2026','Stbd Hull','Midship area','Sealer','Neaten chain plate cover sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c2026-r147','qc-handover-c2026','Stbd Hull','Aft area','Scratches','Scratches below aft windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r148','qc-handover-c2026','Stbd Hull','Midship area','Scratches','Scratches below midship windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r149','qc-handover-c2026','Stbd Hull','Midship area','Scratches','Scratches above midship windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r153','qc-handover-c2026','Port Hull','Aft area','Repairs','Poor repair aft of hull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r154','qc-handover-c2026','Port Hull','Deck flange','Spills','Spills of hull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r155','qc-handover-c2026','Port Hull','Midship area','Scratches','Scratches below hull windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r156','qc-handover-c2026','Port Hull','Midship area','Scratches','Scratches above hull windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c2026-r157','qc-handover-c2026','Port Hull','Deck flange','Repairs','Poor repair at midship deck joint',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
commit;
select model, count(*) as audits from public.quality_control_boats where model='C2' group by model;
