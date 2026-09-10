"use client";

import { getSupabaseConfigurationError, supabase } from "./supabase";

function ensureSupabase() { if (!supabase) throw new Error(getSupabaseConfigurationError()); }

async function loadAllPages(makeQuery) {
  const pageSize = 1000;
  const rows = [];
  for (let from = 0; ; from += pageSize) {
    const { data, error } = await makeQuery().range(from, from + pageSize - 1);
    if (error) throw error;
    rows.push(...(data || []));
    if (!data || data.length < pageSize) return rows;
  }
}

async function upsertInBatches(table, rows, options) {
  for (let index = 0; index < rows.length; index += 500) {
    const { error } = await supabase.from(table).upsert(rows.slice(index, index + 500), options);
    if (error) throw error;
  }
}

function mapRemoteBoat(boat) {
  const areas = [...(boat.quality_control_areas || [])].sort((a, b) => a.sort_order - b.sort_order);
  return {
    id: boat.id,
    name: boat.name,
    model: boat.model || boat.name.slice(0, 2),
    areas: areas.map((area) => area.area_name),
    areaInspectors: Object.fromEntries(areas.map((area) => [area.area_name, area.inspector || ""])),
    completedAreas: [],
    defects: (boat.quality_control_defects || []).map((defect) => ({
      id: defect.id, area: defect.area_name, item: defect.item, failure: defect.failure_mode,
      description: defect.description, code: defect.code || "", discipline: defect.discipline || "",
      concern: Boolean(defect.concern), createdAt: defect.created_at, updatedAt: defect.updated_at,
      repairedBy: defect.repaired_by || "", repairedDate: defect.repaired_date || "",
      teamLeaderCheck: defect.team_leader_check || "", qcRwk: defect.qc_rwk || "", qcAcc: defect.qc_acc || ""
    })),
    pendingSync: false,
    deletedDefectIds: [],
    deletedAreaNames: [],
    createdAt: boat.created_at,
    updatedAt: boat.updated_at
  };
}

const BOAT_SELECT = "id,name,model,created_at,updated_at";
const AREA_SELECT = "boat_id,area_name,inspector,sort_order";
const DEFECT_SELECT = "id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc,created_at,updated_at";

export async function loadSharedQualityBoats() {
  ensureSupabase();
  const [boats, areas, defects] = await Promise.all([
    loadAllPages(() => supabase.from("quality_control_boats").select(BOAT_SELECT).order("name")),
    loadAllPages(() => supabase.from("quality_control_areas").select(AREA_SELECT).order("boat_id").order("sort_order")),
    loadAllPages(() => supabase.from("quality_control_defects").select(DEFECT_SELECT).order("id"))
  ]);
  const areasByBoat = new Map();
  const defectsByBoat = new Map();
  areas.forEach((area) => areasByBoat.set(area.boat_id, [...(areasByBoat.get(area.boat_id) || []), area]));
  defects.forEach((defect) => defectsByBoat.set(defect.boat_id, [...(defectsByBoat.get(defect.boat_id) || []), defect]));
  return boats.map((boat) => mapRemoteBoat({ ...boat, quality_control_areas: areasByBoat.get(boat.id) || [], quality_control_defects: defectsByBoat.get(boat.id) || [] }));
}

export async function loadSharedQualityBoat(boatId) {
  ensureSupabase();
  const { data, error } = await supabase.from("quality_control_boats").select(BOAT_SELECT).eq("id", boatId).maybeSingle();
  if (error) throw error;
  if (!data) return null;
  const [areas, defects] = await Promise.all([
    loadAllPages(() => supabase.from("quality_control_areas").select(AREA_SELECT).eq("boat_id", boatId).order("sort_order")),
    loadAllPages(() => supabase.from("quality_control_defects").select(DEFECT_SELECT).eq("boat_id", boatId).order("id"))
  ]);
  return mapRemoteBoat({ ...data, quality_control_areas: areas, quality_control_defects: defects });
}

export async function syncQualityBoat(boat) {
  ensureSupabase();
  const updatedAt = boat.updatedAt || new Date().toISOString();
  const { error: boatError } = await supabase.from("quality_control_boats").upsert({ id: boat.id, name: boat.name, model: boat.model || boat.name.slice(0, 2), created_at: boat.createdAt || updatedAt, updated_at: updatedAt }, { onConflict: "id" });
  if (boatError) throw boatError;

  const areas = (boat.areas || []).map((areaName, index) => ({ boat_id: boat.id, area_name: areaName, inspector: boat.areaInspectors?.[areaName] || "", sort_order: index, updated_at: updatedAt }));
  if (areas.length) await upsertInBatches("quality_control_areas", areas, { onConflict: "boat_id,area_name" });
  const defects = (boat.defects || []).map((defect) => ({ id: defect.id, boat_id: boat.id, area_name: defect.area, item: defect.item, failure_mode: defect.failure, description: defect.description, code: defect.code ? Number(defect.code) : null, discipline: defect.discipline || "", concern: Boolean(defect.concern), repaired_by: defect.repairedBy || "", repaired_date: defect.repairedDate || "", team_leader_check: defect.teamLeaderCheck || "", qc_rwk: defect.qcRwk || "", qc_acc: defect.qcAcc || "", created_at: defect.createdAt || updatedAt, updated_at: defect.updatedAt || updatedAt }));
  if (defects.length) await upsertInBatches("quality_control_defects", defects, { onConflict: "id" });
  if (boat.deletedDefectIds?.length) { const { error } = await supabase.from("quality_control_defects").delete().eq("boat_id", boat.id).in("id", boat.deletedDefectIds); if (error) throw error; }
  if (boat.deletedAreaNames?.length) { const { error } = await supabase.from("quality_control_areas").delete().eq("boat_id", boat.id).in("area_name", boat.deletedAreaNames); if (error) throw error; }
}

export async function deleteSharedQualityBoat(boatId) { ensureSupabase(); const { error } = await supabase.from("quality_control_boats").delete().eq("id", boatId); if (error) throw error; }

export function subscribeToQualityControlChanges(onChange) {
  if (!supabase) return () => {};
  const channel = supabase.channel(`quality-control-${Math.random()}`)
    .on("postgres_changes", { event: "*", schema: "public", table: "quality_control_boats" }, onChange)
    .on("postgres_changes", { event: "*", schema: "public", table: "quality_control_areas" }, onChange)
    .on("postgres_changes", { event: "*", schema: "public", table: "quality_control_defects" }, onChange)
    .subscribe();
  return () => supabase.removeChannel(channel);
}
