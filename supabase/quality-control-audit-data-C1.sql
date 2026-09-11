-- Quality Control audit import for C1 boats.
-- Renames existing reference audits to _QC3 and adds _HO_Audit boats.
-- Idempotent and non-destructive: existing defects are not overwritten.
begin;
update public.quality_control_boats set name='C1076_QC3' where id='qc-reference-c1076';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1076' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1076' and area_name='Study' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1076' and area_name='Stbd Aft Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1076' and area_name='Aft Cockpit' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1076' and area_name='Port Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1076' and area_name='Stbd Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1076' and area_name='Fwd Cockpit & Foredeck' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C1075_QC3' where id='qc-reference-c1075';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Stbd Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Study' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Owner''S Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Stbd Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Stbd Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Stbd Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Aft Cockpit' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Stbd Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Fwd Cockpit & Foredeck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Stbd Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1075' and area_name='Port Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C1074_QC3' where id='qc-reference-c1074';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Study' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Owner''S Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Stbd Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Stbd Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Port Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Port Aft Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Port Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Port Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Port Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Aft Cockpit' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Stbd Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Port Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Fwd Cockpit & Foredeck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Stbd Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='A/S' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1074' and area_name='Port Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C1073_QC3' where id='qc-reference-c1073';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Stbd Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Stbd Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Owner''S Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Stbd Study & Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Stbd Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Aft Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Aft Cockpit' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Fwd Cockpit & Foredeck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Port Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1073' and area_name='Stbd Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C1071_QC3' where id='qc-reference-c1071';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Port Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Port Aft Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Port Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Port Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Port Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Study' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Stbd Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Stbd Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Aft Cockpit' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Port Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Fwd Cockpit & Foredeck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Mogamat Yunis Jabaar', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Port Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c1071' and area_name='Stbd Hull' and coalesce(trim(inspector),'')='';
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c1068','C1068_HO_Audit','C1') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Port Aft Cabin','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Port Aft Heads','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Port Passage','Imtiyaaz Hassan Hoosain',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Port Fwd Cabin','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Forepeak','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Port Fwd Heads','Imtiyaaz Hassan Hoosain',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Study','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Stbd Aft Cabin','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1068','Stbd Fwd Heads','Imtiyaaz Hassan Hoosain',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c1068-r4','qc-handover-c1068','Port Aft Cabin','Portlight','Loose','tension both',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1068-r5','qc-handover-c1068','Port Aft Cabin','2 x LED reading lamps over bunk','Loose','outboard reading light arm not screwing tight',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r6','qc-handover-c1068','Port Aft Cabin','Fiddles','Loose','inboard bunk fiddle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r7','qc-handover-c1068','Port Aft Cabin','Bunk Drawers','Proud/Alignment','face stepping inward',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r8','qc-handover-c1068','Port Aft Cabin','Hanging locker','Damage','on aft door top corner',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r9','qc-handover-c1068','Port Aft Cabin','Door frames','Damage','neaten screw holes',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r13','qc-handover-c1068','Port Aft Heads','Sliding or hinged heads door','Operational','lock bent+door opens while locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r14','qc-handover-c1068','Port Aft Heads','Under-basin locker with toilet roll holder','Proud/Alignment','face stepping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r15','qc-handover-c1068','Port Aft Heads','Under-basin locker with toilet roll holder','Damage','unwanted hole below bottom hinge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r16','qc-handover-c1068','Port Aft Heads','Waste tank','Proud/Alignment','adjust gaps on insp door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r17','qc-handover-c1068','Port Aft Heads','Fold up vanity mirror','Proud/Alignment','black plastic piece proud at locking arm',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r18','qc-handover-c1068','Port Aft Heads','Floor','Cleaning','sealer smears at shower floor',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r19','qc-handover-c1068','Port Aft Heads','Portlight','Loose','tension portlight',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1068-r21','qc-handover-c1068','Port Passage','AC/DC locker','Loose','toggle block',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r22','qc-handover-c1068','Port Passage','Washing machine locker','Missing part','missing velcro on insp panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r23','qc-handover-c1068','Port Passage','Washing machine locker','Damage','chips on insp panel edges, check all',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r24','qc-handover-c1068','Port Passage','Bilges','Loose','jbox label in fwd bilge',7,'Electrical',false,'','','','',''),
  ('qc-handover-c1068-r25','qc-handover-c1068','Port Passage','Formica Bulkheads','Sealer','excess and poor sealer above fwd cabin door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r26','qc-handover-c1068','Port Passage','Washing machine locker','Operational','doors chaffing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r45','qc-handover-c1068','Port Fwd Cabin','Cabin Door','Cleaning','sticker residue on door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r46','qc-handover-c1068','Port Fwd Cabin','Hanging locker','Operational','door chaffing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r47','qc-handover-c1068','Port Fwd Cabin','Bilges','Flowcoat','stained flowcoat in bunktop bilge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r48','qc-handover-c1068','Port Fwd Cabin','Magazine locker/shelf locker','Cleaning','glue residue on edging at inboard bedside shelf',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r49','qc-handover-c1068','Port Fwd Cabin','Magazine locker/shelf locker','Proud/Alignment','neaten joint in inboard bunkside shelf',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r50','qc-handover-c1068','Port Fwd Cabin','Formica Bulkheads','Proud/Alignment','neaten joint fwd of inboard reading lt',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r51','qc-handover-c1068','Port Fwd Cabin','Formica Bulkheads','Damage','damage on outboard bulkhead at joint below reading lt',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r52','qc-handover-c1068','Port Fwd Cabin','Vinyl ceiling','Cleaning','pen marks and glue residue on ceilings',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r56','qc-handover-c1068','Forepeak','Magazine locker/shelf locker','Cleaning','dirt and debris above inboard shelf locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r57','qc-handover-c1068','Forepeak','LED overhead lighting','Proud/Alignment','sleeving not tucked into touch light',7,'Electrical',false,'','','','',''),
  ('qc-handover-c1068-r61','qc-handover-c1068','Port Fwd Heads','Shower compartment c/w lever mixer and adjustable shower rose','Incorrect','portlight knocking shower rose(cannot fully open)',5,'Plumbing',true,'','','','',''),
  ('qc-handover-c1068-r62','qc-handover-c1068','Port Fwd Heads','Shower bulkhead module','Cracks','on coaming outboard of shower splashback',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r63','qc-handover-c1068','Port Fwd Heads','corian','Proud/Alignment','nuprene protruding at splash back',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r64','qc-handover-c1068','Port Fwd Heads','Portlight','Loose','tension portlight',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1068-r65','qc-handover-c1068','Port Fwd Heads','Ceiling','Cleaning','sticker residue on ceiling and glue residue on bulkhead inboard of toilet',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r87','qc-handover-c1068','Study','Tv locker','Proud/Alignment','unwanted gap and excess below tv locker fwd',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r88','qc-handover-c1068','Study','Formica Bulkheads','sealer','sealer pulling loose at joint fwd of stairs',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r89','qc-handover-c1068','Study','Bilges','repairs','neaten aft limber hole in bilge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r90','qc-handover-c1068','Study','Magazine locker/shelf locker','damage','damaged corner in outboard middle shelf',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r91','qc-handover-c1068','Study','Draw locker','cleaning','dirt and debris behind outboard drawers',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r92','qc-handover-c1068','Study','shoe locker','missing part','missing edging at clip block in fwd shoe locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r96','qc-handover-c1068','Stbd Aft Cabin','Hatch','loose','Escape label',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r97','qc-handover-c1068','Stbd Aft Cabin','Bunk Drawers','proud','face stepping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r98','qc-handover-c1068','Stbd Aft Cabin','Inboard liner','damage','protruding screw fwd of bottom cleat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r99','qc-handover-c1068','Stbd Aft Cabin','Vinyl panels','cleaning','stains on panel at ac vent',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r100','qc-handover-c1068','Stbd Aft Cabin','Ceiling Liner','repairs','poor repairs on bottom coaming at pulley insp',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r101','qc-handover-c1068','Stbd Aft Cabin','Walkthrough capping','damage','top edging inboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r102','qc-handover-c1068','Stbd Aft Cabin','Vinyl panels','loose','velcro at aft ceiling insp',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r103','qc-handover-c1068','Stbd Aft Cabin','window surround','Scratches','deep scr on outboard surround below portlight',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r105','qc-handover-c1068','Stbd Fwd Heads','Inspection lids','cleaning','dirt, debris, and crestomer spills behind inboard insp',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r106','qc-handover-c1068','Stbd Fwd Heads','Sliding or hinged heads door','Cleaning','remove markings from door top brackets and retainers',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1068-r107','qc-handover-c1068','Stbd Fwd Heads','Vanity locker with mirror','Loose','hinge slide on middle locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r108','qc-handover-c1068','Stbd Fwd Heads','Doors','Operational','shower door creaking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r109','qc-handover-c1068','Stbd Fwd Heads','Dividers','Cleaning','rust on s/s brackets at shower divider',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r110','qc-handover-c1068','Stbd Fwd Heads','Windows','Scratches','on heads window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1068-r111','qc-handover-c1068','Stbd Fwd Heads','window surround','Pinholes','and scratches on surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1068-r112','qc-handover-c1068','Stbd Fwd Heads','corian','Damage','chip on splash back corian top edge',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1068-r113','qc-handover-c1068','Stbd Fwd Heads','HEADS','Sealer','neaten sealer in shower area',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1068-r114','qc-handover-c1068','Stbd Fwd Heads','Ceiling','Cleaning','glue residue at edging',10,'Cleaning',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c1069','C1069_HO_Audit','C1') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Saloon','Zunaid Hoosen',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Stbd Fwd Heads','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Stbd Fwd Cabin','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Stbd Passage','Zunaid Hoosen',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Stbd Aft Heads','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Study','Zunaid Hoosen',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Stbd Aft Cabin','Zunaid Hoosen',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Port Fwd Cabin','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Port Fwd Heads','Kyle Carl Adams',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Port Aft Cabin','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Port Aft Heads','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Port Passage','Imtiyaaz Hassan Hoosain',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Aft Cockpit','Zunaid Hoosen',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Port Side Deck','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Stbd Side Deck','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Flybridge','Zunaid Hoosen',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Fwd Cockpit & Foredeck','',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Port Hull','',17) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1069','Stbd Hull','Zunaid Hoosen',18) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c1069-r5','qc-handover-c1069','Saloon','Nav desk','Cleaning','Clean recess fwd of nav desk',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r6','qc-handover-c1069','Saloon','Fwd cockpit door','Scratches','Scratches on companionway door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r7','qc-handover-c1069','Saloon','Galley lockers','Damage','Damage on formica aft of galley locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r8','qc-handover-c1069','Saloon','Galley lockers','Proud/Alignment','Bin locker front proud',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r9','qc-handover-c1069','Saloon','Galley lockers','Operational','Adjust bin locker catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r10','qc-handover-c1069','Saloon','Galley lockers','Operational','Pull out drawer by zink locker not fully closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r11','qc-handover-c1069','Saloon','Floor','Scratches','Scratches visible inside port forward floor locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r12','qc-handover-c1069','Saloon','Lockers','Damage','Scratches on formica aft of LPG controller',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r13','qc-handover-c1069','Saloon','Ceiling','Scratches','Dull on port off ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r14','qc-handover-c1069','Saloon','Companion door','Loose','Bolt loose on port side companionway door frame',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r15','qc-handover-c1069','Saloon','Companion door','Damage','Scratches on companionway door frame + clean all black bolts',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1069-r16','qc-handover-c1069','Saloon','Nav desk','Scratches','Scratches on helm seat stainless steel backrest',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r17','qc-handover-c1069','Saloon','LED overhead lighting','Incorrect','Saloon down lighters fitted incorrectly (X4)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r18','qc-handover-c1069','Saloon','Draw locker','Cleaning','Over spray on draw locker fronts',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r19','qc-handover-c1069','Saloon','window surround','Voids','Bubble on port side bottom window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r37','qc-handover-c1069','Stbd Fwd Heads','Ceiling','Sealer','Yellow sealer on deck ceiling joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r38','qc-handover-c1069','Stbd Fwd Heads','Ceiling','Cleaning','Residue at top fwd of vanity',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r39','qc-handover-c1069','Stbd Fwd Heads','Ceiling','Sealer','Seal ceiling joint above tank monitor',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r40','qc-handover-c1069','Stbd Fwd Heads','Under-basin locker with toilet roll holder','Loose','Toilet roll holder loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r41','qc-handover-c1069','Stbd Fwd Heads','Windows','Scratches','Scratches on Hull Perspex window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r42','qc-handover-c1069','Stbd Fwd Heads','Bilges','Cleaning','Clean dust in heads bilge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r43','qc-handover-c1069','Stbd Fwd Heads','Cabin Door','Operational','Heads door hinge bound',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r51','qc-handover-c1069','Stbd Fwd Cabin','Draw locker','Operational','Bottom drawer not fully closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r52','qc-handover-c1069','Stbd Fwd Cabin','Floor','Sealer','Seal floor joint below bunk drawers',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r53','qc-handover-c1069','Stbd Fwd Cabin','Windows','Scratches','Scratches on Hull Perspex windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r54','qc-handover-c1069','Stbd Fwd Cabin','Coat hook','Loose','Cabin coat hook loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r55','qc-handover-c1069','Stbd Fwd Cabin','Vinyl panels','Cleaning','Remove masking tape from all vinyl ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r64','qc-handover-c1069','Stbd Passage','Waste tank','Proud/Alignment','Waste tank panel proud',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r65','qc-handover-c1069','Stbd Passage','Door frames','Damage','Poor finish on cabin door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1069-r78','qc-handover-c1069','Stbd Aft Heads','Windows','Scratches','Scratches on hull-side Perspex windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r79','qc-handover-c1069','Stbd Aft Heads','Window blinds','Proud/Alignment','Blind catch fitted skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r80','qc-handover-c1069','Stbd Aft Heads','Under-basin locker with toilet roll holder','Cleaning','Clean in recess, forward of basin locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r81','qc-handover-c1069','Stbd Aft Heads','Dividers','Scratches','Visible scratches on Perspex divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r82','qc-handover-c1069','Stbd Aft Heads','Inboard liner','Cleaning','Clean inside toilet inspection locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r83','qc-handover-c1069','Stbd Aft Heads','Formica Bulkheads','Cleaning','Smears on inboard bulkhead',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r84','qc-handover-c1069','Stbd Aft Heads','Floor','Sealer','Seal floor joint off of toilet platform',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r85','qc-handover-c1069','Stbd Aft Heads','Perspex','Scratches','Scratches on fixed Perspex panel of heads',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r94','qc-handover-c1069','Study','Hanging locker','Loose','Hinge loose below hanging locker drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r95','qc-handover-c1069','Study','Draw locker','Cleaning','Pencil marks visible on forward end of drawer locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r96','qc-handover-c1069','Study','Draw locker','Loose','Bottom shoe locker hinges loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r97','qc-handover-c1069','Study','Hanging locker','Loose','Hanging locker top aft hinge loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r114','qc-handover-c1069','Stbd Aft Cabin','Windows','Scratches','Scratches on aft cabin Perspex windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r115','qc-handover-c1069','Stbd Aft Cabin','Vinyl panels','Cleaning','Remove masking tape from all vinyl ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r116','qc-handover-c1069','Stbd Aft Cabin','Ceiling','Scratches','Scratches at top aft ceiling panel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r117','qc-handover-c1069','Stbd Aft Cabin','Vinyl panels','Cleaning','Clean all vinyl ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r118','qc-handover-c1069','Stbd Aft Cabin','Aircon unit','Cleaning','Clean dust and debris inside aircon locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r119','qc-handover-c1069','Stbd Aft Cabin','Fridge/Freezer locker','Cleaning','Remove debris inside fridge locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r152','qc-handover-c1069','Port Fwd Cabin','Vinyl ceiling','Spills','Kokimark on vinyl ceiling forward of gas detector and clean stains on all vinyl ceilings',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r153','qc-handover-c1069','Port Fwd Cabin','Cabin door','Damage','Damage on door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r154','qc-handover-c1069','Port Fwd Cabin','Formica','Spills','Glue spills on Formica inboard area and around lockers check area for pencil marks and remove',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r156','qc-handover-c1069','Port Fwd Cabin','Vinyl ceiling','Proud/Alignment','Ceiling panel stepping forward of hatch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r157','qc-handover-c1069','Port Fwd Cabin','Hatch','Cleaning','Clean entire hatch surround',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r158','qc-handover-c1069','Port Fwd Cabin','AC Outlets','Loose','Loose outlet inboard locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r159','qc-handover-c1069','Port Fwd Cabin','Hatch','Operational','Hatch in for peak stucks in operation',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r167','qc-handover-c1069','Port Fwd Heads','Shower bulkhead module','Loose','shower rail bases',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r168','qc-handover-c1069','Port Fwd Heads','window surround','sealer','Missing sealer on hull transition',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r169','qc-handover-c1069','Port Fwd Heads','Vanity locker with mirror','cleaning','clean debris on mirror at edge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r170','qc-handover-c1069','Port Fwd Heads','Solids','damage','on door capping surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1069-r171','qc-handover-c1069','Port Fwd Heads','Sliding entrance door with lock','sealer','poor sealer aft at sliding door capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r172','qc-handover-c1069','Port Fwd Heads','Sliding entrance door with lock','Loose','screws on sliding door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r173','qc-handover-c1069','Port Fwd Heads','Sliding entrance door with lock','scratches','on bottom step stainless steel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r189','qc-handover-c1069','Port Aft Cabin','Bilges','Cleaning','water in fuel tank bilge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r190','qc-handover-c1069','Port Aft Cabin','Ceiling Liner','Scratches','scratches and dull inboard ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r191','qc-handover-c1069','Port Aft Cabin','Stowage space under floorboards','Sealer','excess sika below floor ground in stowage',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r192','qc-handover-c1069','Port Aft Cabin','Floor','Cleaning','tape residue on floors',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r193','qc-handover-c1069','Port Aft Cabin','Floor','Sealer','neaten floor sealer as marked around aft floor',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r194','qc-handover-c1069','Port Aft Cabin','Fiddles','Cleaning','stains on bunk fiddle',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r195','qc-handover-c1069','Port Aft Cabin','Vinyl ceiling','Loose','fan ceiling panel flimsy',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r196','qc-handover-c1069','Port Aft Cabin','Hanging locker','Proud/Alignment','doors stepping at top',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r197','qc-handover-c1069','Port Aft Cabin','Hanging locker','Proud/Alignment','toggle holes on insp panel not lining up+chips on panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r198','qc-handover-c1069','Port Aft Cabin','Hanging locker','Cleaning','remove plastic from aft insp panel in hanging locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r199','qc-handover-c1069','Port Aft Cabin','Hanging locker','Damage','burred screws on insp panel in fwd hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r200','qc-handover-c1069','Port Aft Cabin','Hanging locker','Proud/Alignment','neaten joints at shelf fiddles in fwd locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r201','qc-handover-c1069','Port Aft Cabin','Door frames','Damage','neaten screw holes in door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1069-r204','qc-handover-c1069','Port Aft Heads','Sliding or hinged heads door','Loose','door loose at top',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r205','qc-handover-c1069','Port Aft Heads','Coat hook','Loose','at base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r206','qc-handover-c1069','Port Aft Heads','Shower bulkhead module','Sealer','neaten sealer behind shower splash back',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r207','qc-handover-c1069','Port Aft Heads','Shower compartment c/w lever mixer and adjustable shower rose','Loose','shower rail',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c1069-r208','qc-handover-c1069','Port Aft Heads','Portlight','Scratches','on portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r211','qc-handover-c1069','Port Passage','Frame','Damage','Poor finish on fwd cabin door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1069-r212','qc-handover-c1069','Port Passage','Lockers','Proud/Alignment','Adjust outboard locker door hights',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r213','qc-handover-c1069','Port Passage','Lockers','Loose','Top fwd locker hinge loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r214','qc-handover-c1069','Port Passage','Inspection lids','Cleaning','Remove masking tape in insp panels inside outboard locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r215','qc-handover-c1069','Port Passage','Inspection lids','Missing part','Velcro not fitted on bottom outboard locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r216','qc-handover-c1069','Port Passage','Lids','Proud/Alignment','Fwd passage floor lid tight',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1069-r217','qc-handover-c1069','Port Passage','Bilges','Cleaning','Clean inside passage bilge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r224','qc-handover-c1069','Aft Cockpit','Transom','Track repairs','porosity In tracking on STB second step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r225','qc-handover-c1069','Aft Cockpit','Locker lids','Repairs','porosity on STB engine room aft coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r226','qc-handover-c1069','Aft Cockpit','Floor','Pinholes','in tracking fwd of Davit walkway',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1069-r227','qc-handover-c1069','Aft Cockpit','Locker lids','Loose','bolts on aft lids at Davit',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r228','qc-handover-c1069','Aft Cockpit','Helmstation','Spills','on stainless steel at helm',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r229','qc-handover-c1069','Aft Cockpit','Floating step','Scratches','on helm steps',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r230','qc-handover-c1069','Aft Cockpit','Fridge/Freezer locker','Operational','aft cockpit fridge opening when locked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r231','qc-handover-c1069','Aft Cockpit','Decklid','Sealer','missing sealer at Davit wire',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r232','qc-handover-c1069','Aft Cockpit','Lockers','Loose','hinges on chubby locker door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r233','qc-handover-c1069','Aft Cockpit','Floor','Track repairs','damage diamonds port of sump',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1069-r234','qc-handover-c1069','Aft Cockpit','Settee','Cracks','below port settee below table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r235','qc-handover-c1069','Aft Cockpit','Floor','Track repairs','Visible track repairs in walkway',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r236','qc-handover-c1069','Aft Cockpit','Table','Cleaning','excess sealer below table',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r237','qc-handover-c1069','Aft Cockpit','Table','Proud/Alignment','visible gap below at table at stainless steel base',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r238','qc-handover-c1069','Aft Cockpit','Transom','Track repairs','sand marks on port transom second step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r239','qc-handover-c1069','Aft Cockpit','Locker lids','Cracks','star crack on STB engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r240','qc-handover-c1069','Aft Cockpit','Transom','Damage','on port bumper rubber',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r241','qc-handover-c1069','Aft Cockpit','Vinyl ceiling','Loose','ceiling panels (check all)',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r242','qc-handover-c1069','Aft Cockpit','Folding swimming ladder c/w teak steps','Proud/Alignment','swim ladder teflons not sitting flush with ladder',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r264','qc-handover-c1069','Port Side Deck','Pulpits with seats','Sealer','missing sealer at fwd side at bow',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r265','qc-handover-c1069','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','clean all stainless steel + bases',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r266','qc-handover-c1069','Port Side Deck','Hatch','Missing part','missing labels on hatches',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r267','qc-handover-c1069','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','stanchion bases (check all)',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r275','qc-handover-c1069','Stbd Side Deck','Bows','Scratches','scratches on entire bow',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r276','qc-handover-c1069','Stbd Side Deck','Decklid','Scratches','dull on entire decklid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r277','qc-handover-c1069','Stbd Side Deck','Targawing','Scratches','dull on entire Targa wing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r278','qc-handover-c1069','Stbd Side Deck','Deck flange','Repairs','visible hole at fwd stanchion base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r279','qc-handover-c1069','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Loose','stanchion bases (check all)',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r287','qc-handover-c1069','Flybridge','Bimini','Cleaning','excess sealer at Bimini stanchion bases',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r288','qc-handover-c1069','Flybridge','Helmstation','Cleaning','remove yellow tape on helm pod',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r289','qc-handover-c1069','Flybridge','Table','Cleaning','rust In tracking below table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r290','qc-handover-c1069','Flybridge','Floor','Loose','loose Velcro on centre panel',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r291','qc-handover-c1069','Flybridge','Floor','Sealer','excess sealer at gooseneck',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r305','qc-handover-c1069','Fwd Cockpit & Foredeck','Fwd cockpit door','Loose','Loose door handle',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r306','qc-handover-c1069','Fwd Cockpit & Foredeck','Fwd cockpit door','Damage','Burred screws on door frame check entire frame',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r307','qc-handover-c1069','Fwd Cockpit & Foredeck','Fwd cockpit door','Cracks','Crack on door frame top section',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r308','qc-handover-c1069','Fwd Cockpit & Foredeck','Locker lids','Scratches','Scratches on combing at gas locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r309','qc-handover-c1069','Fwd Cockpit & Foredeck','Settee','Scratches','Scratches on settee top coaming surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r310','qc-handover-c1069','Fwd Cockpit & Foredeck','Decklid','Scratches','Scratches on decklet inner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r311','qc-handover-c1069','Fwd Cockpit & Foredeck','Fwd area','Loose','Shackle at filler loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r312','qc-handover-c1069','Fwd Cockpit & Foredeck','Locker lids','Operational','Gen set locker Perco knocking',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r346','qc-handover-c1069','Port Hull','Fwd area','Scratches','Scratches above & below fwd cabin port light',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r347','qc-handover-c1069','Port Hull','Windows','Scratches','Scratches on aft heads port light',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1069-r348','qc-handover-c1069','Port Hull','Midship area','Cleaning','Clean residue below aft heads window',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1069-r349','qc-handover-c1069','Port Hull','Aft area','Scratches','Scratcehes fwd of aft chaft plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r359','qc-handover-c1069','Stbd Hull','Aft area','Scratches','Scratches below aft cabin window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r360','qc-handover-c1069','Stbd Hull','chafe plate','Sealer','Neaten aft chaff plate sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1069-r361','qc-handover-c1069','Stbd Hull','Fwd area','Scratches','Scratches below fwd cabin window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1069-r362','qc-handover-c1069','Stbd Hull','Fwd area','Scratches','Scratches fwd of fwd chaff plate',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c1070','C1070_HO_Audit','C1') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Saloon','Zunaid Hoosen',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Stbd Fwd Heads','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Stbd Fwd Cabin','Zunaid Hoosen',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Stbd Passage','Zunaid Hoosen',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Stbd Aft Heads','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Study','Zunaid Hoosen',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Stbd Aft Cabin','Zunaid Hoosen',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Port Fwd Cabin','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Port Fwd Heads','Zunaid Hoosen',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Port Passage','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Port Aft Heads','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Port Aft Cabin','Zunaid Hoosen',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Stbd Side Deck','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Port Side Deck','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Fwd Cockpit & Foredeck','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Aft Cockpit','Zunaid Hoosen',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Stbd Hull','',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Port Hull','Zunaid Hoosen',17) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1070','Flybrige','Zunaid Hoosen',18) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c1070-r5','qc-handover-c1070','Saloon','Nav desk','Loose','Bubble on nav desk viyle insp',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r6','qc-handover-c1070','Saloon','Nav desk','Missing part','Screw missing inside nav desk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r7','qc-handover-c1070','Saloon','Fwd cockpit door','Cleaning','Remove tape residue on fwd cockpit door surrounds',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r8','qc-handover-c1070','Saloon','Floor','Spills','Spills inside port fwd floor locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r9','qc-handover-c1070','Saloon','corian','Scratches','Scratches on edge of corian by sink',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r10','qc-handover-c1070','Saloon','window surround','Scratches','Scratches on edge of GRP by Stb mullion',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r11','qc-handover-c1070','Saloon','window surround','Cleaning','Clean all mullions',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r12','qc-handover-c1070','Saloon','Tv locker','Proud/Alignment','Aft side proud by microwave pull out shelf',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r13','qc-handover-c1070','Saloon','Tv locker','Missing part','Edging missing at back of TV locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r14','qc-handover-c1070','Saloon','Ceiling Liner','Scratches','Scrathes on ceiling at top aft Stb side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r15','qc-handover-c1070','Saloon','Magazine locker/shelf locker','Cleaning','Glue spills on edging fwd of magazine locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r16','qc-handover-c1070','Saloon','Locker lids','Proud/Alignment','Battery locker floor lids tight (X2)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r17','qc-handover-c1070','Saloon','LED Overhead lighting','Incorrect','Port side down light fitted incorretly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r18','qc-handover-c1070','Saloon','Vinyl ceiling','Damage','Cut on Stb ceiling panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r19','qc-handover-c1070','Saloon','Vinyl panels','Cleaning','Clean all vinyl panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r20','qc-handover-c1070','Saloon','Fridge/Freezer locker','Proud/Alignment','Re-align Saloon fridge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r42','qc-handover-c1070','Stbd Fwd Heads','Ceiling','Sealer','Heads ceiling sealer yellowing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r43','qc-handover-c1070','Stbd Fwd Heads','Ceiling','Cleaning','Residue on outboard heads ceiling',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r44','qc-handover-c1070','Stbd Fwd Heads','Heads bulkhead module','Cleaning','Excess sika at shelf below port light window',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r45','qc-handover-c1070','Stbd Fwd Heads','Windows','Scratches','Scratches on hull side window perspex',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r46','qc-handover-c1070','Stbd Fwd Heads','LED Overhead lighting','Loose','Aft heads rope light loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r47','qc-handover-c1070','Stbd Fwd Heads','Bilges','Cleaning','Clean inside bilge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r58','qc-handover-c1070','Stbd Fwd Cabin','Windows','Scratches','Scratches on hull side perspex window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r59','qc-handover-c1070','Stbd Fwd Cabin','Bunktop/Double berth','Cleaning','Paint spill on bunk formica',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r60','qc-handover-c1070','Stbd Fwd Cabin','Bunk Drawers','Proud/Alignment','Bunk draws push lock knobs proud',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r61','qc-handover-c1070','Stbd Fwd Cabin','Formica steps','Missing part','Fire lable not fitted',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r62','qc-handover-c1070','Stbd Fwd Cabin','Vinyl panels','Cleaning','Remove masking tape from all vinyl panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r63','qc-handover-c1070','Stbd Fwd Cabin','Vinyl panels','Cleaning','Sika spills on headboard vinyl panel',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r64','qc-handover-c1070','Stbd Fwd Cabin','Inspection lids','Cleaning','Clean inside headboard insp',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r65','qc-handover-c1070','Stbd Fwd Cabin','Floor','Cleaning','Glue spills on floor below cabin door retainer',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r66','qc-handover-c1070','Stbd Fwd Cabin','Hanging locker','Proud/Alignment','Hanging locker door proud at top aft corner',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r67','qc-handover-c1070','Stbd Fwd Cabin','Aircon unit','Proud/Alignment','Aircon locker lid fwd toggle turns in tight',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r82','qc-handover-c1070','Stbd Passage','Door frames','Damage','Dents on cabin door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1070-r83','qc-handover-c1070','Stbd Passage','Waste tank','Damage','Waste tank platform wood spliting',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c1070-r84','qc-handover-c1070','Stbd Passage','Floor','Sealer','Sealer touch up below draw locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r85','qc-handover-c1070','Stbd Passage','Staircase','Repairs','Touch up on top step edging',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r123','qc-handover-c1070','Stbd Aft Heads','Windows','Scratches','Scratches on hull side peespex windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r124','qc-handover-c1070','Stbd Aft Heads','Dividers','Damage','Chips and scratches on heads perspex divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r125','qc-handover-c1070','Stbd Aft Heads','Basin module','Scratches','Scratches inside basin',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r126','qc-handover-c1070','Stbd Aft Heads','Formica Bulkheads','Scratches','Scratches on edging aft of basin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r127','qc-handover-c1070','Stbd Aft Heads','Formica Bulkheads','Cleaning','Pen marks around door catch',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r128','qc-handover-c1070','Stbd Aft Heads','Floor','Sealer','Seal floor joint fwd of toilet platform',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r137','qc-handover-c1070','Study','Draw locker','Proud/Alignment','Adjust study desk draw gaps',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r138','qc-handover-c1070','Study','Draw locker','Damage','Center outboard draw clip broken',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r163','qc-handover-c1070','Stbd Aft Cabin','Bunk Liners','Spills','White spills on inboard bunk liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r164','qc-handover-c1070','Stbd Aft Cabin','Bunk Drawers','Operational','Bunk draw open when locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r165','qc-handover-c1070','Stbd Aft Cabin','Aircon unit','Cleaning','Remove craddle plexus inside aiecon locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r166','qc-handover-c1070','Stbd Aft Cabin','Aircon unit','Cleaning','Clean inside aircon locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r167','qc-handover-c1070','Stbd Aft Cabin','Windows','Scratches','Scratches on hull windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r168','qc-handover-c1070','Stbd Aft Cabin','LED Overhead lighting','Operational','Inboard side rope lights not working',7,'Electrical',false,'','','','',''),
  ('qc-handover-c1070-r169','qc-handover-c1070','Stbd Aft Cabin','Vinyl panels','Cleaning','Clean all vinyl panles',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r203','qc-handover-c1070','Port Fwd Cabin','Forepeak panel','Sealer','Sealer pulling loose on fore peak shelf',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r204','qc-handover-c1070','Port Fwd Cabin','Lockers','Cleaning','Remove yellow tape from fore peak locker stainless steel',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r205','qc-handover-c1070','Port Fwd Cabin','Flush Hatch over port forepeak (includes mushroom cowl)','Cleaning','Koki mark on fore peak hatch liner',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r206','qc-handover-c1070','Port Fwd Cabin','Windows','Scratches','Scratches on hull side perspex windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r207','qc-handover-c1070','Port Fwd Cabin','LED Overhead lighting','Loose','Strap fwd outboard rope light wires',7,'Electrical',false,'','','','',''),
  ('qc-handover-c1070-r208','qc-handover-c1070','Port Fwd Cabin','Coat hook','Loose','Coat hook loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r209','qc-handover-c1070','Port Fwd Cabin','Cabin Door','Proud/Alignment','Cabin door rattles when locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r210','qc-handover-c1070','Port Fwd Cabin','Cabin Door','Damage','Botton hinge screws burred',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r211','qc-handover-c1070','Port Fwd Cabin','Door frames','Cleaning','Clean pencil marks by bottom hinge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r217','qc-handover-c1070','Port Fwd Heads','Windows','Scratches','Scratches on hull windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r218','qc-handover-c1070','Port Fwd Heads','Shower compartment c/w lever mixer and adjustable shower rose','Proud/Alignment','Port light knocking shower rose rail',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c1070-r219','qc-handover-c1070','Port Fwd Heads','Under-basin locker with toilet roll holder','Proud/Alignment','Toilet roll holder fitted skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r220','qc-handover-c1070','Port Fwd Heads','Under-basin locker with toilet roll holder','Missing part','Screws missing basin locker insp',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r221','qc-handover-c1070','Port Fwd Heads','Under-basin locker with toilet roll holder','Proud/Alignment','Adjust basin locker catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r222','qc-handover-c1070','Port Fwd Heads','Heads bulkhead module','Sealer','Seal at fwd inboard heads bulkhead joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r223','qc-handover-c1070','Port Fwd Heads','Door frames','Sealer','Seal door frame behind sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r233','qc-handover-c1070','Port Passage','Lockers','Cleaning','Clean inside HV locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r239','qc-handover-c1070','Port Aft Heads','Sliding entrance door with lock','Proud/Alignment','Heads door chaffing on bottom door guide',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r240','qc-handover-c1070','Port Aft Heads','Sliding entrance door with lock','Proud/Alignment','Heads door not alighed with catch & chaffing palmet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r241','qc-handover-c1070','Port Aft Heads','Formica Bulkheads','Sealer','Seal aft inboard bulkhead joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r242','qc-handover-c1070','Port Aft Heads','Door frames','Sealer','Seal aft heads door frame behind door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r243','qc-handover-c1070','Port Aft Heads','corian','Incorrect','No finger grip access on corian sump lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r244','qc-handover-c1070','Port Aft Heads','Floor','Sealer','Sealee yellowing below heads door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r245','qc-handover-c1070','Port Aft Heads','Formica Bulkheads','Sealer','Sealer yellowing on aft bulkhead',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r252','qc-handover-c1070','Port Aft Cabin','Windows','Scratches','Scratches on hull and aft windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r253','qc-handover-c1070','Port Aft Cabin','Vinyl panels','Cleaning','Stains on inboard vinyl panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r254','qc-handover-c1070','Port Aft Cabin','Aircon unit','Cleaning','Clean inside inboard insp locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r255','qc-handover-c1070','Port Aft Cabin','Vinyl panels','Cleaning','Remove tape on all vinyl panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r256','qc-handover-c1070','Port Aft Cabin','Coat hook','Scratches','Residue around inboard coat hook',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r257','qc-handover-c1070','Port Aft Cabin','Cabin Door','Proud/Alignment','Bottom hinge screw proud',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r258','qc-handover-c1070','Port Aft Cabin','Cabin Door','Operational','Cabin door lock pin tight',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1070-r272','qc-handover-c1070','Stbd Side Deck','Hatch','crack','crack outboard of aft cabin hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r273','qc-handover-c1070','Stbd Side Deck','side deck step','Porosity','porosity on top step coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r274','qc-handover-c1070','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Damage','split ring damaged',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1070-r275','qc-handover-c1070','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','clean guard wires',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r276','qc-handover-c1070','Stbd Side Deck','Floor','Track repairs','damaged track outboard of fwd cabin hatch',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1070-r277','qc-handover-c1070','Stbd Side Deck','Floor','Track repairs','Damaged track fwd of fwd cabin hatch',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1070-r278','qc-handover-c1070','Stbd Side Deck','Bows','crack','crack on bow at pulpit base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r288','qc-handover-c1070','Port Side Deck','Bows','crack','crack on bow at pulpit base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r289','qc-handover-c1070','Port Side Deck','Pulpits with seats','cleaning','rust on pulpit seat',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r290','qc-handover-c1070','Port Side Deck','Hatch','scratches','Scr aft of fwd cabin hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r291','qc-handover-c1070','Port Side Deck','Hatch','crack','crack inboard fwd of aft cabin hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r292','qc-handover-c1070','Port Side Deck','side deck step','repairs','poor repairs on aft outboard step coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r312','qc-handover-c1070','Fwd Cockpit & Foredeck','Trampoline','Cleaning','Clean excess stb fwd of flange',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r313','qc-handover-c1070','Fwd Cockpit & Foredeck','Sunbed','Spills','Spills on stb coaming inboard of fwd hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r314','qc-handover-c1070','Fwd Cockpit & Foredeck','Sunbed','Track repairs','sand marks in tracking on stb sunbed',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r315','qc-handover-c1070','Fwd Cockpit & Foredeck','Floor','Track repairs','Sand marks in tracking between anchor locker and stb locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r316','qc-handover-c1070','Fwd Cockpit & Foredeck','window surround','Cracks','crack above stb window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r317','qc-handover-c1070','Fwd Cockpit & Foredeck','Settee','Scratches','scr on port back rest',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r318','qc-handover-c1070','Fwd Cockpit & Foredeck','window surround','Cleaning','clean excess above port saloon window',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r351','qc-handover-c1070','Aft Cockpit','Bimini','Scratches','Scuff marks on bimini inner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r352','qc-handover-c1070','Aft Cockpit','Helmstation','Cleaning','Remove plastic from MFD',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r353','qc-handover-c1070','Aft Cockpit','Helmstation','Cleaning','Spills on forward end of chubby locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r354','qc-handover-c1070','Aft Cockpit','Fridge/Freezer locker','Cleaning','Sika spills and paint below off cockpit fridge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r355','qc-handover-c1070','Aft Cockpit','Table','Scratches','Scratches on off cockpit table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r356','qc-handover-c1070','Aft Cockpit','Floor','Track repairs','Visible track repairs in off cockpit walkway',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r357','qc-handover-c1070','Aft Cockpit','Floor','Spills','Spills on tracking forward of life raft locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r358','qc-handover-c1070','Aft Cockpit','Lids','Repairs','Poor repairs visible on off the sump lid covers',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r359','qc-handover-c1070','Aft Cockpit','Engine Room','Porosity','Porosity on edge of Starboard engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r360','qc-handover-c1070','Aft Cockpit','Transom','Porosity','Porosity on smooth surface on Starboard Transom step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r361','qc-handover-c1070','Aft Cockpit','Transom','Cleaning','Sika spills on Starboard Transom off end',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r362','qc-handover-c1070','Aft Cockpit','Ceiling','Loose','Davit switch loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1070-r363','qc-handover-c1070','Aft Cockpit','Engine Room','Spills','Spills on port engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r364','qc-handover-c1070','Aft Cockpit','Engine Room','Repairs','Neaton track lines on port engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r365','qc-handover-c1070','Aft Cockpit','Transom','Repairs','Yellow stains on GRP on port Transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r366','qc-handover-c1070','Aft Cockpit','Transom','Spills','Spills on inboard of port Transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r367','qc-handover-c1070','Aft Cockpit','Ceiling','Scratches','Dull patch on ceiling at Starboard side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r386','qc-handover-c1070','Stbd Hull','Aft area','Scratches','Scratches above window below stansion gate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r387','qc-handover-c1070','Stbd Hull','Aft area','Cracks','Cracks visible above window forward of aft chafe plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r388','qc-handover-c1070','Stbd Hull','Aft area','Sealer','Sealer touch up on aft deck joint',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1070-r389','qc-handover-c1070','Stbd Hull','Aft area','Spills','Spills at bottom of aft deck joint',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r390','qc-handover-c1070','Stbd Hull','Aft area','Cleaning','Clean sika spills outboard of starboard transom',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r397','qc-handover-c1070','Port Hull','Windows','Scratches','Scratch visible at bottom end of port hull forward windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r398','qc-handover-c1070','Port Hull','Windows','Cleaning','Spills on window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1070-r399','qc-handover-c1070','Port Hull','Midship area','Spills','Spills on forward heads window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r400','qc-handover-c1070','Port Hull','Midship area','Cleaning','Clean sealer around chain plate',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r401','qc-handover-c1070','Port Hull','Aft area','Cleaning','Sealer spills on hull below stansion gate',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r402','qc-handover-c1070','Port Hull','Aft area','Sealer','Sealer touch up on bumper rubber',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1070-r425','qc-handover-c1070','Flybrige','Flybridge steps','Cleaning','Clean Flybridge step edges',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r426','qc-handover-c1070','Flybrige','Flybridge steps','Cleaning','Black spills on Flybridge top step',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r427','qc-handover-c1070','Flybrige','Flybridge steps','Cleaning','Tape residue on Flybridge step labels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r428','qc-handover-c1070','Flybrige','Decklid','Cracks','Crack visible at Flybridge top step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r429','qc-handover-c1070','Flybrige','Natural anodized mast','Loose','Forward doom shackle loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1070-r430','qc-handover-c1070','Flybrige','Decklid','Cleaning','Remove plastic from Flybridge speaker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r431','qc-handover-c1070','Flybrige','Bimini','Missing part','Label missing at aft of Birmani',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1070-r432','qc-handover-c1070','Flybrige','Bimini','Spills','Spills on Bimini aft outboard corner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r433','qc-handover-c1070','Flybrige','Bimini','Scratches','Scratches at aft outboard of Birmani',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1070-r434','qc-handover-c1070','Flybrige','Bimini','Cleaning','Tape residue on outboard of Birmani',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1070-r435','qc-handover-c1070','Flybrige','Decklid','Scratches','Scratches at aft outboard of deck',10,'Cleaning',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c1071','C1071_HO_Audit','C1') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Port Deck','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Stb Deck','Zunaid Hoosen',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Fwd Cockpit & Foredeck','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Flybridge','Zunaid Hoosen',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Port Hull','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Stbd Hull','Zunaid Hoosen',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Aft Cockpit','Zunaid Hoosen',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Saloon','Zunaid Hoosen',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Port Fwd Cabin','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Port Fwd Heads','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Port Passage','Riyaaz Harold',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Port Aft Heads','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Port Aft Cabin','Riyaaz Harold',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Stbd Fwd Heads','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Stbd Fwd Cabin','Zunaid Hoosen',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Stbd Passage','Zunaid Hoosen',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1071','Study','Zunaid Hoosen',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c1071-r5','qc-handover-c1071','Port Deck','Aft area','Scratches','Scratches at aft of toe rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r6','qc-handover-c1071','Port Deck','Aft area','Scratches','Scratches on combing of aft step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r7','qc-handover-c1071','Port Deck','Aft area','Track repairs','Visible track repairs on aft tracking panel',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1071-r8','qc-handover-c1071','Port Deck','Flush Hatch over cabins','Cleaning','Clean residue of all deck hatch hinges',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r9','qc-handover-c1071','Port Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Clean all stantions',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r10','qc-handover-c1071','Port Deck','Decklid','Scratches','Buff deckled smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r11','qc-handover-c1071','Port Deck','Fwd area','Spills','Spills on tracking aft of pulpit seat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r12','qc-handover-c1071','Port Deck','Bows','Cracks','Crack on bow below pulpit seat base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r16','qc-handover-c1071','Stb Deck','Aft area','Scratches','Scratches visible at aft outboard of aft step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r17','qc-handover-c1071','Stb Deck','Decklid','Damage','Chip + scratches below forward end of aft grab handle',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r18','qc-handover-c1071','Stb Deck','Flush Hatch over cabins','Scratches','Clean residue off all deck hatch hinges',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r19','qc-handover-c1071','Stb Deck','Targawing','Cracks','Crack at aft bottom of targa wing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r20','qc-handover-c1071','Stb Deck','Targawing','Scratches','Dull and scratches between deck lid and targa wing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r21','qc-handover-c1071','Stb Deck','Decklid','Scratches','Dull on deck lid above forward step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r22','qc-handover-c1071','Stb Deck','Midship area','Spills','Spills on deck inboard of chain plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r23','qc-handover-c1071','Stb Deck','Decklid','Scratches','Dull and scratches forward of deck lid grabrail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r24','qc-handover-c1071','Stb Deck','Decklid','Damage','Damage on GRP forward of deck lid grab handle',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r25','qc-handover-c1071','Stb Deck','Bows','Repairs','Poor Repair around forward pulpit seat base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r26','qc-handover-c1071','Stb Deck','Bows','Scratches','Dull and scratches around bow GRP',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r38','qc-handover-c1071','Fwd Cockpit & Foredeck','Vinyl panels','Loose','Vinyl edge loose above fwd cockpit door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r39','qc-handover-c1071','Fwd Cockpit & Foredeck','LPG label','Cleaning','Tape residue on labels inside gas locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r40','qc-handover-c1071','Fwd Cockpit & Foredeck','Locker lids','Pinholes','Pin holes aft of step locker lid combing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r41','qc-handover-c1071','Fwd Cockpit & Foredeck','Locker lids','Proud/Alignment','Gen set locker chafing step locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r42','qc-handover-c1071','Fwd Cockpit & Foredeck','Floor','Spills','Spills on tracking outboard of gen set locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r43','qc-handover-c1071','Fwd Cockpit & Foredeck','Trampoline','Loose','Tension and clean trampoline',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r44','qc-handover-c1071','Fwd Cockpit & Foredeck','Trampoline','Scratches','Rust marks starboard fwd of trampoline flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r45','qc-handover-c1071','Fwd Cockpit & Foredeck','Natural anodized crossbeam c/w mooring cleats','Cleaning','Remove bubble wrap from fwd A frame',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r46','qc-handover-c1071','Fwd Cockpit & Foredeck','Guard wires with stanchions, bases, port & starboard side gates','Loose','Tension of fwd guard wire',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r51','qc-handover-c1071','Flybridge','Flybridge steps','Scratches','Scratches on top step of fly bridge combing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r52','qc-handover-c1071','Flybridge','Flybridge steps','Cleaning','Clean tape residue on labels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r53','qc-handover-c1071','Flybridge','Main boom topping lift','Loose','Fwd boom shackle loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r54','qc-handover-c1071','Flybridge','Bimini','Missing part','Label missing at aft of Bimini',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r55','qc-handover-c1071','Flybridge','Bimini','Cleaning','Clean Bimini skylight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r56','qc-handover-c1071','Flybridge','Main boom topping lift','Loose','Shackle loose on aft boom fiddle',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r77','qc-handover-c1071','Port Hull','Aft area','Scratches','Dull on aft of hull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r78','qc-handover-c1071','Port Hull','chafe plate','Scratches','Dull all around aft chef plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r79','qc-handover-c1071','Port Hull','Guard wires with stanchions, bases, port & starboard side gates','Scratches','Scratches on hull below stantion gate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r80','qc-handover-c1071','Port Hull','chain plate','Scratches','Scratches at top aft of chain plate cover',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r81','qc-handover-c1071','Port Hull','chain plate','Cleaning','Clean residue on chain plate cover',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r82','qc-handover-c1071','Port Hull','Midship area','Scratches','Dull on hull below aft heads window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r83','qc-handover-c1071','Port Hull','Fwd area','Cleaning','Clean buffing compound at fwd of hull',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r88','qc-handover-c1071','Stbd Hull','Aft area','Cleaning','Poor repair aft of aft hull window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r89','qc-handover-c1071','Stbd Hull','Aft area','Scratches','Scratches on GRP below of chime line',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r90','qc-handover-c1071','Stbd Hull','Midship area','Cleaning','Clean buffing compound at midship hall',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r91','qc-handover-c1071','Stbd Hull','Fwd area','Cleaning','Clean buffing compound at forward end of hall',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r115','qc-handover-c1071','Aft Cockpit','Bimini','Scratches','Scuff marks on Birmani inner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r116','qc-handover-c1071','Aft Cockpit','Bimini','Scratches','Clean tape residue on Bimini inner',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r117','qc-handover-c1071','Aft Cockpit','Helmstation','Cleaning','Remove yellow tape at aft of helm pod',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r118','qc-handover-c1071','Aft Cockpit','Decklid','Scratches','Scratches visible on deck lid aft of helm station',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r119','qc-handover-c1071','Aft Cockpit','Helmstation','Repairs','Mold mark visible below Starboard fixed leaf',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r120','qc-handover-c1071','Aft Cockpit','Floor','Cracks','Crack visible below aft cockpit fridge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r121','qc-handover-c1071','Aft Cockpit','Settee','Repairs','Poor repair visible port side of sump lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r122','qc-handover-c1071','Aft Cockpit','Lids','Scratches','Overspray on sump lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r123','qc-handover-c1071','Aft Cockpit','Companion door','Cleaning','Clean in recess bottom port side of companion way door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r124','qc-handover-c1071','Aft Cockpit','Floor','Track repairs','Visible track repairs below aft cockpit table',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1071-r125','qc-handover-c1071','Aft Cockpit','Floor','Track repairs','Visible track repairs in aft cockpit walkway',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1071-r126','qc-handover-c1071','Aft Cockpit','Life raft locker with convertible fore/aft seat bolster','Track repairs','Poor track repair outboard of life raft locker lid',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1071-r127','qc-handover-c1071','Aft Cockpit','Lockers','Cleaning','Stains inside fire locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r128','qc-handover-c1071','Aft Cockpit','Lids','Proud/Alignment','Adjust fire locker lid perco',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r129','qc-handover-c1071','Aft Cockpit','Lids','Proud/Alignment','Bolts proud on aft cockpit aft sump lids',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r130','qc-handover-c1071','Aft Cockpit','Guard wires with stanchions, bases, port & starboard side gates','Loose','Tension aft guard wires',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r131','qc-handover-c1071','Aft Cockpit','window module','Scratches','Dull on smooth surface at Starboard aft cabin',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r132','qc-handover-c1071','Aft Cockpit','Transom','Spills','Gelcoat spill at aft of Starboard Transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r133','qc-handover-c1071','Aft Cockpit','Transom','Repairs','Gelcoat peeling at outboard of Starboard Transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r134','qc-handover-c1071','Aft Cockpit','Transom','Track repairs','Starcrack visible in tracking outboard of Starboard Transom',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1071-r135','qc-handover-c1071','Aft Cockpit','toe rail','Scratches','Scratches visible on outboard of Starboard toe rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r136','qc-handover-c1071','Aft Cockpit','Engine Room','Sealer','Neaten sealer by port engine room lid hinges',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r137','qc-handover-c1071','Aft Cockpit','Transom','Sealer','Clean sealer around port and Starboard shore power boxes',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r138','qc-handover-c1071','Aft Cockpit','Engine Room','Spills','Spill on inboard aft corner of port engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r139','qc-handover-c1071','Aft Cockpit','Aft area','Loose','Starboard david Latch Bolt loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r148','qc-handover-c1071','Saloon','Vinyl panels','Damage','Damaged on grey vinyl panel forward of Galley locker',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c1071-r149','qc-handover-c1071','Saloon','window surround','Sealer','Neaton sealer port and starboard sides of forward cockpit door window surrounds',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r150','qc-handover-c1071','Saloon','Nav desk','Cleaning','Clean in recess forward of nav desk',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r151','qc-handover-c1071','Saloon','Galley lockers','Repairs','Visible GRP repairs forward sink locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r152','qc-handover-c1071','Saloon','Windows','Scratches','Scratches on port light windows (X2)',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r153','qc-handover-c1071','Saloon','Ceiling Liner','Scratches','Scratches at top port side of ceiling liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r154','qc-handover-c1071','Saloon','Nav desk','Cleaning','Clean tape residue on genset label',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r155','qc-handover-c1071','Saloon','Galley lockers','Cleaning','Pen marks visible behind Galley locker by door catches',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r156','qc-handover-c1071','Saloon','corian','Cleaning','Clean excess glue at starboard forward sink locker corian',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r157','qc-handover-c1071','Saloon','window surround','Scratches','Scratches and dull forward and aft of starboard aft mullion',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r158','qc-handover-c1071','Saloon','Tv locker','Proud/Alignment','TV locker side proud by light switches',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r159','qc-handover-c1071','Saloon','Light switch','Cleaning','Clean pencil mark by light switches',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r160','qc-handover-c1071','Saloon','Microwave locker','Loose','Edging loose at aft of microwave pull out shelf',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r161','qc-handover-c1071','Saloon','Tv locker','Cleaning','Remove sticker from TV locker adjustment pin',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r162','qc-handover-c1071','Saloon','Companion door','Incorrect','Unwanted label fitted on companion way door',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r163','qc-handover-c1071','Saloon','Ceiling','Scratches','Scratches and dull on ceiling above companion way door',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r164','qc-handover-c1071','Saloon','Companion door','Loose','Bolt loose on companion way door port side',4,'Deckfitting',true,'','','','',''),
  ('qc-handover-c1071-r165','qc-handover-c1071','Saloon','Table','Incorrect','Edging short on saloon table',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r166','qc-handover-c1071','Saloon','Table','Loose','All bolts loose below saloon table',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r167','qc-handover-c1071','Saloon','Floor','Damage','Screws burred inside linx locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r168','qc-handover-c1071','Saloon','House batteries','Loose','Battery locker braces loose (X2)',7,'Electrical',false,'','','','',''),
  ('qc-handover-c1071-r169','qc-handover-c1071','Saloon','House batteries','Loose','Battery locker centre grounds loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r170','qc-handover-c1071','Saloon','Ceiling','Cleaning','Clean in black recess of saloon ceiling',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r181','qc-handover-c1071','Port Fwd Cabin','Cabin Door','Damage','Damage on cabin door handel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r182','qc-handover-c1071','Port Fwd Cabin','Inspection lids','Damage','Visible touchup around toggle on insp panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r183','qc-handover-c1071','Port Fwd Cabin','Draw locker','Operational','Bottom draw opens when locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r184','qc-handover-c1071','Port Fwd Cabin','Draw locker','Operational','Top draw difficult to lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r185','qc-handover-c1071','Port Fwd Cabin','Flush Hatch over cabins','Incorrect','Hatch cover trim joiner to long',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r186','qc-handover-c1071','Port Fwd Cabin','Fiddles','Spills','Stains on bunk fiddle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r187','qc-handover-c1071','Port Fwd Cabin','Light switch','Proud/Alignment','Hullside fwd light switch fitted skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r191','qc-handover-c1071','Port Fwd Heads','Under-basin locker with toilet roll holder','Loose','Basin locker catch loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r192','qc-handover-c1071','Port Fwd Heads','Window blinds','Loose','Blind catch loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r193','qc-handover-c1071','Port Fwd Heads','corian','Sealer','Corian sealer yellowing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r194','qc-handover-c1071','Port Fwd Heads','window module','Scratches','Scratcher at bottom of transition',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r195','qc-handover-c1071','Port Fwd Heads','Coat hook','Loose','Door coat hook loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r196','qc-handover-c1071','Port Fwd Heads','Formica Bulkheads','Damage','Damage on heads door palmet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r200','qc-handover-c1071','Port Passage','AC/DC locker','Damage','Warning lable damage on door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r201','qc-handover-c1071','Port Passage','Formica steps','Incorrect','Formica debonding on top step',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c1071-r202','qc-handover-c1071','Port Passage','Formica Bulkheads','Spills','Glue spills on panel by top step stainless steel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r203','qc-handover-c1071','Port Passage','Door frames','Sealer','Seal inboard door frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r219','qc-handover-c1071','Port Aft Heads','Vanity locker with mirror','Loose','Hinge loose on flod up vanity mirror',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r220','qc-handover-c1071','Port Aft Heads','Ceiling Liner','Sealer','Seal ceiling liner as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r229','qc-handover-c1071','Port Aft Cabin','Vinyl panels','Damage','Damage on inboard vinyl insp panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r230','qc-handover-c1071','Port Aft Cabin','AC Outlets','Proud/Alignment','Inboard aft outlet fitted skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r259','qc-handover-c1071','Stbd Fwd Heads','Coat hook','Loose','Forward coat hook loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r260','qc-handover-c1071','Stbd Fwd Heads','Ceiling','Scratches','Scratches and dull at forward end above coat hook',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r261','qc-handover-c1071','Stbd Fwd Heads','Ceiling','Sealer','Heads ceiling sealer joints yellowing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r262','qc-handover-c1071','Stbd Fwd Heads','Heads bulkhead module','Damage','Heads outboard inspection port cracked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r263','qc-handover-c1071','Stbd Fwd Heads','Basin module','Cleaning','Residue inside basin',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r264','qc-handover-c1071','Stbd Fwd Heads','Heads bulkhead module','Cleaning','Sealer spills at outboard corian soap dish',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r265','qc-handover-c1071','Stbd Fwd Heads','Windows','Scratches','Scratches on hullside portlight window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r266','qc-handover-c1071','Stbd Fwd Heads','Windows','Damage','Primer touch up on outboard hullside window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r267','qc-handover-c1071','Stbd Fwd Heads','Floor','Spills','Gelcoat blobs below corian sump lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r268','qc-handover-c1071','Stbd Fwd Heads','Floor','Scratches','Yellow stains below sump lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r273','qc-handover-c1071','Stbd Fwd Cabin','Bunk Liners','Spills','Black primer spills at forward end cabin GRP liner above step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r274','qc-handover-c1071','Stbd Fwd Cabin','Bunk Drawers','Loose','Bottom bunk drawer catch loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r275','qc-handover-c1071','Stbd Fwd Cabin','Windows','Sealer','Neaten cabin floor ceiling joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r276','qc-handover-c1071','Stbd Fwd Cabin','Windows','Scratches','Scratches on hull side perspex windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r277','qc-handover-c1071','Stbd Fwd Cabin','Bilges','Cleaning','Remove masking tape from inspection panels',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r278','qc-handover-c1071','Stbd Fwd Cabin','Door frames','Missing part','Filler piece not fitted at bottom inboard of walk through capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r279','qc-handover-c1071','Stbd Fwd Cabin','Bilges','Cleaning','Clean blue tape residue on labels inside bulge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r280','qc-handover-c1071','Stbd Fwd Cabin','Coat hook','Loose','Cabin coat hook loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r281','qc-handover-c1071','Stbd Fwd Cabin','Aircon unit','Repairs','Neaten tabbing below aircon locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r282','qc-handover-c1071','Stbd Fwd Cabin','Cabin Door','Operational','Cabin door not locking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r283','qc-handover-c1071','Stbd Fwd Cabin','Cabin Door','Damage','Burred screw on cabin door retainer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r294','qc-handover-c1071','Stbd Passage','Waste tank','Cleaning','Clean inside waste tank locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r295','qc-handover-c1071','Stbd Passage','Draw locker','Damage','Damage on edging outboard of draw locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r296','qc-handover-c1071','Stbd Passage','Draw locker','Spills','Glue spills on forward side of draw locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r297','qc-handover-c1071','Stbd Passage','Formica steps','Cleaning','Excess glue visible on Philippines below top step stainless steel capping',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r302','qc-handover-c1071','Stbd Passage','Formica Bulkheads','Sealer','Yellow sealer on forward bulkhead joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r303','qc-handover-c1071','Stbd Passage','Floor','Scratches','Yellow stains on GRP below corian sump lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r304','qc-handover-c1071','Stbd Passage','Formica Bulkheads','Sealer','Neaton inboard forward bulkhead joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r305','qc-handover-c1071','Stbd Passage','Formica Bulkheads','Sealer','Sealer yellowing on floor at inboard floor joint',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r306','qc-handover-c1071','Stbd Passage','Inspection lids','Loose','Outboard corian lid loose',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c1071-r307','qc-handover-c1071','Stbd Passage','window module','Cleaning','Pencil marks visible around shower rose rail',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r308','qc-handover-c1071','Stbd Passage','Sliding entrance door with lock','Proud/Alignment','Shower door lock chafing catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r309','qc-handover-c1071','Stbd Passage','Floor','Sealer','Seal dressing room floor sealer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r328','qc-handover-c1071','Study','Hanging locker','Loose','Hinges loose on shoe locker below hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r329','qc-handover-c1071','Study','Draw locker','Proud/Alignment','Adjust bottom shoe locker push catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r330','qc-handover-c1071','Study','Draw locker','Loose','Draw locker bottom lid aft hinge loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r331','qc-handover-c1071','Study','Fold up vanity mirror','Proud/Alignment','Study desktop drawers knocking each other when fully opened',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1071-r337','qc-handover-c1071','Study','Windows','Damage','Neaten primer at bottom forward corner of aft window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1071-r338','qc-handover-c1071','Study','Windows','Scratches','Scratches on aft cabin window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1071-r339','qc-handover-c1071','Study','window module','Cleaning','Clean residue on aft window surround at outboard corner',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r340','qc-handover-c1071','Study','Bunktop/Double berth','Scratches','Scratches on bunk top GRP',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r341','qc-handover-c1071','Study','Ceiling','Repairs','Mold mark visible at aft outboard of ceiling',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1071-r342','qc-handover-c1071','Study','Vents','Cleaning','Clean air con vent',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1071-r343','qc-handover-c1071','Study','Fiddles','Cleaning','Stain on bunk fiddle',10,'Cleaning',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c1072','C1072_HO_Audit','C1') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Stbd Fwd Heads','Zunaid Hoosen',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Stbd Passage','Zunaid Hoosen',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Stbd Aft Heads','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Study','Zunaid Hoosen',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Stbd Aft Cabin','Zunaid Hoosen',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Aft Cockpit','Zunaid Hoosen',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Port Deck','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Stb Deck','Zunaid Hoosen',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Fwd Cockpit & Foredeck','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Flybribge','Zunaid Hoosen',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Port Hull','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Stbd Hull','Zunaid Hoosen',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Saloon','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Port Fwd Cabin','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Port Fwd Heads','Imtiyaaz Hassan Hoosain',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Port Passage','',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Port Aft Heads','Imtiyaaz Hassan Hoosain',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c1072','Port Aft Cabin','Imtiyaaz Hassan Hoosain',17) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c1072-r5','qc-handover-c1072','Stbd Fwd Heads','Ceiling','Sealer','Yellow sealer visible at ceiling joints',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r6','qc-handover-c1072','Stbd Fwd Heads','Shower bulkhead module','Loose','Loose brackets on shower rose rail',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c1072-r7','qc-handover-c1072','Stbd Fwd Heads','Basin module','Loose','Inspection panel loose inside basin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r8','qc-handover-c1072','Stbd Fwd Heads','Waste tank','Cleaning','Clean inside waste tank locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r9','qc-handover-c1072','Stbd Fwd Heads','Heads bulkhead module','Cleaning','Clean stain forward of heads blind',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r10','qc-handover-c1072','Stbd Fwd Heads','Bilges','Cleaning','Clean inside heads bulge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r11','qc-handover-c1072','Stbd Fwd Heads','Doors','Operational','Heads door not locking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r19','qc-handover-c1072','Stbd Fwd Heads','Bunk Drawers','Proud/Alignment','Bunk drawers knocking each other when fully opened',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r20','qc-handover-c1072','Stbd Fwd Heads','Floor','Sealer','Neaten cabin floor sealer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r21','qc-handover-c1072','Stbd Fwd Heads','window surround','Spills','Spill on aft end of windows around',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r22','qc-handover-c1072','Stbd Fwd Heads','Vinyl panels','Cleaning','Remove masking tape on all vinyl ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r23','qc-handover-c1072','Stbd Fwd Heads','Inspection lids','Cleaning','Clean inside headboard inspection',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r24','qc-handover-c1072','Stbd Fwd Heads','Bilges','Cleaning','Tape residue on labels inside bilge',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r25','qc-handover-c1072','Stbd Fwd Heads','Bilges','Loose','Unused cradles at aft inboard of bilge',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c1072-r26','qc-handover-c1072','Stbd Fwd Heads','Formica Bulkheads','Damage','Unwanted holes inside aircon locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r27','qc-handover-c1072','Stbd Fwd Heads','Doors','Cleaning','Glue spill on cabin door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r28','qc-handover-c1072','Stbd Fwd Heads','Coat hook','Loose','Cabin coat hook loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r29','qc-handover-c1072','Stbd Fwd Heads','Frame','Incorrect','Neaten cabin door checkout',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r30','qc-handover-c1072','Stbd Fwd Heads','Floor','Cleaning','Overspray on floor around inboard door capping',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r42','qc-handover-c1072','Stbd Passage','Frame','Repairs','Poor finish on cabin door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1072-r43','qc-handover-c1072','Stbd Passage','Inspection lids','Scratches','Scratch on Formica waste tank panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r44','qc-handover-c1072','Stbd Passage','Inspection lids','Proud/Alignment','Waste tank panel proud at outboard end',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r45','qc-handover-c1072','Stbd Passage','Inspection lids','Loose','Screws missing on toggle blocks plus blocks loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r81','qc-handover-c1072','Stbd Aft Heads','Windows','Scratches','Scratches on hull side portlight window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1072-r82','qc-handover-c1072','Stbd Aft Heads','Heads bulkhead module','Sealer','Seal inboard heads bulkhead joints',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r83','qc-handover-c1072','Stbd Aft Heads','Dividers','Loose','Nut loose on shower perspex divider',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r84','qc-handover-c1072','Stbd Aft Heads','Dividers','Incorrect','Incorrect plate fitted on heads door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r85','qc-handover-c1072','Stbd Aft Heads','Under-basin locker with toilet roll holder','Loose','Basin locker forward door top hinge loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r86','qc-handover-c1072','Stbd Aft Heads','Under-basin locker with toilet roll holder','Loose','Basin locker aft catch loose and top hinge loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r87','qc-handover-c1072','Stbd Aft Heads','Bilges','Cleaning','Clean inside bilge around water tank locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r88','qc-handover-c1072','Stbd Aft Heads','Flush Hatch over heads','scratches','Scratches on heads hatch perspex',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1072-r89','qc-handover-c1072','Stbd Aft Heads','Floor','Loose','Edging loose at bottom of toilet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r93','qc-handover-c1072','Study','Hanging locker','Proud/Alignment','Adjust hanging locker door heights',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r94','qc-handover-c1072','Study','Bilges','Spills','Resin spills in bulge flow coat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r95','qc-handover-c1072','Study','Dividers','Cleaning','Clean bottom end of shower perspex door and divider',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r96','qc-handover-c1072','Study','Vanity table/desk with storage locker and mirror under lid','Damage','Hole visible at top of sliding door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r97','qc-handover-c1072','Study','Draw locker','Proud/Alignment','Adjust top push lock on outboard drawer locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r98','qc-handover-c1072','Study','Draw locker','Proud/Alignment','Outboard drawer locker top drawers chaffing when fully opened',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r99','qc-handover-c1072','Study','Sliding entrance door with lock','Damage','Screw burred on sliding door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r113','qc-handover-c1072','Stbd Aft Cabin','Bunk Drawers','Proud/Alignment','Adjust bunk drawer push lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r114','qc-handover-c1072','Stbd Aft Cabin','Fiddles','Cleaning','Stains on bunk fiddles',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r115','qc-handover-c1072','Stbd Aft Cabin','Vinyl panels','Cleaning','Remove masking tape from all vinyl panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r116','qc-handover-c1072','Stbd Aft Cabin','Aircon unit','Cleaning','Clean aircon vent',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r117','qc-handover-c1072','Stbd Aft Cabin','window surround','Scratches','Scratches at bottom of hullside window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r118','qc-handover-c1072','Stbd Aft Cabin','Portlight','Loose','Adjust aft port light',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r119','qc-handover-c1072','Stbd Aft Cabin','Ceiling','Scratches','Dull on ceiling forward of deck hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r155','qc-handover-c1072','Aft Cockpit','Bimini','Scratches','Scuff marks on a permanent inner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r156','qc-handover-c1072','Aft Cockpit','Bimini','Sealer','Excess sealer at forward outboard handrail bolts',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r157','qc-handover-c1072','Aft Cockpit','Decklid','Scratches','Scratches on GRP deck lid aft of helm seat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r158','qc-handover-c1072','Aft Cockpit','Helmstation','Scratches','Rust marks inside cubby locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r159','qc-handover-c1072','Aft Cockpit','Table','Scratches','Scratches on aft cockpit table',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r160','qc-handover-c1072','Aft Cockpit','Floor','Track repairs','Visible track repairs in aft cockpit walkway',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1072-r161','qc-handover-c1072','Aft Cockpit','Lockers','Spills','Spills inside fire locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r162','qc-handover-c1072','Aft Cockpit','Aft area','Scratches','Scratches at top smooth surface above starboard aft cabin window',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r163','qc-handover-c1072','Aft Cockpit','toe rail','Scratches','Scratches at starboard aft tow rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r164','qc-handover-c1072','Aft Cockpit','Guard wires with stanchions, bases, port & starboard side gates','Loose','Loose nut at starboard guard wire',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r165','qc-handover-c1072','Aft Cockpit','Transom','Scratches','Scratches on starboard transom aft by bumper rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r166','qc-handover-c1072','Aft Cockpit','Transom','Cracks','Star crack in tracking outboard of starboard transom',1,'Gelcoat',true,'','','','',''),
  ('qc-handover-c1072-r167','qc-handover-c1072','Aft Cockpit','Locker lids','Scratches','Scratches on liferaft locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r168','qc-handover-c1072','Aft Cockpit','Lids','Loose','Port aft sump lid loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r169','qc-handover-c1072','Aft Cockpit','Aft area','Cleaning','Rust marks on bridge deck aft of port sump lid',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r170','qc-handover-c1072','Aft Cockpit','Lids','Cleaning','Clean sealer spills outboard of liferaft locker lid',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r171','qc-handover-c1072','Aft Cockpit','Lids','Repairs','Neaten track lines on port engine locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r172','qc-handover-c1072','Aft Cockpit','toe rail','Scratches','Scratches on port side tow rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r173','qc-handover-c1072','Aft Cockpit','Transom','Repairs','Poor repair at inboard of port transom',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r174','qc-handover-c1072','Aft Cockpit','Transom shower (cold only)','Cleaning','Remove plastic from transom shower lid',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r175','qc-handover-c1072','Aft Cockpit','Aft area','Repairs','Poor repair on entire bridge deck flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r176','qc-handover-c1072','Aft Cockpit','Frame','Loose','Stb davit lactch loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r177','qc-handover-c1072','Aft Cockpit','Frame','Sealer','Seal davit wire holes',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r187','qc-handover-c1072','Port Deck','Decklid','Cleaning','Clean residue at off spin block',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r188','qc-handover-c1072','Port Deck','Decklid','Scratches','Buff entire deck lid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r189','qc-handover-c1072','Port Deck','Flush Hatch over cabins','Cleaning','Clean all deck hatch lid hinges',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1072-r190','qc-handover-c1072','Port Deck','Bows','Sealer','Sealant touch up at bow deck joint',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r191','qc-handover-c1072','Port Deck','Bows','Repairs','Poor repair on port bow',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r205','qc-handover-c1072','Stb Deck','Flush Hatch over cabins','Spills','Gelcoat spills forward of cabin deck hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r206','qc-handover-c1072','Stb Deck','Decklid','Cleaning','Clean sticker residue on deck lid',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r207','qc-handover-c1072','Stb Deck','Decklid','Scratches','Dull and scratches on entire deck lid smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r208','qc-handover-c1072','Stb Deck','Flush Hatch over cabins','Cleaning','Clean all deck hatch lid hinges',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c1072-r225','qc-handover-c1072','Fwd Cockpit & Foredeck','Lids','Spills','Spills on gas locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r226','qc-handover-c1072','Fwd Cockpit & Foredeck','Electrical spares kit: fuses, relays, fuse holders','Damage','Chemical damage on Fusion remote',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r227','qc-handover-c1072','Fwd Cockpit & Foredeck','Lids','Flowcoat','Flowcoat step locker lid edge',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r228','qc-handover-c1072','Fwd Cockpit & Foredeck','Floating step','Porosity','Porosity on step coaming inside step locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r229','qc-handover-c1072','Fwd Cockpit & Foredeck','Deck flange','Cleaning','Clean sticker residue on trampoline flange',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r230','qc-handover-c1072','Fwd Cockpit & Foredeck','Trampoline','Loose','Tension trampoline',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r231','qc-handover-c1072','Fwd Cockpit & Foredeck','Guard wires across bow and stern','Cleaning','Clean gel coat spills on forward guard wire',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r239','qc-handover-c1072','Flybribge','Flybridge steps','Cleaning','Clean tape residue on flybridge labels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r240','qc-handover-c1072','Flybribge','Main boom topping lift','Loose','Loose shackle at forward - remove plastic from flybridge speakers',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r241','qc-handover-c1072','Flybribge','Decklid','Repairs','Poor repair on deck lid at starboard corner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r242','qc-handover-c1072','Flybribge','Aft area','Loose','Loose shackle on aft fiddle',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r265','qc-handover-c1072','Port Hull','Aft area','Scratches','Dull on aft of Hull GRP',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r266','qc-handover-c1072','Port Hull','chain plate','Scratches','Scratches on chain plate cover',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r267','qc-handover-c1072','Port Hull','chain plate','Cleaning','Clean residue forward of chain plate',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r268','qc-handover-c1072','Port Hull','Midship area','Scratches','Scratches above window aft of plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r269','qc-handover-c1072','Port Hull','Fwd area','Scratches','Scratches and dull below charm line at forward of Hull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r279','qc-handover-c1072','Stbd Hull','Midship area','Scratches','Clean buffing compound on entire bottom of hull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r304','qc-handover-c1072','Saloon','Microwave locker','Cleaning','clean smears at microwave draw',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r305','qc-handover-c1072','Saloon','Vinyl ceiling','Cleaning','clean all vinyl ceiling panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r306','qc-handover-c1072','Saloon','Nav desk','loose','loose edging at nav desk inspection',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r307','qc-handover-c1072','Saloon','Nav desk','Proud/Alignment','nav desk fold up desk steping outboard fwd corner',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r308','qc-handover-c1072','Saloon','Floor','Incorrect','battery locker lids creaking',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r309','qc-handover-c1072','Saloon','Floor','Damage','formica outboard of battery locker lids damaged',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c1072-r310','qc-handover-c1072','Saloon','Floor','Operational','port fwd storage locker lid tight',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r311','qc-handover-c1072','Saloon','Companion door','Damage','poor spray on cwd frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1072-r343','qc-handover-c1072','Port Fwd Cabin','Hanging locker','Loose','insp panel not fitted',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r344','qc-handover-c1072','Port Fwd Cabin','Windows','Damage','neaten primer at windows',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r345','qc-handover-c1072','Port Fwd Cabin','Formica Bulkheads','Cleaning','visible excess in groove fwd of inboard reading light',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r346','qc-handover-c1072','Port Fwd Cabin','Magazine locker/shelf locker','Flowcoat','cracked flowcoat around forepeak fwd shelf',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c1072-r347','qc-handover-c1072','Port Fwd Cabin','Hatch','Operational','liner loose+blinds getting stuck',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r350','qc-handover-c1072','Port Fwd Heads','Sliding or hinged heads door','Operational','handle chaffing capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r351','qc-handover-c1072','Port Fwd Heads','Door frames','Sealer','missing sealer around door frame fwd and bottom',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r352','qc-handover-c1072','Port Fwd Heads','Under-basin locker with toilet roll holder','Loose','hinge loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r353','qc-handover-c1072','Port Fwd Heads','Window blinds','Loose','blind tack loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r380','qc-handover-c1072','Port Passage','AC/DC locker','Proud/Alignment','adjust gaps at top locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r381','qc-handover-c1072','Port Passage','AC/DC locker','Proud/Alignment','bottom locker stepping+difficulty inserting toggle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r382','qc-handover-c1072','Port Passage','Inspection lids','Cleaning','pencil marks at toggle plate of small insp',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r383','qc-handover-c1072','Port Passage','Washing machine locker','Operational','doors chaffing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r384','qc-handover-c1072','Port Passage','Formica Bulkheads','Proud/Alignment','proud filler piece at settee area aft of staircase',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r385','qc-handover-c1072','Port Passage','Vinyl ceiling','Cleaning','clean lobby ceilings',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r386','qc-handover-c1072','Port Passage','Solids','Damage','scratches on fwd cabin frame+overspray on sealer',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c1072-r393','qc-handover-c1072','Port Aft Heads','Electric sea water flush toilet','Loose','toilet seat loose',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c1072-r394','qc-handover-c1072','Port Aft Heads','Vanity locker with mirror','Operational','door chaffing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r395','qc-handover-c1072','Port Aft Heads','underbasin locker','proud/alignment','toilet roll holder fitted incorrectly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r396','qc-handover-c1072','Port Aft Heads','Under-basin locker with toilet roll holder','Cleaning','koki marks at hinges',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r397','qc-handover-c1072','Port Aft Heads','Door frames','Sealer','missing sealer around door frame aft and bottom',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r398','qc-handover-c1072','Port Aft Heads','Floor','Cleaning','sealer smears on floors',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r399','qc-handover-c1072','Port Aft Heads','corian','Missing part','missing finger grip recess at shower sump corian',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r417','qc-handover-c1072','Port Aft Cabin','Windows','Damage','neaten primer at outboard windows',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c1072-r418','qc-handover-c1072','Port Aft Cabin','Fiddles','Damage','bunk fiddle damaged and loose+glue residue',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c1072-r419','qc-handover-c1072','Port Aft Cabin','Bunktop/Double berth','Cleaning','remove plastic from bunktop lid',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r420','qc-handover-c1072','Port Aft Cabin','Bunk Liners','Cleaning','smears on eng starter battery label',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r421','qc-handover-c1072','Port Aft Cabin','Cabin Door','Cleaning','sticker residue at top of door',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c1072-r422','qc-handover-c1072','Port Aft Cabin','Door frames','Proud/Alignment','visible packing at outboard door frame',3,'Joinery/Carp',false,'','','','','')
on conflict (id) do nothing;
commit;
select model, count(*) as audits from public.quality_control_boats where model='C1' group by model;
