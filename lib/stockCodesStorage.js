"use client";

import { getSupabaseConfigurationError, supabase } from "./supabase";

const CACHE_KEY = "hull-master:stock-codes:v1";

export const DEFAULT_STOCK_CATEGORIES = [
  { id: "10000000-0000-4000-8000-000000000001", name: "Electrical" },
  { id: "10000000-0000-4000-8000-000000000002", name: "Plumbing" },
  { id: "10000000-0000-4000-8000-000000000003", name: "Mechanical" },
  { id: "10000000-0000-4000-8000-000000000004", name: "Skipper's pack" },
  { id: "10000000-0000-4000-8000-000000000005", name: "Other" }
];

function readCache() {
  try {
    const cached = JSON.parse(window.localStorage.getItem(CACHE_KEY) || "null");
    return {
      categories: Array.isArray(cached?.categories) ? cached.categories : [],
      items: Array.isArray(cached?.items) ? cached.items : [],
      deletedItems: Array.isArray(cached?.deletedItems) ? cached.deletedItems : []
    };
  } catch {
    return { categories: [], items: [], deletedItems: [] };
  }
}

function writeCache(state) {
  window.localStorage.setItem(CACHE_KEY, JSON.stringify(state));
}

function ensureDefaultCategories(categories) {
  const names = new Set(categories.map((category) => category.name.toLowerCase()));
  return [
    ...categories,
    ...DEFAULT_STOCK_CATEGORIES
      .filter((category) => !names.has(category.name.toLowerCase()))
      .map((category) => ({ ...category, pendingSync: false }))
  ];
}

function mapCategory(row) {
  return { id: row.id, name: row.name || "", pendingSync: false };
}

function mapItem(row) {
  return {
    id: row.id,
    stockCode: row.stock_code || "",
    description: row.description || "",
    searchTerms: Array.isArray(row.search_terms) ? row.search_terms : [],
    categoryId: row.category_id || "",
    categoryName: row.stock_categories?.name || "Other",
    imageDataUrl: row.image_url || "",
    imagePath: row.image_path || "",
    pendingSync: false,
    createdAt: row.created_at || new Date().toISOString()
  };
}

function mergeById(remoteRows, localRows) {
  const merged = new Map(remoteRows.map((row) => [row.id, row]));
  localRows.filter((row) => row.pendingSync).forEach((row) => merged.set(row.id, row));
  return [...merged.values()];
}

export function loadCachedStockState() {
  const cached = readCache();
  return { ...cached, categories: ensureDefaultCategories(cached.categories) };
}

export async function loadStockState() {
  const cached = loadCachedStockState();
  if (!supabase) return cached;

  const [{ data: categories, error: categoryError }, { data: items, error: itemError }] = await Promise.all([
    supabase.from("stock_categories").select("id,name").order("name"),
    supabase
      .from("stock_items")
      .select("id,stock_code,description,search_terms,category_id,image_path,image_url,created_at,stock_categories(name)")
      .order("stock_code")
  ]);

  if (categoryError) throw categoryError;
  if (itemError) throw itemError;

  const nextState = {
    categories: ensureDefaultCategories(mergeById((categories || []).map(mapCategory), cached.categories)),
    items: mergeById((items || []).map(mapItem), cached.items)
      .filter((item) => !cached.deletedItems.some((deleted) => deleted.id === item.id)),
    deletedItems: cached.deletedItems
  };
  writeCache(nextState);
  return nextState;
}

export function saveStockStateLocally(state) {
  writeCache(state);
}

export async function syncCategory(category) {
  if (!supabase) throw new Error(getSupabaseConfigurationError());

  const { data, error } = await supabase
    .from("stock_categories")
    .upsert({ id: category.id, name: category.name }, { onConflict: "id" })
    .select("id,name")
    .single();

  if (error) throw error;
  return mapCategory(data);
}

function dataUrlToBlob(dataUrl) {
  const [header, encoded] = dataUrl.split(",");
  const mimeType = header.match(/data:(.*?);/)?.[1] || "image/jpeg";
  const bytes = window.atob(encoded);
  const values = new Uint8Array(bytes.length);
  for (let index = 0; index < bytes.length; index += 1) values[index] = bytes.charCodeAt(index);
  return new Blob([values], { type: mimeType });
}

export async function syncStockItem(item) {
  if (!supabase) throw new Error(getSupabaseConfigurationError());

  let imagePath = item.imagePath || "";
  let imageUrl = item.imageDataUrl || "";

  if (item.imageDataUrl?.startsWith("data:")) {
    imagePath = `${item.id}/photo.jpg`;
    const { error: uploadError } = await supabase.storage
      .from("stock-item-images")
      .upload(imagePath, dataUrlToBlob(item.imageDataUrl), { contentType: "image/jpeg", upsert: true });
    if (uploadError) throw uploadError;
    imageUrl = supabase.storage.from("stock-item-images").getPublicUrl(imagePath).data.publicUrl;
  }

  const { data, error } = await supabase
    .from("stock_items")
    .upsert({
      id: item.id,
      stock_code: item.stockCode,
      description: item.description,
      search_terms: item.searchTerms,
      category_id: item.categoryId,
      image_path: imagePath || null,
      image_url: imageUrl || null
    }, { onConflict: "id" })
    .select("id,stock_code,description,search_terms,category_id,image_path,image_url,created_at,stock_categories(name)")
    .single();

  if (error) throw error;
  return mapItem(data);
}

export async function syncDeleteStockItem(item) {
  if (!supabase) throw new Error(getSupabaseConfigurationError());

  const { error } = await supabase.from("stock_items").delete().eq("id", item.id);
  if (error) throw error;

  if (item.imagePath) {
    const { error: imageError } = await supabase.storage.from("stock-item-images").remove([item.imagePath]);
    if (imageError) throw imageError;
  }
}

export async function compressStockPhoto(file) {
  const source = URL.createObjectURL(file);
  try {
    const image = await new Promise((resolve, reject) => {
      const element = new Image();
      element.onload = () => resolve(element);
      element.onerror = reject;
      element.src = source;
    });
    const scale = Math.min(1, 1200 / Math.max(image.naturalWidth, image.naturalHeight));
    const canvas = document.createElement("canvas");
    canvas.width = Math.max(1, Math.round(image.naturalWidth * scale));
    canvas.height = Math.max(1, Math.round(image.naturalHeight * scale));
    canvas.getContext("2d").drawImage(image, 0, 0, canvas.width, canvas.height);
    return canvas.toDataURL("image/jpeg", 0.76);
  } finally {
    URL.revokeObjectURL(source);
  }
}
