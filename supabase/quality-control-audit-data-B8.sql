-- Quality Control audit import for B8 boats.
-- Renames existing reference audits to _QC3 and adds _HO_Audit boats.
-- Idempotent and non-destructive: existing defects are not overwritten.
begin;
update public.quality_control_boats set name='B8130_QC3' where id='qc-reference-b8130';
update public.quality_control_boats set name='B8129_QC3' where id='qc-reference-b8129';
update public.quality_control_boats set name='B8128_QC3' where id='qc-reference-b8128';
update public.quality_control_boats set name='B8127_QC3' where id='qc-reference-b8127';
update public.quality_control_boats set name='B8126_QC3' where id='qc-reference-b8126';
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b8126','B8126_HO_Audit','B8') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Saloon',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Stbd Fwd Cabin',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Stbd Fwd Heads',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Stb Pessage',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Stbd Aft Heads',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Stbd Aft Cabin',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Port Fwd Cabin',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Port Fwd Heads',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Port Passage',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Port Aft Heads',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Port Aft Cabin',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Aft Cockpit',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Flybridge',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Fwd Cockpit & Foredeck',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Stb Deck',14) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8126','Port Deck',15) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b8126-r4','qc-handover-b8126','Saloon','Galley lockers','Operational','Adjust Door Fwd Of Freezer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r5','qc-handover-b8126','Saloon','Floor','Damage','Damage Floor Below Small freezer',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-b8126-r6','qc-handover-b8126','Saloon','Galley lockers','Operational','Adjust Locker Door Abive Small Freezer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r7','qc-handover-b8126','Saloon','Doors','Scratches','Scratches On Fwd Door Perspex',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8126-r8','qc-handover-b8126','Saloon','Doors','Cleaning','Remove Plastic From Door Lock',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r9','qc-handover-b8126','Saloon','Vinyl ceiling','Proud/Alignment','Port Side Vinyl Panels Stepping " Check All Panels "',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r10','qc-handover-b8126','Saloon','Vinyl ceiling','Cleaning','Remove Masking Tape Underneath All Vinyl Panels " Please Blom Team Leader "',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r11','qc-handover-b8126','Saloon','Companion door','Loose','Loose Companionway Door Barrel Box Cover',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r12','qc-handover-b8126','Saloon','Ceiling Liner','Damage','Neaten Fible Glass Inside Port Aircon Insoection locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r40','qc-handover-b8126','Stbd Fwd Cabin','Cabin Door','Damage','Damage Edging By Door Lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r41','qc-handover-b8126','Stbd Fwd Cabin','Light switch','Damage','Damage lobby Light Switch Cover',7,'Electrical',false,'','','','',''),
  ('qc-handover-b8126-r42','qc-handover-b8126','Stbd Fwd Cabin','Formica Bulkheads','Damage','Damage Poppers On Bed Headboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r43','qc-handover-b8126','Stbd Fwd Cabin','Vinyl panels','Cleaning','Clean All Vinyl Panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r44','qc-handover-b8126','Stbd Fwd Cabin','Formica Bulkheads','Damage','Untreated wood Behind Headboard Below Gas Locker module',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r45','qc-handover-b8126','Stbd Fwd Cabin','Window blinds','Damage','Window Blimd Slats Damages " Check All "',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r46','qc-handover-b8126','Stbd Fwd Cabin','Vinyl panels','Cleaning','Clean All Vinyl Panels & Formica Bulkheads As Mark',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r47','qc-handover-b8126','Stbd Fwd Cabin','Light switch','Loose','Aft Bed Light Switch Damages',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r48','qc-handover-b8126','Stbd Fwd Cabin','Frame','Sealer','Touch Up Sealer By Fwd Heads Door Capping & Overspray On Bulkheads & Vinyl',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r49','qc-handover-b8126','Stbd Fwd Cabin','Fan','Cleaning','Dusty Cabin Fan',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r55','qc-handover-b8126','Stbd Fwd Heads','Perspex','Scratches','Scratches On Shower Divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8126-r56','qc-handover-b8126','Stbd Fwd Heads','Vanity table/desk with storage locker and mirror under lid','Cleaning','Remove Sticker By Vanyte Locker Door Catch & Hinges Loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r57','qc-handover-b8126','Stbd Fwd Heads','window surround','Pinholes','& Poor Repair On Window Transition Aft Top Side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r58','qc-handover-b8126','Stbd Fwd Heads','Coat hook','Cleaning','Excess Glue By Coat hook Base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r59','qc-handover-b8126','Stbd Fwd Heads','Stainlesteel','Cleaning','Remove Plastic Bottom Of Door Capping " Check Port Side Aswell "',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r65','qc-handover-b8126','Stb Pessage','Aft area','Scratches','Scratches By Inboard Coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r66','qc-handover-b8126','Stb Pessage','Staircase','Scratches','Buff Entire Stairway Grp Smooth Surface & Remove Plastic From S/Steel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r71','qc-handover-b8126','Stbd Aft Heads','window surround','Repairs','Repairs On Transtions Window Surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r72','qc-handover-b8126','Stbd Aft Heads','Doors','Operational','Sliding Door Not Running Smoothly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r77','qc-handover-b8126','Stbd Aft Cabin','Cabin Door','Damage','Damage Edging By Door Lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r78','qc-handover-b8126','Stbd Aft Cabin','Vinyl panels','Cleaning','Remove Masking Tape From Ceiling Velcro & Clean All Vinyl Panels & Formica Bulkheads',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r79','qc-handover-b8126','Stbd Aft Cabin','Vinyl ceiling','Cleaning','Remove Cable Ties Inside Aircon Inspection Locker Aft Side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r80','qc-handover-b8126','Stbd Aft Cabin','Fan','Cleaning','Dusty Cabin Fan',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r108','qc-handover-b8126','Port Fwd Cabin','Vinyl panels','Cleaning','Clean Pencil Marks By Fwd Bed Head Light & All Vinyl Panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r109','qc-handover-b8126','Port Fwd Cabin','Fan','Loose','Fan Loose At Base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r110','qc-handover-b8126','Port Fwd Cabin','Vinyl ceiling','Damage','Inboard Ceiling Vinyl Panel Damage Aft Corner',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r111','qc-handover-b8126','Port Fwd Cabin','Forepeak panel','Cleaning','Remove Masking Tape From Bow Truster lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r112','qc-handover-b8126','Port Fwd Cabin','Light switch','Proud/Alignment','Lobby Light Switch Fitted Skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r113','qc-handover-b8126','Port Fwd Cabin','Floor','Proud/Alignment','Lobby Floorboard To Tight',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r116','qc-handover-b8126','Port Fwd Heads','Doors','Operational','Heads Sliding Door Not Running Smoothly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r117','qc-handover-b8126','Port Fwd Heads','Formica Bulkheads','Sealer','Entire Heads Sealer Yellowing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r118','qc-handover-b8126','Port Fwd Heads','Perspex','Scratches','Scratches In Shower Divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8126-r119','qc-handover-b8126','Port Fwd Heads','Under-basin locker with toilet roll holder','Loose','Strap Bin Inside Basn Locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r123','qc-handover-b8126','Port Passage','Galley lockers','Sealer','Excess Bonding Above inboard Locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r129','qc-handover-b8126','Port Aft Heads','Doors','Operational','Sliding Door Not Running Smoothly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r135','qc-handover-b8126','Port Aft Cabin','Ceiling Liner','Scratches','Scratches & Dull By Vent Smooth Surface Grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r136','qc-handover-b8126','Port Aft Cabin','Vinyl ceiling','Cleaning','Clean Entire Cabin Vinyl & Formica Bulkheads',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8126-r142','qc-handover-b8126','Aft Cockpit','Folding swimming ladder c/w teak steps','Operational','Swim Ladder Bolts Loose And Chaffing When Fully Open',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r143','qc-handover-b8126','Aft Cockpit','Ceiling Liner','Repairs','Repairs By Davit Motor Coaming Port Side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r144','qc-handover-b8126','Aft Cockpit','Ceiling Liner','Repairs','Stb Davit Motor Cover Fitted To Tight Again Stainless Pole',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r145','qc-handover-b8126','Aft Cockpit','Vinyl panels','Proud/Alignment','All Vinyl Panels Stepping',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r146','qc-handover-b8126','Aft Cockpit','Ceiling Liner','Scratches','Dull Patches On Aft Ceiling Liner Grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r147','qc-handover-b8126','Aft Cockpit','Stainlesteel','Cleaning','Clean Diving Tank Stainless',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r148','qc-handover-b8126','Aft Cockpit','Table','Scratches','Buff Entire Table Smooth Surface Grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r181','qc-handover-b8126','Flybridge','Targawing','Sealer','Neaten sealer on panel below starboard targa wing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r182','qc-handover-b8126','Flybridge','Targawing','Scratches','Spillsand scratches forward of starboard targa wing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r183','qc-handover-b8126','Flybridge','Floor','Scratches','Scratches on coaming forward of wet bar locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r184','qc-handover-b8126','Flybridge','Wetbar','Loose','Wet bar forward locker catch loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r185','qc-handover-b8126','Flybridge','Vinyl ceiling','Proud/Alignment','Bimini off-white vinyl panels not flush',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r186','qc-handover-b8126','Flybridge','Targawing','Repairs','Poor repairs forward and aft of teflon panel below port targa wing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r187','qc-handover-b8126','Flybridge','Targawing','Sealer','Neaten sealer forward and aft of port targa wing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r188','qc-handover-b8126','Flybridge','Fwd area','Cleaning','Excess glue below port forward windshield',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r189','qc-handover-b8126','Flybridge','Bimini','Repairs','Poor repair and excess flow coat on Bimini forward flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r190','qc-handover-b8126','Flybridge','Helmstation','Proud/Alignment','Warning lables below steering wheel fitted skew',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r213','qc-handover-b8126','Fwd Cockpit & Foredeck','Ceiling','Defect','Pencil marks above forward cockpit door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r214','qc-handover-b8126','Fwd Cockpit & Foredeck','Ceiling','Defect','Excess sealer smears above forward cockpit door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r215','qc-handover-b8126','Fwd Cockpit & Foredeck','Fwd cockpit door','Defect','Excess sealer on starboard side wall of forward cockpit',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r216','qc-handover-b8126','Fwd Cockpit & Foredeck','Aft area','Defect','Excess sealer aft of port sunbed coaming',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r217','qc-handover-b8126','Fwd Cockpit & Foredeck','Drinks holders - 2 in fwd cockpit and 1 at helm','Defect','Spills on port stainless steel cup holder',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r218','qc-handover-b8126','Fwd Cockpit & Foredeck','Lockers','Defect','Spills on coaming port side above gas locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r219','qc-handover-b8126','Fwd Cockpit & Foredeck','Lids','Defect','Spills on port lid flange',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r220','qc-handover-b8126','Fwd Cockpit & Foredeck','Anchor/windlass locker','Defect','Remove plastic on mooring cleat inside anchor locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8126-r221','qc-handover-b8126','Fwd Cockpit & Foredeck','Anchor/windlass locker','Defect','Cable tie missing on anchor bridle shackle',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r222','qc-handover-b8126','Fwd Cockpit & Foredeck','Lids','Defect','Poor repair on anchor locker lid inner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r248','qc-handover-b8126','Stb Deck','Decklid','Defect','Buff entire deck lid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r249','qc-handover-b8126','Stb Deck','Decklid','Defect','Dent on deck lid above forward end of handrail by 2nd stud',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r250','qc-handover-b8126','Stb Deck','side deck step','Defect','Crack on outboard toe rail coaming above aft step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r251','qc-handover-b8126','Stb Deck','Flush Hatch over cabins','Defect','Residue on hatch lid hinges',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r252','qc-handover-b8126','Stb Deck','Bows','Defect','Poor repairs + wavy bow GRP',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r281','qc-handover-b8126','Port Deck','Decklid','Defect','Buff entire deck lid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r282','qc-handover-b8126','Port Deck','Floor','Defect','Scuffs marks on coaming inboard of side deck by aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8126-r283','qc-handover-b8126','Port Deck','Fuel deck fillers','Defect','Clean fuel filler caps',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r284','qc-handover-b8126','Port Deck','Flush Hatch over cabins','Defect','Residue on hatch lid hinges',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8126-r285','qc-handover-b8126','Port Deck','Bows','Defect','Wavy bow GRP',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b8127','B8127_HO_Audit','B8') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Port Hull',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Stbd Hull',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Aft Cockpit',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Stbd Side Deck',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Port Side Deck',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Flybridge',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Forward Cockpit',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Saloon',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Stbd Aft Cabin',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Stbd Aft Heads',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Stbd Fwd Heads',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Stbd Fwd Cabin',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Port Aft Heads',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Port Aft Cabin',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Port Passage',14) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Port Fwd Heads',15) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8127','Port Fwd Cabin',16) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b8127-r4','qc-handover-b8127','Port Hull','Deck flange','Scratches','scratches on aft flange coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r5','qc-handover-b8127','Port Hull','Deck flange','Scratches','dull on outboard tow rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r9','qc-handover-b8127','Stbd Hull','Deck flange','Scratches','dull on outboard tow rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r10','qc-handover-b8127','Stbd Hull','Deck flange','Scratches','scratches on aft flange coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r45','qc-handover-b8127','Aft Cockpit','Transom','Cleaning','stb + port bumper rubbers',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8127-r46','qc-handover-b8127','Aft Cockpit','Transom','Sealer','poor sealer on stb bumper rubber',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8127-r47','qc-handover-b8127','Aft Cockpit','Transom','Cleaning','remobe plastic below transom steps',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8127-r48','qc-handover-b8127','Aft Cockpit','Decklid','Scratches','thin gelcoat at aft decklid + dull on entire flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r49','qc-handover-b8127','Aft Cockpit','Decklid','Cleaning','spills on all stainless steel',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8127-r50','qc-handover-b8127','Aft Cockpit','Decklid','Loose','shackles at davit lines',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8127-r54','qc-handover-b8127','Stbd Side Deck','Decklid','Scratches','dull on entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r55','qc-handover-b8127','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','all stanchion bases + poles',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8127-r58','qc-handover-b8127','Port Side Deck','Decklid','Scratches','dull on entire decklid + remove yellow tape',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r59','qc-handover-b8127','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','all stanchion bases + poles',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8127-r60','qc-handover-b8127','Port Side Deck','Hatch','Cleaning','clean all deck hatches',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8127-r61','qc-handover-b8127','Port Side Deck','Floating step','Spills','at fwd deck hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r64','qc-handover-b8127','Flybridge','Windows','Scratches','on all windshields',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8127-r65','qc-handover-b8127','Flybridge','Basin module','Scratches','on flybridge wetbar grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r66','qc-handover-b8127','Flybridge','Ceiling','Proud/Alignment','on centre ceiling panel',7,'Electrical',false,'','','','',''),
  ('qc-handover-b8127-r68','qc-handover-b8127','Forward Cockpit','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','all stanchions + bases',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8127-r86','qc-handover-b8127','Saloon','Locker lids','Loose','push lock on charging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r87','qc-handover-b8127','Saloon','Vinyl ceiling','Cleaning','remove all masking tape on all ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r88','qc-handover-b8127','Saloon','Tv locker','Loose','hinges on tv kocker lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r89','qc-handover-b8127','Saloon','S/S cupholder','Scratches','on cupholder stainless steel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r90','qc-handover-b8127','Saloon','Fwd cockpit door','Scratches','on fwd cockpit door',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r91','qc-handover-b8127','Saloon','Floating step','sealer','poor sealer at stb passage below at galley',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r92','qc-handover-b8127','Saloon','Vinyl ceiling','Cleaning','clean all vynil ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r96','qc-handover-b8127','Stbd Aft Cabin','USB outlets in each cabin','proud/alignment','skew aft inboard outlet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r97','qc-handover-b8127','Stbd Aft Cabin','Vinyl ceiling','cleaning','remove masking tape on all vynil panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r98','qc-handover-b8127','Stbd Aft Cabin','Windows','scratches','on hull window + portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8127-r100','qc-handover-b8127','Stbd Aft Heads','Sliding entrance door with lock','damage','burred screws on door magnet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r101','qc-handover-b8127','Stbd Aft Heads','Sliding entrance door with lock','Sealer','poor sealer at fwd door capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r102','qc-handover-b8127','Stbd Aft Heads','Under-basin locker with toilet roll holder','Proud/Alignment','proud basin locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r105','qc-handover-b8127','Stbd Fwd Heads','Holding tanks','Cleaning','remove wood below waste tank locker + inside at holding tank',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r106','qc-handover-b8127','Stbd Fwd Heads','Windows','Scratches','on hull window + portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8127-r107','qc-handover-b8127','Stbd Fwd Heads','Window blinds','Loose','adjust blind + blind tac',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r110','qc-handover-b8127','Stbd Fwd Cabin','Formica Bulkheads','Loose','poor joint at fwd inboard formica bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r111','qc-handover-b8127','Stbd Fwd Cabin','Vents','Cleaning','inside inboard vent',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r112','qc-handover-b8127','Stbd Fwd Cabin','Hanging locker','Loose','hinges on hanging locker doors + adjust catches',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r113','qc-handover-b8127','Stbd Fwd Cabin','Bunktop/Double berth','Loose','aft bunk fiddle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r114','qc-handover-b8127','Stbd Fwd Cabin','Light switch','Proud/Alignment','skew light switch at headboard + remove plastic',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r125','qc-handover-b8127','Port Aft Heads','Ceiling','sealer','yellow sealer on entire heads surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r126','qc-handover-b8127','Port Aft Heads','Ceiling','Sealer','yellow sealer at vanity surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r129','qc-handover-b8127','Port Aft Cabin','Bunk Liners','scratches','on entire inboard bunk liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r130','qc-handover-b8127','Port Aft Cabin','Cabin Door','damage','burred screws on cabin door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r131','qc-handover-b8127','Port Aft Cabin','Vinyl ceiling','Cleaning','all vynil ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r135','qc-handover-b8127','Port Passage','Floor','cleaning','overspray at outboard bottom formica capping',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8127-r136','qc-handover-b8127','Port Passage','Hanging locker','loose','fit inspection lid inspoection hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r138','qc-handover-b8127','Port Fwd Heads','Holding tanks','loose','toggle plate',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r139','qc-handover-b8127','Port Fwd Heads','Dedicated trashcan locker','Loose','bunjy cord inside buin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r140','qc-handover-b8127','Port Fwd Heads','Holding tanks','Cleaning','builder dust inside at holding tank',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r141','qc-handover-b8127','Port Fwd Heads','Coat hook','loose','coat hook base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r142','qc-handover-b8127','Port Fwd Heads','Formica Bulkheads','sealer','yellow sealer at sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r143','qc-handover-b8127','Port Fwd Heads','Ceiling','sealer','yellow sealer at entire ceiling joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r146','qc-handover-b8127','Port Fwd Cabin','Cabin Door','Cleaning','excess sealer at door capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r147','qc-handover-b8127','Port Fwd Cabin','Bedside cave locker inboard','Loose','hinges on crawlthrough locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r148','qc-handover-b8127','Port Fwd Cabin','Bedside cave locker inboard','Cleaning','remove tape inside at cav locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8127-r149','qc-handover-b8127','Port Fwd Cabin','Floating step','Cracks','inside at cav locker floating steps + poor flowcoat as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r167','qc-handover-b8127','Port Hull','Deck flange','Repairs','poor repairs on aft hull flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r168','qc-handover-b8127','Port Hull','Deck flange','Sealer','poor sealer on entire deckjoint',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8127-r169','qc-handover-b8127','Port Hull','Windows','Scratches','on all hull windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8127-r170','qc-handover-b8127','Port Hull','Deck flange','Repairs','on midship deck flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r171','qc-handover-b8127','Port Hull','chain plate','Sealer','poor selaer on chainplate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8127-r172','qc-handover-b8127','Port Hull','Deck flange','Repairs','bubble oin fwd tow rail of chainplate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r173','qc-handover-b8127','Port Hull','Deck flange','Repairs','below at hull midship bottom side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8127-r174','qc-handover-b8127','Port Hull','Deck flange','Scratches','dull on entire hull',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b8129','B8129_HO_Audit','B8') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Aft Cockpit',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Saloon',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Stbd Fwd Heads',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Stbd Study & Passage',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Port Fwd Cabin',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Port Fwd Heads',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Port Passage',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Port Aft Cabin',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Port Aft Heads',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Flybridge',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Port Side Deck',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Stbd Side Deck',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Fwd Cockpit & Foredeck',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Stbd Hull',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8129','Port Hull',14) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b8129-r4','qc-handover-b8129','Aft Cockpit','Folding swimming ladder c/w teak steps','Incorrect','not enough thread on catch at swim ladder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r5','qc-handover-b8129','Aft Cockpit','Folding swimming ladder c/w teak steps','Sealer','teak spliting fwd of swim ladder base',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r6','qc-handover-b8129','Aft Cockpit','Folding swimming ladder c/w teak steps','Cleaning','rust on swim ladder bolts (check all)',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r7','qc-handover-b8129','Aft Cockpit','Floor','Sealer','excess sealer at oeot transom joint',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r8','qc-handover-b8129','Aft Cockpit','Mooring cleats','Cleaning','remove plastic on mooring cleats',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r9','qc-handover-b8129','Aft Cockpit','Deck flange','Repairs','around lifting platform handle',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r10','qc-handover-b8129','Aft Cockpit','Table','Damage','chips on aft table surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r11','qc-handover-b8129','Aft Cockpit','Table','Scratches','dull on entire table surround + clean bottom side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r12','qc-handover-b8129','Aft Cockpit','Deck flange','Scratches','scratches on port transom above port transom window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r13','qc-handover-b8129','Aft Cockpit','Targawing','Sealer','yellow sealer below STB Targawing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r14','qc-handover-b8129','Aft Cockpit','Vinyl ceiling','Proud/Alignment','aft cockpit ceilings Stepping+ clean all ceiling panels',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r15','qc-handover-b8129','Aft Cockpit','Companion door','Loose','loose bolts STB of Valence',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r16','qc-handover-b8129','Aft Cockpit','Windows','Scratches','On STB + port transom windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8129-r40','qc-handover-b8129','Saloon','Draw locker','Operational','galley locker drawers knocking while opening',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r41','qc-handover-b8129','Saloon','Fridge/Freezer locker','Missing part','missing screws on catch inspection lid above fridge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r42','qc-handover-b8129','Saloon','Companion door','Proud/Alignment','proud bolts on companion way door lock',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r43','qc-handover-b8129','Saloon','Fridge/Freezer locker','Damage','On fridge door fwd side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r44','qc-handover-b8129','Saloon','Hanging locker','Proud/Alignment','proud locker door above freezer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r45','qc-handover-b8129','Saloon','Galley lockers','Cleaning','clean all galley locker drawers',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r46','qc-handover-b8129','Saloon','Window blinds','Operational','twisted fwd door window blind',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r47','qc-handover-b8129','Saloon','Ceiling Liner','Spills','port of fwd door blind top flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r48','qc-handover-b8129','Saloon','AC/DC locker','Repairs','visible holes in AC/DC on GRP box',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r49','qc-handover-b8129','Saloon','Vinyl ceiling','Missing part','valcro on STB + port ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r50','qc-handover-b8129','Saloon','AC/DC locker','Scratches','On stainless steel above AC /DC',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r51','qc-handover-b8129','Saloon','corian','Scratches','deep Scratches on corion at HOB + drip tray inspection',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8129-r52','qc-handover-b8129','Saloon','window surround','Scratches','below port aft mullion in saloon',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r53','qc-handover-b8129','Saloon','Vinyl ceiling','Damage','damage on Stb vynil panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r54','qc-handover-b8129','Saloon','Fwd cockpit door','Scratches','On fwd door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8129-r55','qc-handover-b8129','Saloon','Draw locker','Operational','galley locker drawer fwd of Freezer opening while locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r75','qc-handover-b8129','Stbd Fwd Heads','Hatch','Loose','hatfh handle (check all)',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r76','qc-handover-b8129','Stbd Fwd Heads','Door surround','repairs','poor repairs outboard or fwd door',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r77','qc-handover-b8129','Stbd Fwd Heads','Electric sea water flush toilet','cleaning','spills on toilet bowl surround',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8129-r80','qc-handover-b8129','Stbd Study & Passage','Floor','cleaning','remove green inside bilge fwd bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r81','qc-handover-b8129','Stbd Study & Passage','Hanging locker','damage','on hanging locker doors + remove plastic on hinges (check all)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r82','qc-handover-b8129','Stbd Study & Passage','Sliding entrance door with lock','loose','catch on sliding door aft catch+ loose bolts on door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r83','qc-handover-b8129','Stbd Study & Passage','Vinyl ceiling','cleaning','remove all masking tape on vynil panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r84','qc-handover-b8129','Stbd Study & Passage','Aircon unit','crack','On aircon platform above bunk',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r85','qc-handover-b8129','Stbd Study & Passage','Ceiling Liner','scratches','deep scratches on aft ceiling surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r111','qc-handover-b8129','Port Fwd Cabin','Bunktop/Double berth','damage','bunk headboard bottom side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r112','qc-handover-b8129','Port Fwd Cabin','Locker lids','Cleaning','inside forepeak inspection',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r113','qc-handover-b8129','Port Fwd Cabin','fan','loose','fan base + clean blades',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r114','qc-handover-b8129','Port Fwd Cabin','Fan','incorrect','missing wiring cut out on fan wire',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r115','qc-handover-b8129','Port Fwd Cabin','Bunk Liners','damage','fwd of walkthrough bottom post',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r116','qc-handover-b8129','Port Fwd Cabin','Bunktop/Double berth','Cleaning','clean thinners stains below mattress + residue',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r119','qc-handover-b8129','Port Fwd Heads','Floor','repairs','sand marks in tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r120','qc-handover-b8129','Port Fwd Heads','Floor','repairs','yellow GRP fwd of sump',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r121','qc-handover-b8129','Port Fwd Heads','Holding tanks','Cleaning','debris behind holdong tank',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8129-r122','qc-handover-b8129','Port Fwd Heads','Dedicated trashcan locker','Loose','steps bin inside bin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r123','qc-handover-b8129','Port Fwd Heads','Windows','scratches','on portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8129-r124','qc-handover-b8129','Port Fwd Heads','Formica Bulkheads','sealer','yellow sealer on fwd bunlkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r125','qc-handover-b8129','Port Fwd Heads','Ceiling','Cleaning','spills on ceiling surround',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8129-r128','qc-handover-b8129','Port Passage','Formica Bulkheads','Cleaning','glue skills on inboard + outboards bulkheads',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r129','qc-handover-b8129','Port Passage','Solids','Damage','on aft door capping surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b8129-r152','qc-handover-b8129','Port Aft Cabin','Ceiling Liner','Scratches','dull on inboard ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r153','qc-handover-b8129','Port Aft Cabin','Vinyl ceiling','Cleaning','clean all vynil ceiling panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r154','qc-handover-b8129','Port Aft Cabin','2 x LED reading lamps over bunk','Operational','both aft reading light operating skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r155','qc-handover-b8129','Port Aft Cabin','Window blinds','Proud/Alignment','skew aft transom blinds',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r156','qc-handover-b8129','Port Aft Cabin','Window blinds','Missing part','valcro strip pelmet not fitted',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r157','qc-handover-b8129','Port Aft Cabin','Bunktop/Double berth','Loose','outboard bunk fiddle loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r158','qc-handover-b8129','Port Aft Cabin','Floor','Cleaning','clean around fuel locker surround',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8129-r159','qc-handover-b8129','Port Aft Cabin','Floor','Sealer','poor floor sealer fwd of bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r160','qc-handover-b8129','Port Aft Cabin','Ceiling','Proud/Alignment','protruding screws inside aft ceiling inspection',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r161','qc-handover-b8129','Port Aft Cabin','Cabin Door','Proud/Alignment','cabin door handle sagging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r162','qc-handover-b8129','Port Aft Cabin','Fan','Cleaning','dust on fan blades',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8129-r163','qc-handover-b8129','Port Aft Cabin','Door surround','Scratches','on fwd stainless steel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r166','qc-handover-b8129','Port Aft Heads','Double towel rail','Sealer','yellow sealer above towel rail surround + fwd surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r190','qc-handover-b8129','Flybridge','Targawing','Sealer','Neaten sealer at Starboard targawing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r191','qc-handover-b8129','Flybridge','Aft area','Pinholes','Pinholes at stern light',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r192','qc-handover-b8129','Flybridge','Aft area','Scratches','Scratches and dull at aft flange at stantions',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r193','qc-handover-b8129','Flybridge','Ceiling','Loose','Rope light bracket loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r194','qc-handover-b8129','Flybridge','Vinyl ceiling','Proud/Alignment','Fit all ceiling panels and check for alignment + clean',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r195','qc-handover-b8129','Flybridge','Deck flange','Damage','Chips on bimini flange above port targawing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r201','qc-handover-b8129','Port Side Deck','Decklid','Scratches','Scratches and dull on decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r202','qc-handover-b8129','Port Side Deck','Hatch','Missing part','Fit all no step labels',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r203','qc-handover-b8129','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Clean all stantions',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8129-r204','qc-handover-b8129','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Proud/Alignment','Skew stantions as marked',4,'Deckfitting',true,'','','','',''),
  ('qc-handover-b8129-r205','qc-handover-b8129','Port Side Deck','Bows','Repairs','Wavy bow',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-b8129-r210','qc-handover-b8129','Stbd Side Deck','Decklid','Scratches','Scratches on deck lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r211','qc-handover-b8129','Stbd Side Deck','Bows','Repairs','Poor repairs on bow',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-b8129-r212','qc-handover-b8129','Stbd Side Deck','Hatch','Missing part','Fit no step labels',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r213','qc-handover-b8129','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Remove all plastic and clean stantions',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8129-r214','qc-handover-b8129','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Proud/Alignment','Skew stantions as marked',4,'Deckfitting',true,'','','','',''),
  ('qc-handover-b8129-r231','qc-handover-b8129','Fwd Cockpit & Foredeck','Locker lids','Loose','Loose rubbers inside lockers',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r232','qc-handover-b8129','Fwd Cockpit & Foredeck','Fwd area','Sealer','Excess sealer on cushion poppers',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r233','qc-handover-b8129','Fwd Cockpit & Foredeck','Floor','Spills','Spills on foredeck',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r234','qc-handover-b8129','Fwd Cockpit & Foredeck','Decklid','Scratches','buff entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r239','qc-handover-b8129','Stbd Hull','Aft area','Repair','Poor repair at aft flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r240','qc-handover-b8129','Stbd Hull','Aft area','Sealer','Neaten aft deck joint sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r241','qc-handover-b8129','Stbd Hull','Aft area','Repair','Poor repair at aft chafe plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r242','qc-handover-b8129','Stbd Hull','Exterior','Sealer','Neaten sealer around all the chafe plates',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8129-r243','qc-handover-b8129','Stbd Hull','Midship area','Scratches','Scratches and dull area above windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r244','qc-handover-b8129','Stbd Hull','Fwd area','Porosity','Porosity above second window on knuckle',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r249','qc-handover-b8129','Port Hull','Aft area','Repairs','Mold marks at scratches above windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r250','qc-handover-b8129','Port Hull','Midship area','Damage','Scruff marks below windows',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r251','qc-handover-b8129','Port Hull','Deck flange','Pinholes','Pinholes at deck joint forward of midship mooring cleat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8129-r252','qc-handover-b8129','Port Hull','Midship area','Scratches','Deep scratches above midship windows',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b8130','B8130_HO_Audit','B8') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Stbd Hull',0) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Port Hull',1) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Aft Cockpit',2) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Port Side Deck',3) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Fwd Cockpit & Foredeck',4) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Stbd Side Deck',5) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Flybridge',6) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Saloon',7) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Forepeak',8) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Port Fwd Cabin',9) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Port Fwd Heads',10) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Port Passage',11) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Port Aft Heads',12) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Port Aft Cabin',13) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Stbd Fwd Cabin',14) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Stbd Fwd Heads',15) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Stbd Aft Heads',16) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_areas (boat_id,area_name,sort_order) values ('qc-handover-b8130','Stbd Aft Cabin',17) on conflict (boat_id,area_name) do nothing;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b8130-r4','qc-handover-b8130','Stbd Hull','Deck flange','Repairs','poor repairs ,pinholes and Scratches on entire deck joint',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r5','qc-handover-b8130','Stbd Hull','Deck flange','Sealer','sealer entire deck joint',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r6','qc-handover-b8130','Stbd Hull','Guard wires with stanchions, bases, port & starboard side gates','Damage','on mid guardrail base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r7','qc-handover-b8130','Stbd Hull','Deck flange','Scratches','dull on aft hull surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r12','qc-handover-b8130','Port Hull','Deck flange','Repairs','poor repairs on entire tow rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r13','qc-handover-b8130','Port Hull','Windows','Scratches','on entire hull windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r43','qc-handover-b8130','Aft Cockpit','Folding swimming ladder c/w teak steps','Sealer','poor sealer around swim ladder bases',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r44','qc-handover-b8130','Aft Cockpit','Floor','Track repairs','poor track repair aft of STB sump',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r45','qc-handover-b8130','Aft Cockpit','Locker lids','Scratches','around STB engine lid + water channel on lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r46','qc-handover-b8130','Aft Cockpit','Locker lids','Cleaning','around STB + port engine room water channels',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r47','qc-handover-b8130','Aft Cockpit','Locker lids','Scratches','on port engine room lid surround + water channel on lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r48','qc-handover-b8130','Aft Cockpit','Locker lids','Loose','remove plastic on port engine room lid',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r49','qc-handover-b8130','Aft Cockpit','Decklid','Cleaning','spills on all stainless steel posts + fittings',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r50','qc-handover-b8130','Aft Cockpit','Decklid','Repairs','around davit motor cut out surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r51','qc-handover-b8130','Aft Cockpit','Floating step','Loose','STB + port aft cockpit steps',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r52','qc-handover-b8130','Aft Cockpit','Table','Proud/Alignment','dome nut proud below table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r53','qc-handover-b8130','Aft Cockpit','Floor','Cracks','port of sump lid in water channel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r57','qc-handover-b8130','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','mid stanchion base + rails',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r58','qc-handover-b8130','Port Side Deck','Decklid','Scratches','dull on entire decklid smooth coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r59','qc-handover-b8130','Port Side Deck','Hatch','Missing part','missing no step labels on hatch',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r63','qc-handover-b8130','Fwd Cockpit & Foredeck','Decklid','Scratches','on decklid sunbed waterlines',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r64','qc-handover-b8130','Fwd Cockpit & Foredeck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','clean all stainless steel fittings',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r67','qc-handover-b8130','Stbd Side Deck','Bows','Repairs','repairs + spills on STB bow',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r68','qc-handover-b8130','Stbd Side Deck','Hatch','Missing part','no step labels on hatch',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r69','qc-handover-b8130','Stbd Side Deck','Decklid','Scratches','on entire declikd smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r70','qc-handover-b8130','Stbd Side Deck','Targawing','Proud/Alignment','skew blower covers below decals',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r78','qc-handover-b8130','Flybridge','Flybridge steps','scratches','scratches on Flybridge steps coamings (check all)',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r79','qc-handover-b8130','Flybridge','hardtop','scratches','aft on hardtop entire coaming at rope light + buff aft decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r80','qc-handover-b8130','Flybridge','Helmstation','proud','proud screw on helm station',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r81','qc-handover-b8130','Flybridge','Bimini','cleaning','clean all stainless steel poles',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b8130-r82','qc-handover-b8130','Flybridge','BBQ','cleaning','rust marks aft of BBQ',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r83','qc-handover-b8130','Flybridge','Targawing','scratches','dull on STB + port Targa wing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r84','qc-handover-b8130','Flybridge','Windows','scratches','on all windshield surrounds',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r85','qc-handover-b8130','Flybridge','Helmstation','scratches','On grey helm pod',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r86','qc-handover-b8130','Flybridge','Bimini','flowcoat','missing flowcoat fwd on Bimini + remove green sticker STB outboard side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r117','qc-handover-b8130','Saloon','Lockers','loose','locker unit above dishwasher',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r118','qc-handover-b8130','Saloon','Lockers','loose','light switch cover above dishwasher',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r119','qc-handover-b8130','Saloon','Draw locker','loose','loose push lock on pot drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r120','qc-handover-b8130','Saloon','Companion door','sealer','poor sealer at companion way door top side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r121','qc-handover-b8130','Saloon','Vinyl ceiling','proud','ceiling panels stepping + clean all',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r122','qc-handover-b8130','Saloon','AC/DC locker','scratches','scratches on stainless steel above A/DC panel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r123','qc-handover-b8130','Saloon','Table','scratches','scratches on table bases',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r155','qc-handover-b8130','Forepeak','Locker lids','Missing part','Velcro on bow thruster lid + remove plastic',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r159','qc-handover-b8130','Port Fwd Cabin','Doors','Cleaning','yellow Stains on fwd bottom fabric at forepeak',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r160','qc-handover-b8130','Port Fwd Cabin','Vinyl ceiling','Cleaning','clean ceiling vynil panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r161','qc-handover-b8130','Port Fwd Cabin','Hatch','Proud/Alignment','inboard hatch liner not flush',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r162','qc-handover-b8130','Port Fwd Cabin','Portlight hull side','Scratches','on portlight+ hull window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r163','qc-handover-b8130','Port Fwd Cabin','Ceiling','Scratches','aft of hatch on liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r164','qc-handover-b8130','Port Fwd Cabin','Cabin Door','Operational','door handle difficult when latching',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r165','qc-handover-b8130','Port Fwd Cabin','Cabin Door','Proud/Alignment','poorly fitted screw on inboard top door capping + remove tape',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r169','qc-handover-b8130','Port Fwd Heads','Heads bulkhead module','Sealer','poor + yellow sealer on fwd bulkhead joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r170','qc-handover-b8130','Port Fwd Heads','Waste tank','Cleaning','remove debris at holding tank surround',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b8130-r171','qc-handover-b8130','Port Fwd Heads','Dedicated trashcan locker','Missing part','missing strap in bin',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r172','qc-handover-b8130','Port Fwd Heads','Floor','Track repairs','visible track repair in heads',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r176','qc-handover-b8130','Port Passage','Solids','Damage','poor spray on door capping inboard side',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b8130-r177','qc-handover-b8130','Port Passage','Hanging locker','Operational','adjust locker doors',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r178','qc-handover-b8130','Port Passage','Staircase','Damage','poor edging at stairway fwd bottom side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r179','qc-handover-b8130','Port Passage','Staircase','Loose','top step stainless steel capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r180','qc-handover-b8130','Port Passage','Staircase','Scratches','below bottom step smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r181','qc-handover-b8130','Port Passage','Solids','Damage','aft door capping two tone on surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b8130-r182','qc-handover-b8130','Port Passage','Staircase','Sealer','loose sealer at aft Formica pelmet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r191','qc-handover-b8130','Port Aft Heads','corian','Scratches','on corion surround',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r192','qc-handover-b8130','Port Aft Heads','Formica Bulkheads','Sealer','visible joint at aft bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r193','qc-handover-b8130','Port Aft Heads','Vanity locker with mirror','Operational','vanity locker door chaffing when operating',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r194','qc-handover-b8130','Port Aft Heads','Perspex','Scratches','on prsped divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r195','qc-handover-b8130','Port Aft Heads','window surround','Scratches','poor repair + scratches on window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r199','qc-handover-b8130','Port Aft Cabin','Cabin Door','Damage','on door handle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r200','qc-handover-b8130','Port Aft Cabin','Magazine locker/shelf locker','Scratches','below at inboard magazine grp coamong',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r201','qc-handover-b8130','Port Aft Cabin','Ceiling Liner','Scratches','on entire ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r202','qc-handover-b8130','Port Aft Cabin','Vinyl ceiling','Proud/Alignment','ceiling panel stepping + clean',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r203','qc-handover-b8130','Port Aft Cabin','Formica Bulkheads','Cleaning','remove glue spills on outboard Formica bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r204','qc-handover-b8130','Port Aft Cabin','Window blinds','Cleaning','remove pencil markings on blind + transom vynil panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r224','qc-handover-b8130','Stbd Fwd Cabin','Vinyl ceiling','cleaning','clean all vynil ceiling panels + fwd bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r225','qc-handover-b8130','Stbd Fwd Cabin','Bunktop/Double berth','damage','broken poppers on headboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r226','qc-handover-b8130','Stbd Fwd Cabin','Light switch','Loose','light switch aft of headboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r227','qc-handover-b8130','Stbd Fwd Cabin','Floor','sealer','poor floor sealer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r228','qc-handover-b8130','Stbd Fwd Cabin','Cabin Door','Operational','cabin door difficult locking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r229','qc-handover-b8130','Stbd Fwd Cabin','Hanging locker','Operational','adjust locker doors',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r230','qc-handover-b8130','Stbd Fwd Cabin','Light switch','Loose','light switch in lobby',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r231','qc-handover-b8130','Stbd Fwd Cabin','Vents','Cleaning','smears on vent surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r232','qc-handover-b8130','Stbd Fwd Cabin','Cabin Door','Proud/Alignment','screws fitted poorly on hinges',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r236','qc-handover-b8130','Stbd Fwd Heads','window surround','Scratches','on window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r237','qc-handover-b8130','Stbd Fwd Heads','Windows','Scratches','on hull window + Portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r238','qc-handover-b8130','Stbd Fwd Heads','window surround','Sealer','poor sealer on window surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r239','qc-handover-b8130','Stbd Fwd Heads','corian','Scratches','on corion surround',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r240','qc-handover-b8130','Stbd Fwd Heads','Dedicated trashcan locker','Damage','on bin locker door top edging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r241','qc-handover-b8130','Stbd Fwd Heads','Basin module','Operational','adjust basin locker door when operating',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r242','qc-handover-b8130','Stbd Fwd Heads','Holding tanks','Sealer','poor sealer below holding tank',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r243','qc-handover-b8130','Stbd Fwd Heads','Sliding entrance door with lock','Incorrect','unwanted packing at sliding door rail',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r244','qc-handover-b8130','Stbd Fwd Heads','Under-basin locker with toilet roll holder','Loose','toilet roll holder',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r245','qc-handover-b8130','Stbd Fwd Heads','Floor','Cleaning','remove spills in tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r246','qc-handover-b8130','Stbd Fwd Heads','Under-basin locker with toilet roll holder','Sealer','yellow sealer around toilet bowl + fwd inboard bulkhead joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r251','qc-handover-b8130','Port Passage','Floor','Loose','floorboard In passage aft side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r252','qc-handover-b8130','Port Passage','Stairs','Missing part','courtesy light switch cover',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r253','qc-handover-b8130','Port Passage','Manual bilge pumps with (keel sump)','Cleaning','remove residue on Manuel bilge pump cover',5,'Plumbing',false,'','','','',''),
  ('qc-handover-b8130-r254','qc-handover-b8130','Port Passage','Stairs','Scratches','below bottom stairway',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r255','qc-handover-b8130','Port Passage','Solids','Damage','aft cabin inboard door capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b8130-r265','qc-handover-b8130','Stbd Aft Heads','Floor','cleaning','stains in entire tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r266','qc-handover-b8130','Stbd Aft Heads','Solids','damage','on door capping surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b8130-r267','qc-handover-b8130','Stbd Aft Heads','Basin module','operational','adjust basin locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r268','qc-handover-b8130','Stbd Aft Heads','PERSPEX','scratches','on Perspex divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b8130-r269','qc-handover-b8130','Stbd Aft Heads','window surround','Sealer','poor sealer at bottom window surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r270','qc-handover-b8130','Stbd Aft Heads','Sliding entrance door with lock','loose','loose sliding door top catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r274','qc-handover-b8130','Stbd Aft Cabin','Solids','damage','on door capping surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b8130-r275','qc-handover-b8130','Stbd Aft Cabin','Ceiling','scratches','scratches + dull on ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b8130-r276','qc-handover-b8130','Stbd Aft Cabin','Fan','missing','spacer on fan',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r277','qc-handover-b8130','Stbd Aft Cabin','Ceiling','cleaning','clean all ceiling panels - Formica bulkheads',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b8130-r278','qc-handover-b8130','Stbd Aft Cabin','Window blinds','proud /alignment','skew outboard transom blind',3,'Joinery/Carp',false,'','','','','')
on conflict (id) do nothing;
commit;
select model, count(*) as audits from public.quality_control_boats where model='B8' group by model;
