"use client";

import { getSupabaseConfigurationError, supabase } from "./supabase";

function ensureSupabase() { if (!supabase) throw new Error(getSupabaseConfigurationError()); }

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
      concern: Boolean(defect.concern), createdAt: defect.created_at, updatedAt: defect.updated_at
    })),
    pendingSync: false,
    createdAt: boat.created_at,
    updatedAt: boat.updated_at
  };
}

const BOAT_SELECT = "id,name,model,created_at,updated_at,quality_control_areas(area_name,inspector,sort_order),quality_control_defects(id,area_name,item,failure_mode,description,code,discipline,concern,created_at,updated_at)";

export async function loadSharedQualityBoats() {
  ensureSupabase();
  const { data, error } = await supabase.from("quality_control_boats").select(BOAT_SELECT).order("name");
  if (error) throw error;
  return (data || []).map(mapRemoteBoat);
}

export async function loadSharedQualityBoat(boatId) {
  ensureSupabase();
  const { data, error } = await supabase.from("quality_control_boats").select(BOAT_SELECT).eq("id", boatId).maybeSingle();
  if (error) throw error;
  return data ? mapRemoteBoat(data) : null;
}

export async function syncQualityBoat(boat) {
  ensureSupabase();
  const updatedAt = boat.updatedAt || new Date().toISOString();
  const { error: boatError } = await supabase.from("quality_control_boats").upsert({ id: boat.id, name: boat.name, model: boat.model || boat.name.slice(0, 2), created_at: boat.createdAt || updatedAt, updated_at: updatedAt }, { onConflict: "id" });
  if (boatError) throw boatError;

  const areas = (boat.areas || []).map((areaName, index) => ({ boat_id: boat.id, area_name: areaName, inspector: boat.areaInspectors?.[areaName] || "", sort_order: index, updated_at: updatedAt }));
  if (areas.length) {
    const { error } = await supabase.from("quality_control_areas").upsert(areas, { onConflict: "boat_id,area_name" });
    if (error) throw error;
  }
  const { data: storedAreas, error: storedAreasError } = await supabase.from("quality_control_areas").select("area_name").eq("boat_id", boat.id);
  if (storedAreasError) throw storedAreasError;
  const currentAreas = new Set(areas.map((area) => area.area_name));
  const staleAreas = (storedAreas || []).filter((area) => !currentAreas.has(area.area_name)).map((area) => area.area_name);
  if (staleAreas.length) { const { error } = await supabase.from("quality_control_areas").delete().eq("boat_id", boat.id).in("area_name", staleAreas); if (error) throw error; }

  const defects = (boat.defects || []).map((defect) => ({ id: defect.id, boat_id: boat.id, area_name: defect.area, item: defect.item, failure_mode: defect.failure, description: defect.description, code: defect.code ? Number(defect.code) : null, discipline: defect.discipline || "", concern: Boolean(defect.concern), created_at: defect.createdAt || updatedAt, updated_at: defect.updatedAt || updatedAt }));
  if (defects.length) { const { error } = await supabase.from("quality_control_defects").upsert(defects, { onConflict: "id" }); if (error) throw error; }
  const { data: storedDefects, error: storedDefectsError } = await supabase.from("quality_control_defects").select("id").eq("boat_id", boat.id);
  if (storedDefectsError) throw storedDefectsError;
  const currentDefects = new Set(defects.map((defect) => defect.id));
  const staleDefects = (storedDefects || []).filter((defect) => !currentDefects.has(defect.id)).map((defect) => defect.id);
  if (staleDefects.length) { const { error } = await supabase.from("quality_control_defects").delete().in("id", staleDefects); if (error) throw error; }
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
