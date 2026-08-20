"use client";

import { DEFAULT_BOAT_AREAS, getCommonDefectAreaNames, orderBoatAreas } from "./constants";
import { getSupabaseConfigurationError, supabase } from "./supabase";

const BOAT_SELECT_WITH_AREAS = "id,name,commissioning_engineer,areas,completed_areas,created_at,updated_at,defects(id,text,discipline,area,callback_requested_at,created_at,updated_at)";
const BOAT_SELECT_WITH_AREAS_LEGACY = "id,name,commissioning_engineer,areas,created_at,updated_at,defects(id,text,discipline,area,created_at,updated_at)";
const BOAT_SELECT_WITHOUT_AREAS = "id,name,commissioning_engineer,created_at,updated_at,defects(id,text,discipline,area,created_at,updated_at)";
let hasBoatAreasColumn = true;
let hasWorkflowColumns = true;
let hasCommonDefectsTable = true;
const ALLOWED_DISCIPLINES = new Set(["PLUM", "ELEC", "MECH", "FA", "DECK", "CARP", "FIN"]);

function mapDefect(row) {
  return {
    id: row.id,
    text: row.text || "",
    discipline: row.discipline || "",
    area: row.area || "",
    callbackRequestedAt: row.callback_requested_at || "",
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
}

function mapCommonDefect(row) {
  return {
    text: row.text || "",
    discipline: row.discipline || ""
  };
}

function normalizeAreas(areas) {
  if (!Array.isArray(areas)) {
    return null;
  }

  return areas
    .map((area) => String(area || "").trim())
    .filter((area, index, list) => area && list.indexOf(area) === index);
}

function normalizeDiscipline(discipline) {
  const normalized = String(discipline || "").trim().toUpperCase();
  return ALLOWED_DISCIPLINES.has(normalized) ? normalized : null;
}

function normalizeRequiredText(value, label) {
  const normalized = String(value || "").trim();

  if (!normalized) {
    throw new Error(`${label} cannot be blank.`);
  }

  return normalized;
}

function mapBoat(row) {
  const defects = Array.isArray(row.defects) ? row.defects : [];

  return {
    id: row.id,
    name: row.name || "",
    commissioningEngineer: row.commissioning_engineer || "",
    areas: normalizeAreas(row.areas),
    completedAreas: normalizeAreas(row.completed_areas) || [],
    createdAt: row.created_at,
    updatedAt: row.updated_at,
    defects: defects.map(mapDefect)
  };
}

function ensureSupabase() {
  if (!supabase) {
    throw new Error(getSupabaseConfigurationError());
  }
}

function isMissingAreasColumnError(error) {
  const message = `${error?.message || ""} ${error?.details || ""} ${error?.hint || ""}`.toLowerCase();
  return message.includes("areas") && (message.includes("column") || message.includes("schema cache"));
}

function isMissingWorkflowColumnError(error) {
  const message = `${error?.message || ""} ${error?.details || ""} ${error?.hint || ""}`.toLowerCase();
  return (message.includes("completed_areas") || message.includes("callback_requested_at"))
    && (message.includes("column") || message.includes("schema cache"));
}

function isMissingCommonDefectsTableError(error) {
  const message = `${error?.message || ""} ${error?.details || ""} ${error?.hint || ""}`.toLowerCase();
  return message.includes("common_defects") && (message.includes("table") || message.includes("schema cache") || message.includes("relation"));
}

function boatSelectColumns() {
  if (!hasBoatAreasColumn) return BOAT_SELECT_WITHOUT_AREAS;
  return hasWorkflowColumns ? BOAT_SELECT_WITH_AREAS : BOAT_SELECT_WITH_AREAS_LEGACY;
}

export async function loadState() {
  ensureSupabase();

  let { data, error } = await supabase
    .from("boats")
    .select(boatSelectColumns())
    .order("name", { ascending: false })
    .order("created_at", { referencedTable: "defects", ascending: true });

  if (error && hasWorkflowColumns && isMissingWorkflowColumnError(error)) {
    hasWorkflowColumns = false;
    ({ data, error } = await supabase
      .from("boats")
      .select(BOAT_SELECT_WITH_AREAS_LEGACY)
      .order("name", { ascending: false })
      .order("created_at", { referencedTable: "defects", ascending: true }));
  }

  if (error && hasBoatAreasColumn && isMissingAreasColumnError(error)) {
    hasBoatAreasColumn = false;
    ({ data, error } = await supabase
      .from("boats")
      .select(BOAT_SELECT_WITHOUT_AREAS)
      .order("name", { ascending: false })
      .order("created_at", { referencedTable: "defects", ascending: true }));
  }

  if (error) {
    throw error;
  }

  return {
    boats: (data || []).map(mapBoat)
  };
}

export async function loadCommonDefects(area) {
  ensureSupabase();

  if (!hasCommonDefectsTable || !area) {
    return [];
  }

  const areaNames = getCommonDefectAreaNames(area);
  let query = supabase
    .from("common_defects")
    .select("text,discipline,occurrence_count")
    .order("occurrence_count", { ascending: false })
    .order("text", { ascending: true });

  query = areaNames.length > 1 ? query.in("area", areaNames) : query.eq("area", area);

  const { data, error } = await query;

  if (error && isMissingCommonDefectsTableError(error)) {
    hasCommonDefectsTable = false;
    return [];
  }

  if (error) {
    throw error;
  }

  return (data || []).map(mapCommonDefect);
}

export async function createBoat(name, commissioningEngineer = "") {
  ensureSupabase();

  const normalizedName = name.trim().toUpperCase();
  const normalizedEngineer = commissioningEngineer.trim();
  const insertValues = {
    name: normalizedName,
    commissioning_engineer: normalizedEngineer
  };

  if (hasBoatAreasColumn) {
    insertValues.areas = DEFAULT_BOAT_AREAS;
  }

  let { data, error } = await supabase
    .from("boats")
    .insert(insertValues)
    .select(hasBoatAreasColumn ? "id,name,commissioning_engineer,areas,created_at,updated_at" : "id,name,commissioning_engineer,created_at,updated_at")
    .single();

  if (error && hasBoatAreasColumn && isMissingAreasColumnError(error)) {
    hasBoatAreasColumn = false;
    ({ data, error } = await supabase
      .from("boats")
      .insert({
        name: normalizedName,
        commissioning_engineer: normalizedEngineer
      })
      .select("id,name,commissioning_engineer,created_at,updated_at")
      .single());
  }

  if (error) {
    throw error;
  }

  return mapBoat({ ...data, defects: [] });
}

export async function updateBoatName(boatId, name) {
  ensureSupabase();

  const normalizedName = name.trim().toUpperCase();
  const { data, error } = await supabase
    .from("boats")
    .update({ name: normalizedName })
    .eq("id", boatId)
    .select(boatSelectColumns())
    .single();

  if (error) {
    throw error;
  }

  return mapBoat(data);
}

export async function updateBoatCommissioningEngineer(boatId, commissioningEngineer) {
  ensureSupabase();

  const normalizedEngineer = commissioningEngineer.trim();
  const { data, error } = await supabase
    .from("boats")
    .update({ commissioning_engineer: normalizedEngineer })
    .eq("id", boatId)
    .select(boatSelectColumns())
    .single();

  if (error) {
    throw error;
  }

  return mapBoat(data);
}

export async function updateBoatAreas(boatId, areas) {
  ensureSupabase();

  if (!hasBoatAreasColumn) {
    throw new Error("Run the Supabase SQL to enable custom boat areas first.");
  }

  const normalizedAreas = orderBoatAreas(normalizeAreas(areas));
  const { data, error } = await supabase
    .from("boats")
    .update({ areas: normalizedAreas })
    .eq("id", boatId)
    .select(hasWorkflowColumns ? BOAT_SELECT_WITH_AREAS : BOAT_SELECT_WITH_AREAS_LEGACY)
    .single();

  if (error) {
    throw error;
  }

  return mapBoat(data);
}

export async function updateBoatCompletedAreas(boatId, completedAreas) {
  ensureSupabase();

  if (!hasWorkflowColumns) {
    throw new Error("Run the Supabase workflow SQL before saving area progress.");
  }

  const { data, error } = await supabase
    .from("boats")
    .update({ completed_areas: normalizeAreas(completedAreas) || [] })
    .eq("id", boatId)
    .select(BOAT_SELECT_WITH_AREAS)
    .single();

  if (error) throw error;
  return mapBoat(data);
}

export async function deleteBoat(boatId) {
  ensureSupabase();

  const { error } = await supabase
    .from("boats")
    .delete()
    .eq("id", boatId);

  if (error) {
    throw error;
  }
}

export async function duplicateBoat(sourceBoat, name) {
  ensureSupabase();

  const nextBoat = await createBoat(name, sourceBoat.commissioningEngineer || "");
  const sourceAreas = normalizeAreas(sourceBoat.areas);
  const defects = sourceBoat.defects
    .filter((defect) => defect.text.trim())
    .map((defect) => ({
      boat_id: nextBoat.id,
      text: defect.text.trim(),
      discipline: defect.discipline || null,
      area: defect.area
    }));

  let duplicatedBoat = nextBoat;

  if (sourceAreas && hasBoatAreasColumn) {
    duplicatedBoat = await updateBoatAreas(nextBoat.id, sourceAreas);
  }

  if (defects.length === 0) {
    return duplicatedBoat;
  }

  const { data, error } = await supabase
    .from("defects")
    .insert(defects)
    .select("id,text,discipline,area,created_at,updated_at");

  if (error) {
    await deleteBoat(nextBoat.id);
    throw error;
  }

  return {
    ...duplicatedBoat,
    defects: (data || []).map(mapDefect)
  };
}

export async function createDefect({ boatId, text, discipline, area }) {
  ensureSupabase();

  const normalizedText = normalizeRequiredText(text, "Defect text");
  const normalizedArea = normalizeRequiredText(area, "Defect area");

  const { data, error } = await supabase
    .from("defects")
    .insert({
      boat_id: boatId,
      text: normalizedText,
      discipline: normalizeDiscipline(discipline),
      area: normalizedArea
    })
    .select("id,text,discipline,area,created_at,updated_at")
    .single();

  if (error) {
    throw error;
  }

  return mapDefect(data);
}

export async function updateDefectRecord(defectId, values) {
  ensureSupabase();

  const patch = {};

  if (Object.prototype.hasOwnProperty.call(values, "text")) {
    patch.text = normalizeRequiredText(values.text, "Defect text");
  }

  if (Object.prototype.hasOwnProperty.call(values, "discipline")) {
    patch.discipline = normalizeDiscipline(values.discipline);
  }

  if (Object.prototype.hasOwnProperty.call(values, "area")) {
    patch.area = normalizeRequiredText(values.area, "Defect area");
  }

  if (Object.prototype.hasOwnProperty.call(values, "callbackRequestedAt")) {
    patch.callback_requested_at = values.callbackRequestedAt || null;
  }

  const { data, error } = await supabase
    .from("defects")
    .update(patch)
    .eq("id", defectId)
    .select(hasWorkflowColumns ? "id,text,discipline,area,callback_requested_at,created_at,updated_at" : "id,text,discipline,area,created_at,updated_at")
    .single();

  if (error) {
    throw error;
  }

  return mapDefect(data);
}

export async function deleteDefect(defectId) {
  ensureSupabase();

  const { error } = await supabase
    .from("defects")
    .delete()
    .eq("id", defectId);

  if (error) {
    throw error;
  }
}

export function subscribeToStateChanges(callback) {
  if (!supabase) {
    return () => {};
  }

  const channel = supabase
    .channel("shared-hull-master-state")
    .on("postgres_changes", { event: "*", schema: "public", table: "boats" }, callback)
    .on("postgres_changes", { event: "*", schema: "public", table: "defects" }, callback)
    .subscribe();

  return () => {
    supabase.removeChannel(channel);
  };
}
