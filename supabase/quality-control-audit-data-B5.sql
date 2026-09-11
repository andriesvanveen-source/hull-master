-- Quality Control audit import for B5 boats.
-- Renames existing reference audits to _QC3 and adds _HO_Audit boats.
-- Idempotent and non-destructive: existing defects are not overwritten.
begin;
update public.quality_control_boats set name='B5156_QC3' where id='qc-reference-b5156';
update public.quality_control_boats set name='B5155_QC3' where id='qc-reference-b5155';
update public.quality_control_boats set name='B5154_QC3' where id='qc-reference-b5154';
update public.quality_control_boats set name='B5153_QC3' where id='qc-reference-b5153';
update public.quality_control_boats set name='B5152_QC3' where id='qc-reference-b5152';
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b5051','B5051_HO_Audit','B5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Galley','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Saloon','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Stbd Aft Cabin','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Ov Study Area','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Owner''S Heads','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Port Fwd Cabin','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Port Fwd Heads','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Port Passage','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Port Aft Heads','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Port Aft Cabin','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Aft Cockpit','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Flybridge','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Port Hull','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Stbd Hull','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Port Deck','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Stb Deck','',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5051','Fwd Cockpit & Foredeck','',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b5051-r4','qc-handover-b5051','Galley','Magazine locker/shelf locker','Loose','s/steel btm rail loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r5','qc-handover-b5051','Galley','Companion door','Damage','paint damage at btm frame of door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r6','qc-handover-b5051','Galley','corian','Sealer','sealer bubbling by corian self port',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r7','qc-handover-b5051','Galley','Formica Bulkheads','Loose','edging pulling loose outboard of fwd outboard locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r16','qc-handover-b5051','Saloon','Floor','Sealer','touchup floor jionts as marked black lines visible',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r17','qc-handover-b5051','Saloon','Fwd cockpit door','Sealer','neaten sealer by dwd door at top as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r18','qc-handover-b5051','Saloon','Settee','Loose','backrest loose of port fwd settee',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r39','qc-handover-b5051','Stbd Aft Cabin','Ceiling Liner','Repairs','visible chips around ropelight wire hole',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r40','qc-handover-b5051','Stbd Aft Cabin','LED overhead lighting','Loose','ropelight wire loose as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r46','qc-handover-b5051','Ov Study Area','Vanity table/desk with storage locker and mirror under lid','Operational','lid chavves when opening',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r47','qc-handover-b5051','Ov Study Area','Draw locker','Operational','btm draw not self closing n centre draw',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r48','qc-handover-b5051','Ov Study Area','Formica Bulkheads','Damage','on formica above manual bilge pump',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r49','qc-handover-b5051','Ov Study Area','Vinyl ceiling','Spills','marks on all panels as marked',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r57','qc-handover-b5051','Owner''S Heads','Draw locker','Damage','hullside aft draw faulty',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r58','qc-handover-b5051','Owner''S Heads','Vanity locker with mirror','Loose','hinges loose of centre vanity locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r59','qc-handover-b5051','Owner''S Heads','Lockers','Cleaning','pencil marks around all hinges of lockers',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r60','qc-handover-b5051','Owner''S Heads','Windows','Scratches','on hullside window in dressing room',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5051-r61','qc-handover-b5051','Owner''S Heads','Solids','Damage','dents n poor spray on walk-through capping',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b5051-r62','qc-handover-b5051','Owner''S Heads','Window blinds','Damage','hullside blind in shower area damage',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r63','qc-handover-b5051','Owner''S Heads','Ceiling','Sealer','pulling yellow as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r64','qc-handover-b5051','Owner''S Heads','corian','Sealer','seal shower rose corian',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r65','qc-handover-b5051','Owner''S Heads','Floor','Damage','on floor insp in dressing room',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r78','qc-handover-b5051','Port Fwd Cabin','Hatch','Damage','hatch cover trim damage',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r79','qc-handover-b5051','Port Fwd Cabin','Formica bulkheads','Damage','dent in formica btm of fwd outlet in self',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r92','qc-handover-b5051','Port Fwd Heads','Dividers','Loose','at mounting point as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r93','qc-handover-b5051','Port Fwd Heads','Sliding entrance door with lock','Proud/Alignment','door top magnet not catching',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r94','qc-handover-b5051','Port Fwd Heads','corian','Sealer','seal shower rose corian',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r103','qc-handover-b5051','Port Passage','Floor','Damage','dents on floor btm of washing machine',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r104','qc-handover-b5051','Port Passage','Formica Bulkheads','Sealer','neaten sealer by s/steel above manual bilge pump',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r105','qc-handover-b5051','Port Passage','Floor','Sealer','touchup floor jiont btm of aft door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r106','qc-handover-b5051','Port Passage','Formica Bulkheads','Damage','dent on outboard bulkhead at btm aft of fwd door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r117','qc-handover-b5051','Port Aft Heads','Ceiling','Sealer','heads sealer yellow smears',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r118','qc-handover-b5051','Port Aft Heads','LED overhead lighting','Incorrect','ropelight wire visible',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r129','qc-handover-b5051','Port Aft Cabin','Formica Bulkheads','Damage','above inboard reading light',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r130','qc-handover-b5051','Port Aft Cabin','Windows','Scratches','on hullside windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5051-r131','qc-handover-b5051','Port Aft Cabin','Cabin Door','Scratches','on cabin door handel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r132','qc-handover-b5051','Port Aft Cabin','Hanging locker','Loose','self loose inside hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r133','qc-handover-b5051','Port Aft Cabin','Vinyl ceiling','Damage','aft panel damage as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5051-r152','qc-handover-b5051','Aft Cockpit','Table','Loose','table loose at btm',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r153','qc-handover-b5051','Aft Cockpit','Floor','Repairs','aft of port engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r154','qc-handover-b5051','Aft Cockpit','Lids','Repairs','aft of stb lifting platform motor locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r155','qc-handover-b5051','Aft Cockpit','Ceiling','Scratches','on ceiling grp as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r168','qc-handover-b5051','Flybridge','Staircase','Loose','teak pulling loose on steps to flybridge as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r169','qc-handover-b5051','Flybridge','Hatch','Sealer','neaten sealer by hatch frame as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r170','qc-handover-b5051','Flybridge','Hatch','Loose','dome nuts loose of retainer on hatch',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r171','qc-handover-b5051','Flybridge','Hatch','Proud/Alignment','screw proud on hatch frame',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r172','qc-handover-b5051','Flybridge','Floor','Sealer','excess sika around teak btm of wetbar fwd as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r173','qc-handover-b5051','Flybridge','Guard wires across bow and stern','Loose','bottle screw nuts loose on aft rail',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r187','qc-handover-b5051','Port Hull','Aft area','Repairs','on aft hull coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r188','qc-handover-b5051','Port Hull','Aft area','Scratches','on aft grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r189','qc-handover-b5051','Port Hull','Windows','Cracks','aft of aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r190','qc-handover-b5051','Port Hull','Aft area','Repairs','around diesel inlet cap',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r204','qc-handover-b5051','Stbd Hull','Aft area','Cracks','around diesel inlet cap',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r205','qc-handover-b5051','Stbd Hull','Aft area','Sealer','seal aft chavve plate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r221','qc-handover-b5051','Port Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','Tension Bottle screw at aft guard wire',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r222','qc-handover-b5051','Port Deck','Decklid','Scratches','Dull on aft of Decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r223','qc-handover-b5051','Port Deck','Flush Hatch over cabins','Cleaning','Residue on fwd hatch hinge',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5051-r224','qc-handover-b5051','Port Deck','Pushpits','Scratches','Rust mark forward pulpit seat',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r225','qc-handover-b5051','Port Deck','Stainlesteel','Cleaning','Spills on it Forward stainless steel rail',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r226','qc-handover-b5051','Port Deck','Bows','Repairs','Thin gel coat Outboard of bow',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r236','qc-handover-b5051','Stb Deck','side deck step','Repairs','Gel coat peeling on inboard of 2nd step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r237','qc-handover-b5051','Stb Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Remove Masking tape on guardrail bottle screw',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r238','qc-handover-b5051','Stb Deck','Flush Hatch over cabins','Cleaning','Residue on Fwd deck hatch hinges',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5051-r239','qc-handover-b5051','Stb Deck','Floor','Cleaning','Remove rust on tracking fwd on pulpit seat',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r261','qc-handover-b5051','Fwd Cockpit & Foredeck','Fwd cockpit door','Loose','Cockpit door Centre handle loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r262','qc-handover-b5051','Fwd Cockpit & Foredeck','Lids','Spills','Spill on sump lid aft port side of lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r263','qc-handover-b5051','Fwd Cockpit & Foredeck','Fwd area','Spills','Primer spills on tracking Port sunbed area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r264','qc-handover-b5051','Fwd Cockpit & Foredeck','S/S cupholder','Cleaning','Rust marks inside Port cup holder',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r265','qc-handover-b5051','Fwd Cockpit & Foredeck','S/S cupholder','Sealer','Excess sealer visible by port cup holder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5051-r266','qc-handover-b5051','Fwd Cockpit & Foredeck','Locker lids','Cleaning','Remove masking tape Port forward locker lid',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r267','qc-handover-b5051','Fwd Cockpit & Foredeck','Floor','Scratches','Rust marks inside water channel Starboard forward locker water channel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5051-r268','qc-handover-b5051','Fwd Cockpit & Foredeck','Anchor chain bin','Cleaning','Spills on windlass Winch wiring',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5051-r269','qc-handover-b5051','Fwd Cockpit & Foredeck','Fwd area','Scratches','Overspray on crown Port forward outboard combing',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b5152','B5152_HO_Audit','B5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Galley','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Saloon','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Port Fwd Cabin','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Port Fwd Heads','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Cabin & Study & Passage','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Port Aft Heads','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Port Aft Cabin','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Stbd Aft Cabin','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Ov Study','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Owner''S Heads','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Aft Cockpit','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Stbd Side Deck','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Port Side Deck','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Flybridge','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Crew Quarters','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Port Engine Room','',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5152','Stbd Hull','',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b5152-r4','qc-handover-b5152','Galley','LED overhead lighting','Proud/Alignment','aft ropelight bracket proud as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r5','qc-handover-b5152','Galley','Vinyl ceiling','Spills','marks on panels as marked',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5152-r16','qc-handover-b5152','Saloon','Vinyl panels','Spills','around fwd door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5152-r17','qc-handover-b5152','Saloon','Vinyl panels','Spills','marks on panels fwd of helm pod',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5152-r18','qc-handover-b5152','Saloon','Locker lids','Loose','hinges loose of wireless charging locker lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r19','qc-handover-b5152','Saloon','Tv locker','Damage','mirror damage on tv locker lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r38','qc-handover-b5152','Port Fwd Cabin','Hatch','Operational','adjust hatch shades',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r39','qc-handover-b5152','Port Fwd Cabin','Lockers','Loose','hinges loose of hullside locker doors n burred screw',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r40','qc-handover-b5152','Port Fwd Cabin','Floor','Damage','on centre floor lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r41','qc-handover-b5152','Port Fwd Cabin','Vinyl ceiling','Loose','ceiling panel sagging by fan',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r55','qc-handover-b5152','Port Fwd Heads','Perspex','Loose','divider loose at top',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r56','qc-handover-b5152','Port Fwd Heads','Sliding entrance door with lock','Proud/Alignment','sliding door top magnet retainer not catching',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r57','qc-handover-b5152','Port Fwd Heads','Under-basin locker with toilet roll holder','Proud/Alignment','centre basin locker door chavves',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r58','qc-handover-b5152','Port Fwd Heads','Vanity locker with mirror','Proud/Alignment','vanity door chavves when closing on edging as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r59','qc-handover-b5152','Port Fwd Heads','Door frames','Damage','dents on door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b5152-r65','qc-handover-b5152','Cabin & Study & Passage','Formica Bulkheads','Damage','long scratches on inboard bulkhead above small insp',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r66','qc-handover-b5152','Cabin & Study & Passage','Formica Bulkheads','Damage','dent in formica above btm step aft',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r78','qc-handover-b5152','Port Aft Heads','Ceiling','Sealer','heads sealer pulling yellow',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r90','qc-handover-b5152','Port Aft Cabin','Hanging locker','Damage','hole visible inside hanging locker by grp',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r91','qc-handover-b5152','Port Aft Cabin','Hanging locker','Sealer','yellow sealer inside hanging locker as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r92','qc-handover-b5152','Port Aft Cabin','Door frames','Incorrect','incorrect screws on door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r117','qc-handover-b5152','Stbd Aft Cabin','window surround','Scratches','on aft window grp as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r118','qc-handover-b5152','Stbd Aft Cabin','Windows','Damage','blemish n scratches on hullside aft window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5152-r119','qc-handover-b5152','Stbd Aft Cabin','Tv locker','Loose','top hinge loose of aft tv locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r128','qc-handover-b5152','Ov Study','Draw locker','Operational','btm desk study desk draw opens when locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r129','qc-handover-b5152','Ov Study','Draw locker','Operational','fwd btm draw opens when locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r130','qc-handover-b5152','Ov Study','Draw locker','Missing part','inboard fwd draw missing catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r138','qc-handover-b5152','Owner''S Heads','Sliding entrance door with lock','Proud/Alignment','sliding door knocks against btm guide door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r139','qc-handover-b5152','Owner''S Heads','Lockers','Loose','top hinge loose of hullside aft locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r140','qc-handover-b5152','Owner''S Heads','Draw locker','Operational','hullside fwd draw opens when locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r141','qc-handover-b5152','Owner''S Heads','Lockers','Loose','hullside fwd door hinges loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r142','qc-handover-b5152','Owner''S Heads','Waste tank','Loose','hinges loose of waste tank locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r143','qc-handover-b5152','Owner''S Heads','corian','Sealer','seal shower corian',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5152-r152','qc-handover-b5152','Aft Cockpit','Folding swimming ladder c/w teak steps','Missing part','catch missing on ladder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r153','qc-handover-b5152','Aft Cockpit','corian','Sealer','bubbling by corian',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r154','qc-handover-b5152','Aft Cockpit','Floor','Damage','bubble in teak as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r155','qc-handover-b5152','Aft Cockpit','LED overhead lighting','Missing part','side covers missing on led ropelight covers',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r161','qc-handover-b5152','Stbd Side Deck','Staircase','Cracks','on top step to side deck',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r162','qc-handover-b5152','Stbd Side Deck','Floor','Track repairs','aft of aft hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r172','qc-handover-b5152','Port Side Deck','Hatch','Loose','hinges loose of fwd hatches',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r173','qc-handover-b5152','Port Side Deck','Floor','Track repairs','poor tracking fwd of fwd hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r174','qc-handover-b5152','Port Side Deck','Fuel deck fillers','Spills','buffing compound on caps',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5152-r175','qc-handover-b5152','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','bottle screw nuts loose of aft guard wire',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r187','qc-handover-b5152','Flybridge','Staircase','Cracks','on top step to flybridge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r188','qc-handover-b5152','Flybridge','Floor','Repairs','btm of port fwd settee base thin grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r189','qc-handover-b5152','Flybridge','Windows','Damage','crack on stb fwd windshield centre btm as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r190','qc-handover-b5152','Flybridge','Helmstation','Repairs','grind marks on helm pod outboard fwd',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r191','qc-handover-b5152','Flybridge','Windows','Scratches','on windshields as marked',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5152-r192','qc-handover-b5152','Flybridge','Inspection lids','Sealer','bubbles in sealer of aft insp lids',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r193','qc-handover-b5152','Flybridge','Wetbar','Loose','outlet loose inside griller locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5152-r194','qc-handover-b5152','Flybridge','Ceiling','Repairs','visible chips on hardtop fwd flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r197','qc-handover-b5152','Crew Quarters','GRP','Damage','hole visible on inboard grp n screw protruding',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r204','qc-handover-b5152','Port Engine Room','Ceiling','Proud/Alignment','matt upstands around mooring cleat on inside',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r211','qc-handover-b5152','Stbd Hull','Midship area','Sealer','seal centre chafe plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r212','qc-handover-b5152','Stbd Hull','Aft area','Sealer','neaten sealer btm of aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r213','qc-handover-b5152','Stbd Hull','Aft area','Scratches','above aft window n overspray',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5152-r214','qc-handover-b5152','Stbd Hull','Aft area','Scratches','on aft grp as marked',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b5153','B5153_HO_Audit','B5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Galley','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Saloon','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Stbd Fwd Cabin','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Stbd Fwd Heads','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Stbd Aft Heads','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Port Fwd Cabin','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Port Passage','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Port Aft Heads','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Aft Cockpit','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Stbd Side Deck','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Port Side Deck','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Flybridge','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Stbd Hull','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Port Aft Cabin','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Port Engine Room','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Stbd Engine Room','',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5153','Port Hull','',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b5153-r4','qc-handover-b5153','Galley','Dedicated trashcan locker','Proud/Alignment','inconsistent gap around bin locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r5','qc-handover-b5153','Galley','Draw locker','Operational','pot draw not locking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r6','qc-handover-b5153','Galley','Draw locker','Operational','small draw btm of pot draw not locking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r7','qc-handover-b5153','Galley','Lids','Proud/Alignment','fwd floor lid warped',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r8','qc-handover-b5153','Galley','Formica Bulkheads','Damage','dent on formica above spice rack',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r16','qc-handover-b5153','Saloon','Tv locker','Loose','hinge loose of tv locker lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r17','qc-handover-b5153','Saloon','Table','Missing part','screws missing at btm of table',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r18','qc-handover-b5153','Saloon','Window blinds','Loose','port fwd window blind tacks loose as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r39','qc-handover-b5153','Stbd Fwd Cabin','Floating step','Scratches','on bunk steps s/steel aft n fwd',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r40','qc-handover-b5153','Stbd Fwd Cabin','Window blinds','Spills','stain mark on hullside window blind',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r41','qc-handover-b5153','Stbd Fwd Cabin','Fan','Cleaning','fan very dirty',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r42','qc-handover-b5153','Stbd Fwd Cabin','Floor','Sealer','touchup floor jiont as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r47','qc-handover-b5153','Stbd Fwd Heads','corian','Sealer','seal shower corian',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r48','qc-handover-b5153','Stbd Fwd Heads','Window blinds','Loose','blind loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r49','qc-handover-b5153','Stbd Fwd Heads','window surround','Cracks','on window grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r50','qc-handover-b5153','Stbd Fwd Heads','Ceiling','Sealer','neaten sealer in shower area as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r51','qc-handover-b5153','Stbd Fwd Heads','Floor','Spills','overspray on floor as marked',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-b5153-r60','qc-handover-b5153','Stbd Aft Heads','Ceiling','Sealer','neaten ceiling sealer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r61','qc-handover-b5153','Stbd Aft Heads','Window blinds','Loose','blind loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r78','qc-handover-b5153','Port Fwd Cabin','Fan','Cleaning','clean fan dirty',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r79','qc-handover-b5153','Port Fwd Cabin','Windows','Damage','heads window cracked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r80','qc-handover-b5153','Port Fwd Cabin','corian','Sealer','seal shower corian',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r81','qc-handover-b5153','Port Fwd Cabin','Ceiling','Sealer','smears on ceiling by jionts',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r92','qc-handover-b5153','Port Passage','Floor','Sealer','seal floor jionts',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r93','qc-handover-b5153','Port Passage','Door frames','Damage','crack on aft door frame at btm as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r103','qc-handover-b5153','Port Aft Heads','Vanity locker with mirror','Damage','on inside around btm hinge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r104','qc-handover-b5153','Port Aft Heads','window surround','Cracks','on window grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r105','qc-handover-b5153','Port Aft Heads','Door frames','Loose','btm capping loose of frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r108','qc-handover-b5153','Port Aft Heads','window surround','Scratches','above hullside window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r117','qc-handover-b5153','Aft Cockpit','Windows','Sealer','pulling loose by port aft window outboard',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r118','qc-handover-b5153','Aft Cockpit','Folding swimming ladder c/w teak steps','Loose','bolts n nuts loose on swimladder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r119','qc-handover-b5153','Aft Cockpit','Floor','Repairs','aft of port engine locker as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r120','qc-handover-b5153','Aft Cockpit','GRP','Cracks','on suger skoop as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r121','qc-handover-b5153','Aft Cockpit','Locker lids','Proud/Alignment','bolt proud of stb lifting platform motor lid',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r122','qc-handover-b5153','Aft Cockpit','Floor','Repairs','thin grp inboard btm of stb aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r123','qc-handover-b5153','Aft Cockpit','Windows','Sealer','sealer pulling loose outboard of port aft window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r124','qc-handover-b5153','Aft Cockpit','Companion door','Sealer','neaten sealer port at btm of cmp way door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r128','qc-handover-b5153','Stbd Side Deck','Fuel deck fillers','Spills','on waste cap buffing compound',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r138','qc-handover-b5153','Port Side Deck','Bows','Repairs','wavey repair on bow',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r139','qc-handover-b5153','Port Side Deck','Fuel deck fillers','Spills','buffing compound on waater inlet cap',10,'Cleaning',false,'','','','',''),
  ('qc-handover-b5153-r140','qc-handover-b5153','Port Side Deck','Staircase','Cracks','on step above window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r152','qc-handover-b5153','Flybridge','Staircase','Sealer','seal teak on steps to flybridge',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r153','qc-handover-b5153','Flybridge','Inspection lids','Sealer','neaten aft insp cover sealer as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r154','qc-handover-b5153','Flybridge','Staircase','Damage','teak damage on centre step to flybridge',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r168','qc-handover-b5153','Stbd Hull','Aft area','Cracks','on aft grp aft of aft vent',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r169','qc-handover-b5153','Stbd Hull','Aft area','Sealer','neaten sealer around diesel inlet',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r170','qc-handover-b5153','Stbd Hull','Aft area','Repairs','above aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r171','qc-handover-b5153','Stbd Hull','Aft area','Scratches','above aft vent cover',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r261','qc-handover-b5153','Port Aft Cabin','Bunktop/Double berth','Loose','bracket loose of ac unit inside bunk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r262','qc-handover-b5153','Port Aft Cabin','Windows','Scratches','on hullside windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5153-r263','qc-handover-b5153','Port Aft Cabin','Hanging locker','Operational','hanging locker door knocking when closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r264','qc-handover-b5153','Port Aft Cabin','Floor','Operational','floor insp lid to tight',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r265','qc-handover-b5153','Port Aft Cabin','Fan','Loose','at base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r279','qc-handover-b5153','Port Aft Heads','Waste tank','loose','hinges loose of waste tank locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r280','qc-handover-b5153','Port Aft Heads','Under-basin locker with toilet roll holder','loose','edging pulling loose on door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r281','qc-handover-b5153','Port Aft Heads','Ceiling','Sealer','pulling yellow as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r282','qc-handover-b5153','Port Aft Heads','Windows','Scratches','on window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5153-r283','qc-handover-b5153','Port Aft Heads','Floor','loose','block loose btm of sump',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r284','qc-handover-b5153','Port Aft Heads','Sliding entrance door with lock','loose','btm track block loose of door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r293','qc-handover-b5153','Galley','Magazine locker/shelf locker','Loose','s/steel rails loose of selfs as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r294','qc-handover-b5153','Galley','Draw locker','Proud/Alignment','stb pullout self not lining up when closed',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r295','qc-handover-b5153','Galley','Draw locker','Incorrect','holes visible by stb pullout draw tracks',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r296','qc-handover-b5153','Galley','Draw locker','Incorrect','holes visible by port pullout draws n proud screws',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r297','qc-handover-b5153','Galley','Draw locker','Operational','draw fwd of fridge not catching btm draw',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r298','qc-handover-b5153','Galley','Floor','sealer','neaten floor jionts as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r299','qc-handover-b5153','Galley','corian','Scratches','on corian fwd of hob',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5153-r308','qc-handover-b5153','Saloon','Tv locker','Loose','aft hinge loose of tv locker lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r309','qc-handover-b5153','Saloon','Digital monitoring with 7" Multi-function Dispaly','Proud/Alignment','power steering assist diplay fitted skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r310','qc-handover-b5153','Saloon','Vinyl panels','Loose','vinyl pulling loose btm of fwd s/steel frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r311','qc-handover-b5153','Saloon','Floor','Sealer','neaten floor jionts as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5153-r330','qc-handover-b5153','Flybridge','Table','Sealer','seal btm base of table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r331','qc-handover-b5153','Flybridge','Hardtop supports','Sealer','neaten sealer at btm basses of fwd s/steel poles',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r332','qc-handover-b5153','Flybridge','Ceiling','Repairs','on hardtop flange port as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r333','qc-handover-b5153','Flybridge','Wetbar','Operational','fridge locker door needs to be adjusted of wetbar',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r334','qc-handover-b5153','Flybridge','Wetbar','Proud/Alignment','griller locker door not lining up knocks agnst eachother',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r335','qc-handover-b5153','Flybridge','Windows','Loose','windshields loose stb',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r336','qc-handover-b5153','Flybridge','Guard wires across bow and stern','Missing part','aft rail wire missing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r337','qc-handover-b5153','Flybridge','Wetbar','Scratches','scratches on btm flange of wetbar as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r367','qc-handover-b5153','Aft Cockpit','corian','Sealer','pulling loose by corian',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r368','qc-handover-b5153','Aft Cockpit','Inspection lids','Loose','insp panel above corian flimsy',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r369','qc-handover-b5153','Aft Cockpit','Transom','Repairs','on port transom inboard coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r370','qc-handover-b5153','Aft Cockpit','Floor','Repairs','damage grp fwd outboard of stb engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r371','qc-handover-b5153','Aft Cockpit','Windows','Sealer','neaten sealer above stb aft window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r372','qc-handover-b5153','Aft Cockpit','Floor','Cracks','on floor inboard btm of stb aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r373','qc-handover-b5153','Aft Cockpit','Floor','Cracks','on floor aft outboard of stb engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r374','qc-handover-b5153','Aft Cockpit','Settee','Repairs','poor repair on stb settee flnage',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r375','qc-handover-b5153','Aft Cockpit','GRP','Repairs','on sugerskoop as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r376','qc-handover-b5153','Aft Cockpit','Ceiling','Cracks','on hardtop inner above corian',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r377','qc-handover-b5153','Aft Cockpit','Ceiling','Repairs','poor repairs on decklid flange aft aft as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r382','qc-handover-b5153','Port Engine Room','Locker lids','Loose','perco latch loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5153-r383','qc-handover-b5153','Port Engine Room','GRP','Repairs','thin grp on engine room locker flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r389','qc-handover-b5153','Stbd Engine Room','GRP','Repairs','thin grp on flange of engine room as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r390','qc-handover-b5153','Stbd Engine Room','Locker lids','Flowcoat','flange on locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r407','qc-handover-b5153','Port Hull','Aft area','Repairs','on aft hull coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r408','qc-handover-b5153','Port Hull','Aft area','Repairs','by aft hull jiont thin grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r409','qc-handover-b5153','Port Hull','Aft area','Repairs','above aft vent cover',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r410','qc-handover-b5153','Port Hull','Midship area','Repairs','above aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r419','qc-handover-b5153','Stbd Hull','Aft area','Repairs','on aft hull coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5153-r420','qc-handover-b5153','Stbd Hull','Midship area','Damage','btm of aft hull window',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b5154','B5154_HO_Audit','B5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Fwd Cabin','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Fwd Heads','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Passage','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Aft Cabin','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Aft Heads','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Passage','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Fwd Heads','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Fwd Cabin','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Aft Heads','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Aft Cabin','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Galley','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Saloon','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Aft Cockpit','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Side Deck','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Side Deck','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Fwd Cockpit & Foredeck','',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Flybridge','',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Hull','',17) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Port Engine Room','',18) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Engine Room','',19) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5154','Stbd Hull','',20) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b5154-r4','qc-handover-b5154','Stbd Fwd Cabin','Staircase','Scratches','on bunk steps s/steel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r5','qc-handover-b5154','Stbd Fwd Cabin','Hanging locker','Loose','insp cover loose inside hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r16','qc-handover-b5154','Stbd Fwd Heads','Floor','Loose','sump lid wobble when stepping on',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r26','qc-handover-b5154','Stbd Passage','Formica Bulkheads','Loose','sealer pulling loose above ac display unit',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r38','qc-handover-b5154','Port Aft Cabin','Draw locker','Operational','bunk draw not self closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r39','qc-handover-b5154','Port Aft Cabin','Hanging locker','Loose','self loose inside hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r40','qc-handover-b5154','Port Aft Cabin','Formica Bulkheads','Scratches','on formica around heads door frame outboard as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r55','qc-handover-b5154','Port Aft Heads','Window blinds','Damage','blind damage as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r56','qc-handover-b5154','Port Aft Heads','Dividers','Loose','at mounting points',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r57','qc-handover-b5154','Port Aft Heads','Waste tank','Loose','hinges loose of waste tank locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r64','qc-handover-b5154','Port Passage','Inspection lids','Proud/Alignment','small insp panel proud not flush',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r65','qc-handover-b5154','Port Passage','Lockers','Loose','hinges loose of locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r78','qc-handover-b5154','Port Fwd Heads','Dividers','Loose','at mounting points',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r79','qc-handover-b5154','Port Fwd Heads','Sliding entrance door with lock','Operational','door not catching',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r80','qc-handover-b5154','Port Fwd Heads','Dividers','Scratches','on divider by door as marked',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5154-r92','qc-handover-b5154','Port Fwd Cabin','Door frames','Incorrect','wood visible by striker plate of cabin door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r93','qc-handover-b5154','Port Fwd Cabin','Hanging locker','Loose','insp panel inside hanging locker loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r117','qc-handover-b5154','Stbd Aft Heads','Waste tank','Operational','adjust waste tank locker door knocking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r118','qc-handover-b5154','Stbd Aft Heads','Vanity locker with mirror','Operational','vanity locker door chavves when operating',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r128','qc-handover-b5154','Stbd Aft Cabin','2 x LED reading lamps over bunk','Loose','hullside reading light loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r129','qc-handover-b5154','Stbd Aft Cabin','Vinyl panels','Loose','overhang panel flimsy',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r130','qc-handover-b5154','Stbd Aft Cabin','window surround','Repairs','repair on aft window grp inboard as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r152','qc-handover-b5154','Galley','Perspex','Loose','perspex in self loose as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r153','qc-handover-b5154','Galley','Ceiling','Proud/Alignment','centre led light proud n corner cover loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r168','qc-handover-b5154','Saloon','Floor','Sealer','neaten floor jionts as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r169','qc-handover-b5154','Saloon','Vinyl panels','Cleaning','stains on panels as marked n around fwd door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r187','qc-handover-b5154','Aft Cockpit','GRP','Cracks','on sugerskoop as marked stb',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r188','qc-handover-b5154','Aft Cockpit','GRP','Repairs','gelcoat peeling on sugerskoop as marked port',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r189','qc-handover-b5154','Aft Cockpit','Floor','Damage','teak damage aft of sump lid as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r190','qc-handover-b5154','Aft Cockpit','Decklid','Repairs','aft on decklid as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r191','qc-handover-b5154','Aft Cockpit','Companion door','Sealer','seal door on sides',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r204','qc-handover-b5154','Stbd Side Deck','Targawing','Sealer','around s/steel grabrail',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r205','qc-handover-b5154','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','bottle screw nut loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r206','qc-handover-b5154','Stbd Side Deck','Fuel deck fillers','Cleaning','buffing compound on filler caps',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r207','qc-handover-b5154','Stbd Side Deck','Hatch','Loose','hinges loose of fwd hatch',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r211','qc-handover-b5154','Port Side Deck','Floor','Track repairs','btm of aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r212','qc-handover-b5154','Port Side Deck','Fuel deck fillers','Cleaning','buffing compound on filler caps',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r220','qc-handover-b5154','Fwd Cockpit & Foredeck','Windows','Sealer','neaten sealer above stb fwd window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r221','qc-handover-b5154','Fwd Cockpit & Foredeck','Gas cylinder regulator in dedicated LPG locker','Operational','gas locker lid chavves when operating',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r222','qc-handover-b5154','Fwd Cockpit & Foredeck','Mooring cleats','Missing part','labels missing by fwd cleats',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r233','qc-handover-b5154','Flybridge','Staircase','Cracks','on centre step to flybridge as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r234','qc-handover-b5154','Flybridge','Table','Missing part','no drain holes on table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r235','qc-handover-b5154','Flybridge','Wetbar','Loose','centre door dtm hinge loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r236','qc-handover-b5154','Flybridge','GRP','Missing part','stb aft insp missing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r237','qc-handover-b5154','Flybridge','Floor','Damage','bubbles in teak btm of wetbar as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r238','qc-handover-b5154','Flybridge','Ceiling','Scratches','on ceiling grp as marked port fwd',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r239','qc-handover-b5154','Flybridge','LED overhead lighting','Proud/Alignment','fwd led strip proud',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r240','qc-handover-b5154','Flybridge','Ceiling','Repairs','on ceiling grp stb aft',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r241','qc-handover-b5154','Flybridge','Wetbar','Missing part','screw missing on wetbar locker door catch block',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r248','qc-handover-b5154','Port Hull','Aft area','Repairs','btm of aft floating step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r249','qc-handover-b5154','Port Hull','Aft area','Scratches','above aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r250','qc-handover-b5154','Port Hull','Aft area','Sealer','seal on side of transom bumper rubber',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r279','qc-handover-b5154','Port Aft Heads','Waste tank','loose','hinges loose of waste tank locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r280','qc-handover-b5154','Port Aft Heads','Under-basin locker with toilet roll holder','loose','edging pulling loose on door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r281','qc-handover-b5154','Port Aft Heads','Ceiling','Sealer','pulling yellow as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r282','qc-handover-b5154','Port Aft Heads','Windows','Scratches','on window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5154-r283','qc-handover-b5154','Port Aft Heads','Floor','loose','block loose btm of sump',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r284','qc-handover-b5154','Port Aft Heads','Sliding entrance door with lock','loose','btm track block loose of door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r293','qc-handover-b5154','Galley','Magazine locker/shelf locker','Loose','s/steel rails loose of selfs as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r294','qc-handover-b5154','Galley','Draw locker','Proud/Alignment','stb pullout self not lining up when closed',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r295','qc-handover-b5154','Galley','Draw locker','Incorrect','holes visible by stb pullout draw tracks',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r296','qc-handover-b5154','Galley','Draw locker','Incorrect','holes visible by port pullout draws n proud screws',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r297','qc-handover-b5154','Galley','Draw locker','Operational','draw fwd of fridge not catching btm draw',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r298','qc-handover-b5154','Galley','Floor','sealer','neaten floor jionts as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r299','qc-handover-b5154','Galley','corian','Scratches','on corian fwd of hob',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5154-r308','qc-handover-b5154','Saloon','Tv locker','Loose','aft hinge loose of tv locker lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r309','qc-handover-b5154','Saloon','Digital monitoring with 7" Multi-function Dispaly','Proud/Alignment','power steering assist diplay fitted skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r310','qc-handover-b5154','Saloon','Vinyl panels','Loose','vinyl pulling loose btm of fwd s/steel frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r311','qc-handover-b5154','Saloon','Floor','Sealer','neaten floor jionts as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5154-r330','qc-handover-b5154','Flybridge','Table','Sealer','seal btm base of table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r331','qc-handover-b5154','Flybridge','Hardtop supports','Sealer','neaten sealer at btm basses of fwd s/steel poles',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r332','qc-handover-b5154','Flybridge','Ceiling','Repairs','on hardtop flange port as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r333','qc-handover-b5154','Flybridge','Wetbar','Operational','fridge locker door needs to be adjusted of wetbar',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r334','qc-handover-b5154','Flybridge','Wetbar','Proud/Alignment','griller locker door not lining up knocks agnst eachother',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r335','qc-handover-b5154','Flybridge','Windows','Loose','windshields loose stb',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r336','qc-handover-b5154','Flybridge','Guard wires across bow and stern','Missing part','aft rail wire missing',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r337','qc-handover-b5154','Flybridge','Wetbar','Scratches','scratches on btm flange of wetbar as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r367','qc-handover-b5154','Aft Cockpit','corian','Sealer','pulling loose by corian',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r368','qc-handover-b5154','Aft Cockpit','Inspection lids','Loose','insp panel above corian flimsy',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r369','qc-handover-b5154','Aft Cockpit','Transom','Repairs','on port transom inboard coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r370','qc-handover-b5154','Aft Cockpit','Floor','Repairs','damage grp fwd outboard of stb engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r371','qc-handover-b5154','Aft Cockpit','Windows','Sealer','neaten sealer above stb aft window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r372','qc-handover-b5154','Aft Cockpit','Floor','Cracks','on floor inboard btm of stb aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r373','qc-handover-b5154','Aft Cockpit','Floor','Cracks','on floor aft outboard of stb engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r374','qc-handover-b5154','Aft Cockpit','Settee','Repairs','poor repair on stb settee flnage',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r375','qc-handover-b5154','Aft Cockpit','GRP','Repairs','on sugerskoop as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r376','qc-handover-b5154','Aft Cockpit','Ceiling','Cracks','on hardtop inner above corian',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r377','qc-handover-b5154','Aft Cockpit','Ceiling','Repairs','poor repairs on decklid flange aft aft as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r382','qc-handover-b5154','Port Engine Room','Locker lids','Loose','perco latch loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5154-r383','qc-handover-b5154','Port Engine Room','GRP','Repairs','thin grp on engine room locker flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r389','qc-handover-b5154','Stbd Engine Room','GRP','Repairs','thin grp on flange of engine room as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r390','qc-handover-b5154','Stbd Engine Room','Locker lids','Flowcoat','flange on locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r407','qc-handover-b5154','Port Hull','Aft area','Repairs','on aft hull coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r408','qc-handover-b5154','Port Hull','Aft area','Repairs','by aft hull jiont thin grp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r409','qc-handover-b5154','Port Hull','Aft area','Repairs','above aft vent cover',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r410','qc-handover-b5154','Port Hull','Midship area','Repairs','above aft window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r419','qc-handover-b5154','Stbd Hull','Aft area','Repairs','on aft hull coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5154-r420','qc-handover-b5154','Stbd Hull','Midship area','Damage','btm of aft hull window',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-b5155','B5155_HO_Audit','B5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Port Fwd Cabin','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Port Fwd Heads','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Port Aft Heads','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Port Aft Cabin','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Stbd Aft Cabin','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Stbd Aft Heads','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Stbd Fwd Heads','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Stbd Fwd Cabin','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Galley','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Saloon','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Port Side Deck','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Stbd Side Deck','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Fwd Cockpit & Foredeck','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Flybridge','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-b5155','Aft Cockpit','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-b5155-r4','qc-handover-b5155','Port Fwd Cabin','Windows','Scratches','on hullside window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5155-r16','qc-handover-b5155','Port Fwd Heads','Under-basin locker with toilet roll holder','Operational','adjust door knocking against catch block',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r17','qc-handover-b5155','Port Fwd Heads','Formica Bulkheads','Damage','screw protruding on inside of door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r38','qc-handover-b5155','Port Aft Heads','Windows','Scratches','on hullside window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5155-r39','qc-handover-b5155','Port Aft Heads','Dividers','Missing part','spacers missing n covers missing on divider',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r40','qc-handover-b5155','Port Aft Heads','Dividers','Scratches','on divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5155-r55','qc-handover-b5155','Port Aft Cabin','Hanging locker','Loose','catch loose of hanging locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r56','qc-handover-b5155','Port Aft Cabin','Draw locker','Operational','bunk draw difficult locking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r78','qc-handover-b5155','Stbd Aft Cabin','Bunktop/Double berth','Loose','ropelight wire loose inboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r79','qc-handover-b5155','Stbd Aft Cabin','Hanging locker','Loose','top hinge loose of hanging locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r80','qc-handover-b5155','Stbd Aft Cabin','Window blinds','Loose','hullside fwd window blind string base loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r90','qc-handover-b5155','Stbd Aft Heads','Sliding entrance door with lock','Operational','heads door not catching',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r91','qc-handover-b5155','Stbd Aft Heads','Windows','Scratches','on window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5155-r117','qc-handover-b5155','Stbd Fwd Heads','Coat hook','Loose','coat hook loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r118','qc-handover-b5155','Stbd Fwd Heads','Windows','Scratches','on window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5155-r128','qc-handover-b5155','Stbd Fwd Cabin','Floor','Sealer','touchup floor as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r129','qc-handover-b5155','Stbd Fwd Cabin','Lockers','Loose','hinges loose of hullside locker doors',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r130','qc-handover-b5155','Stbd Fwd Cabin','Draw locker','Missing part','catch missing of top draw',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r131','qc-handover-b5155','Stbd Fwd Cabin','Windows','Scratches','on hullside window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-b5155-r152','qc-handover-b5155','Galley','Draw locker','Loose','catch loose of draw btm of oven',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r161','qc-handover-b5155','Saloon','Floor','Sealer','seal floor jiont as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r162','qc-handover-b5155','Saloon','Settee','Missing part','kicker plate missing btm of stb settee',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-b5155-r187','qc-handover-b5155','Port Side Deck','Staircase','Repairs','on top step to side deck',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5155-r188','qc-handover-b5155','Port Side Deck','Floor','Spills','in floor tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5155-r197','qc-handover-b5155','Stbd Side Deck','Floor','Spills','in floor tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5155-r198','qc-handover-b5155','Stbd Side Deck','Fuel deck fillers','Spills','on feul filler caps',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5155-r204','qc-handover-b5155','Fwd Cockpit & Foredeck','GRP','Repairs','on grp above step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5155-r205','qc-handover-b5155','Fwd Cockpit & Foredeck','Lids','Missing part','clips missing on port n stb locker lids',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5155-r220','qc-handover-b5155','Flybridge','Hatch','Missing part','catch missing of hatch by steps to flybridge',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5155-r221','qc-handover-b5155','Flybridge','Windows','Sealer','sika blobs btm of centre windshields',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5155-r222','qc-handover-b5155','Flybridge','Ceiling','Repairs','visible chips on flange fwd as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5155-r223','qc-handover-b5155','Flybridge','Guard wires across bow and stern','Loose','bottle screw nuts loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5155-r224','qc-handover-b5155','Flybridge','GRP','Repairs','wavey repair around aft centre insp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-b5155-r233','qc-handover-b5155','Aft Cockpit','Lids','Proud/Alignment','aft lifting platform motor locker lids bolts proud when stepping on',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-b5155-r234','qc-handover-b5155','Aft Cockpit','Ceiling','Sealer','touchup sealer jiont stb as marked',4,'Deckfitting',false,'','','','','')
on conflict (id) do nothing;
commit;
select model, count(*) as audits from public.quality_control_boats where model='B5' group by model;
