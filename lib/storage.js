"use client";

import { getSupabaseConfigurationError, supabase } from "./supabase";

function mapDefect(row) {
  return {
    id: row.id,
    text: row.text || "",
    discipline: row.discipline || "",
    area: row.area || "",
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
}

function mapBoat(row) {
  const defects = Array.isArray(row.defects) ? row.defects : [];

  return {
    id: row.id,
    name: row.name || "",
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

export async function loadState() {
  ensureSupabase();

  const { data, error } = await supabase
    .from("boats")
    .select("id,name,created_at,updated_at,defects(id,text,discipline,area,created_at,updated_at)")
    .order("updated_at", { ascending: false })
    .order("created_at", { referencedTable: "defects", ascending: true });

  if (error) {
    throw error;
  }

  return {
    boats: (data || []).map(mapBoat)
  };
}

export async function createBoat(name) {
  ensureSupabase();

  const normalizedName = name.trim().toUpperCase();
  const { data, error } = await supabase
    .from("boats")
    .insert({ name: normalizedName })
    .select("id,name,created_at,updated_at")
    .single();

  if (error) {
    throw error;
  }

  return mapBoat({ ...data, defects: [] });
}

export async function createDefect({ boatId, text, discipline, area }) {
  ensureSupabase();

  const { data, error } = await supabase
    .from("defects")
    .insert({
      boat_id: boatId,
      text: text.trim(),
      discipline: discipline || null,
      area
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
    patch.text = values.text.trim();
  }

  if (Object.prototype.hasOwnProperty.call(values, "discipline")) {
    patch.discipline = values.discipline || null;
  }

  if (Object.prototype.hasOwnProperty.call(values, "area")) {
    patch.area = values.area;
  }

  const { data, error } = await supabase
    .from("defects")
    .update(patch)
    .eq("id", defectId)
    .select("id,text,discipline,area,created_at,updated_at")
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
