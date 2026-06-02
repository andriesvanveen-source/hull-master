-- Seed previous Hull Master boats from C1_CE_Reports (new) (2).xlsx
-- Run this after supabase-schema.sql.

insert into public.boats (name)
values ('C1019')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter alarm not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter alarm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Autopilot motor Cross Wired', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Autopilot motor Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mast wiring incomplete', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('mast wiring incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck light not working', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('deck light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrectly labeled acdc panel', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrectly labeled acdc panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing deck wash label', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing deck wash label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'multimeters freezing and needs to be updated', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('multimeters freezing and needs to be updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect jump on shore 1 at acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect jump on shore 1 at acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'dual shore power breaker light is wired on wrong side', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('dual shore power breaker light is wired on wrong side'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'TV lock pins incorrectly installed', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('TV lock pins incorrectly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACDC panel covers not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ACDC panel covers not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge alarm panel not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge alarm panel not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incorrectly wired AC multimeter. Should measure genset and shore 1 not shore 2', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Incorrectly wired AC multimeter. Should measure genset and shore 1 not shore 2'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACU ground wire not pulled through', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ACU ground wire not pulled through'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Telly Mute Not Working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Telly Mute Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wireless charger not working', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('wireless charger not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing negative bus bar cover', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing negative bus bar cover'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx2 cover loose', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx2 cover loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon door not set', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon door not set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AIS not working', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AIS not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AIS not showing on MFD camera view', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AIS not showing on MFD camera view'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Victron app setup not done', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Victron app setup not done'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Mfd Needs To Be Updated', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Mfd Needs To Be Updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing main breaker labels in saloon floor', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing main breaker labels in saloon floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing breaker labels on saloon DB', null, 'Saloon'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing breaker labels on saloon DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water pipe running over steering pulleys', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water pipe running over steering pulleys'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'outboard AC outlet is upside down', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('outboard AC outlet is upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'untidy morse control cables inboard', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('untidy morse control cables inboard'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower hot water kinked', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower hot water kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pipes not cradled', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pipes not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wires covering toilet anti-syphen', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('wires covering toilet anti-syphen'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon drain too long', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon drain too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater drain not cradled', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater drain not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on waste tank', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on waste tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'CO sensor not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('CO sensor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad duckting inboard', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bad duckting inboard'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer wire not cradled', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer wire not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Leaking Into Bilge', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Leaking Into Bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin not properly draining (water collects in corner)', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin not properly draining (water collects in corner)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer label missing', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer label missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin mixer loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose pipes in bilge', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose pipes in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wireless charger wire not strapped', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('wireless charger wire not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'speed transducer wire not cradled', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('speed transducer wire not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'speed transducer missing label', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('speed transducer missing label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'duckting not neat', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('duckting not neat'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'isolator switch mounted skew', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('isolator switch mounted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'remove plastic in inverter fans', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('remove plastic in inverter fans'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon drain too long', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon drain too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater drain too long', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater drain too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water tank dirty', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water tank dirty'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'label breakers in HVL', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('label breakers in HVL'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose pipes in bilge', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose pipes in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering is stiff and clicking', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('steering is stiff and clicking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'davit is skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('davit is skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'camera skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('camera skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect label on liferaft locker', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('incorrect label on liferaft locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Raymic Fitting Upside Down', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Raymic Fitting Upside Down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel transfer is not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fuel transfer is not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm cup holders not draining', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('helm cup holders not draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'compass light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('compass light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect steering wheel fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('incorrect steering wheel fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'emergency tiller getting stuck', null, 'Port Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('emergency tiller getting stuck'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad ground wire crimp on rudder', null, 'Port Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('bad ground wire crimp on rudder'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad heat shrink on gnd bus bar', null, 'Port Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('bad heat shrink on gnd bus bar'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'coolant under engine', null, 'Port Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('coolant under engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower mixer skew', null, 'Port Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('stern shower mixer skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'emergency tiller getting stuck', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('emergency tiller getting stuck'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power box missing blanks', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power box missing blanks'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unwanted shore power jump wire', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('unwanted shore power jump wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'float switch not properly functioning', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('float switch not properly functioning'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power breakers not labeled', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power breakers not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galvanic isolator cables loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('galvanic isolator cables loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'rust and dirt on engine', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('rust and dirt on engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'camera is skew', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('camera is skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass brake is too tight', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass brake is too tight'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing boots on windlass motor', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing boots on windlass motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass junction box loosely mounted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass junction box loosely mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect washdown fitting (should be black)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('incorrect washdown fitting (should be black)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit fusion remote not picking up network', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit fusion remote not picking up network'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'all outlets to be tested', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('all outlets to be tested'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'All bilge labels to be checked', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('All bilge labels to be checked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fresh/Salt water labels for toilets to be fitted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1019'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Fresh/Salt water labels for toilets to be fitted'))
  );

insert into public.boats (name)
values ('C1018')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon fridge not cooling', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon fridge not cooling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Nmma Label Needs To Be Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Nmma Label Needs To Be Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset volts and hertz not correctly set', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset volts and hertz not correctly set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset transfer breaker light not going on', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset transfer breaker light not going on'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mast wiring needs to be done', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('mast wiring needs to be done'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Door Needs To Be Set', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Door Needs To Be Set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing clamp for fridge drain pipe', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing clamp for fridge drain pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Oven cluster not working', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Oven cluster not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge alarm panel not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge alarm panel not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Clear Plastic Db Cover Not Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Clear Plastic Db Cover Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fire Blanket Not Fitted (Sf)', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Fire Blanket Not Fitted (Sf)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Co2 Sensor Not Mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Co2 Sensor Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect acdc panel labels', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect acdc panel labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect colour code wire under helm on bus bar', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect colour code wire under helm on bus bar'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing labels for main breakers in floor', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing labels for main breakers in floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Autopilot RF remote not connected', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Autopilot RF remote not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no Co-X plugs fitted for VHF antenna', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no Co-X plugs fitted for VHF antenna'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD needs to be updated', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD needs to be updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC Multimeter needs to be programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC Multimeter needs to be programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No key tallies for saloon door fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No key tallies for saloon door fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing bus bar cover in saloon floor', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing bus bar cover in saloon floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx 2 cover loose', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx 2 cover loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery brace loose', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('battery brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon tap weight badly installed', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon tap weight badly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not switching on', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not switching on'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'morse control idle revs misaligned', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('morse control idle revs misaligned'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power 1 not working (incorrectly wired)', null, 'Saloon'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('shore power 1 not working (incorrectly wired)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel pipes metal support frame loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel pipes metal support frame loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater drain pipe not cradled', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater drain pipe not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm cup holder drain not correctly installed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('helm cup holder drain not correctly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'manual fire suppression cable loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('manual fire suppression cable loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon Not Draining', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon Not Draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not switching on', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not switching on'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm cup holder drain badly installed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('helm cup holder drain badly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fridge compressor not mounted', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fridge compressor not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'OV cabin door lock incorrectly installed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('OV cabin door lock incorrectly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet solenoid broke loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet solenoid broke loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'outlet upside down', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('outlet upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon box cover not fitted', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon box cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing ball valve label', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing ball valve label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing j-box cover in bilge', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing j-box cover in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not switching on', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not switching on'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'excess gas piping behind genset battery inboard', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('excess gas piping behind genset battery inboard'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not switching on', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not switching on'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unlabeled wires and busbar at yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unlabeled wires and busbar at yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater drain pipe not cradled', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater drain pipe not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon drain pipe too long', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon drain pipe too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose connections on yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose connections on yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing c-clips at aircon bleed', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing c-clips at aircon bleed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AIS not wired', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('AIS not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'manual fire suppression cable loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('manual fire suppression cable loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose toilet piping', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose toilet piping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing breaker labels', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing breaker labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing j-box cover in bilge', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing j-box cover in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'underwater lights not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('underwater lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly installed shore power socket screws both port and stbd side', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('badly installed shore power socket screws both port and stbd side'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'dome tag not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('dome tag not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'transom teak steps SF', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('transom teak steps SF'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon door missing cover plate on port side', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('saloon door missing cover plate on port side'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon door missing interior valence', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('saloon door missing interior valence'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aft cockpit strip light not connected', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('aft cockpit strip light not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset battery voltage is showing on mfd if isolator is off', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('genset battery voltage is showing on mfd if isolator is off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Label On Battery', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Missing Label On Battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'rust on engine', null, 'Port Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('rust on engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose exhaust clamp', null, 'Port Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose exhaust clamp'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Label On Battery', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Missing Label On Battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot overturns and gets stuck', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('autopilot overturns and gets stuck'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly installed engine ground wire', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('badly installed engine ground wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power breakers not labeled', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power breakers not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'remove unwanted boot on battery', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('remove unwanted boot on battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'extra jump in shore power contactor box (unwanted)', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('extra jump in shore power contactor box (unwanted)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose exhaust clamp', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose exhaust clamp'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass is slipping', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass is slipping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deckwash is leaking', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('deckwash is leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass boot missing', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass boot missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset breaker not labeled', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset breaker not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass chain teflon block badly installed (remove teflon block or fix mounting)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass chain teflon block badly installed (remove teflon block or fix mounting)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stbd deck winch not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('stbd deck winch not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mainsheet deck winch button needs to be removed. It is not a electric winch', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('mainsheet deck winch button needs to be removed. It is not a electric winch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing label in gas locker shutoff valve', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing label in gas locker shutoff valve'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic outlet is skew', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('raymic outlet is skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Jammer Labels Not Fitted', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Jammer Labels Not Fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck winches silver tops do not align', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('deck winches silver tops do not align'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'boom warning labels to be fitted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('boom warning labels to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh labels', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mount fire extinguishers', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('mount fire extinguishers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'electrical labeling needs to be done', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1018'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('electrical labeling needs to be done'))
  );

insert into public.boats (name)
values ('C1013')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'buzzer not connected by helm', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('buzzer not connected by helm'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Nmma Label Needs To Be Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Nmma Label Needs To Be Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset volts and hertz not correctly set', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset volts and hertz not correctly set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplete wiring by main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incomplete wiring by main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mast wiring needs to be done', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('mast wiring needs to be done'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Door Needs To Be Set', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Door Needs To Be Set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing clamp for fridge drain pipe', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing clamp for fridge drain pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing diodes by main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing diodes by main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stbd fwd shower pump wire needs to be strapped to main db', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('stbd fwd shower pump wire needs to be strapped to main db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Clear Plastic Db Cover Not Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Clear Plastic Db Cover Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fire Blanket Not Fitted (Sf)', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Fire Blanket Not Fitted (Sf)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Co2 Sensor Not Mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Co2 Sensor Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect acdc panel labels', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect acdc panel labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'curtacy lights incorrectly wired', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('curtacy lights incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing labels for main breakers in floor', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing labels for main breakers in floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter network cable pulled out', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter network cable pulled out'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no Co-X plugs fitted for VHF antenna', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no Co-X plugs fitted for VHF antenna'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD needs to be updated', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD needs to be updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC Multimeter needs to be programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC Multimeter needs to be programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No key tallies for saloon door fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No key tallies for saloon door fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Autopilot motor not working', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Autopilot motor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'DC multimeter freezing', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('DC multimeter freezing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrectly wired AC neutrals', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrectly wired AC neutrals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'DC multimeter arrow cross wired', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('DC multimeter arrow cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck light not working', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('deck light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC cluster incorrectly wired', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC cluster incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power 2 not working (incorrectly wired)', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('shore power 2 not working (incorrectly wired)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'VHF antenna wire not pulled through from nav station', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('VHF antenna wire not pulled through from nav station'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Galley Fridge Not Working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Galley Fridge Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker polarity incorrect', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('watermaker polarity incorrect'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'telly mute not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('telly mute not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge notification popups not working', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge notification popups not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter alarm incorrectly wired', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter alarm incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge helm light not working', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge helm light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass only works with port ignition', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('windlass only works with port ignition'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Victron app on MFD not configured', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Victron app on MFD not configured'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'port water heater not working', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('port water heater not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stereo keeps tripping', null, 'Saloon'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('stereo keeps tripping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater leaking at hot water', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater leaking at hot water'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater drain pipe not cradled', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater drain pipe not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm cup holder drain not correctly installed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('helm cup holder drain not correctly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wires needs to be strapped in inboard inspection', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('wires needs to be strapped in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACU ground wire not connected', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ACU ground wire not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'co2 sensor not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('co2 sensor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inboard piping not cradled', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inboard piping not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2way switch fitted -- should be three way', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('2way switch fitted -- should be three way'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ventilation fan not fitted', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ventilation fan not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon elbow broken', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon elbow broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor aircon duckting', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('poor aircon duckting'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose pipes by aircon', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose pipes by aircon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing ball valve label', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing ball valve label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon base loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon base loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet switch not wired', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet switch not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'outlet not wired', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('outlet not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly installed duckting', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('badly installed duckting'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker prefilter is damaged', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('watermaker prefilter is damaged'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste Tank Indicator Not Working', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste Tank Indicator Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon duckting loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon duckting loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater drain pipe not cradled', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater drain pipe not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon drain pipe too long', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon drain pipe too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose connections on yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose connections on yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose toilet piping', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose toilet piping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump pipe too long', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump pipe too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower mixer upside down', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('stern shower mixer upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower nozzle leaking', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('stern shower nozzle leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'dome tag not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('dome tag not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Davit Skew', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Davit Skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'usb fitted at incorrect location', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('usb fitted at incorrect location'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'davit switch badly mounted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('davit switch badly mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power grommets badly fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('shore power grommets badly fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power plugs not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('shore power plugs not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stbd mid extractor mushroom not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('stbd mid extractor mushroom not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset battery voltage is showing on mfd if isolator is off', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('genset battery voltage is showing on mfd if isolator is off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fusion remote not picking up', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fusion remote not picking up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fireboy display defective', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fireboy display defective'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Label On Battery', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Missing Label On Battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose L-Bracket On Starter Motor', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose L-Bracket On Starter Motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cyrix status led not flashing', null, 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('cyrix status led not flashing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine raw water pipe is dirty', null, 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine raw water pipe is dirty'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower pipe is kinked', null, 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('stern shower pipe is kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fuel Prefilter Pipe Clamps Loose', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Fuel Prefilter Pipe Clamps Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel and coolant pipe', null, 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel and coolant pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no fireboy terminator plug', null, 'Port Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no fireboy terminator plug'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Label On Battery', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Missing Label On Battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge float chaffing (getting stuck)', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('bilge float chaffing (getting stuck)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly installed engine ground wire', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('badly installed engine ground wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power breakers not labeled', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power breakers not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'blue steering conduit at an angle', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('blue steering conduit at an angle'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fuel Prefilter Pipe Clamps Loose', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Fuel Prefilter Pipe Clamps Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel and coolant pipe', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel and coolant pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no fireboy terminator plug', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no fireboy terminator plug'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass cables on wrong side of bulkhead', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass cables on wrong side of bulkhead'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset cap leaking coolant', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset cap leaking coolant'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass boots missing', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass boots missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset breaker not labeled', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset breaker not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass base is loose', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass base is loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset leak alarm not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset leak alarm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrectly wired genset earth leakage', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('incorrectly wired genset earth leakage'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water level not showing on MFD', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('water level not showing on MFD'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'auto pilot motor not wired', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('auto pilot motor not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'throttle rpms not aligning', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('throttle rpms not aligning'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering is clicking', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('steering is clicking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'boom warning labels to be fitted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('boom warning labels to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'damage on boom', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('damage on boom'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Jammer Labels Not Fitted', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Jammer Labels Not Fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Pulleys And Rope Painter Needs To Be Installed', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Pulleys And Rope Painter Needs To Be Installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fusion remote and speaker not working on flybridge', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fusion remote and speaker not working on flybridge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd camera is skew', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd camera is skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck winches silver tops do not align', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('deck winches silver tops do not align'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'victron app setup to be done', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('victron app setup to be done'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'port water tank sensor defective', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('port water tank sensor defective'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck light not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('deck light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon programming', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('aircon programming'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'hull decals', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('hull decals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh labels', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mount fire extinguishers', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('mount fire extinguishers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'electrical labeling needs to be done', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1013'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('electrical labeling needs to be done'))
  );

insert into public.boats (name)
values ('C1017')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect wires (colour codes) used for light switches (multiple)', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect wires (colour codes) used for light switches (multiple)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Nmma Label Needs To Be Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Nmma Label Needs To Be Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset volts and hertz not correctly set', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset volts and hertz not correctly set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2x missing downlights', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('2x missing downlights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mast wiring needs to be done', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('mast wiring needs to be done'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Door Needs To Be Set', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Door Needs To Be Set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing clamp for fridge drain pipe', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing clamp for fridge drain pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon settee armrest bolts cut off too short', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon settee armrest bolts cut off too short'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lifting platform isolator not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lifting platform isolator not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Clear Plastic Db Cover Not Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Clear Plastic Db Cover Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fire Blanket Not Fitted (Sf)', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Fire Blanket Not Fitted (Sf)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Co2 Sensor Not Mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Co2 Sensor Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect acdc panel labels', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect acdc panel labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset transfer causing finder behind ACDC to gitter', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset transfer causing finder behind ACDC to gitter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing labels for main breakers in floor', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing labels for main breakers in floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2x unused loose wires behind ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('2x unused loose wires behind ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no Co-X plugs fitted for VHF antenna', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no Co-X plugs fitted for VHF antenna'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD needs to be updated', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD needs to be updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC Multimeter needs to be programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC Multimeter needs to be programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No key tallies for saloon door fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No key tallies for saloon door fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Autopilot motor cross wired', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Autopilot motor cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'DC multimeter freezing', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('DC multimeter freezing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Bad crimp on battery protect unit', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Bad crimp on battery protect unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'house battery cables not properly routed and strapped', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('house battery cables not properly routed and strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck light not working', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('deck light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'curtacy lights incorrectly wired', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('curtacy lights incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stbd engine battery voltage not showing on dc meter', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('stbd engine battery voltage not showing on dc meter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'VHF antenna wire not pulled through from nav station', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('VHF antenna wire not pulled through from nav station'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'horn button not working', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('horn button not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shore 2 not working (incorrect contactor wiring)', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Shore 2 not working (incorrect contactor wiring)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'telly mute not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('telly mute not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'induction HOB not working', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('induction HOB not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter alarm incorrectly wired', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter alarm incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Main saloon breakers not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Main saloon breakers not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter incorrectly programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter incorrectly programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Victron app on MFD not configured', null, 'Saloon'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Victron app on MFD not configured'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt water not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet fresh water not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet fresh water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inboard inspection pipes not strapped', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inboard inspection pipes not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'float switch chemical damage', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('float switch chemical damage'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly installed duckting', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('badly installed duckting'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon drain pipe too long', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon drain pipe too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater drain pipe not cradled', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater drain pipe not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet plumbing leaking', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet plumbing leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2x cut AC wires because stuck in steering', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('2x cut AC wires because stuck in steering'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm cup holder''s not properly draining', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('helm cup holder''s not properly draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad morse control cable installation', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bad morse control cable installation'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no plugs fitted for aircon unit', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no plugs fitted for aircon unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'duckting badly installed', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('duckting badly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing rail stoppers for finder', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing rail stoppers for finder'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'extra unused relay on DB', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('extra unused relay on DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower inspection leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower inspection leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank strap badly installed', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank strap badly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste Tank Indicator Light Not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste Tank Indicator Light Not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon filter leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon filter leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon t-piece leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon t-piece leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon blead leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon blead leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer dummy not fitted', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer dummy not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water purifier mounted at different location', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water purifier mounted at different location'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect aircon pump wiring', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incorrect aircon pump wiring'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing deckwask through hull label', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing deckwask through hull label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin light wires badly installed', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin light wires badly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin water gathering in corner and needs to be filled up', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin water gathering in corner and needs to be filled up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no plugs fitted for aircon unit', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no plugs fitted for aircon unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'speed transducer wire not cradled', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('speed transducer wire not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet loose', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon drain pipe too long', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon drain pipe too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater overflow pipe not cradled', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater overflow pipe not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet anti-syten leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet anti-syten leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pump leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater wires not strapped', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater wires not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'isolator switch wires not strapped', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('isolator switch wires not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'untidy wiring in inboard inspection', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('untidy wiring in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly layed genset exhaust pipe', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('badly layed genset exhaust pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad wire routing under yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bad wire routing under yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump wiring incorrect', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump wiring incorrect'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon filter leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon filter leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'outboard piping not strapped', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('outboard piping not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused watermaker wires under inverter (wastage)', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unused watermaker wires under inverter (wastage)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HVL busbar cover not fitted', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('HVL busbar cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing breaker labels and blanks', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing breaker labels and blanks'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing blank in solar box', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing blank in solar box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing ground on earth bonding plate', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing ground on earth bonding plate'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lifting platform mechanical stop needs to be adjusted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('lifting platform mechanical stop needs to be adjusted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fridge not mounted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fridge not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Raymic Fitting Upside Down', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Raymic Fitting Upside Down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel transfer is not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fuel transfer is not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose cradle of rudder post ground wire', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose cradle of rudder post ground wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel lines', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on coolant lines', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on coolant lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'dirt/rust under engine', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('dirt/rust under engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'emergensy tiller not engaging', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('emergensy tiller not engaging'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery label not fitted', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery positive terminal loose', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery positive terminal loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose pipe on stern shower mixer', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose pipe on stern shower mixer'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower mixer skew', null, 'Port Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('stern shower mixer skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power ground bus cover not fitted', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power ground bus cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad crimp on rudder gnd wire', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('bad crimp on rudder gnd wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect colour blanks in hager box', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('incorrect colour blanks in hager box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering cable in blue sleeve is at an angle', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('steering cable in blue sleeve is at an angle'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on galvanic isolator', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose wires on galvanic isolator'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor heat shrink on galvanic isolator', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('poor heat shrink on galvanic isolator'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine anti-syfen leaking', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine anti-syfen leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'coolant of engine was badly topped up', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('coolant of engine was badly topped up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'emergency tiller not engaging', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('emergency tiller not engaging'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel lines', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on coolant lines', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on coolant lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Label On Battery', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Missing Label On Battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing blower pipe', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('missing blower pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'standing rigging is too long', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('standing rigging is too long'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing boots on windlass control box and motor', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing boots on windlass control box and motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing screws for genset cover', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing screws for genset cover'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset ground leakage incorrectly installed', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset ground leakage incorrectly installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit stbd strip light defective', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit stbd strip light defective'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit fusion defective', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit fusion defective'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deckwash pump not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('deckwash pump not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No voltage pushing through genset earth leakage (how was AC declared working?)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('No voltage pushing through genset earth leakage (how was AC declared working?)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon programming', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('aircon programming'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'hull decals', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('hull decals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'guard rails hitting stanctions', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('guard rails hitting stanctions'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mount fire extinguishers', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('mount fire extinguishers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'electrical labeling needs to be done', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1017'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('electrical labeling needs to be done'))
  );

insert into public.boats (name)
values ('C1015')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACDC covers not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ACDC covers not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Nmma Label Needs To Be Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Nmma Label Needs To Be Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset volts and hertz not correctly set', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset volts and hertz not correctly set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass not working on stbd ignition', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('windlass not working on stbd ignition'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mast wiring needs to be done', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('mast wiring needs to be done'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Door Needs To Be Set', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Door Needs To Be Set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing clamp for fridge drain pipe', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing clamp for fridge drain pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Telly Mute Not Working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Telly Mute Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'compass light not working', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('compass light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Clear Plastic Db Cover Not Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Clear Plastic Db Cover Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fire Blanket Not Fitted (Sf)', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Fire Blanket Not Fitted (Sf)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Co2 Sensor Not Mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Co2 Sensor Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect acdc panel labels', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect acdc panel labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'reefing warning sign not fitted in galley', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('reefing warning sign not fitted in galley'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing labels for main breakers in floor', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing labels for main breakers in floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'house batteries brace loose', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('house batteries brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no Co-X plugs fitted for VHF antenna', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no Co-X plugs fitted for VHF antenna'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD needs to be updated', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD needs to be updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC Multimeter needs to be programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC Multimeter needs to be programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No key tallies for saloon door fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No key tallies for saloon door fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Autopilot motor not connected', null, 'Saloon'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Autopilot motor not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak On Water Heater', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak On Water Heater'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused cradle in fuel locker', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unused cradle in fuel locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose fire suppression cable', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose fire suppression cable'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm cup holders do not drain into aircon drain', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('helm cup holders do not drain into aircon drain'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads floor leaking into bilge', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads floor leaking into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ducting is badly installed in ceiling', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ducting is badly installed in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pipe leaking', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pipe leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly installed morse control cables in ceiling below helm', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('badly installed morse control cables in ceiling below helm'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly strapped wiring in ceiling below helm', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('badly strapped wiring in ceiling below helm'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'extractor fan pipe not connected to deck mushroom', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('extractor fan pipe not connected to deck mushroom'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'extractor fan fitted skew', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('extractor fan fitted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Anti-Syphen Leaking', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Anti-Syphen Leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt water is blocked', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt water is blocked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads rope light not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads rope light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inboard inspection has a pipe that is not draining properly', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inboard inspection has a pipe that is not draining properly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused cradels and plumbing not cradled inboard inspection', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unused cradels and plumbing not cradled inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Water Tank Brace Loose', 'MECH', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Water Tank Brace Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing blue clip for aircon finder relay', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing blue clip for aircon finder relay'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'extra aircon bleed label fitted', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('extra aircon bleed label fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer dummy plug not on boat (used for C1012)', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer dummy plug not on boat (used for C1012)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Leaking Into Bilge', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Leaking Into Bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on aircon pump', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on aircon pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker requires commissioning', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('watermaker requires commissioning'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pump leaking', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower leaking into bilge', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower leaking into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad duckting of aircon', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bad duckting of aircon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset battery base installed at incorrect location', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('genset battery base installed at incorrect location'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Mixer Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon filter leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon filter leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Water Tank Brace Loose', 'MECH', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Water Tank Brace Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon Not Draining', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon Not Draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pump leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet ballvalve broken', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet ballvalve broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing aircon bleed label', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing aircon bleed label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon filter leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon filter leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pump leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Davit Skew', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Davit Skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '12V helm outlet location to be determined', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('12V helm outlet location to be determined'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'davit motor not booted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('davit motor not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'davit contactor not booted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('davit contactor not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Davit contactor loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Davit contactor loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic wire is not mounted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('raymic wire is not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Battery Link Not Working (wire not pulled through)', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Battery Link Not Working (wire not pulled through)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'transom teak steps needs to be fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('transom teak steps needs to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'liferaft locker backrest supports needs to be fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('liferaft locker backrest supports needs to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Topup Engine Fluids', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Topup Engine Fluids'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine battery not labeled', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine battery not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Morse Control Splitpins Not Properly Bent Open', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Morse Control Splitpins Not Properly Bent Open'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel prefilter', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel prefilter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fireboy harness terminator plugs not fitted (SF)', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('fireboy harness terminator plugs not fitted (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower tap mounted skew, leaking and wire pipe kinked', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('stern shower tap mounted skew, leaking and wire pipe kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose morse control nut', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose morse control nut'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on coolant piping to waterheater', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on coolant piping to waterheater'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Steering Cable Loose', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Steering Cable Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no teflon strips for steering bar', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no teflon strips for steering bar'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'exhaust temp sensor loose', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('exhaust temp sensor loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'multiple loose pipes and single clamps', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('multiple loose pipes and single clamps'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'underwater light gnd wire loose', null, 'Port Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('underwater light gnd wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose underwater light nut', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose underwater light nut'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge pump used for C1012', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('bilge pump used for C1012'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fireboy harness terminator plugs not fitted (SF)', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('fireboy harness terminator plugs not fitted (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Morse Control Splitpins Not Properly Bent Open', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Morse Control Splitpins Not Properly Bent Open'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel prefilter', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel prefilter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'exhaust temp sensor loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('exhaust temp sensor loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saildrive oil low', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('saildrive oil low'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prefilter and pipes loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('prefilter and pipes loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'earth wire of underwater light loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('earth wire of underwater light loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poorly fitted clamps on raw water pipes', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('poorly fitted clamps on raw water pipes'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing clamp covers', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('missing clamp covers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused craddle by breath pipe', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('unused craddle by breath pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AR200 cover broken', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('AR200 cover broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'spray dodger needs to be fitted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('spray dodger needs to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'defective 72mm block for main sheet', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('defective 72mm block for main sheet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset coolant cap leaking', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset coolant cap leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Boom Labels Needs To Be Fitted', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Boom Labels Needs To Be Fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Jammer Labels Not Fitted', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Jammer Labels Not Fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering has a sound', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('steering has a sound'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing boots on windlass motor and control box', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing boots on windlass motor and control box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing windlass junction box', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing windlass junction box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing gas locker label', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing gas locker label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon programming', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('aircon programming'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'hull decals', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('hull decals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'guard rails hitting stanctions', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('guard rails hitting stanctions'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mount fire extinguishers', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('mount fire extinguishers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'electrical labeling needs to be done', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1015'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('electrical labeling needs to be done'))
  );

insert into public.boats (name)
values ('C1012')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Telly Mute Not Working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Telly Mute Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Nmma Label Needs To Be Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Nmma Label Needs To Be Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon Switching On Wrong Pump', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Aircon Switching On Wrong Pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incomplete Wiring Behind Acdc Panel', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Incomplete Wiring Behind Acdc Panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incomplete Wiring At Main Saloon Db', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Incomplete Wiring At Main Saloon Db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Door Needs To Be Set', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Door Needs To Be Set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose Wires Behind Acdc', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose Wires Behind Acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Bilge Override Lights Not Mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Bilge Override Lights Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset Isolator Switch Not Mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Genset Isolator Switch Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon Clear Plastic Db Cover Not Mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon Clear Plastic Db Cover Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fire Blanket Not Fitted (Sf)', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Fire Blanket Not Fitted (Sf)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Co2 Sensor Not Mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Co2 Sensor Not Mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon door handle loose', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon door handle loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter Not Programmed On Acdc', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter Not Programmed On Acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'dual shore power switch light is on even with breaker off', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('dual shore power switch light is on even with breaker off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset transfer switch light is on even if breaker is off', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset transfer switch light is on even if breaker is off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset transfer is not working', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset transfer is not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect acdc panel labels', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect acdc panel labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'small conductor under large conductor x3 behind acdc panel', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('small conductor under large conductor x3 behind acdc panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter Alarm Not Working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter Alarm Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'acdc panel closing screws are too short', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('acdc panel closing screws are too short'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing negative bus cover in saloon DB', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing negative bus cover in saloon DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon downlights not working', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon downlights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '4x missing saloon downlights', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('4x missing saloon downlights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'curtacy lights not working', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('curtacy lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'multiple loose ground wires in saloon floor', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('multiple loose ground wires in saloon floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'morse control ground wire not connected', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('morse control ground wire not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx blue cover missing', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx blue cover missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shunt blue cover missing', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('shunt blue cover missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'mast wiring is incomplete', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('mast wiring is incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing mounting screws for main breakers in floor', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing mounting screws for main breakers in floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing labels for main breakers in floor', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing labels for main breakers in floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'house batteries not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('house batteries not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galley fridge not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('galley fridge not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galley fridge compressor not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('galley fridge compressor not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'reefing warning sign not fitted in galley', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('reefing warning sign not fitted in galley'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HOB S/S not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('HOB S/S not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'hand held VHF missing at nav desk', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('hand held VHF missing at nav desk'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no Co-X plugs fitted for VHF antenna', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no Co-X plugs fitted for VHF antenna'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD needs to be programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD needs to be programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC Multimeter needs to be programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC Multimeter needs to be programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No key tallies for saloon door fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No key tallies for saloon door fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'backbone not terminated', null, 'Saloon'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('backbone not terminated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak On Water Heater', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak On Water Heater'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'isolator switch not mounted', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('isolator switch not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'manual fire suppression wire loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('manual fire suppression wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater not draining', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater not draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing bilge labels', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing bilge labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater leaking', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ducting is badly installed in ceiling', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ducting is badly installed in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'not enough light in stbd mid cabin', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('not enough light in stbd mid cabin'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bottom bunk fan mounted to wall not ceiling', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bottom bunk fan mounted to wall not ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no usb for reading light', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no usb for reading light'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water tank is dirty', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water tank is dirty'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads extractor fan not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads extractor fan not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads rope light not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads rope light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'DB missing rail stopper', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('DB missing rail stopper'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inboard inspection has a pipe that is not draining properly', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inboard inspection has a pipe that is not draining properly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste Tank Indicator Not Working', 'ELEC', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste Tank Indicator Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon plug not properly connected', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon plug not properly connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower cold water not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower cold water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fresh water bleed label not fitted', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fresh water bleed label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer dummy plug not on boat', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer dummy plug not on boat'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Anti-Syphen Leaking', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Anti-Syphen Leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker was cross wired and is now broken', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('watermaker was cross wired and is now broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads light not working', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker raw water filter not fitted', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('watermaker raw water filter not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incorrect Wiring On Finder Relay For Genset', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Incorrect Wiring On Finder Relay For Genset'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no diode for finder relay', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no diode for finder relay'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wire hanging in inboard inspection', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wire hanging in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bosch relay is not mounted', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bosch relay is not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Salt/Fresh Is Cross Wired', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Salt/Fresh Is Cross Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset battery is not booted', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('genset battery is not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset manufold is at bad location (unable to access)', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('genset manufold is at bad location (unable to access)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Debree In Water Tank', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Debree In Water Tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin lights not working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no torque marks on engine isolator', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no torque marks on engine isolator'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'reading lights not working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater not draining', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater not draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing finder diodes', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing finder diodes'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Salt/Fresh Label At Toilet', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Salt/Fresh Label At Toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pump leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly fitted water heater overflow', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('badly fitted water heater overflow'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Base Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Base Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste Tank Indicator Not Working', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste Tank Indicator Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing blank covers for shore power breaker box', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing blank covers for shore power breaker box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter Fans Not Working', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Inverter Fans Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fresh water bleed leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fresh water bleed leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing aircon bleed label', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing aircon bleed label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon filter leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon filter leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pump leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'emergency tiller port side does not engage', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('emergency tiller port side does not engage'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'emergency tiller stbd side gets stuck', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('emergency tiller stbd side gets stuck'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'downlights not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('downlights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'curtacy lights not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('curtacy lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david sensor not connected', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david sensor not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly installed swim ladder clip', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('badly installed swim ladder clip'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gas strut of grill is hitting grill', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('gas strut of grill is hitting grill'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing warning label at shore power', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('missing warning label at shore power'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'davit motor not booted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('davit motor not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'davit contactor not booted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('davit contactor not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Davit contactor loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Davit contactor loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor heat shrink on deck winch terminals', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('poor heat shrink on deck winch terminals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing boots on deck winches', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('missing boots on deck winches'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing jammer labels', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('missing jammer labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel transfer is not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fuel transfer is not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no stbd fuel tank reading', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('no stbd fuel tank reading'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic wire is not pulled through', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('raymic wire is not pulled through'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Battery Link Not Working', 'ELEC', 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Battery Link Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'transom teak steps needs to be fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('transom teak steps needs to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'liferaft locker backrest supports needs to be fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('liferaft locker backrest supports needs to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Coolant pipe for water heater damaged', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Coolant pipe for water heater damaged'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset fuel assist leaking', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('genset fuel assist leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Morse Control Splitpins Not Properly Bent Open', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Morse Control Splitpins Not Properly Bent Open'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel prefilter', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel prefilter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing sterling screw', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('missing sterling screw'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused shore power lead', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('unused shore power lead'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose bat neg terminal', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose bat neg terminal'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery boots', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery boots'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no heat shrink on gnd wire', null, 'Port Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no heat shrink on gnd wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'rudder gnd wire has no heat shrink', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('rudder gnd wire has no heat shrink'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad heat shrink on gnd wire at inboard bus', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('bad heat shrink on gnd wire at inboard bus'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine harness is suspect (engine dies if tampered with)', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine harness is suspect (engine dies if tampered with)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Morse Control Splitpins Not Properly Bent Open', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Morse Control Splitpins Not Properly Bent Open'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel prefilter', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel prefilter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing blanks in shore power breaker box', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('missing blanks in shore power breaker box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose sterling cover', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose sterling cover'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad crimps and not heat shrink on galvanic isolator', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('bad crimps and not heat shrink on galvanic isolator'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'exposed wire on exhaust pipe at engine', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('exposed wire on exhaust pipe at engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery boots', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery boots'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AR200 cover broken', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('AR200 cover broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'spray dodger is bad design', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('spray dodger is bad design'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'rope painter and blocks not fitted to secure mast', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('rope painter and blocks not fitted to secure mast'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'coach roof fusion remote not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('coach roof fusion remote not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'furler block is mounted too low and line will chafe', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('furler block is mounted too low and line will chafe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stbd ceiling panel will chafe against furler rope', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('stbd ceiling panel will chafe against furler rope'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bottle screws are hitting guard rails', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('bottle screws are hitting guard rails'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing boots on windlass motor and control box', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing boots on windlass motor and control box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing windlass junction box', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing windlass junction box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wires routed on chain side of bulk head', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('wires routed on chain side of bulk head'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gas locker does not stay open', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('gas locker does not stay open'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing gas locker labels', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1012'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing gas locker labels'))
  );

insert into public.boats (name)
values ('C1016')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset isolator switch not mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset isolator switch not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'grounding plate in port passgar bilge inboard is not connected to ground', null, 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('grounding plate in port passgar bilge inboard is not connected to ground'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2x amplifiers not fitted', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('2x amplifiers not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon fridge door is falling out', null, 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon fridge door is falling out'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon clear plastic DB cover not mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon clear plastic DB cover not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'table top not installed', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('table top not installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fire blanket not fitted (SF)', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('fire blanket not fitted (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'House batteries not booted', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('House batteries not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD not showing volts and amps of house battery', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD not showing volts and amps of house battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD showing stbd engine bilge is constantly running', null, 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD showing stbd engine bilge is constantly running'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Main DB not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Main DB not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'CO2 sensor not mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('CO2 sensor not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot cross wired', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('autopilot cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galley fridge compressor loosely mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('galley fridge compressor loosely mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon tap weight mounted on wrong side of hose', 'PLUM', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon tap weight mounted on wrong side of hose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'telly mute not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('telly mute not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'NMMA label needs to be mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('NMMA label needs to be mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter Alarm Not Working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter Alarm Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon switching on wrong pump', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('aircon switching on wrong pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'VHF wire not pulled through', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('VHF wire not pulled through'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplet wiring behind ACDC panel', null, 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incomplet wiring behind ACDC panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplete wiring at main saloon DB', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incomplete wiring at main saloon DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lights wiring is incomplete', null, 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lights wiring is incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon door needs to be set', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon door needs to be set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not draining', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin, heads and reading lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin, heads and reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin fan not working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin fan not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank indicator light not fitted', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank indicator light not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak below toilet', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak below toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing salt/fresh label at toilet', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing salt/fresh label at toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'low level bilge float not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('low level bilge float not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin, heads and reading lights not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin, heads and reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin fan not working', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin fan not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gas pipes not connected (gas installation incomplete)', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('gas pipes not connected (gas installation incomplete)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower leaking into bilge', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower leaking into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bidet leaking at wall outlet', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bidet leaking at wall outlet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing salt/fresh label at toilet', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing salt/fresh label at toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank indicator light not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank indicator light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing salt/fresh label for toilet', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing salt/fresh label for toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh is cross wired', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh is cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing c clips on shower rose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing c clips on shower rose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no 5 amp fuse installed for cabin fan', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no 5 amp fuse installed for cabin fan'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower cold water leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower cold water leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deckwash pump running inconsistently', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('deckwash pump running inconsistently'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower head leaking', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower head leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet flush defective', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet flush defective'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'clean generator raw water filter', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('clean generator raw water filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin heads and reading lights not working', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin heads and reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin fan not working', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin fan not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter not powering up', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Inverter not powering up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incomplete wiring on DB', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Incomplete wiring on DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incorrect wiring on finder relay for genset', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Incorrect wiring on finder relay for genset'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon Pump Not Wired', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon Pump Not Wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin door missing a magnet stopper', 'CARP', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin door missing a magnet stopper'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker control box not mounted', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('watermaker control box not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lifting platform DB has a broken grommet at the bottom', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('lifting platform DB has a broken grommet at the bottom'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Cabin Lights Not Working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Cabin Lights Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin, heads and reading lights not working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin, heads and reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin fan not working', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin fan not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on water heater hot water', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on water heater hot water'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'radar wire not connected on yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('radar wire not connected on yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused cradles at fuel tank', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unused cradles at fuel tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'debree in water tank', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('debree in water tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower mixer cross plumbed', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower mixer cross plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on toilet solenoid', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on toilet solenoid'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unwanted screw in basin drain', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unwanted screw in basin drain'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'multiple missing fusion remote network cables at DB', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('multiple missing fusion remote network cables at DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet flush is cross wired', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet flush is cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'multiple aircon pump pipes leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('multiple aircon pump pipes leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing fuse in HVL under MPPT', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing fuse in HVL under MPPT'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter fans not working', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inverter fans not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank monitor light not working', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank monitor light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter touch light not working', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inverter touch light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing bus bar covers and labels', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing bus bar covers and labels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon connection box not labeled', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon connection box not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon box incorrectly wired', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon box incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing timmer module for aircon relays', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing timmer module for aircon relays'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak On Basin Plumbing', 'PLUM', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak On Basin Plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on waste water tank', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on waste water tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HIN number sticker not fitted', 'FA', 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('HIN number sticker not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stbd sugar scoop bottom curtacy light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('stbd sugar scoop bottom curtacy light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shore power label not fitted', 'FA', 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Shore power label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'R&C decal label / dome tag', 'FA', 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('R&C decal label / dome tag'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'jammer labels not fitted', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('jammer labels not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose grommet for port lifting platform up sensor', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('loose grommet for port lifting platform up sensor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lifting platform stbd sensor is damaged', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('lifting platform stbd sensor is damaged'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic fitting upside down', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('raymic fitting upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'underwater lights not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('underwater lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery cover not fitted', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery label not fitted', null, 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'junction box labels missing', null, 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('junction box labels missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose clamps on engine fuel prefilter and filter', null, 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose clamps on engine fuel prefilter and filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fluids low', null, 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fluids low'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel lines', null, 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on engine raw water filter', null, 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on engine raw water filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wire on starter solenoid', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose wire on starter solenoid'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galvanic isolator wires loose', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('galvanic isolator wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering bar laying on raw fibre glass', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('steering bar laying on raw fibre glass'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Alternator negative wire not connected', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Alternator negative wire not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'morse control cables are badly routed', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('morse control cables are badly routed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power breakers not labeled and no rail stopper', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power breakers not labeled and no rail stopper'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery cover not fitted and no battery label', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('battery cover not fitted and no battery label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power cable female fittings not properly grommeted', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power cable female fittings not properly grommeted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'junction box labels missing', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('junction box labels missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose clamps on engine fuel prefilter and filter', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose clamps on engine fuel prefilter and filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Alternator negative wire not connected', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Alternator negative wire not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel lines', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'morse control cables are badly routed', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('morse control cables are badly routed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine oil and coolant very low', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine oil and coolant very low'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ECU breaker box is loosely mounted', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('ECU breaker box is loosely mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'coolant pipes for water heater is single clamped', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('coolant pipes for water heater is single clamped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine harness not strapped up', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine harness not strapped up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose cradle for fuel piping', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose cradle for fuel piping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor heat shrinks on battery terminals', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('poor heat shrinks on battery terminals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing cover for ground bus inboard of engine', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('missing cover for ground bus inboard of engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing labels and loose covers on multiple electrical boxes and junction boxes', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('missing labels and loose covers on multiple electrical boxes and junction boxes'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose L-Bracket On Starter Motor', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose L-Bracket On Starter Motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Engine revs do not align', 'MECH', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Engine revs do not align'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No teak steps to coach roof fitted', 'CARP', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('No teak steps to coach roof fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'jammer labels not fitted', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('jammer labels not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'pulleys not fitted (SF)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('pulleys not fitted (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'pulleys and rope painter needs to be installed', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('pulleys and rope painter needs to be installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'speakers not working', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('speakers not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'boom labels needs to be fitted', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('boom labels needs to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit speakers not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit speakers not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'oven gas shutoff label not fitted', 'PLUM', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('oven gas shutoff label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Windlass not operational', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Windlass not operational'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD needs to be updated', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('MFD needs to be updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires under windlass motor', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('loose wires under windlass motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset breaker not labeled', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset breaker not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gas solenoid not wired', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('gas solenoid not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon display covers (SF)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('aircon display covers (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'all fire extinguishers to be installed (SF)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('all fire extinguishers to be installed (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset label damaged', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1016'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset label damaged'))
  );

insert into public.boats (name)
values ('C1010')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Feedback On Autopilot Breaker On Acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Feedback On Autopilot Breaker On Acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'VHF antenna not connected (CO-X plugs on SF)', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('VHF antenna not connected (CO-X plugs on SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2x amplifiers on SF', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('2x amplifiers on SF'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'LPG monitor mounted skew', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('LPG monitor mounted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon clear plastic DB cover not mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon clear plastic DB cover not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'table top not installed', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('table top not installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fire blanket not fitted (SF)', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('fire blanket not fitted (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'House batteries not booted', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('House batteries not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Lynxx 2 & shunt cover not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Lynxx 2 & shunt cover not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm alarm buzzer not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('helm alarm buzzer not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Main DB not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Main DB not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water pressure pump light on ACDC is flashing', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('water pressure pump light on ACDC is flashing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon tap cross plumbed', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon tap cross plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galley fridge compressor loosely mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('galley fridge compressor loosely mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon tap weight mounted on wrong side of hose', 'PLUM', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon tap weight mounted on wrong side of hose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing reefing label at stbd fwd staircase', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing reefing label at stbd fwd staircase'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACDC panel labeling wrong', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ACDC panel labeling wrong'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Engine Return & Supply Pipe Calmp Loose', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Engine Return & Supply Pipe Calmp Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC multimeter not showing genset voltage and current', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC multimeter not showing genset voltage and current'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'NMMA label needs to be mounted', 'FA', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('NMMA label needs to be mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter Alarm Not Working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter Alarm Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACDC panel has no mounting skrews', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ACDC panel has no mounting skrews'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge alarm panel loose', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge alarm panel loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'brken black plastic wire cover behind ACDC panel', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('brken black plastic wire cover behind ACDC panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon switching on wrong pump', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('aircon switching on wrong pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stbd aircon switches on the wrong LED on the ACDC panel', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Stbd aircon switches on the wrong LED on the ACDC panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'telly mute not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('telly mute not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot cross wired', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('autopilot cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'delay on 220V cluster from genset switch', null, 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('delay on 220V cluster from genset switch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'CO2 sensor not mounted', 'CARP', 'Saloon'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('CO2 sensor not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin fan cross wired', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin fan cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not draining', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater pipes kinked', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater pipes kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on water heater hot water', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on water heater hot water'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'coolant leak on water heater', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('coolant leak on water heater'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fuel Tank Brace Loose', 'MECH', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Fuel Tank Brace Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing salt/fresh label at toilet', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing salt/fresh label at toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'sniffer wiring not strapped', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('sniffer wiring not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon ball valve not labeled', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon ball valve not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer not labeled', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing aircon pump label', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing aircon pump label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower leaking into bilge', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower leaking into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower gulley constantly running', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower gulley constantly running'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing salt/fresh label at toilet', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing salt/fresh label at toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank indicator light not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank indicator light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower head leaking', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower head leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet flush defective', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet flush defective'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'clean generator raw water filter', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('clean generator raw water filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon display upside down', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon display upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Cabin Lights Not Working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Cabin Lights Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fuel Tank Brace Loose', 'MECH', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Fuel Tank Brace Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater not draining into bilge', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater not draining into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'manual fire suppression wire loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('manual fire suppression wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not draining', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused cradles at fuel tank', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unused cradles at fuel tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'debree in water tank', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('debree in water tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower mixer cross plumbed', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower mixer cross plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on toilet solenoid', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on toilet solenoid'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing c-clips on fresh water bleed', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing c-clips on fresh water bleed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump outlet piping loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump outlet piping loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing aircon pump label', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing aircon pump label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank monitor light not working', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank monitor light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak at aircon bleed valve', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak at aircon bleed valve'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no aircon bleed labels x3', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no aircon bleed labels x3'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon connection box not labeled', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon connection box not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon box incorrectly wired', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon box incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires in bilge outboard', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires in bilge outboard'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet pump label badly fitted', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet pump label badly fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on waste water tank', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on waste water tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'David Skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('David Skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HIN number sticker not fitted', 'FA', 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('HIN number sticker not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Strip lights on SF', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Strip lights on SF'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shore power label not fitted', 'FA', 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Shore power label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'R&C decal label / dome tag', 'FA', 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('R&C decal label / dome tag'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'jammer labels not fitted', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('jammer labels not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david solenoid loosely mounted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david solenoid loosely mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bad crimps on strip lights bus bar connections', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('bad crimps on strip lights bus bar connections'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic fitting upside down', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('raymic fitting upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'horn button not mounted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('horn button not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot cover not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('autopilot cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'liferaft locker seat backrest SF', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('liferaft locker seat backrest SF'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery cover not fitted', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery label not fitted', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '4x junction box labels missing', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('4x junction box labels missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose clamps on engine fuel prefilter and filter', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose clamps on engine fuel prefilter and filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fluids low', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fluids low'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel lines', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on engine raw water filter', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on engine raw water filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose L-Bracket On Starter Motor', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose L-Bracket On Starter Motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galvanic isolator wires loose', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('galvanic isolator wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering bar laying on raw fibre glass', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('steering bar laying on raw fibre glass'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AUX stop alarm constantly on', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('AUX stop alarm constantly on'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Engine Blower Not Working', null, 'Port Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Engine Blower Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery cover not fitted', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('battery cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery label not fitted', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('battery label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '4x junction box labels missing', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('4x junction box labels missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose clamps on engine fuel prefilter and filter', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose clamps on engine fuel prefilter and filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Alternator negative wire broken', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Alternator negative wire broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on fuel lines', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on fuel lines'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ecu Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Ecu Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'altrnator fuse cover loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('altrnator fuse cover loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine oil very low', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine oil very low'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'atlernator temp sensor wire not strapped at sterling', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('atlernator temp sensor wire not strapped at sterling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'coolant pipes for water heater is single clamped', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('coolant pipes for water heater is single clamped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine harness not strapped up', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine harness not strapped up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose cradle for fuel piping', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose cradle for fuel piping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on engine raw water filter', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on engine raw water filter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly placed clamp on salt waetr pipe connecting to engine coolant compartment', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('badly placed clamp on salt waetr pipe connecting to engine coolant compartment'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose GND wire on engine connectipon', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose GND wire on engine connectipon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose L-Bracket On Starter Motor', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose L-Bracket On Starter Motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windvane to be installed', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windvane to be installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge run light at helm not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('bilge run light at helm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '12v outlet at helm not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('12v outlet at helm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'second mast stantions to be fitted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('second mast stantions to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'pulleys and rope painter needs to be installed', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('pulleys and rope painter needs to be installed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'speakers not working', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('speakers not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'boom labels needs to be fitted', 'DECK', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('boom labels needs to be fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit speakers not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit speakers not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'oven gas shutoff label not fitted', 'PLUM', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('oven gas shutoff label not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit door middle handle loose', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit door middle handle loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD needs to be updated', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('MFD needs to be updated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon display covers (SF)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('aircon display covers (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'all fire extinguishers to be installed (SF)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('all fire extinguishers to be installed (SF)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer gel and wire (SF)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1010'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('depth transducer gel and wire (SF)'))
  );

insert into public.boats (name)
values ('C1009')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david breaker is a different size to the other breakers', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('david breaker is a different size to the other breakers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset volts and hertz not set', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset volts and hertz not set'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge alarm panel not mounted on ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge alarm panel not mounted on ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'outlet at TV not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('outlet at TV not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing boots on deck winch motors', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing boots on deck winch motors'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'curtacy light wiring wrong', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('curtacy light wiring wrong'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'under basin locker has no catch fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('under basin locker has no catch fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'nav desk front loosely mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('nav desk front loosely mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'breakers not labeled at house batteries', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('breakers not labeled at house batteries'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'house battery brace loose', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('house battery brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect jump in main DB at AC wiring', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect jump in main DB at AC wiring'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing cover on main negative DC terminal on main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing cover on main negative DC terminal on main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'main DB not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('main DB not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'main DB has no cover fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('main DB has no cover fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx 2 has no floorboard inspection', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx 2 has no floorboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon table not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon table not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon door not properly closing', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon door not properly closing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon door not properly locking', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon door not properly locking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACDC panel labels incomplete', null, 'Saloon'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ACDC panel labels incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'strip light not connected', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('strip light not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel tank level sensor wire not cradled', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel tank level sensor wire not cradled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on water heater', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on water heater'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel bleed leaking', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel bleed leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel tank level low', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel tank level low'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing screw on fire boy', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing screw on fire boy'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires inboard in inspection', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires inboard in inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose morse control cables in inboard inspection', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose morse control cables in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not draining properly', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not draining properly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no catch for cabin door', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no catch for cabin door'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no brackets for bottom cupboards', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no brackets for bottom cupboards'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon fridge compressor wires not strapped', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('saloon fridge compressor wires not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon fridge drain not connected', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('saloon fridge drain not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david breaker wires loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('david breaker wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing rail stoppers on inboard DB', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing rail stoppers on inboard DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Anti-Syphen Leaking', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Anti-Syphen Leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh swopped', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh swopped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet water supply pipe standing proud', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet water supply pipe standing proud'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank bottom pipe damaged', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank bottom pipe damaged'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank inspection panel not chamfered', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank inspection panel not chamfered'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower mixer cross plumbed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower mixer cross plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'vanity mirror SF', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('vanity mirror SF'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank monitor wires not strapped', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank monitor wires not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused cradle above waste tank', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unused cradle above waste tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2x missing stoppers on bleed valves in bilge', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('2x missing stoppers on bleed valves in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump outlet pipe not connected', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump outlet pipe not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer wire badly layed', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer wire badly layed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fresh water leak at freash water pump', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fresh water leak at freash water pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads light switch loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads light switch loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh crossed', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh crossed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank indicator light wires not strapped', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank indicator light wires not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower leaking into bilge through inspection panel', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower leaking into bilge through inspection panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin mixer leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin mixer leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing rope light', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing rope light'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh cross wired', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'c-clips missing on fresh water bleed', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('c-clips missing on fresh water bleed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unstrapped wiring at yachtsense inspection', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unstrapped wiring at yachtsense inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'vanity mirror SF', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('vanity mirror SF'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused network cable in yachtsense inspection', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unused network cable in yachtsense inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'defective network cable for fusion fwd cockpit fusion remote', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('defective network cable for fusion fwd cockpit fusion remote'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset finder relay wired incorrectly', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('genset finder relay wired incorrectly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh cross wired', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Cross Plumbed', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Cross Plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump pipe clamps loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump pipe clamps loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'solar panels not giving a reading', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('solar panels not giving a reading'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower sump pump clamp loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower sump pump clamp loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing stopper on aircon bleed', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing stopper on aircon bleed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing shore power label', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('missing shore power label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing horn button and bilge alarm light at helm station', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('missing horn button and bilge alarm light at helm station'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'metal tops of deck winches at different angles', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('metal tops of deck winches at different angles'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic connection upside down', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('raymic connection upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david not catching', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david not catching'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david switch spelt wrong', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david switch spelt wrong'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on engine coolant connections', null, 'Port Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on engine coolant connections'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery top covers', null, 'Port Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery top covers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No Labels At Filters Outboard', null, 'Port Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('No Labels At Filters Outboard'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery label', null, 'Port Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Junction Box Not Labeled', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Junction Box Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower leaking', null, 'Port Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('stern shower leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'underwater light ground wire loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('underwater light ground wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'sterling wires loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('sterling wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused grommet on engine ecu breaker', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('unused grommet on engine ecu breaker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamps on engine coolant connections', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamps on engine coolant connections'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery top covers', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery top covers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No Labels At Filters Outboard', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('No Labels At Filters Outboard'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery label', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Junction Box Not Labeled', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Junction Box Not Labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HIN number printed under battery box', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('HIN number printed under battery box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine mounting paint exfoliating', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine mounting paint exfoliating'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose L-Bracket On Starter Motor', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose L-Bracket On Starter Motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect stbd fuel tank level reading', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('incorrect stbd fuel tank level reading'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing teflon spacer at fwd cockpit door catch', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing teflon spacer at fwd cockpit door catch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing oven shutoff label in gas locker', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing oven shutoff label in gas locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass slipping', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass slipping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing black plastic piece of windlass', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing black plastic piece of windlass'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fusion remote not picking up network', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fusion remote not picking up network'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no teflon anti-chafe for anchor chain', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('no teflon anti-chafe for anchor chain'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Check wrong floorboard layers as previous boat', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1009'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Check wrong floorboard layers as previous boat'))
  );

insert into public.boats (name)
values ('C1008')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset not charging boat', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset not charging boat'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge low level has an alarm (it should not)', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge low level has an alarm (it should not)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge indicator panel loose on acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge indicator panel loose on acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david breaker not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('david breaker not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter Not Programmed On Acdc', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter Not Programmed On Acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC meter incorrectly programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC meter incorrectly programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'DC meter indicator arrow cross wired', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('DC meter indicator arrow cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing back cover on ACDC panel', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing back cover on ACDC panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Filter Tap Loose', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Filter Tap Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HOB not igniting', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('HOB not igniting'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'downlights fitted skew', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('downlights fitted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx 2 covers not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx 2 covers not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx 2 inspection has no finger hole', null, 'Saloon'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx 2 inspection has no finger hole'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin light wires not pulled through', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin light wires not pulled through'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplete loose wires above steering pulley', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incomplete loose wires above steering pulley'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh switch not labeled', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh switch not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh water cross plumbed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh water cross plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet base loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet base loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank outlet pipe badly fitted and kinked', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank outlet pipe badly fitted and kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Cross Plumbed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Cross Plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower mixer loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin hot water leaking', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin hot water leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower Rose Leaking', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower Rose Leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower mixer backplate not properly sealed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower mixer backplate not properly sealed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon finder relay missing blue clip', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon finder relay missing blue clip'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fresh water bleed has a missing end cap', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fresh water bleed has a missing end cap'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump outlet clamps loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump outlet clamps loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon outlet piping badly layed', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon outlet piping badly layed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no salt/fresh label for toilet', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no salt/fresh label for toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet flush switch rubber is exposed and obstructing the switch', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet flush switch rubber is exposed and obstructing the switch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet anti syfen leaking', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet anti syfen leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'depth transducer fitted skew', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('depth transducer fitted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing terminator on yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing terminator on yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose pipe clamp on coolant pipe of water heater', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose pipe clamp on coolant pipe of water heater'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater hot water leaking', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater hot water leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tanl level sensor not working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tanl level sensor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Loose', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing salt/fresh water label for toilet', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing salt/fresh water label for toilet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin nozzel leaking inconsistant flow', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin nozzel leaking inconsistant flow'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel leak at genset manifold', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel leak at genset manifold'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset and water maker ballvalves not labeled', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('genset and water maker ballvalves not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump elbows loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump elbows loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump outlet leaking at T-piece', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump outlet leaking at T-piece'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter fans not working', 'ELEC', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inverter fans not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing positive bus cover in HV locker', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing positive bus cover in HV locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon finder relay blue bracket broken', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon finder relay blue bracket broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power gland loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('shore power gland loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Swim Ladder Bolts Loose', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Swim Ladder Bolts Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'swim ladder catch chaffing', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('swim ladder catch chaffing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david not catching', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david not catching'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge run light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('bilge run light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steaming light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('steaming light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('deck light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'boat number sticker not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('boat number sticker not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stern Shower Wire Pipe Kinked', null, 'Port Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Stern Shower Wire Pipe Kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'alternator temp sensor wire broken', null, 'Port Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('alternator temp sensor wire broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fuel Prefilter Pipe Clamps Loose', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Fuel Prefilter Pipe Clamps Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery top cover missing', null, 'Port Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery top cover missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery label missing', null, 'Port Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('battery label missing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'racor fuel filter not labeled', null, 'Port Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('racor fuel filter not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fluid levels low (coolant, saildrive oil, engine oil)', null, 'Port Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fluid levels low (coolant, saildrive oil, engine oil)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose battery terminal', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose battery terminal'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery top cover', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery top cover'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery label', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery label'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wrong cyrix screws', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('wrong cyrix screws'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fluid levels low (coolant, saildrive oil, engine oil)', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fluid levels low (coolant, saildrive oil, engine oil)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering stop rope shackles loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('steering stop rope shackles loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'rudder gnd wire heat shrink burnt', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('rudder gnd wire heat shrink burnt'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'alternator fuse cover not fitted', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('alternator fuse cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose L-Bracket On Starter Motor', 'MECH', 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose L-Bracket On Starter Motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'underwater light nuts loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('underwater light nuts loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel prefilter pipes need to be adjusted (badly directed)', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('fuel prefilter pipes need to be adjusted (badly directed)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck winches metal tops have different alignments', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('deck winches metal tops have different alignments'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'change yachtsense icon placement on mfd', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('change yachtsense icon placement on mfd'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'nav lights not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('nav lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset breaker not labeled', 'ELEC', 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset breaker not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'coolant present on and below genset', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('coolant present on and below genset'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose ancher Lewmar control box terminals', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('loose ancher Lewmar control box terminals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose anchor motor terminals', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('loose anchor motor terminals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass slipping', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass slipping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'anchor bridle shackels not cable tied', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('anchor bridle shackels not cable tied'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'anchor bridle hook splitpin not properly bent open', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('anchor bridle hook splitpin not properly bent open'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'anchor chain twisted (not catching on stopper)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('anchor chain twisted (not catching on stopper)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing teflon behind fwd cockpit door catch', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing teflon behind fwd cockpit door catch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gas solenoid grommet loose', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1008'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('gas solenoid grommet loose'))
  );

insert into public.boats (name)
values ('C1007')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'light wiring incorrect (all lights connected to cabin light breaker on acdc)', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('light wiring incorrect (all lights connected to cabin light breaker on acdc)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'deck winches terminals not booted', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('deck winches terminals not booted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'protruding worm skrews on down lights', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('protruding worm skrews on down lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'hob igniter is not working', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('hob igniter is not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'main db breakers not labeled', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('main db breakers not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb aft aircon negative wiring incomplete at main db', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('stb aft aircon negative wiring incomplete at main db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect ac wiring at main db', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrect ac wiring at main db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx 2 terminal wires loose', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx 2 terminal wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx 2 blue cover not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx 2 blue cover not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lynxx 2 inspection has no finger cutout', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('lynxx 2 inspection has no finger cutout'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplete loose wires at main db', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incomplete loose wires at main db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'house battery brace loose', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('house battery brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing blade fuses at inverter relays in acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing blade fuses at inverter relays in acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wire on battery protect unit in acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose wire on battery protect unit in acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge light unit loose at acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge light unit loose at acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'dc multimeter not working', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('dc multimeter not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ac multimeter not working', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ac multimeter not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose ac wiring at acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose ac wiring at acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'feedback on acdc panel leds', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('feedback on acdc panel leds'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fusion antenna not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('fusion antenna not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'vhf antenna wire to mast not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('vhf antenna wire to mast not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose ac outlet at tv bracket', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose ac outlet at tv bracket'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'carbon monoxide sensor not working', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('carbon monoxide sensor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb usb outlet not working', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('stb usb outlet not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on minibus in ceiling', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose wires on minibus in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no grey raymic box for vhf mast connection', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no grey raymic box for vhf mast connection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unterminated backbone in aft ceiling', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('unterminated backbone in aft ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ac cluster trips when all items are on on acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ac cluster trips when all items are on on acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Cabin Lights Not Working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Cabin Lights Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering pulley bolt not protuding', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('steering pulley bolt not protuding'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon wiring incomplete', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon wiring incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cut wirin in inboard inspection', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cut wirin in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aft light switch fitted upside down', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aft light switch fitted upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on water heater temp control', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on water heater temp control'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplete wiring of reading lights', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incomplete wiring of reading lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'reading lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak On Shower Plumbing', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak On Shower Plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Fresh Water Solenoid Not Working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Fresh Water Solenoid Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt water not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water leaking from toilet bowl', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water leaking from toilet bowl'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing blue sea cover in ceiling', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing blue sea cover in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on minibus in ceiling', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires on minibus in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'backbone not termineted in ceiling', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('backbone not termineted in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering sprocket grommets not tight', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('steering sprocket grommets not tight'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'carbon monoxide sensor not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('carbon monoxide sensor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'carbon monoxide sensor not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('carbon monoxide sensor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin light not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'reading lights not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires in inboard inspection', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires in bilge', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads light not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on inboard db', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires on inboard db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unterminated wires on db', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unterminated wires on db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on waste tank', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on waste tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt water not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Fresh Water Solenoid Not Working', 'ELEC', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Fresh Water Solenoid Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ac outlet not fitted', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ac outlet not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower rose and mixer loose', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower rose and mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'carbon monoxide sensor not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('carbon monoxide sensor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin light not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'reading lights not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('reading lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires in inboard inspection', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires in bilge', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads light not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on inboard db', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires on inboard db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unterminated wires on db', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unterminated wires on db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on waste tank', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on waste tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt water not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Fresh Water Solenoid Not Working', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Fresh Water Solenoid Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ac outlet not fitted', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ac outlet not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin Mixer Loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin Mixer Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower rose and mixer loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower rose and mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'timer for aircon pump relay not fitted', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('timer for aircon pump relay not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on toilet plumbing', 'PLUM', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on toilet plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak On Shower Plumbing', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak On Shower Plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste Tank Indicator Not Working', 'ELEC', 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste Tank Indicator Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplete wiring at yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incomplete wiring at yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot motor cross wired', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('autopilot motor cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unterminated cut wires at yachtsense', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('unterminated cut wires at yachtsense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cut in shore power cable in inboard inspection', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cut in shore power cable in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon Loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet fresh water not working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet fresh water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'port water pressure pump not working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('port water pressure pump not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Cabin Lights Not Working', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Cabin Lights Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon Loose', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing dimmer unit in db', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing dimmer unit in db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'dimmer unit wiring incomplete at db', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('dimmer unit wiring incomplete at db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'feedback on rope lights of cabin', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('feedback on rope lights of cabin'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect fuse used for water lift pump', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incorrect fuse used for water lift pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect jump used on finder relay', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incorrect jump used on finder relay'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no grey rail stoppers at finder relay', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no grey rail stoppers at finder relay'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires at db', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires at db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak On Toilet Plumbing', 'PLUM', 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak On Toilet Plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak From Shower Into Bilge', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak From Shower Into Bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'hvl extractor fans not fitted', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('hvl extractor fans not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on waste tank', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on waste tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'morse control nuts loose inside throttle unit', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('morse control nuts loose inside throttle unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'seal morse control throttle unit', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('seal morse control throttle unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb fuel tank not showing on mfd', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('stb fuel tank not showing on mfd'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt water tank not showing on mfd', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('prt water tank not showing on mfd'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'port engine bat not showing on mfd', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('port engine bat not showing on mfd'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset bat not showing on mfd', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('genset bat not showing on mfd'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering not locking', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('steering not locking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering stiff', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('steering stiff'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic connection fitted skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('raymic connection fitted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel transfer not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fuel transfer not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Battery Link Not Working', 'ELEC', 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Battery Link Not Working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fusion remote at helm not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fusion remote at helm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('stern light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david contactor mounting skrew loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david contactor mounting skrew loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect wire types at david bus', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('incorrect wire types at david bus'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david switch label spelled wrong', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david switch label spelled wrong'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wiring unstrapped prt fwd ceiling', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('wiring unstrapped prt fwd ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'protruding worm skrew on down lights', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('protruding worm skrew on down lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wiring at ceiling bus wrong type of wires', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('wiring at ceiling bus wrong type of wires'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'speakers not working', 'ELEC', 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('speakers not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ar200 not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('ar200 not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'blower not working', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('blower not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'underwater light gnd wire loose', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('underwater light gnd wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering cable chaffing', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('steering cable chaffing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cyrix not working', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('cyrix not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on stern shower', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('leak on stern shower'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore power earth leakage not labeled', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('shore power earth leakage not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galvanic isolator wires loose', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('galvanic isolator wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'too many gnd wires on engine', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('too many gnd wires on engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'sterling settings incorrect', null, 'Port Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('sterling settings incorrect'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'sterling setting incorrect', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('sterling setting incorrect'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'starter bracket loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('starter bracket loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inboard draining pipe loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('inboard draining pipe loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'badly routed grounding wires', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('badly routed grounding wires'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gaurd rail knoking on shrouds (designer issue)', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('gaurd rail knoking on shrouds (designer issue)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fusion remote in fwd cockpit not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fusion remote in fwd cockpit not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no boots on windlass control box terminals', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('no boots on windlass control box terminals'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no boots on windlass motor', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('no boots on windlass motor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset blower bolts badly fitted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset blower bolts badly fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset oil drain valve leaking', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset oil drain valve leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on jabsco pump on genset', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('leak on jabsco pump on genset'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'rust on genset', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('rust on genset'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'debree under genset', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('debree under genset'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset earth leakage breaker cross wired', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset earth leakage breaker cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing teflon spacer under camera', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing teflon spacer under camera'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing teflon spacer at fwd cockpit door latch', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('missing teflon spacer at fwd cockpit door latch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit speakers not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit speakers not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit lights not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1007'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit lights not working'))
  );

insert into public.boats (name)
values ('C1006')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AR200 top plastic cover broken', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AR200 top plastic cover broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'TV mounting bracket loose', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('TV mounting bracket loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'feedback on fan breaker at ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('feedback on fan breaker at ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'feedback on saloon breaker', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('feedback on saloon breaker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon lights on when breaker is off', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon lights on when breaker is off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose AC wiring behind ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose AC wiring behind ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter alarm not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter alarm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires at battery protect unit', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose wires at battery protect unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimps at battery protect unit', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('poor crimps at battery protect unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon and aft cockpit light switches cross wired', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon and aft cockpit light switches cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose Wires Behind Acdc', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose Wires Behind Acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose AC wiring behind ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose AC wiring behind ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose gnd bus connections on ac wiring of acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose gnd bus connections on ac wiring of acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no power to inverter cluster at acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no power to inverter cluster at acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wires not terminated on acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('wires not terminated on acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose screws laying in acdc connectors', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose screws laying in acdc connectors'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing covers on gnd busses in main DB in saloon', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing covers on gnd busses in main DB in saloon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'main DB breakers not labeled', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('main DB breakers not labeled'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unterminated spare wires in main saloon DB', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('unterminated spare wires in main saloon DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Sterlings wired incorrectly ( charging house battery and not Engine )', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Sterlings wired incorrectly ( charging house battery and not Engine )'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ac meter wired incorrectly (switching on with panel lights Breaker)', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('ac meter wired incorrectly (switching on with panel lights Breaker)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no rail stopper on main DB in saloon', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no rail stopper on main DB in saloon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter not programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter not programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'port engine battery not showing on yacht sense', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('port engine battery not showing on yacht sense'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'feedback on dc breakers on ac dc', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('feedback on dc breakers on ac dc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '2nd and 3rd ac clusters not working on acdc', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('2nd and 3rd ac clusters not working on acdc'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset water assist switching on at preheat', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('genset water assist switching on at preheat'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'first ac cluster on acdc switches off when all aircons are switched on', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('first ac cluster on acdc switches off when all aircons are switched on'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose screw on 2nd lynxx blue cover', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose screw on 2nd lynxx blue cover'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing bridges on main saloon DB', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing bridges on main saloon DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'damaged red bridges in main DB in saloon', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('damaged red bridges in main DB in saloon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'damaged manual bilge relay in main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('damaged manual bilge relay in main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon tap red/blue hot cold indicator installed skew', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon tap red/blue hot cold indicator installed skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unterminated wire at main db in saloon', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('unterminated wire at main db in saloon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon tap weight installed wrong', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('saloon tap weight installed wrong'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galley fridge compressor mounted loosely', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('galley fridge compressor mounted loosely'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wire at saloon main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose wire at saloon main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing clamp on saloon main fridge drain pipe', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing clamp on saloon main fridge drain pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'vhf ant wire not pulled through', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('vhf ant wire not pulled through'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit strip lights working inconsistently', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit strip lights working inconsistently'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit strip light not working', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit strip light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'house bat isolator wires loose', null, 'Saloon'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('house bat isolator wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin fan operating when breaker is off', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin fan operating when breaker is off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering pulley damaged', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('steering pulley damaged'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin towel hanger loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin towel hanger loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'not enough thread protruding on steering pulley', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('not enough thread protruding on steering pulley'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'manual fire suppression wire loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('manual fire suppression wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads door chaffing', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads door chaffing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet Seat Loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet Seat Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads bin locker loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads bin locker loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimps on wiring on stb aft inboard inspection', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('poor crimps on wiring on stb aft inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb aft shower leak into bilge', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb aft shower leak into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb aft toilet salt/fresh crossed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb aft toilet salt/fresh crossed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine isolator wires loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('engine isolator wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cut loom in stb mid cabin inboard inspection', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cut loom in stb mid cabin inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ts4-17 & ts4-18 connections on stb mid inboard db has cut wires', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ts4-17 & ts4-18 connections on stb mid inboard db has cut wires'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid heads extractor fan ducting not fitted', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid heads extractor fan ducting not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid cabin carbon monoxide sensor loose', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid cabin carbon monoxide sensor loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid toilet loose', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid toilet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid toilet seat loose', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid toilet seat loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid basin mixer hot water leaking', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid basin mixer hot water leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid db has no stoppers on rails', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid db has no stoppers on rails'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid shower rose leaking', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid shower rose leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb water tank brace loose', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb water tank brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid waste tank indicator not wired', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid waste tank indicator not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb fwd cabin towel hanger loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb fwd cabin towel hanger loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb fwd heads basin mixer loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb fwd heads basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb fwd gas sniffer screw loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb fwd gas sniffer screw loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ac outlet wiring not strapped at bunk head panel stb fwd', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ac outlet wiring not strapped at bunk head panel stb fwd'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not working stb fwd', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not working stb fwd'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb fwd aircon giving fault', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb fwd aircon giving fault'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect wiring for aircon unit at connector box', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incorrect wiring for aircon unit at connector box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing timer relay in stb fwd aircon box', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing timer relay in stb fwd aircon box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on toilet salt water plumbing', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on toilet salt water plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on toilet salt water pump', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on toilet salt water pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak from shower sump into bilge', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak from shower sump into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank level monitor not mounted', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank level monitor not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh cross wired', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aircon wiring incomplete', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aircon wiring incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aircon timer at relay not fitted', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aircon timer at relay not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on aircon blead valve prt side', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on aircon blead valve prt side'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aft heads anti syphon leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aft heads anti syphon leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt fwd heads anti syphon leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt fwd heads anti syphon leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak in top of prt waste tank', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak in top of prt waste tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank monitoring light not working prt', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank monitoring light not working prt'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on water heater hot water outlet in prt aft cabin', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on water heater hot water outlet in prt aft cabin'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'kink in prt fuel tank sensor wire', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('kink in prt fuel tank sensor wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt engine isolator terminals loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt engine isolator terminals loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aft inboard reading light loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aft inboard reading light loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on prt aircon pump', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on prt aircon pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aft heads basin loose', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aft heads basin loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aft basin cross plumbed', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aft basin cross plumbed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on prt aft shower mixer', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on prt aft shower mixer'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aft shower mixer mounted loosely', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aft shower mixer mounted loosely'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt aft toilet salt/fresh cross wired', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt aft toilet salt/fresh cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'saloon aircon not draining', null, 'Port Aft Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('saloon aircon not draining'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel leak on genset manifold', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel leak on genset manifold'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt fwd inboard db spare wires not terminated', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt fwd inboard db spare wires not terminated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset ac wiring incomplete prt fwd inboard db', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('genset ac wiring incomplete prt fwd inboard db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt fwd heads basin mixer loose', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt fwd heads basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bus bar connected incorrectly', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bus bar connected incorrectly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bridge wrong way on prt fwd inboard db', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('bridge wrong way on prt fwd inboard db'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt fwd toilet salt fresh cross wired', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('prt fwd toilet salt fresh cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrect wire used on genset fuel lift relay', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('incorrect wire used on genset fuel lift relay'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water maker getting constant power', null, 'Port Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water maker getting constant power'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'helm seat backing loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('helm seat backing loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering stiff', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('steering stiff'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fusion remote at helm not connected', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fusion remote at helm not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'raymic fitting skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('raymic fitting skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wrong david switch', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('wrong david switch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'swim ladder bolts loose', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('swim ladder bolts loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower tap mounted skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('stern shower tap mounted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel lines badly layed prt engine', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('fuel lines badly layed prt engine'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'alternator wiring not strapped', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('alternator wiring not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on galvanic isolator', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose wires on galvanic isolator'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cyrix not getting power', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('cyrix not getting power'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no cover for engine battery', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no cover for engine battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no strap for engine battery', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('no strap for engine battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'too many gnd wires on engine connection', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('too many gnd wires on engine connection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'single clamp on engine impeller connector', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('single clamp on engine impeller connector'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine harness wires not strapped', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine harness wires not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose single wire of engine harness', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose single wire of engine harness'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'unused bung in port engine room', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('unused bung in port engine room'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose nut on ref throttle', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('loose nut on ref throttle'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stern shower leaking', null, 'Port Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('stern shower leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no cover on engine fuse stb', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no cover on engine fuse stb'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor heat shrink on sterling wiring', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('poor heat shrink on sterling wiring'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery cover', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery cover'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no battery strap', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('no battery strap'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cyrix mounting skrew loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('cyrix mounting skrew loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'underwater light light nuts loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('underwater light light nuts loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'guard rails loose', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('guard rails loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'side deck teak step metal supports loosely mounted', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('side deck teak step metal supports loosely mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Electrical Anthena not fitted SF', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1006'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Electrical Anthena not fitted SF'))
  );

insert into public.boats (name)
values ('C1005')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter not switching off at display', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter not switching off at display'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter switch not working', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter switch not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter not programmed on ACDC', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter not programmed on ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter alarm not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter alarm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inverter alarm relays not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('inverter alarm relays not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker not wired', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('watermaker not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'touchlight in high voltage locker not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('touchlight in high voltage locker not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires behind ACDC', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose wires behind ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge override lights not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge override lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'prt high water not working', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('prt high water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not wired', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'GND wires behind ACDC are cut', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('GND wires behind ACDC are cut'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Low water pressure at basin', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Low water pressure at basin'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'induction HOB incorrectly labeled and label is damaged on ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('induction HOB incorrectly labeled and label is damaged on ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no power to genset starter panel on ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('no power to genset starter panel on ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HOB knobs not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('HOB knobs not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing terminator on backbone at MFD', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing terminator on backbone at MFD'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing cover on blue sea negative bus', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('missing cover on blue sea negative bus'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on floor DB', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose wires on floor DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose live wires on main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose live wires on main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on negative bus in DB', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose wires on negative bus in DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimps on wires in main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('poor crimps on wires in main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'damaged bridge on main DB', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('damaged bridge on main DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose battery distributer unit', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('loose battery distributer unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'different battery terminals used', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('different battery terminals used'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'filter tap fitted wrong (too tight)', 'PLUM', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('filter tap fitted wrong (too tight)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'galley fridge not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('galley fridge not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon & Aft cockpit lights crossed', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon & Aft cockpit lights crossed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Saloon, aft cockpit & flybridge curtacy lights crossed', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Saloon, aft cockpit & flybridge curtacy lights crossed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Main LPG control incorrectly wired', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Main LPG control incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'feedback on autopilot breaker on ACDC', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('feedback on autopilot breaker on ACDC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'bilge pumps not working all over', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('bilge pumps not working all over'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incorrectly wired bilge alarms', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('incorrectly wired bilge alarms'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HOB fitted skew', null, 'Saloon'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('HOB fitted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not wired', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh water crossed', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh water crossed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet fresh water solenoid not working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet fresh water solenoid not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet hardup against wall', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet hardup against wall'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor heat shrink on stb engine isolator switch', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('poor heat shrink on stb engine isolator switch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose manual fire suppression wire', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose manual fire suppression wire'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on stb water pressure pump plumbing', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on stb water pressure pump plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fridge compressor not mounted', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fridge compressor not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb high water float alarm not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb high water float alarm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel tank brace loose', 'MECH', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel tank brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water tank brace loose', 'MECH', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water tank brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads extractor fan not fitted', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads extractor fan not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'heads extractor fan ducting incomplete', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('heads extractor fan ducting incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank refill pipe leaking', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank refill pipe leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank full indicator wire not strapped', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank full indicator wire not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet seat loose', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet seat loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'house bat isolator switch missing a mounting skrew', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('house bat isolator switch missing a mounting skrew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimp on heads strip light', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('poor crimp on heads strip light'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing fuse on stb mid inboard', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing fuse on stb mid inboard'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'stb mid basin loose', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('stb mid basin loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet salt/fresh water switch not working', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet salt/fresh water switch not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower mixer pipe kinked', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower mixer pipe kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not wired', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC outlet not wired up', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('AC outlet not wired up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gas locker sniffer not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('gas locker sniffer not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet seat loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet seat loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on top of waste water tank', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on top of waste water tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet anti-syphen leaking', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet anti-syphen leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet fresh water solenoid not working', 'ELEC', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet fresh water solenoid not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet fresh/salt switch crossed', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet fresh/salt switch crossed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank full indicator not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank full indicator not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank full indicator not wired', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank full indicator not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'watermaker breaker not installed in high voltage locker', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('watermaker breaker not installed in high voltage locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water maker negative terminal not connected in high voltage locker', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water maker negative terminal not connected in high voltage locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank plumbing in bilge not strapped', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank plumbing in bilge not strapped'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not wired', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on fireboy black boxes', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires on fireboy black boxes'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cabin strip light wires not terminated', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('cabin strip light wires not terminated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Quattro bypass switch not mounted', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Quattro bypass switch not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'yachtsense DB mounted skew', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('yachtsense DB mounted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires at inboard DB', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wires at inboard DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon mounted loosely', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon mounted loosely'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel tank brace loose', 'MECH', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel tank brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water tank brace loose', 'MECH', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water tank brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet hardup against wall', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet hardup against wall'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet fresh water not working', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet fresh water not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon pump not wired', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon pump not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon drain pipe clamp loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon drain pipe clamp loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset fuel assist not switching on at preheat', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('genset fuel assist not switching on at preheat'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wire on water lift relay of genset', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('loose wire on water lift relay of genset'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing crimp on AC wiring for genset water lift pump relay', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing crimp on AC wiring for genset water lift pump relay'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC outlet fitted upside down', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('AC outlet fitted upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing clamp on genset water assist pump', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing clamp on genset water assist pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet seat skew', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet seat skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower rose cold water kinked', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower rose cold water kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin mixer pipes kinked', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin mixer pipes kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'salt/fresh water for toilet cross wired', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('salt/fresh water for toilet cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin mixer loose', 'PLUM', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'yachtsense fuel and water showing incorrectly on MFD', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('yachtsense fuel and water showing incorrectly on MFD'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering bar knocking', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('steering bar knocking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot reference cross wired', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('autopilot reference cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot motor cross wired', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('autopilot motor cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'swim ladder bolts loose', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('swim ladder bolts loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fridge not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fridge not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'battery link not working', 'ELEC', 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('battery link not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel transfer not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('fuel transfer not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shore water connector leaking', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('shore water connector leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on aft cockpit ceiling mini bus', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('loose wires on aft cockpit ceiling mini bus'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david relay wiring loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david relay wiring loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no boots on david relay wiring', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('no boots on david relay wiring'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'david motor terminals loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('david motor terminals loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'victro not setup or connected to MFD', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('victro not setup or connected to MFD'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'autopilot motor not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('autopilot motor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'GND wires not sleeved', null, 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('GND wires not sleeved'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Too many wires connected to engine ground connection', null, 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Too many wires connected to engine ground connection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering cable loose', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('steering cable loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine blower not working', null, 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine blower not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fire suppression incorrectly wired', null, 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('fire suppression incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'touch light not working', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('touch light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fuse terminal broken', null, 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fuse terminal broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fuse not covered', 'ELEC', 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fuse not covered'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on muffler pipe connector', null, 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('leak on muffler pipe connector'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'morse control splitpins not properly bent open', 'MECH', 'Port Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('morse control splitpins not properly bent open'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'GND wires not sleeved', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('GND wires not sleeved'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Too many wires connected to engine ground connection', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Too many wires connected to engine ground connection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'steering cale loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('steering cale loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cyrix relay not working', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('cyrix relay not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'cyrix wires loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('cyrix wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine blower not working', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine blower not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fire suppression incorrectly wired', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('fire suppression incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'starter L-bracket loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('starter L-bracket loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fuse terminal loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fuse terminal loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine fuse not covered', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine fuse not covered'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'touch light not working', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('touch light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimp on GND wire on rudder', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('poor crimp on GND wire on rudder'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine raw water filter clamp loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine raw water filter clamp loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel clamps loose on prefilter', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('fuel clamps loose on prefilter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'small hatch next to genset slams closed and does not latch', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('small hatch next to genset slams closed and does not latch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit strip light inconsistant switching', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit strip light inconsistant switching'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit strip light loose in enclosure producing inconsistant lighting', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit strip light loose in enclosure producing inconsistant lighting'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset red start switch on genset cover panel not wired up', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset red start switch on genset cover panel not wired up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'genset fuel pump wiring not properly insolated', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('genset fuel pump wiring not properly insolated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'windlass slipping', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('windlass slipping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fwd cockpit remote not wired up', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('fwd cockpit remote not wired up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aft cockpit remote not wired up', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('aft cockpit remote not wired up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Camara Not Wired up', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Camara Not Wired up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no torque marks on A-frames', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('no torque marks on A-frames'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Extractor Fans Not working in HVL', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Extractor Fans Not working in HVL'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'VHF Anthenna Wire not pulled through', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('VHF Anthenna Wire not pulled through'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Mid Ship Heads Port side Waste tank light not working', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Mid Ship Heads Port side Waste tank light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Neatrals not connected on AC board', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1005'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('Neatrals not connected on AC board'))
  );

insert into public.boats (name)
values ('C1004')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset Isolator switch loose', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Genset Isolator switch loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Dc M2 display not working', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Dc M2 display not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AC M2 display not working', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('AC M2 display not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset starter harness not wired', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Genset starter harness not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset starter harness plug broken', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Genset starter harness plug broken'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fresh water pump signals not showing/working', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Fresh water pump signals not showing/working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incorrect wiring on fresh water pumps at DB board', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Incorrect wiring on fresh water pumps at DB board'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'High level alarm present while present over-ride button', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('High level alarm present while present over-ride button'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose DC wires on panel board', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose DC wires on panel board'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose AC wires on panel board', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose AC wires on panel board'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No Relays fitted for inverter alarm', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No Relays fitted for inverter alarm'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter alarm not working', 'ELEC', 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter alarm not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wires on battery protect unit', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose wires on battery protect unit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Numerous QC green stickers present', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Numerous QC green stickers present'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose switches at TV-Bracket', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose switches at TV-Bracket'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing cover/Loose negative shunt', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Missing cover/Loose negative shunt'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose cover on battery distributor', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose cover on battery distributor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing cover on lewmar breaker', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Missing cover on lewmar breaker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Oven Loose', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Oven Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'LPG not wired', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('LPG not wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No power to Galley fridge', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No power to Galley fridge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose filter tap/damaged', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose filter tap/damaged'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Galley fridge compressor loose', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Galley fridge compressor loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing covers on buss at TV-Bracket locker', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Missing covers on buss at TV-Bracket locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Monoxide detector not working', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Monoxide detector not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose Backbone in ceiling', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose Backbone in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing terminators on backbone in ceiling', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Missing terminators on backbone in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Bilge pump incorrectly wired', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Bilge pump incorrectly wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Wires nor pulled through for lights', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Wires nor pulled through for lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wires on Mini buss in ceiling', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Loose wires on Mini buss in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing boots on lewmar winches', null, 'Saloon'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Missing boots on lewmar winches'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose fridge compressor', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Loose fridge compressor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fire suppression cable loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Fire suppression cable loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on water heater', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak on water heater'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No wires puled through for lights', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('No wires puled through for lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Heads lights switch/wiring wrong', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Heads lights switch/wiring wrong'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inboard reading light not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Inboard reading light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Outboard reading light not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Outboard reading light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak from shower into bilge', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak from shower into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet water supply not working, Salt and Fresh', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet water supply not working, Salt and Fresh'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on toilet plumbing', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak on toilet plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin mixer loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poor airflow from air vent', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Poor airflow from air vent'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimps on outlets', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('poor crimps on outlets'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No wires pulled through for lights', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('No wires pulled through for lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak from waste tank', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak from waste tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet water supply not working, Fresh and Salt', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet water supply not working, Fresh and Salt'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Anti-syphon loops leaking', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Anti-syphon loops leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin mixer loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Heads lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Heads lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste tank indicator not working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste tank indicator not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incomplete wiring on inboard buss', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Incomplete wiring on inboard buss'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poor crimps on inboard Buss', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Poor crimps on inboard Buss'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon nor wired up', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon nor wired up'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing Relay for Aircon', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing Relay for Aircon'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'wires not pulled through for lights', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('wires not pulled through for lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Heads Lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Heads Lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste tank monitor not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste tank monitor not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet water supply not working, Salt and fresh', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet water supply not working, Salt and fresh'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on toilet plumbing', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak on toilet plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin mixer loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on Shower plumbing', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak on Shower plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon Loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon Loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Ducting poorly fitted', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Ducting poorly fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset battery wiring incomplete', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Genset battery wiring incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Broken distribution board covers', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Broken distribution board covers'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing RELAY for genset wiring', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing RELAY for genset wiring'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset raw water pump not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Genset raw water pump not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon wiring incomplete', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon wiring incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No wiring pulled through for lights', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('No wiring pulled through for lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aft light stays on continuously', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aft light stays on continuously'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Touch light not working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Touch light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poor crimps on plug wiring', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Poor crimps on plug wiring'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Shower sump not working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Shower sump not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet waste supply not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet waste supply not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin mixer loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on toilet plumbing', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak on toilet plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incomplete wiring on breaker box', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Incomplete wiring on breaker box'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Broken Ball valve', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Broken Ball valve'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing covers in HVL', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing covers in HVL'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak From shower pumps', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak From shower pumps'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on water pressure pump plumbing', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak on water pressure pump plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet pumps not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet pumps not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin mixer loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on toilet plumbing', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak on toilet plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Waste tank indicator not working', 'ELEC', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Waste tank indicator not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Lights not working', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Wires not pulled through for lights', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Wires not pulled through for lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'hact-cense wiring incomplete', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('hact-cense wiring incomplete'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Engine Battery switch incomplete/LOOSE', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Engine Battery switch incomplete/LOOSE'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak from shower into bilge', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Leak from shower into bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No wire for water tank transducer', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('No wire for water tank transducer'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wires on fire buoy busses', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Loose wires on fire buoy busses'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Engine throttles not aligned', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Engine throttles not aligned'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Steering stiff', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Steering stiff'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Steering chain slipping', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Steering chain slipping'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Davit skew', 'DECK', 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Davit skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Auto-pilot/rudder ref wired incorrectly', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Auto-pilot/rudder ref wired incorrectly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Strip lights not working', 'ELEC', 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Strip lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Down lights not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Down lights not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Wires not pulled through for lights', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Wires not pulled through for lights'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aft cockpit fridge not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Aft cockpit fridge not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Raymic fittings not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Raymic fittings not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Horn switch & bilge light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Horn switch & bilge light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fuel transfer pump not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Fuel transfer pump not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Engine fuse wires loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Engine fuse wires loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poor crimps on galvanic isolator', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Poor crimps on galvanic isolator'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No heat shrink on galvanic isolator wires', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('No heat shrink on galvanic isolator wires'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on stern shower', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Leak on stern shower'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose plumbing on inboard drain pipe', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Loose plumbing on inboard drain pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wires on sterling', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Loose wires on sterling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Under water light not working', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Under water light not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wires on sterling', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose wires on sterling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wires on starter bracket', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Loose wires on starter bracket'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose wires on engine starter battery fuse', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose wires on engine starter battery fuse'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel filter loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('fuel filter loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Incorrect settings on sterling', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Incorrect settings on sterling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset not working', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Genset not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fusion radio not working', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Fusion radio not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'incomplete wiring in genset locker', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('incomplete wiring in genset locker'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'flybridge fusion remote not working', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('flybridge fusion remote not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Leak on genset raw water plumbing', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Leak on genset raw water plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Prt aft cabin aircon in ceiling loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Prt aft cabin aircon in ceiling loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Prt aft cabin aft aircon loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Prt aft cabin aft aircon loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Battery link not working', 'ELEC', 'Stbd Engine'
from public.boats b
where b.name = 'C1004'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('Battery link not working'))
  );

insert into public.boats (name)
values ('C1003')
on conflict (name) do nothing;

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Down light switch cross wired', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Down light switch cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No labels of fridges on AC/DC panel', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No labels of fridges on AC/DC panel'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Down light grommet worm screws not flush', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Down light grommet worm screws not flush'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Yachtsense to be programmed', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Yachtsense to be programmed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing stainless steel catch at AC/DC', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Missing stainless steel catch at AC/DC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Generator not giving power', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Generator not giving power'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Water pressure pump light not showing on AC/DC', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Water pressure pump light not showing on AC/DC'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Water pressure hot wired', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Water pressure hot wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'HOB fitted skew', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('HOB fitted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'DB not mounted', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('DB not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poor crimp on blue sea bus at DB compromised', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Poor crimp on blue sea bus at DB compromised'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Black wire to be terminated in DB', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Black wire to be terminated in DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poor heat shrink on AC wire in DB', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Poor heat shrink on AC wire in DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Damaged bridges on DB', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Damaged bridges on DB'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD stays on when breaker is switched off', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('MFD stays on when breaker is switched off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter buzzer not working when house battery is switched off', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Inverter buzzer not working when house battery is switched off'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Relays not fitted', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Relays not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Manual bilge pump overrides cross wired', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Manual bilge pump overrides cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Buzzers working with low water running', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Buzzers working with low water running'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stb watre tank not showing', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('Stb watre tank not showing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'House battery not showing volts', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('House battery not showing volts'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gensetbattery not showing', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('gensetbattery not showing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No network cable by MFD', null, 'Saloon'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Saloon'
      and lower(btrim(d.text)) = lower(btrim('No network cable by MFD'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fan not connected', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Fan not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fridge compressor not secured', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fridge compressor not secured'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'inboard reading light loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('inboard reading light loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'manual suppression wire gromet loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('manual suppression wire gromet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water heater not properly mounted', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water heater not properly mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fuel tank sensor wire loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Fuel tank sensor wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel pipes metal support loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel pipes metal support loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'manual suppression wire nut loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('manual suppression wire nut loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aft aircon loose', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aft aircon loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'high level float not muting music', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('high level float not muting music'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fridge drain not fitted properly', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fridge drain not fitted properly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on shower plumbing', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on shower plumbing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'no terminator fitted in backbone in ceiling', null, 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('no terminator fitted in backbone in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin mixer loose', 'PLUM', 'Stbd Aft Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Aft Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin mixer loose', 'PLUM', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Tank level sensor not connected', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Tank level sensor not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank monitor not connected', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank monitor not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on aft toilet anti-syphen', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on aft toilet anti-syphen'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimp on aft toilet solenoid', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('poor crimp on aft toilet solenoid'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water tank brace loose', 'MECH', 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water tank brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'extraction fan not connected', null, 'Stbd Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('extraction fan not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'basin mixer loose', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on hot water t-piece in bilge', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on hot water t-piece in bilge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on waste water tank', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on waste water tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'leak on shower mixer', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('leak on shower mixer'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet anti-syphen leaking', 'PLUM', 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet anti-syphen leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon not connected', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'aircon loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('aircon loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Strip light wire visible', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Strip light wire visible'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Strip light loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Strip light loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Pump backboard in bilge not properly secured', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Pump backboard in bilge not properly secured'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poorly strapped wiring on genset exhaust outlet', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Poorly strapped wiring on genset exhaust outlet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Raw wire on aft strip light', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Raw wire on aft strip light'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Wires inboard on DB not terminated', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Wires inboard on DB not terminated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Book shelf loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Book shelf loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inboard reading light loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Inboard reading light loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Cabin towel hanger loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Cabin towel hanger loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon does not have a drain', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon does not have a drain'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon vent connection loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon vent connection loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Genset battery terminal loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Genset battery terminal loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'GFCI outlet to be mounted properly', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('GFCI outlet to be mounted properly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Sower sump not working', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Sower sump not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet loose', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Set port water pressure', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Set port water pressure'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Mount toilet switch', null, 'Stbd Fwd Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Fwd Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Mount toilet switch'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Fresh water pump t-piece leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Fresh water pump t-piece leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Bad plumbing layout at fresh water pump', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Bad plumbing layout at fresh water pump'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'toilet anti-syphen leaking', 'PLUM', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('toilet anti-syphen leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste tank top pipes leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste tank top pipes leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'shower pump leaking', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('shower pump leaking'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'extractor fan in high voltage locker not working', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('extractor fan in high voltage locker not working'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inverter loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Inverter loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'positive bus bar too close to inverter', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('positive bus bar too close to inverter'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'breaker box loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('breaker box loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'transformer loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('transformer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'missing cover on blue sea bus', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('missing cover on blue sea bus'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'waste water tank sensor not connected', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('waste water tank sensor not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Water tank sensor wire badly layed', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Water tank sensor wire badly layed'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon duckting incomplete in ceiling', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon duckting incomplete in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Missing terminator on backbone in ceiling', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Missing terminator on backbone in ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aft aircon not draining properly', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aft aircon not draining properly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aft light switch fitted upside down', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aft light switch fitted upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Manual suppression wire grommet fitted poorly', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Manual suppression wire grommet fitted poorly'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Isolator switch skew', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Isolator switch skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Isolator switchwiring loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Isolator switchwiring loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Poorly fitted outboard reading light', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Poorly fitted outboard reading light'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'drain pipe loose in aft ceiling', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('drain pipe loose in aft ceiling'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Loose wire on fireboy system top corner', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Loose wire on fireboy system top corner'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Aircon spare power cable not terminated', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Aircon spare power cable not terminated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'busbar not labeled by yachtsense in inboard inspection', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('busbar not labeled by yachtsense in inboard inspection'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'water tank brace loose', 'MECH', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('water tank brace loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACU 400 giving constant power to backbone', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ACU 400 giving constant power to backbone'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'ACU 400 cross wired', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('ACU 400 cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, '5 way back bone connected to constant power', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('5 way back bone connected to constant power'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'fuel return ball valve loose on tank', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('fuel return ball valve loose on tank'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Strip light not connected', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Strip light not connected'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Basin mixer loose', 'PLUM', 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Basin mixer loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Toilet loose', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Toilet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Salt/Fresh water cross wired', null, 'Port Mid Cabin & Heads'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Mid Cabin & Heads'
      and lower(btrim(d.text)) = lower(btrim('Salt/Fresh water cross wired'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'David switch not mounted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('David switch not mounted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'No cable ties on david shackels', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('No cable ties on david shackels'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'David is skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('David is skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'David sensor fitted upside down', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('David sensor fitted upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Autopilot screen fitted skew', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Autopilot screen fitted skew'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'MFD backplate loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('MFD backplate loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Raymic connector upside down', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Raymic connector upside down'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stb & Prt handrails loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Stb & Prt handrails loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stb top curtacy light not connected and badly fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Stb top curtacy light not connected and badly fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Port winch rope outlet not at correct angle', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Port winch rope outlet not at correct angle'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Swim ladder skew and chaffing', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Swim ladder skew and chaffing'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Swim ladder catch hitting', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Swim ladder catch hitting'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stern shower leaking on cold water pipe', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Stern shower leaking on cold water pipe'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stern shower leaking at nozzle', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Stern shower leaking at nozzle'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stern shower wire pipe kinked', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Stern shower wire pipe kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stern shower wire pipe kinked', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Stern shower wire pipe kinked'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Stern floor board port side not flush with floor', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Stern floor board port side not flush with floor'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Gap at hinge of inspection above fridge', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Gap at hinge of inspection above fridge'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Inspection above fridge, latch not fitted', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Inspection above fridge, latch not fitted'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Strip lights inconsistant (Showing individual LED''s)', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Strip lights inconsistant (Showing individual LED''s)'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'David motor terminals loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('David motor terminals loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'David solenoid terminals loose', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('David solenoid terminals loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Small blue wire at david motor not terminated', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Small blue wire at david motor not terminated'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'David pully stiff at rope outlet', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('David pully stiff at rope outlet'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'AR200 fitted wrong way', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('AR200 fitted wrong way'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Dome nuts to be fitted on david bottom bolts', null, 'Aft Cockpit'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Aft Cockpit'
      and lower(btrim(d.text)) = lower(btrim('Dome nuts to be fitted on david bottom bolts'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine starter bracket loose', null, 'Port Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('engine starter bracket loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'too many terminals on engine stud', null, 'Port Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('too many terminals on engine stud'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'grounding wire on under water light loose', null, 'Port Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('grounding wire on under water light loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'poor crimp on galvanic isolator wires', null, 'Port Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('poor crimp on galvanic isolator wires'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'Exhaust temp open circuit', null, 'Port Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Port Engine'
      and lower(btrim(d.text)) = lower(btrim('Exhaust temp open circuit'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'gas lockert drain outlet loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('gas lockert drain outlet loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'too many terminals on engine stud', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('too many terminals on engine stud'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'loose terminals on positive bus on battery', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('loose terminals on positive bus on battery'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine starter bracket loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine starter bracket loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'engine starter positive wire loose', null, 'Stbd Engine'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Stbd Engine'
      and lower(btrim(d.text)) = lower(btrim('engine starter positive wire loose'))
  );

insert into public.defects (boat_id, text, discipline, area)
select b.id, 'topping lift block making clucking sound', null, 'Fwd Cockpit Lounge & Deck'
from public.boats b
where b.name = 'C1003'
  and not exists (
    select 1
    from public.defects d
    where d.boat_id = b.id
      and d.area = 'Fwd Cockpit Lounge & Deck'
      and lower(btrim(d.text)) = lower(btrim('topping lift block making clucking sound'))
  );
