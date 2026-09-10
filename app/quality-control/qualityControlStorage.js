"use client";

export const QUALITY_STORAGE_KEY = "hull-master:quality-control:v1";
export const QUALITY_CODE_DISCIPLINES = { 1: "Gelcoat", 2: "Flowcoat", 3: "Joinery/Carp", 4: "Deckfitting", 5: "Plumbing", 6: "Mechanical", 7: "Electrical", 8: "Perspex/Windows", 9: "Spray Painting", 10: "Cleaning" };
export const QUALITY_BOAT_MODELS = ["B5", "B8", "B9", "C1", "C2", "C5"];
export const QUALITY_REFERENCE_BOATS = ["B5152", "B5153", "B5154", "B5155", "B5156", "B8126", "B8127", "B8128", "B8129", "B8130", "B9074", "B9075", "B9076", "B9077", "B9078", "C1071", "C1073", "C1074", "C1075", "C1076", "C2022", "C2023", "C2024", "C2025", "C2026", "C5001", "C5002", "C5003", "C5004", "C5005"];
const REFERENCE_SEED_VERSION = 1;
const REFERENCE_DATA_VERSION = 2;

function makeId(prefix = "qc") { return `${prefix}-${Date.now()}-${Math.random().toString(36).slice(2, 9)}`; }
function createReferenceBoat(name) { const now = new Date().toISOString(); return { id: `qc-reference-${name.toLowerCase()}`, name, model: name.slice(0, 2), areas: [], areaInspectors: {}, completedAreas: [], defects: [], pendingSync: false, deletedDefectIds: [], deletedAreaNames: [], createdAt: now, updatedAt: now }; }

function compareBoatsDescending(a, b) { return String(b.name || "").localeCompare(String(a.name || ""), undefined, { numeric: true, sensitivity: "base" }); }

function migrateQualityState(state) {
  const boats = (state.boats || []).filter((boat) => boat.id !== "generic-quality-audit").map((boat) => ({
    ...boat,
    model: boat.model || String(boat.name || "").slice(0, 2),
    areaInspectors: boat.areaInspectors || {},
    defects: (boat.defects || []).map((defect) => ({ ...defect, concern: Boolean(defect.concern), discipline: QUALITY_CODE_DISCIPLINES[Number(defect.code)] || defect.discipline || "" })),
    pendingSync: boat.id?.startsWith("qc-reference-") && !(boat.areas || []).length && !(boat.defects || []).length ? false : Boolean(boat.pendingSync),
    deletedDefectIds: boat.deletedDefectIds || [],
    deletedAreaNames: boat.deletedAreaNames || []
  }));
  if ((state.referenceSeedVersion || 0) < REFERENCE_SEED_VERSION) {
    const names = new Set(boats.map((boat) => boat.name));
    QUALITY_REFERENCE_BOATS.forEach((name) => { if (!names.has(name)) boats.push(createReferenceBoat(name)); });
  }
  return { ...state, boats, deletedBoatIds: state.deletedBoatIds || [], referenceSeedVersion: REFERENCE_SEED_VERSION };
}

export function loadQualityState() {
  const rawState = window.localStorage.getItem(QUALITY_STORAGE_KEY);
  try {
    const saved = JSON.parse(rawState || "null");
    if (Array.isArray(saved?.boats)) return saveQualityState(migrateQualityState(saved));
  } catch {
    if (rawState) window.localStorage.setItem(`${QUALITY_STORAGE_KEY}:recovery:${Date.now()}`, rawState);
  }
  return saveQualityState(migrateQualityState({ boats: [] }));
}
export function saveQualityState(state) { window.localStorage.setItem(QUALITY_STORAGE_KEY, JSON.stringify(state)); return state; }
export function hydrateQualityReferenceAudits(referenceAudits) {
  const state = loadQualityState();
  if ((state.referenceDataVersion || 0) >= REFERENCE_DATA_VERSION) return state;
  const byId = new Map(state.boats.map((boat) => [boat.id, boat]));
  (referenceAudits || []).forEach((reference) => {
    const existing = byId.get(reference.id);
    if (!existing) { byId.set(reference.id, { ...reference, pendingSync: false, deletedDefectIds: [], deletedAreaNames: [] }); return; }
    const existingDefectIds = new Set((existing.defects || []).map((defect) => defect.id));
    byId.set(reference.id, {
      ...reference,
      ...existing,
      model: reference.model,
      areas: [...new Set([...(reference.areas || []), ...(existing.areas || [])])],
      areaInspectors: { ...(reference.areaInspectors || {}), ...(existing.areaInspectors || {}) },
      defects: [...(reference.defects || []).filter((defect) => !existingDefectIds.has(defect.id)), ...(existing.defects || [])],
      pendingSync: Boolean(existing.pendingSync),
      deletedDefectIds: existing.deletedDefectIds || [],
      deletedAreaNames: existing.deletedAreaNames || []
    });
  });
  return saveQualityState({ ...state, boats: [...byId.values()].sort(compareBoatsDescending), referenceDataVersion: REFERENCE_DATA_VERSION });
}
export function createQualityBoat(name) {
  const state = loadQualityState();
  const now = new Date().toISOString();
  state.boats.unshift({ id: makeId("boat"), name, model: name.slice(0, 2), areas: [], areaInspectors: {}, completedAreas: [], defects: [], pendingSync: true, deletedDefectIds: [], deletedAreaNames: [], createdAt: now, updatedAt: now });
  return saveQualityState(state);
}
export function updateQualityBoat(nextBoat) {
  const state = loadQualityState();
  const previous = state.boats.find((boat) => boat.id === nextBoat.id);
  const nextDefectIds = new Set((nextBoat.defects || []).map((defect) => defect.id));
  const nextAreas = new Set(nextBoat.areas || []);
  const removedDefects = (previous?.defects || []).filter((defect) => !nextDefectIds.has(defect.id)).map((defect) => defect.id);
  const removedAreas = (previous?.areas || []).filter((area) => !nextAreas.has(area));
  state.boats = state.boats.map((boat) => boat.id === nextBoat.id ? { ...nextBoat, model: String(nextBoat.name || "").slice(0, 2), pendingSync: true, deletedDefectIds: [...new Set([...(boat.deletedDefectIds || []), ...removedDefects])], deletedAreaNames: [...new Set([...(boat.deletedAreaNames || []), ...removedAreas])], updatedAt: new Date().toISOString() } : boat);
  saveQualityState(state);
  return state.boats.find((boat) => boat.id === nextBoat.id);
}
export function deleteQualityBoat(boatId) { const state = loadQualityState(); state.boats = state.boats.filter((boat) => boat.id !== boatId); state.deletedBoatIds = [...new Set([...(state.deletedBoatIds || []), boatId])]; return saveQualityState(state); }
export function markQualityBoatSynced(boatId) { const state = loadQualityState(); state.boats = state.boats.map((boat) => boat.id === boatId ? { ...boat, pendingSync: false, deletedDefectIds: [], deletedAreaNames: [] } : boat); return saveQualityState(state); }
export function clearDeletedQualityBoat(boatId) { const state = loadQualityState(); state.deletedBoatIds = (state.deletedBoatIds || []).filter((id) => id !== boatId); return saveQualityState(state); }
export function mergeQualityStates(localState, remoteBoats, options = {}) {
  const deleted = new Set(localState.deletedBoatIds || []);
  const merged = new Map((remoteBoats || []).filter((boat) => !deleted.has(boat.id)).map((boat) => [boat.id, boat]));
  (localState.boats || []).forEach((localBoat) => {
    const remoteBoat = merged.get(localBoat.id);
    const localIsNewer = new Date(localBoat.updatedAt || 0) >= new Date(remoteBoat?.updatedAt || 0);
    if (localBoat.pendingSync || (!options.remoteComplete && (!remoteBoat || localIsNewer))) merged.set(localBoat.id, localBoat);
  });
  return saveQualityState({ ...localState, boats: [...merged.values()].sort(compareBoatsDescending) });
}
export function findQualityBoat(boatId) { return loadQualityState().boats.find((boat) => boat.id === boatId) || null; }
export function codeDiscipline(code) { return QUALITY_CODE_DISCIPLINES[Number(code)] || ""; }
export function newQualityDefect(values) { const now = new Date().toISOString(); return { id: makeId("defect"), ...values, createdAt: now, updatedAt: now }; }
