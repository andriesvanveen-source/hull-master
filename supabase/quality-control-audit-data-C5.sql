-- Quality Control audit import for C5 boats.
-- Renames existing reference audits to _QC3 and adds _HO_Audit boats.
-- Idempotent and non-destructive: existing defects are not overwritten.
begin;
update public.quality_control_boats set name='C5005_QC3' where id='qc-reference-c5005';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Moegamat Saleem Philander', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Stbd Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Moegamat Saleem Philander', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Stbd Study & Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Moegamat Saleem Philander', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Owner''S Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Sheldon Barends', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Crew Quarters' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Sheldon Barends', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Flowcoat Inside Bilge Surround' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Sheldon Barends', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Port Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Aft Cockpit' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Port Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imran Majiet', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Stbd Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imran Majiet', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Sheldon Barends', updated_at=now() where boat_id='qc-reference-c5005' and area_name='Port Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C5004_QC3' where id='qc-reference-c5004';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Owner''S Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Forepeak' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Port Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Port Aft Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Port Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Stbd Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Port Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Port Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5004' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C5003_QC3' where id='qc-reference-c5003';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5003' and area_name='Port Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5003' and area_name='Port Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5003' and area_name='Port Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5003' and area_name='Stbd Study & Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5003' and area_name='Owner''S Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5003' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5003' and area_name='Stbd Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C5002_QC3' where id='qc-reference-c5002';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Aft Cockpit' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Fwd Cockpit & Foredeck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Stbd Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Stbd Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Stbd Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imran Majiet', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Study' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Port Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imtiyaaz Hassan Hoosain', updated_at=now() where boat_id='qc-reference-c5002' and area_name='Port Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_boats set name='C5001_QC3' where id='qc-reference-c5001';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Port Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Stbd Side Deck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Port Hull' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Stbd Engine Room' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imran Majiet', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Flybridge' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Imran Majiet', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Fwd Cockpit & Foredeck' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Moegamat Saleem Philander', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Saloon' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Port Fwd Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Port Fwd Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Port Aft Cabin' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Port Aft Heads' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Kyle Carl Adams', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Port Passage' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Moegamat Saleem Philander', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Study' and coalesce(trim(inspector),'')='';
update public.quality_control_areas set inspector='Moegamat Saleem Philander', updated_at=now() where boat_id='qc-reference-c5001' and area_name='Owner''S Heads' and coalesce(trim(inspector),'')='';
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c5001','C5001_HO_Audit','C5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Saloon','Kyle Carl Adams',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Port Aft Cabin','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Port Aft Heads','Kyle Carl Adams',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Port Passage','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Port Fwd Heads','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Port Fwd Cabin','Kyle Carl Adams',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Stbd Owner''S Cabin','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Owner''S Study','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Owner''S Heads','Kyle Carl Adams',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Aft Cockpit','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Foredeck/Fwd Cockpit','Kyle Carl Adams',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Stbd Side Deck','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Port Side Deck','Kyle Carl Adams',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5001','Port Hull','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c5001-r5','qc-handover-c5001','Saloon','Vinyl panels','Loose','Vinyl pulling loose on stbd aft removable panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r6','qc-handover-c5001','Saloon','Ceiling','Damage','Chip at saddle above center fwd ceiling',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r7','qc-handover-c5001','Saloon','Galley lockers','Cleaning','Remove washer behind fwd pull out drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r8','qc-handover-c5001','Saloon','window surround','Damage','Remove excess on stbd fwd side window primer and neaten stbd centre window primer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5001-r9','qc-handover-c5001','Saloon','Companion door','Operational','Door chafing track and loose centre leaf door latch mechanism',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5001-r10','qc-handover-c5001','Saloon','Draw locker','Damage','Scratch on top drawer lock',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r11','qc-handover-c5001','Saloon','Lockers','Damage','Damage on bin locker door due to drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r12','qc-handover-c5001','Saloon','Vinyl ceiling','Cleaning','Clean all vinyl panels',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5001-r13','qc-handover-c5001','Saloon','Tv locker','Cleaning','Clean tv bracket',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5001-r31','qc-handover-c5001','Port Aft Cabin','Bunktop/Double berth','Incorrect','Unused cradles inside bunk inspection',7,'Electrical',false,'','','','',''),
  ('qc-handover-c5001-r32','qc-handover-c5001','Port Aft Cabin','Bunktop/Double berth','Flowcoat','Flowcoat as marked and remove spills',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r33','qc-handover-c5001','Port Aft Cabin','Hanging locker','Proud/Alignment','Door stepping top and bottom ( warped )',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r34','qc-handover-c5001','Port Aft Cabin','Bedside cave locker inboard','Cleaning','Remove tape from Valcro check all panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r35','qc-handover-c5001','Port Aft Cabin','Window blinds','Cleaning','Clean stains on all window blinds',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r47','qc-handover-c5001','Port Aft Heads','Shower bulkhead module','Sealer','Neaten sealer at corian plate',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r48','qc-handover-c5001','Port Aft Heads','Inspection lids','Loose','Loose catch waste tank and bin locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r67','qc-handover-c5001','Port Passage','Inspection lids','Cleaning','Clean debris and dirt inside inboard inspection',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5001-r73','qc-handover-c5001','Port Fwd Heads','Hatch','Loose','Loose hatch and screw',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r74','qc-handover-c5001','Port Fwd Heads','Heads bulkhead module','Cleaning','Clean entire heads as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r75','qc-handover-c5001','Port Fwd Heads','window module','Scratches','Grind mark above shower rose and scratches and dull spills window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r76','qc-handover-c5001','Port Fwd Heads','Shower bulkhead module','Sealer','Neaten sealer at corian plate',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r83','qc-handover-c5001','Port Fwd Cabin','Window blinds','Spill','Spill on window blind',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r84','qc-handover-c5001','Port Fwd Cabin','Bedside cave locker inboard','Cleaning','Remove tape from Valcro check all panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r107','qc-handover-c5001','Stbd Owner''S Cabin','Large mirror behind sliding entrance door','Damage','Scratch on door latch s/s frame',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r108','qc-handover-c5001','Stbd Owner''S Cabin','Window blinds','Cleaning','Clean stains on all window blinds',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r109','qc-handover-c5001','Stbd Owner''S Cabin','Formica','Cleaning','Remove pencil markings on all Formica surfaces as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r115','qc-handover-c5001','Owner''S Study','Hanging locker','Loose','Loose door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r116','qc-handover-c5001','Owner''S Study','Formica','Cleaning','Remove pencil markings on all Formica surfaces as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r125','qc-handover-c5001','Owner''S Heads','Draw locker','Operational','Adjust fwd to drawer to operate the same as aft drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r126','qc-handover-c5001','Owner''S Heads','Vinyl panels','Spills','Stain on vinyl panel above sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r127','qc-handover-c5001','Owner''S Heads','Under-basin locker with toilet roll holder','Loose','Fwd door catch loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r128','qc-handover-c5001','Owner''S Heads','Ceiling','Sealer','Yellow sealer and neaten sealer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r129','qc-handover-c5001','Owner''S Heads','Ceiling','Damage','Damage on ceiling as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5001-r130','qc-handover-c5001','Owner''S Heads','Windows','Scratches','Scratches on window and port light',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5001-r139','qc-handover-c5001','Aft Cockpit','Vents','Damage','Cracked stbd side vent above floating step',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5001-r140','qc-handover-c5001','Aft Cockpit','Helmstation','Scratches','Scratches outboard of helm console',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r141','qc-handover-c5001','Aft Cockpit','Aft area','Repairs','Poor repairs spill and scratches on bridge deck check entire marked area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r142','qc-handover-c5001','Aft Cockpit','Decklid','Sealer','Neaten sealer around grab handle at staircase ceiling area',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5001-r143','qc-handover-c5001','Aft Cockpit','Fwd area','Spills','Remove Flowcoat spills and neaten Flowcoat under sump lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r154','qc-handover-c5001','Foredeck/Fwd Cockpit','Fwd area','Cleaning','Remove green sticker on bow sprit',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5001-r172','qc-handover-c5001','Stbd Side Deck','Decklid','Repairs','Poor repair on decklid aft of grab handle',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r173','qc-handover-c5001','Stbd Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Rust marks and excess sika and spills on stanchion gate and rails check all',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5001-r184','qc-handover-c5001','Port Side Deck','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Rust marks and excess sika and spills on stanchion gate and rails check all',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5001-r185','qc-handover-c5001','Port Side Deck','Fwd area','Scratches','At pull pit base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r186','qc-handover-c5001','Port Side Deck','Fwd area','Spills','Spills on tracking fwd area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r187','qc-handover-c5001','Port Side Deck','Decklid','Repairs','Poor repair fwd if chafe plate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r204','qc-handover-c5001','Port Hull','Fwd area','Repairs','Thin above chafe plate and scratches check entire area marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5001-r205','qc-handover-c5001','Port Hull','Deck joint','Sealer','Neaten sealer check all marked and around chain plate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5001-r206','qc-handover-c5001','Port Hull','Chafe plate','Sealer','Seal mid chafe plate and check sealer on all',4,'Deckfitting',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c5002','C5002_HO_Audit','C5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Stbd Aft Cabin','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Stbd Passage','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Stbd Heads','Kyle Carl Adams',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Fwd Cabin','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Fwd Heads','Kyle Carl Adams',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Aft Cabin','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Aft Heads','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Passage','Kyle Carl Adams',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Saloon','Kyle Carl Adams',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Aft Cockpit','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Foredeck/Fwd Cockpit','Kyle Carl Adams',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Stbd Engine Room','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Engine Room','Kyle Carl Adams',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Side Deck','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Stbd Side Deck','Kyle Carl Adams',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5002','Port Hull','',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c5002-r4','qc-handover-c5002','Stbd Aft Cabin','Large mirror behind sliding entrance door','Damage','Damage on door latch block and catch block fwd and aft',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r5','qc-handover-c5002','Stbd Aft Cabin','Large mirror behind sliding entrance door','Damage','Damage on door top aft section close to bird catch and bird catch damaged',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r6','qc-handover-c5002','Stbd Aft Cabin','Windows','Scratches','Scratch marks on all windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5002-r7','qc-handover-c5002','Stbd Aft Cabin','Ceiling Liner','Damage','Unwanted holes below removable panel aft of hatch',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r16','qc-handover-c5002','Stbd Passage','Inspection lids','Proud/Alignment','Inboard inspection lid stepping / warped',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r17','qc-handover-c5002','Stbd Passage','Inspection lids','Damage','Damage on the edges of lid',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r18','qc-handover-c5002','Stbd Passage','Draw locker','Operational','Drawer catch lock knocking on top Formica cleat',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r19','qc-handover-c5002','Stbd Passage','Staircase','Operational','Floating steps latch not latching into plates',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r20','qc-handover-c5002','Stbd Passage','Draw locker','Incorrect','Latch on middle drawer fitted with cut out visible above latch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r26','qc-handover-c5002','Stbd Heads','Floor board','Missing part','Missing floor studs and floor board not evenly scribed',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r27','qc-handover-c5002','Stbd Heads','Waste tank lockers','Proud/Alignment','Align all door fronts and check operation of doors',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r28','qc-handover-c5002','Stbd Heads','Hatch','Proud/Alignment','Proud hatch to ceiling',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r36','qc-handover-c5002','Port Fwd Cabin','Solids','Damage','Dentation and chip on frame check entire frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5002-r37','qc-handover-c5002','Port Fwd Cabin','Cabin door','Sealer','Seal frame outboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r38','qc-handover-c5002','Port Fwd Cabin','Cabin door','Proud/Alignment','Proud screws on hinges',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r39','qc-handover-c5002','Port Fwd Cabin','Floor','Sealer','Seal floor joint at door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r40','qc-handover-c5002','Port Fwd Cabin','Hanging locker','Loose','Loose cleat at door where hinges are mounted',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r41','qc-handover-c5002','Port Fwd Cabin','Bilges','Flowcoat','Neaten flow coat in bilge check entire marked area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r42','qc-handover-c5002','Port Fwd Cabin','Electric bilge pumps (keel sump) with float switches and alarm at switch panel','Sealer','Neaten sealer',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c5002-r43','qc-handover-c5002','Port Fwd Cabin','Hanging locker','Operational','Door chafing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r44','qc-handover-c5002','Port Fwd Cabin','Bilges','Proud/Alignment','Long screws in bilge ceiling area',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r45','qc-handover-c5002','Port Fwd Cabin','Vents','Repairs','Paint fading on vent',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5002-r50','qc-handover-c5002','Port Fwd Heads','Sliding or hinged heads door','Operational','Door operates stiff adjust door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r51','qc-handover-c5002','Port Fwd Heads','Hatch','Sealer','Yellow sealer around hatch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r52','qc-handover-c5002','Port Fwd Heads','Hatch','Damage','Damage on ceiling around hatch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r53','qc-handover-c5002','Port Fwd Heads','Portlight with roller blind','Cleaning','Overspray on port light',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r54','qc-handover-c5002','Port Fwd Heads','Windows','Scratches','Scratches on Perspex window and divider',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5002-r55','qc-handover-c5002','Port Fwd Heads','Shower bulkhead module','Sealer','Remove excess sika and neaten sealer at splash back',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r56','qc-handover-c5002','Port Fwd Heads','Under-basin locker with toilet roll holder','Operational','Door chafing ( THL )',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r71','qc-handover-c5002','Port Aft Cabin','Cabin door','Damage','Scratches on cabin door ( THL )',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r81','qc-handover-c5002','Port Aft Heads','Solids','Damage','Damage and chip on door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5002-r82','qc-handover-c5002','Port Aft Heads','Heads bulkhead module','Sealer','Neaten sealer and remove yellow sealer and stains in heads surround as marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r83','qc-handover-c5002','Port Aft Heads','Shower bulkhead module','Sealer','Neaten sealer at splash back corian',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r84','qc-handover-c5002','Port Aft Heads','Waste tank','Incorrect','Incorrect position of waste tank label and remove green sticker',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c5002-r90','qc-handover-c5002','Port Passage','Staircase','Operational','Floating step catch not aligned with plate',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r91','qc-handover-c5002','Port Passage','Bilges','Proud/Alignment','Long screws in bilge ceiling area',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r111','qc-handover-c5002','Saloon','Galley lockers','Loose','Loose edging stbd aft locker above ac/dc panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r112','qc-handover-c5002','Saloon','Lockers','Damage','Damage inside of bin locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r113','qc-handover-c5002','Saloon','Companion door','Damage','Damage screws on door check all and paint peeling off',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r114','qc-handover-c5002','Saloon','Galley lockers','Proud/Alignment','Stbd aft bonded front stepping drawer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r143','qc-handover-c5002','Aft Cockpit','Bimini','Cracks','Helm station - bimini cracked at support aft base',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r144','qc-handover-c5002','Aft Cockpit','Helmstation','Repairs','Scratches, dulls and bubbles at helm station fwd of morse control',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r145','qc-handover-c5002','Aft Cockpit','Settee','Track repairs','Spills and damage in tracking stbd settee corner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r146','qc-handover-c5002','Aft Cockpit','Table','Damage','Aft cockpit table - damaged on table and scratches',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r147','qc-handover-c5002','Aft Cockpit','Transom','Track repairs','Starboard Transom stain in tracking outboard step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r148','qc-handover-c5002','Aft Cockpit','Transom','Scratches','Scratches and dulls outboard around stbd shore power',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r149','qc-handover-c5002','Aft Cockpit','Windows','Scratches','Remove tape residue from Transom window and scratches',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5002-r150','qc-handover-c5002','Aft Cockpit','Stainless steel deck fittings','Cleaning','Rust stains on s/s bolts at davit base and life raft back rest base',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r151','qc-handover-c5002','Aft Cockpit','Wetbar','Sealer','Neaten sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r152','qc-handover-c5002','Aft Cockpit','Sump lid','Operational','Sump lid wobbly',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r158','qc-handover-c5002','Foredeck/Fwd Cockpit','Fwd cockpit door','Scratches','Deep scratches around forward cockpit door frame GRP area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r159','qc-handover-c5002','Foredeck/Fwd Cockpit','Locker lids','Cracks','Cracked blower vent',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r160','qc-handover-c5002','Foredeck/Fwd Cockpit','Fwd cockpit door','Scratches','Scratches on forward cockpit door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5002-r161','qc-handover-c5002','Foredeck/Fwd Cockpit','Lockers','Damage','Damages around blower motor inside genset locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r162','qc-handover-c5002','Foredeck/Fwd Cockpit','Trampoline','Incorrect','Cable ties too long',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r174','qc-handover-c5002','Stbd Engine Room','Engine Room','Damage','Starboard engine room - chip on board outboard',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5002-r175','qc-handover-c5002','Stbd Engine Room','Floor','Flowcoat','Visible holes and flow coat touch up at floor area outboard and inboard',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r176','qc-handover-c5002','Stbd Engine Room','Emergency tiller (s/s)','Flowcoat','Neat and flow coat around tiller arm',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r177','qc-handover-c5002','Stbd Engine Room','Engine Room','Flowcoat','Chip and flow coat on walls outboard and inboard as check entire marked area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r178','qc-handover-c5002','Stbd Engine Room','Engine Room','Cleaning','Remove spills and residue in and around engine room',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r179','qc-handover-c5002','Stbd Engine Room','Engine Room','Flowcoat','Check interior - poor flow coat at engine room cut out surround and gas strut areas damage flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r180','qc-handover-c5002','Stbd Engine Room','Engine Room','Flowcoat','Flow coat over bolt and nut forward gas strut',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r181','qc-handover-c5002','Stbd Engine Room','Locker lids','Incorrect','Holes not protruding - nut at engine room hinges',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r182','qc-handover-c5002','Stbd Engine Room','Engine Room','Spills','Flow coat spills on pipes in engine room',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r185','qc-handover-c5002','Port Engine Room','Engine Room','Proud/Alignment','Bolts too long at transom shower',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r186','qc-handover-c5002','Port Engine Room','Engine Room','Flowcoat','Flowcoat entire marked area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r205','qc-handover-c5002','Port Side Deck','Stanchion bases','Sealer','Reseal around stanchion bases - check all',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r206','qc-handover-c5002','Port Side Deck','Windows','Sealer','Remove residue and excess sika from saloon windows - aft and saloon window joints',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r207','qc-handover-c5002','Port Side Deck','Decklid','Cracks','Crack at grab handle above floating steps',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r208','qc-handover-c5002','Port Side Deck','Decklid','Cracks','Crack at grab handle on deck lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r216','qc-handover-c5002','Stbd Side Deck','Fwd area','Spills','Gel coat spills in tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r217','qc-handover-c5002','Stbd Side Deck','Toe rail','Scratches','Scratches on toe rail check entire toe rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r218','qc-handover-c5002','Stbd Side Deck','Decklid','Repairs','Poor repair at grab handle bolts inner flange',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r245','qc-handover-c5002','Port Hull','Aft area','Repairs','Poor repair aft area as marked on coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r246','qc-handover-c5002','Port Hull','Aft area','Repairs','Thin on combing aft area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r247','qc-handover-c5002','Port Hull','deck Join','Sealer','Deck joint sealer poor, neaten entire deck joint sealer aft to fwd area',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r249','qc-handover-c5002','Port Hull','Aft area','Scratches','Scratches and dull aft area smooth surface',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r250','qc-handover-c5002','Port Hull','chain plate','Sealer','Neaten sealer at chain plate and around chain plate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5002-r251','qc-handover-c5002','Port Hull','Fwd area','Pinholes','Pinholes forward of chain plate and poor repair',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5002-r252','qc-handover-c5002','Port Hull','chafe plate','Sealer','Neaten sealer around chafe plate x3',4,'Deckfitting',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c5003','C5003_HO_Audit','C5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Stbd Hull','',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Hull','Kyle Carl Adams',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Aft Cockpit','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Stbd Engine Room','',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Engine Room','Kyle Carl Adams',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Side Deck','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Stbd Side Deck','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Foredeck/Fwd Cockpit','Kyle Carl Adams',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Owner''S Heads','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Stbd Study & Passage','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Stbd Aft Cabin','Imran Majiet',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Saloon','Kyle Carl Adams',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Fwd Cabin','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Fwd Heads','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Passage','',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Aft Heads','',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5003','Port Aft Cabin','',16) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c5003-r4','qc-handover-c5003','Stbd Hull','Aft area','Repairs','Poor repair aft of mooring cleat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r5','qc-handover-c5003','Stbd Hull','Stbd hull side','Cleaning','Remove spills and residue and excess sika check entire hull',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5003-r6','qc-handover-c5003','Stbd Hull','deck Join','Sealer','Neaten deck joint sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r7','qc-handover-c5003','Stbd Hull','Chain plate','Sealer','Neaten chain plate sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r8','qc-handover-c5003','Stbd Hull','chain plate','Proud/Alignment','Chain plate cover',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r19','qc-handover-c5003','Port Hull','deck Join','Sealer','Neaten deck joint sealer as marked',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r20','qc-handover-c5003','Port Hull','chain plate','Sealer','Neaten chain plate sealer',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r41','qc-handover-c5003','Aft Cockpit','Engine room lid','Repairs','Starboard engine room lid chafing',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r42','qc-handover-c5003','Aft Cockpit','BBQ locker','Missing part','Barbecue missing screw',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r43','qc-handover-c5003','Aft Cockpit','Aft area','Cleaning','Remove excess tape stbd support aft post',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r44','qc-handover-c5003','Aft Cockpit','Davit switch','Proud/Alignment','Poorly fitted davit switch',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r45','qc-handover-c5003','Aft Cockpit','Ceiling','Scratches','Dull and scratches on ceiling aft of helm seat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r46','qc-handover-c5003','Aft Cockpit','Life raft locker with convertible fore/aft seat bolster','Missing part','Missing gas strut inside locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r47','qc-handover-c5003','Aft Cockpit','Life raft locker with convertible fore/aft seat bolster','Spills','Spills on life raft locker and scratches',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r48','qc-handover-c5003','Aft Cockpit','Wetbar','Loose','Missing screw on wet bar locker loose hinge',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r49','qc-handover-c5003','Aft Cockpit','Aft area','Missing part','No dome nuts fitted at aft support base bolts at ceiling area',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r50','qc-handover-c5003','Aft Cockpit','Engine room ventilation fans','Damage','Stbd vent cracked and port vent',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r51','qc-handover-c5003','Aft Cockpit','Vinyl panels','Missing part','Missing screw at port removable ceiling female popper',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r52','qc-handover-c5003','Aft Cockpit','Life raft locker with convertible fore/aft seat bolster','Cracks','Crack at life raft locker inboard floor area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r53','qc-handover-c5003','Aft Cockpit','Settee','Cracks','Crack at port settee aft of fwd of life raft locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r54','qc-handover-c5003','Aft Cockpit','Engine Room','Sealer','Remove excess sealer at engine room hinges port and stbd',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5003-r55','qc-handover-c5003','Aft Cockpit','Ceiling','Damage','Hole in port ceiling inspection',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r58','qc-handover-c5003','Stbd Engine Room','Engine Room','Loose','Engine room stbd side gastrut hinge loose check both',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r59','qc-handover-c5003','Stbd Engine Room','Engine Room','Cracks','Crack at stbd engine room water channel',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r60','qc-handover-c5003','Stbd Engine Room','Engine Room','Cleaning','Spills excess sika on stbd engine room lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r61','qc-handover-c5003','Stbd Engine Room','Engine room','Flowcoat','Flowcoat tiller arm cut out',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r64','qc-handover-c5003','Port Engine Room','Engine room','Flowcoat','Flowcoat tiller arm cut out',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r75','qc-handover-c5003','Port Side Deck','Decklid','Repairs','Poor repair on aft decklid area and scratches inner and outer',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r76','qc-handover-c5003','Port Side Deck','Midship area','Damage','Exposed screw holes on at midship hatch surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r77','qc-handover-c5003','Port Side Deck','Decklid','Repairs','Poor repair on decklid fwd area inner and outer',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r78','qc-handover-c5003','Port Side Deck','toe rail','Repairs','Cloud repair on toe rail fwd of mooring cleat',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r83','qc-handover-c5003','Stbd Side Deck','Decklid','Repairs','Poor repair on aft decklid and scratches',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r84','qc-handover-c5003','Stbd Side Deck','Decklid','Repairs','Poor repair on forward decklid as and scratches',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r93','qc-handover-c5003','Foredeck/Fwd Cockpit','Locker lids','Scratches','Scratches and dull at hinge points on lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r94','qc-handover-c5003','Foredeck/Fwd Cockpit','Locker lids','Flowcoat','Flow coat drain holes inside anchor locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r95','qc-handover-c5003','Foredeck/Fwd Cockpit','Locker lids','Sealer','Poor sealer around perco at anchor locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r96','qc-handover-c5003','Foredeck/Fwd Cockpit','Aft area','Proud/Alignment','Poorly fitted cushion clip on anchor locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r110','qc-handover-c5003','Owner''S Heads','Portlight','Cleaning','Remove buffing stains on port light',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5003-r111','qc-handover-c5003','Owner''S Heads','window surround','Scratches','Scratches and poor repair on window transition',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r112','qc-handover-c5003','Owner''S Heads','Window blinds','Loose','Loose blind catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r113','qc-handover-c5003','Owner''S Heads','Heads bulkhead module','Sealer','Neaten sealer below window transition and heads joints',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r115','qc-handover-c5003','Owner''S Heads','Shower bulkhead module','Damage','Scuff marks on shower corian',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5003-r116','qc-handover-c5003','Owner''S Heads','Floor','Track repair','Chip in tracking',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r117','qc-handover-c5003','Owner''S Heads','Vanity locker with mirror','Loose','Loose catch on vanity locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r118','qc-handover-c5003','Owner''S Heads','Vinyl ceiling','Loose','Vinyl debonding on aft hatch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r119','qc-handover-c5003','Owner''S Heads','Hatch','Missing part','Missing hatch screw clip',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r120','qc-handover-c5003','Owner''S Heads','Perspex','Damage','Visible hole on Perspex door at catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r126','qc-handover-c5003','Stbd Study & Passage','Vinyl panels','Missing part','Fit vinyl panel above study ceiling area',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r127','qc-handover-c5003','Stbd Study & Passage','Large mirror behind sliding entrance door','Proud/Alignment','Skew sliding door catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r128','qc-handover-c5003','Stbd Study & Passage','Large mirror behind sliding entrance door','Missing part','Missing screws at sliding door rail',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r134','qc-handover-c5003','Stbd Aft Cabin','Window blinds','Loose','Loose outboard blind screw points',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r135','qc-handover-c5003','Stbd Aft Cabin','Ceiling Liner','Cracks','Crack at starboard outboard ceiling',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r136','qc-handover-c5003','Stbd Aft Cabin','Ceiling','Scratches','Scratches and dull around the hatches',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r148','qc-handover-c5003','Saloon','Fwd cockpit door','Scratches','Scratches on forward cockpit door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5003-r149','qc-handover-c5003','Saloon','Draw locker','Cleaning','Remove green sticker behind drawers above fridge',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r150','qc-handover-c5003','Saloon','Aft area','Scratches','Scratches and dull stbd aft Grp liner',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r152','qc-handover-c5003','Saloon','Door frames','Damage','Damages on door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5003-r153','qc-handover-c5003','Saloon','Dish and cutlery drying recess with drainage','Proud/Alignment','Neaten edging around dishwasher and align dishwasher',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r154','qc-handover-c5003','Saloon','Floor','Damage','Chip in floor fwd of companion door',3,'Joinery/Carp',true,'','','','',''),
  ('qc-handover-c5003-r155','qc-handover-c5003','Saloon','Floor','Cleaning','Spill on floor below spice rack locker',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5003-r156','qc-handover-c5003','Saloon','Galley lockers','Cleaning','Builders dust and debris behind pottery drawer',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5003-r185','qc-handover-c5003','Port Fwd Cabin','Hatch','Proud/Alignment','Tension hatch - proud hatch liner',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r186','qc-handover-c5003','Port Fwd Cabin','Inspection lids','Incorrect','Visible hole at inside inspection inboard of bedside coming from gas locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5003-r187','qc-handover-c5003','Port Fwd Cabin','Perspex','Scratches','Scratches on perspex window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5003-r188','qc-handover-c5003','Port Fwd Cabin','Hanging locker','Damage','Scratch on hanging locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r189','qc-handover-c5003','Port Fwd Cabin','Hanging locker','Operational','Door operating with difficulty align gaps',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r190','qc-handover-c5003','Port Fwd Cabin','Light switch','Damage','Damage and skew light switch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r199','qc-handover-c5003','Port Fwd Heads','Sliding or hinged heads door','Proud/Alignment','Poor catch block fitted at heads door retainer and sliding door rattles',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r200','qc-handover-c5003','Port Fwd Heads','Hatch','Loose','Loose hatch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r201','qc-handover-c5003','Port Fwd Heads','Window blinds','Loose','Loose window blind catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r202','qc-handover-c5003','Port Fwd Heads','Electric sea water flush toilet','Loose','Loose salt fresh water switch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r203','qc-handover-c5003','Port Fwd Heads','Vanity locker with mirror','Loose','Loose catch inside vanity locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r209','qc-handover-c5003','Port Passage','Inspection lids','Proud/Alignment','Screws protruding inside aircon locker inspection',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r222','qc-handover-c5003','Port Aft Heads','Underbasin locker','Loose','Loose toilet roll holder',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r223','qc-handover-c5003','Port Aft Heads','Window transition','Cracks','Crack at window transition',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r224','qc-handover-c5003','Port Aft Heads','Window transition','Repairs','Poor repair at window transition top area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5003-r225','qc-handover-c5003','Port Aft Heads','Door frames','Damage','Damage dull and chip on heads door frame check entire frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5003-r226','qc-handover-c5003','Port Aft Heads','Electric sea water flush toilet','Loose','Loose salt/fresh water switch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r232','qc-handover-c5003','Port Aft Cabin','Hatch','Proud/Alignment','Large gaps at hatch liner',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5003-r233','qc-handover-c5003','Port Aft Cabin','Ceiling','Scratches','Scratches and dull around hatch liner',1,'Gelcoat',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c5004','C5004_HO_Audit','C5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Saloon','Kyle Carl Adams',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Stbd Aft Cabin','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Stbd Study & Passage','Kyle Carl Adams',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Owner''S Heads','Kyle Carl Adams',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Port Fwd Cabin','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Port Passage','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Port Fwd Heads','Sheldon Barends',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Port Aft Cabin','',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Port Aft Heads','',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Forepeak','Sheldon Barends',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Aft Cockpit','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Port Side Deck','',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Stbd Side Deck','Kyle Carl Adams',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Flybridge','',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Foredeck/Fwd Cockpit','Kyle Carl Adams',14) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5004','Stbd Hull','Kyle Carl Adams',15) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c5004-r4','qc-handover-c5004','Saloon','AC/DC locker','Cleaning','Clean debris and wire cut offs inside inspection',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5004-r5','qc-handover-c5004','Saloon','Galley lockers','Proud/Alignment','Skew push lock below oven and scratches push lock aft of cockpit door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r6','qc-handover-c5004','Saloon','Draw locker','Proud/Alignment','Align all drawers above galley counters',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r7','qc-handover-c5004','Saloon','Companion door','Damage','Damage paint work on door and frame check entire',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5004-r8','qc-handover-c5004','Saloon','Vinyl panels','Damage','Damage vinyl panel aft of mast pole',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r9','qc-handover-c5004','Saloon','Fwd cockpit door','Scratches','Fine scratches on door',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5004-r10','qc-handover-c5004','Saloon','Fwd cockpit door','Operational','Middle handle very hard to operate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r43','qc-handover-c5004','Stbd Aft Cabin','Vinyl panels','Loose','Aft ceiling panel above reading lights - flimsy and debonding',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r44','qc-handover-c5004','Stbd Aft Cabin','Bunk top','Scratches','Scratches on bunk top GRP',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r45','qc-handover-c5004','Stbd Aft Cabin','Vinyl panels','Cleaning','Clean all vinyl panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r46','qc-handover-c5004','Stbd Aft Cabin','Hatch','Operational','Spills on hatch surround and adjust operation',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r47','qc-handover-c5004','Stbd Aft Cabin','window surround','Cleaning','Dirt and dull on window transition - check all and buff all',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r48','qc-handover-c5004','Stbd Aft Cabin','Vinyl panels','Damage','Damage on vinyl panel below window transition',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r49','qc-handover-c5004','Stbd Aft Cabin','Fan','Incorrect','Rubber fitted at incorrect position on fan',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r50','qc-handover-c5004','Stbd Aft Cabin','Windows','Scratches','Scratches on windows - check all',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5004-r51','qc-handover-c5004','Stbd Aft Cabin','Floor','Sealer','Neaten floor sealer - check entire stbd side floor sealer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r52','qc-handover-c5004','Stbd Aft Cabin','Bunktop/Double berth','Loose','Loose bunk footer outboard section',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r57','qc-handover-c5004','Stbd Study & Passage','Staircase','Missing part','Missing edging at staircase',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r58','qc-handover-c5004','Stbd Study & Passage','Large mirror behind sliding entrance door','Loose','Poor edging on catch block and loose bird catch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r59','qc-handover-c5004','Stbd Study & Passage','Draw locker','Operational','Study drawer top drawer chafing when closing',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r60','qc-handover-c5004','Stbd Study & Passage','Inspection lids','Damage','Small chips around floor cut out and floor boards check all floor inspections',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r61','qc-handover-c5004','Stbd Study & Passage','Hatch','Operational','Hatch proud and shade and net stucks in operation',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r62','qc-handover-c5004','Stbd Study & Passage','Hanging locker','Loose','Loose hinge on hanging locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r63','qc-handover-c5004','Stbd Study & Passage','Hanging locker','Loose','Loose catches on hanging locker - check all',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r64','qc-handover-c5004','Stbd Study & Passage','Draw locker','Loose','Loose hinge on bottom foot locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r65','qc-handover-c5004','Stbd Study & Passage','Staircase','Loose','Ac/Dc locker bulkhead debonding',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r66','qc-handover-c5004','Stbd Study & Passage','Staircase','Sealer','Neaten sealer below AC/DC locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r67','qc-handover-c5004','Stbd Study & Passage','Staircase','Damage','Fit edging below fwd locker comer piece',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r75','qc-handover-c5004','Owner''S Heads','Vinyl panels','Damage','Damage on vinyl panel forward of sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r76','qc-handover-c5004','Owner''S Heads','Sliding or hinged heads door','Damage','Deep scratch on sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r77','qc-handover-c5004','Owner''S Heads','Vanity locker with mirror','Loose','Loose catches on vanity locker doors',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r78','qc-handover-c5004','Owner''S Heads','Under-basin locker with toilet roll holder','Loose','Loose hinges and catches on under basin locker doors - check all',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r79','qc-handover-c5004','Owner''S Heads','Windows','Scratches','Scratches on both heads windows',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5004-r80','qc-handover-c5004','Owner''S Heads','Hatch','Missing part','Missing screw clip on hatch and adjust operation',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r81','qc-handover-c5004','Owner''S Heads','Hatch','Loose','Ceiling flimsy at hatch and hatch is also proud',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r83','qc-handover-c5004','Owner''S Heads','Toilet','Loose','Loose toilet switch and missing switch stickers',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r84','qc-handover-c5004','Owner''S Heads','Underbasin locker doors','Proud/Alignment','Align locker doors below basin',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r85','qc-handover-c5004','Owner''S Heads','Lockers','Proud/Alignment','Proud fitted toilet roll holder',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r86','qc-handover-c5004','Owner''S Heads','Doors','Incorrect','Incorrect nuts fitted on Perspex door catch blocks and missing bolt and nut bottom catch block',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r87','qc-handover-c5004','Owner''S Heads','Heads bulkhead module','Cleaning','Clean entire heads bulkhead module- debris, stains, spills and yellow sealer',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r108','qc-handover-c5004','Port Fwd Cabin','Windows','Scratches','On hull window + portlight',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5004-r109','qc-handover-c5004','Port Fwd Cabin','Bunktop/Double berth','Loose','inboard bunk fiddle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r110','qc-handover-c5004','Port Fwd Cabin','Hanging locker','Proud/Alignment','hanging locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r111','qc-handover-c5004','Port Fwd Cabin','Vents','Sealer','missing sealer at inboard vent top side',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r112','qc-handover-c5004','Port Fwd Cabin','Bunk Drawers','Operational','bunk drawers opening while locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r113','qc-handover-c5004','Port Fwd Cabin','Cabin Door','Sealer','missing sealer on outboard door capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r114','qc-handover-c5004','Port Fwd Cabin','Solids','Damage','poor spray on door surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5004-r115','qc-handover-c5004','Port Fwd Cabin','2 x LED reading lamps over bunk','Proud/Alignment','outboard reading light not clipped in',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r116','qc-handover-c5004','Port Fwd Cabin','Vents','Cleaning','excess sealer inside vent',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r122','qc-handover-c5004','Port Passage','Staircase','Incorrect','top step hinge not latching correctly',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r123','qc-handover-c5004','Port Passage','Staircase','Loose','loose 2nd step',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r124','qc-handover-c5004','Port Passage','Bilges','Flowcoat','Visible screw in bilge + poor flowcoat inside',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r125','qc-handover-c5004','Port Passage','Bilges','Incorrect','inboard wiring cut out to be neatened',5,'Plumbing',false,'','','','',''),
  ('qc-handover-c5004-r126','qc-handover-c5004','Port Passage','Staircase','Proud/Alignment','visible gaps on fwd stairway capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r127','qc-handover-c5004','Port Passage','Aircon unit','Missing part','aircon inspection panel (missing cleat)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r128','qc-handover-c5004','Port Passage','Aircon unit','Flowcoat','missing wood sealer',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r129','qc-handover-c5004','Port Passage','Cabin Door','Cleaning','clean excess at fwd stairway capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r135','qc-handover-c5004','Port Fwd Heads','Window blinds','Missing part','missing screw cap on blind tac',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r136','qc-handover-c5004','Port Fwd Heads','Perspex','Loose','Perspex divider',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r137','qc-handover-c5004','Port Fwd Heads','Vanity locker with mirror','Loose','top hinge vanity locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r138','qc-handover-c5004','Port Fwd Heads','Basin module','Loose','toilet roll holder',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r139','qc-handover-c5004','Port Fwd Heads','Sliding entrance door with lock','sealer','missing sealer on capping when sliding door closed (check below door)',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r149','qc-handover-c5004','Port Aft Cabin','Cabin Door','operational','cabin door opening when locked + loose door handle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r150','qc-handover-c5004','Port Aft Cabin','hanging locker','proud','proud inboard hanging locker door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r151','qc-handover-c5004','Port Aft Cabin','Fan','incorrect','fan base kinked on wiring',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r152','qc-handover-c5004','Port Aft Cabin','Vinyl ceiling','loose','outboard vynil ceiling panel',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r153','qc-handover-c5004','Port Aft Cabin','Window blinds','proud','aft hull window blind fitted skew',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r154','qc-handover-c5004','Port Aft Cabin','Window blinds','damage','transom window blind tac screws burred',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r155','qc-handover-c5004','Port Aft Cabin','Portlight with roller blind','cleaning','excess sealer below fwd hull portlight',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r156','qc-handover-c5004','Port Aft Cabin','Bunk Drawers','operational','drawer opening while locked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r162','qc-handover-c5004','Port Aft Heads','Sliding entrance door with lock','operational','sliding door chaffing against the pelmet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r163','qc-handover-c5004','Port Aft Heads','Coat hook','loose','loose coat hook base',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r164','qc-handover-c5004','Port Aft Heads','Sliding entrance door with lock','sealer','missing sealer behind heads door capping',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r165','qc-handover-c5004','Port Aft Heads','Vanity locker with mirror','loose','vanity loose',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r166','qc-handover-c5004','Port Aft Heads','Hanging locker','loose','loose catch hanging Locker door + align bottom side of door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r167','qc-handover-c5004','Port Aft Heads','Perspex','loose','Perspex divider',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r168','qc-handover-c5004','Port Aft Heads','Perspex','cleaning','remove Koki markings at Perspex divider',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5004-r169','qc-handover-c5004','Port Aft Heads','Shower bulkhead module','Loose','shower rail bases',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r170','qc-handover-c5004','Port Aft Heads','window surround','Repairs','poor repairs on window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r171','qc-handover-c5004','Port Aft Heads','Hatch','damage','damage edging at hatch surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r176','qc-handover-c5004','Forepeak','Fwd area','Sealer','missing sealer on fwd bunk surround + missing edging on ends',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r177','qc-handover-c5004','Forepeak','Floor','Spills','remove spills on entire bunk surround',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r178','qc-handover-c5004','Forepeak','Door surround','Sealer','missing sealer on crew quarter door frame inside + remove pencil markings',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r179','qc-handover-c5004','Forepeak','Hatch','Proud/Alignment','proud hatch liner + adjust when operating',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r296','qc-handover-c5004','Aft Cockpit','Windows','Cleaning','Over spray and scratches on port transom window',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5004-r297','qc-handover-c5004','Aft Cockpit','Engine room ventilation fans','Damage','Chemical damage on port engine blower box',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r298','qc-handover-c5004','Aft Cockpit','Vents','Damage','Crack air vents x2',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r299','qc-handover-c5004','Aft Cockpit','Aft area','Repairs','Poor repair port transom below air vents',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r300','qc-handover-c5004','Aft Cockpit','Vinyl ceiling','Damage','Damages port vinyl ceiling',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r301','qc-handover-c5004','Aft Cockpit','Vinyl ceiling','Damage','Damages on stbd vinyl ceiling',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5004-r302','qc-handover-c5004','Aft Cockpit','Aft area','Cleaning','Clean glue and sticker residue aft area marked',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5004-r303','qc-handover-c5004','Aft Cockpit','Lockers','Spills','Primer spillage inside chubby locker',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r304','qc-handover-c5004','Aft Cockpit','Locker lids','Damage','Screw protruding fire locker lid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r305','qc-handover-c5004','Aft Cockpit','Locker lids','Spills','Spills and scratches on life raft locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r306','qc-handover-c5004','Aft Cockpit','Helmstation','Loose','Horn switch loose and helm seat cushion clip loose',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r307','qc-handover-c5004','Aft Cockpit','Aft area','Cleaning','Clean excess sika at port step above transom window',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r308','qc-handover-c5004','Aft Cockpit','Helmstation','Repairs','Chips on steering platform and excess sika and scratches and dull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r314','qc-handover-c5004','Port Side Deck','Decklid','Repairs','Dents visible at repair aft area and buff entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r319','qc-handover-c5004','Stbd Side Deck','Decklid','Repairs','Dents visible at repair aft area and buff entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r332','qc-handover-c5004','Flybridge','Table','scratches','on table surround + clean bottom side',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r333','qc-handover-c5004','Flybridge','Bimini','Cleaning','clean Bimini skyscreen surround',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5004-r341','qc-handover-c5004','Foredeck/Fwd Cockpit','Lockers','Damage','Damage Flowcoat at hinges and chipped flange cut out surround as marked inside genset locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r342','qc-handover-c5004','Foredeck/Fwd Cockpit','Lockers','Damage','Screws protruding inboard area genset locker',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r343','qc-handover-c5004','Foredeck/Fwd Cockpit','Lockers','Damage','Damaged fire repellent / sound seal inside genset locker',6,'Mechanical',false,'','','','',''),
  ('qc-handover-c5004-r344','qc-handover-c5004','Foredeck/Fwd Cockpit','Trampoline','Cleaning','Stains and tension trampoline',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r370','qc-handover-c5004','Stbd Hull','Aft area','Scratches','Scratches dull and scuff marks check entire aft area marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r371','qc-handover-c5004','Stbd Hull','Midship area','Scratches','Scratches and scuff marked check entire marked area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r372','qc-handover-c5004','Stbd Hull','Fwd area','Scratches','Scratches and dull check entire marked area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5004-r373','qc-handover-c5004','Stbd Hull','deck Join','Sealer','Neaten deck joint sealer and chain plate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5004-r374','qc-handover-c5004','Stbd Hull','Guard wires with stanchions, bases, port & starboard side gates','Cleaning','Clean entire side stanchion and remove tape residue',10,'Cleaning',false,'','','','',''),
  ('qc-handover-c5004-r375','qc-handover-c5004','Stbd Hull','Windows','Cleaning','Clean neoprene',8,'Perspex/Windows',false,'','','','','')
on conflict (id) do nothing;
insert into public.quality_control_boats (id,name,model) values ('qc-handover-c5005','C5005_HO_Audit','C5') on conflict (id) do update set name=excluded.name, model=excluded.model;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Saloon','Kyle Carl Adams',0) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Stbd Aft Cabin','',1) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Stbd Study & Passage','',2) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Owner''S Heads','Kyle Carl Adams',3) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Port Aft Cabin','',4) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Port Aft Heads','',5) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Port Fwd Heads','',6) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Port Fwd Cabin','Kyle Carl Adams',7) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Aft Cockpit','Kyle Carl Adams',8) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Foredeck/Fwd Cockpit','',9) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Port Side Deck','',10) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Stbd Side Deck','Kyle Carl Adams',11) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Stbd Hull','',12) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_areas (boat_id,area_name,inspector,sort_order) values ('qc-handover-c5005','Port Hull','Kyle Carl Adams',13) on conflict (boat_id,area_name) do update set inspector=case when coalesce(trim(quality_control_areas.inspector),'')='' then excluded.inspector else quality_control_areas.inspector end;
insert into public.quality_control_defects (id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values
  ('qc-handover-c5005-r4','qc-handover-c5005','Saloon','Draw locker','Missing part','Missing screw on catch blocks and align drawer galley area above counter tops',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r5','qc-handover-c5005','Saloon','Lockers','Loose','Align and fasten all locker button locks',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r6','qc-handover-c5005','Saloon','Companion door','Damage','Damages on door frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5005-r7','qc-handover-c5005','Saloon','Windows','Damage','Scratch on port and stbd window as marked',8,'Perspex/Windows',false,'','','','',''),
  ('qc-handover-c5005-r8','qc-handover-c5005','Saloon','Vinyl ceiling','Damage','Damage on vinyl panels marked',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r9','qc-handover-c5005','Saloon','Ceiling','Cracks','Stbd aft ceiling above tv bracket',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r10','qc-handover-c5005','Saloon','Lockers','Damage','Scratch on Formica below mast pole',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r11','qc-handover-c5005','Saloon','Fwd cockpit door','Scratches','Scratch on s/s frame',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r12','qc-handover-c5005','Saloon','Fwd cockpit door','Loose','Loose center door handle',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5005-r13','qc-handover-c5005','Saloon','Nav desk','Loose','Loose bulkhead below nav desk',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r44','qc-handover-c5005','Stbd Aft Cabin','Vinyl panels','Damage','Damaged aft vinyl panel and visible Valcro',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r45','qc-handover-c5005','Stbd Aft Cabin','Blinds','Loose','Loose blind screws and Valcro strips check all',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r46','qc-handover-c5005','Stbd Aft Cabin','Bunk top','Loose','Excess glue spills and loose bunk fiddle',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r47','qc-handover-c5005','Stbd Aft Cabin','Ceiling','Cracks','Crack aft of hatch inboard',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r48','qc-handover-c5005','Stbd Aft Cabin','Vinyl panels','Cleaning','Clean all vinyl panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r53','qc-handover-c5005','Stbd Study & Passage','Sliding or hinged heads door','Damage','Damage on door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r54','qc-handover-c5005','Stbd Study & Passage','Sliding or hinged heads door','Operational','Adjust operation',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r55','qc-handover-c5005','Stbd Study & Passage','Inspection lids','Missing part','Missing toggles on inspection lids',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r56','qc-handover-c5005','Stbd Study & Passage','Magazine locker/shelf locker','Damage','Damage on shelf locker above study',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r57','qc-handover-c5005','Stbd Study & Passage','Inspection lids','Loose','Loose inspection panel aft of sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r62','qc-handover-c5005','Owner''S Heads','Vinyl panels','Damage','Damage on vinyl panel above sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r63','qc-handover-c5005','Owner''S Heads','Formica Bulkheads','Damage','Damage on Formica bulkhead fwd of sliding door',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r64','qc-handover-c5005','Owner''S Heads','Draw locker','Loose','Loose draw knob',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r65','qc-handover-c5005','Owner''S Heads','Vanity locker with mirror','Damage','Damage on Formica fwd of vanity locker',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r66','qc-handover-c5005','Owner''S Heads','Under-basin locker with toilet roll holder','Loose','Loose catch check all',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r67','qc-handover-c5005','Owner''S Heads','Hatch','Damage','Damage on vinyl at hatch screw point',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r68','qc-handover-c5005','Owner''S Heads','Locker','Loose','Loose cleat above toilet and unwanted extra holes inside cave locker above toilet',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r69','qc-handover-c5005','Owner''S Heads','Electric sea water flush toilet','Scratches','Scratches on toilet Grp base check entire',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r70','qc-handover-c5005','Owner''S Heads','Perspex','Scratches','Scratches on s/s stopper plates',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r71','qc-handover-c5005','Owner''S Heads','Heads bulkhead module','Sealer','Neaten sealer and remove yellow sealer and excess sealer and spills',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r81','qc-handover-c5005','Port Aft Cabin','Window blinds','Loose','Loose screw points and Valcro strips',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r82','qc-handover-c5005','Port Aft Cabin','window surround','Scratches','Scratches on hillside window surround',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r83','qc-handover-c5005','Port Aft Cabin','Inspection lids','Cleaning','Remove masking tape from Valcro',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r84','qc-handover-c5005','Port Aft Cabin','Vinyl panels','Cleaning','Remove pencil markings around hatch and clean all vinyl panels',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r90','qc-handover-c5005','Port Aft Heads','Hatch','Loose','Hatch frame loose and proud',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r91','qc-handover-c5005','Port Aft Heads','Door frames','Damage','Two tone and dull on frame surround',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5005-r92','qc-handover-c5005','Port Aft Heads','Dividers','Loose','Loose divider and mountings',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r93','qc-handover-c5005','Port Aft Heads','Sliding or hinged heads door','Loose','Loose door latch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r98','qc-handover-c5005','Port Fwd Heads','Door frames','Damage','Damage and two tone on frame check entire frame',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5005-r99','qc-handover-c5005','Port Fwd Heads','Coat hook','Loose','Loose coat hook',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r100','qc-handover-c5005','Port Fwd Heads','Sliding or hinged heads door','Operational','Chafing door and adjust door operation',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r101','qc-handover-c5005','Port Fwd Heads','Sliding or hinged heads door','Loose','Loose door latch',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r105','qc-handover-c5005','Port Fwd Cabin','window surround','Damage','Visible hole at blind clip',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r106','qc-handover-c5005','Port Fwd Cabin','Door frames','Damage','Damage and two tone on door frame and paint striker plate cutout',9,'Spray Painting',false,'','','','',''),
  ('qc-handover-c5005-r107','qc-handover-c5005','Port Fwd Cabin','Hatch','Operational','Hatch fitted wrong way in crew quarters',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r108','qc-handover-c5005','Port Fwd Cabin','Sliding or hinged heads door','Operational','Chafing door and adjust door operation',3,'Joinery/Carp',false,'','','','',''),
  ('qc-handover-c5005-r118','qc-handover-c5005','Aft Cockpit','Transom','Track repair','Yellow stain in tracking transom top step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r119','qc-handover-c5005','Aft Cockpit','Lockers','Damage','Damage on fire locker coaming',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r120','qc-handover-c5005','Aft Cockpit','Helmstation','Porosity','Porosity on helm step coamings',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r121','qc-handover-c5005','Aft Cockpit','Floor','Porosity','Porosity on water channels at walk way as marked',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r122','qc-handover-c5005','Aft Cockpit','Lockers','Loose','Loose hinge on chubby locker and align gaps',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5005-r123','qc-handover-c5005','Aft Cockpit','Ceiling Liner','Scratches','Buff entire ceiling Grp surround scratches and dull',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r124','qc-handover-c5005','Aft Cockpit','Settee','Crack','Port settee coaming aft area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r125','qc-handover-c5005','Aft Cockpit','BBQ Locker','Loose','Loose bbq',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5005-r157','qc-handover-c5005','Foredeck/Fwd Cockpit','Anchor/windlass locker','Operational','Perco stucks adjust',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5005-r158','qc-handover-c5005','Foredeck/Fwd Cockpit','Fwd area','Spills','Spills and scratches coaming surround check entire',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r168','qc-handover-c5005','Port Side Deck','Decklid','Scratches','Scratches and dull check entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r180','qc-handover-c5005','Stbd Side Deck','Decklid','Scratches','Spills scratches and dull check entire decklid',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r196','qc-handover-c5005','Stbd Hull','Guard wires with stanchions, bases, port & starboard side gates','Missing part','Missing bolt on aft stanchion gate',4,'Deckfitting',false,'','','','',''),
  ('qc-handover-c5005-r210','qc-handover-c5005','Port Hull','Aft area','Repairs','Poor repairs and thin at top step area',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r211','qc-handover-c5005','Port Hull','toe rail','Repairs','Poor repairs on toe rail and thin below stanchion gate',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r212','qc-handover-c5005','Port Hull','Aft area','Repairs','Thin aft flange above top step',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r213','qc-handover-c5005','Port Hull','Aft area','Repairs','Poor repair above chafe plate on toe rail',1,'Gelcoat',false,'','','','',''),
  ('qc-handover-c5005-r214','qc-handover-c5005','Port Hull','chafe plate','Sealer','Seal all chafe plate x3',4,'Deckfitting',false,'','','','','')
on conflict (id) do nothing;
commit;
select model, count(*) as audits from public.quality_control_boats where model='C5' group by model;
