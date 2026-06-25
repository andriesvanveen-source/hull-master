export const DISCIPLINES = ["PLUM", "ELEC", "MECH", "FA", "DECK", "CARP", "FIN"];

export const BOAT_MODELS = ["B5", "B8", "B9", "C1", "C2", "C5"];

export const BOAT_NAME_PATTERN = /^(B5|B8|B9|C1|C2|C5)\d{3}$/;

export const COMMISSIONING_ENGINEER_PLACEHOLDER = "Commissioning Engineer";

export const COMMISSIONING_ENGINEERS = [
  "Martin Lourens",
  "Ricky Samuels",
  "Machiel Botha",
  "Kurt Carpenter",
  "Andries Van Veen"
];

export const GENERAL_AREA = "General";

export const DEFAULT_BOAT_AREAS = [
  "Saloon",
  "Stbd Aft Cabin/Heads",
  "Port Fwd Cabin/Heads",
  "Port Aft Cabin/Heads",
  "Stbd Engine Room",
  "Port Engine Room",
  "Aft Cockpit",
  "Fwd Cockpit",
  "Foredeck, Port & Stbd Side Deck, Flybridge",
  GENERAL_AREA
];

export const COMMON_DEFECT_AREAS = [
  "Saloon",
  "Stbd Fwd Cabin/Heads",
  "Stbd Mid Cabin/Heads",
  "Stbd Aft Cabin/Heads",
  "Port Fwd Cabin/Heads",
  "Port Mid Cabin/Heads",
  "Port Aft Cabin/Heads",
  "Crew Cabin/Heads",
  "Stbd Passage",
  "Port Passage",
  "Passage",
  "Stbd Engine Room",
  "Port Engine Room",
  "Aft Cockpit",
  "Fwd Cockpit",
  "Flybridge",
  "Foredeck, Port & Stbd Side Deck, Flybridge",
  GENERAL_AREA
];

export const COMMON_DEFECT_AREA_ALIASES = {
  "Fwd Cockpit Lounge & Deck": [
    "Fwd Cockpit",
    "Foredeck, Port & Stbd Side Deck, Flybridge"
  ],
  "Crew Cabin": ["Crew Cabin/Heads"],
  "Stbd Engine": ["Stbd Engine Room"],
  "Port Engine": ["Port Engine Room"],
  "Stbd Fwd Cabin & Heads": ["Stbd Fwd Cabin/Heads"],
  "Stbd Mid Cabin & Heads": ["Stbd Mid Cabin/Heads"],
  "Stbd Aft Cabin & Heads": ["Stbd Aft Cabin/Heads"],
  "Port Fwd Cabin & Heads": ["Port Fwd Cabin/Heads"],
  "Port Mid Cabin & Heads": ["Port Mid Cabin/Heads"],
  "Port Aft Cabin & Heads": ["Port Aft Cabin/Heads"]
};

export const LEGACY_BOAT_AREAS = [
  "Saloon",
  "Aft Cockpit",
  "Fwd Cockpit Lounge & Deck",
  "Stbd Engine",
  "Port Engine",
  "Stbd Fwd Cabin & Heads",
  "Stbd Mid Cabin & Heads",
  "Stbd Aft Cabin & Heads",
  "Port Fwd Cabin & Heads",
  "Port Mid Cabin & Heads",
  "Port Aft Cabin & Heads",
  "Crew Cabin"
];

export const BOAT_AREAS = LEGACY_BOAT_AREAS;

export function isGeneralArea(area) {
  return String(area || "").trim().toLowerCase() === GENERAL_AREA.toLowerCase();
}

export function getCommonDefectAreaNames(area) {
  const normalizedArea = String(area || "").trim();

  if (!normalizedArea) {
    return [];
  }

  const aliases = Object.entries(COMMON_DEFECT_AREA_ALIASES)
    .find(([legacyArea]) => legacyArea.toLowerCase() === normalizedArea.toLowerCase())?.[1] || [];

  return [normalizedArea, ...aliases].filter((item, index, list) => (
    item && list.findIndex((candidate) => candidate.toLowerCase() === item.toLowerCase()) === index
  ));
}

export function orderBoatAreas(areas) {
  if (!Array.isArray(areas)) {
    return [GENERAL_AREA];
  }

  const orderedAreas = [];

  areas.forEach((area) => {
    const normalizedArea = String(area || "").trim();

    if (!normalizedArea || isGeneralArea(normalizedArea)) {
      return;
    }

    if (!orderedAreas.some((item) => item.toLowerCase() === normalizedArea.toLowerCase())) {
      orderedAreas.push(normalizedArea);
    }
  });

  orderedAreas.push(GENERAL_AREA);
  return orderedAreas;
}

export function getBoatAreas(boat) {
  if (Array.isArray(boat?.areas) && boat.areas.length > 0) {
    return orderBoatAreas(boat.areas);
  }

  const areas = [...LEGACY_BOAT_AREAS];

  if (Array.isArray(boat?.defects)) {
    boat.defects.forEach((defect) => {
      if (defect.area && !areas.includes(defect.area)) {
        areas.push(defect.area);
      }
    });
  }

  return orderBoatAreas(areas);
}

export const STORAGE_KEY = "hull-master-state-v1";
