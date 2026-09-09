"use client";

export const QUALITY_STORAGE_KEY = "hull-master:quality-control:v1";
export const QUALITY_CODE_DISCIPLINES = { 1: "Exterior", 2: "Lockers", 3: "Saloon", 4: "Deckfitting", 5: "Plumbing", 6: "Mechanical", 7: "Electrical", 8: "Perspex", 9: "Spray Painting", 10: "Cleaning" };

const sampleAreas = {
  Saloon: [["Drawer Locker", "Operational Defect", "Drawer does not close smoothly", 3], ["Nav Desk", "Loose", "Nav desk lid hinge is loose", 3], ["Galley Lockers", "Misaligned", "Locker doors are stepping", 3], ["Floor", "Sealing Defect", "Floor joint requires sealing", 3], ["Window Surround", "Scratched / Chafing", "Scratch on window surround", 1]],
  "Aft Cockpit": [["Helm Station", "Finish Defect", "Poor finish on helm station", 1], ["Locker Lid", "Loose", "Locker lid hinge is loose", 4], ["Transom", "Damaged", "Chip on transom edge", 1], ["Table", "Misaligned", "Table top is not level", 4], ["Floor", "Requires Cleaning", "Residue on cockpit floor", 10]],
  Flybridge: [["Bimini", "Finish Defect", "Visible finish marks on bimini", 1], ["Helm Seat", "Loose", "Helm seat mounting is loose", 4], ["Window", "Scratched / Chafing", "Scratch on flybridge screen", 8], ["Console", "Sealing Defect", "Seal around console requires attention", 4], ["Light", "Not Working", "Overhead light does not work", 7]],
  "Port Fwd Cabin": [["Cabin Door", "Operational Defect", "Door does not latch correctly", 3], ["Window Blind", "Misaligned", "Blind does not run evenly", 3], ["Floorboard", "Creaking", "Floorboard creaks when walked on", 3], ["Ceiling Liner", "Damaged", "Mark on ceiling liner", 3], ["AC Outlet", "Loose", "Outlet is loose at mounting", 7]],
  "Stbd Engine Room": [["Engine Room", "Missing / Not Fitted", "Cable clamp is not fitted", 6], ["Engine Harness", "Loose", "Harness requires securing", 7], ["Sound Deadening Panel", "Damaged", "Sound seal panel is damaged", 6], ["Fuel Pipe", "Loose", "Fuel pipe clamp is loose", 6], ["Bilge", "Requires Cleaning", "Debris found in bilge", 10]]
};

function makeId(prefix = "qc") { return `${prefix}-${Date.now()}-${Math.random().toString(36).slice(2, 9)}`; }
function createSampleBoat() {
  const now = new Date().toISOString();
  const defects = Object.entries(sampleAreas).flatMap(([area, rows]) => rows.map(([item, failure, description, code]) => ({ id: makeId("defect"), area, item, failure, description, code, discipline: QUALITY_CODE_DISCIPLINES[code], createdAt: now, updatedAt: now })));
  return { id: "generic-quality-audit", name: "QC-DEMO-001", qualityController: "Generic User", areas: Object.keys(sampleAreas), completedAreas: [], defects, createdAt: now, updatedAt: now };
}

export function loadQualityState() {
  try {
    const saved = JSON.parse(window.localStorage.getItem(QUALITY_STORAGE_KEY) || "null");
    if (Array.isArray(saved?.boats)) return saved;
  } catch { window.localStorage.removeItem(QUALITY_STORAGE_KEY); }
  return saveQualityState({ boats: [createSampleBoat()] });
}
export function saveQualityState(state) { window.localStorage.setItem(QUALITY_STORAGE_KEY, JSON.stringify(state)); return state; }
export function createQualityBoat(name, qualityController = "") {
  const state = loadQualityState();
  const now = new Date().toISOString();
  state.boats.unshift({ id: makeId("boat"), name, qualityController, areas: [], completedAreas: [], defects: [], createdAt: now, updatedAt: now });
  return saveQualityState(state);
}
export function updateQualityBoat(nextBoat) {
  const state = loadQualityState();
  state.boats = state.boats.map((boat) => boat.id === nextBoat.id ? { ...nextBoat, updatedAt: new Date().toISOString() } : boat);
  saveQualityState(state);
  return state.boats.find((boat) => boat.id === nextBoat.id);
}
export function deleteQualityBoat(boatId) { const state = loadQualityState(); state.boats = state.boats.filter((boat) => boat.id !== boatId); return saveQualityState(state); }
export function findQualityBoat(boatId) { return loadQualityState().boats.find((boat) => boat.id === boatId) || null; }
export function codeDiscipline(code) { return QUALITY_CODE_DISCIPLINES[Number(code)] || ""; }
export function newQualityDefect(values) { const now = new Date().toISOString(); return { id: makeId("defect"), ...values, createdAt: now, updatedAt: now }; }
