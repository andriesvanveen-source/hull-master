"use client";

import { STORAGE_KEY } from "./constants";

const emptyState = {
  boats: []
};

export function loadState() {
  if (typeof window === "undefined") {
    return emptyState;
  }

  try {
    const raw = window.localStorage.getItem(STORAGE_KEY);
    if (!raw) {
      return emptyState;
    }

    const parsed = JSON.parse(raw);
    return {
      boats: Array.isArray(parsed.boats) ? parsed.boats : []
    };
  } catch {
    return emptyState;
  }
}

export function saveState(state) {
  if (typeof window === "undefined") {
    return;
  }

  window.localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
}

export function createBoat(name) {
  const normalizedName = name.trim().toUpperCase();

  return {
    id: `${normalizedName}-${Date.now()}`,
    name: normalizedName,
    createdAt: new Date().toISOString(),
    defects: []
  };
}

export function createDefect({ text, discipline, area }) {
  return {
    id: `DEF-${Date.now()}-${Math.random().toString(16).slice(2)}`,
    text: text.trim(),
    discipline,
    area,
    createdAt: new Date().toISOString()
  };
}
