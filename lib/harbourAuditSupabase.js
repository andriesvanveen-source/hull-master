"use client";

import { getSupabaseConfigurationError, supabase } from "./supabase";

const PHOTO_BUCKET = "harbour-audit-photos";

function ensureSupabase() {
  if (!supabase) throw new Error(getSupabaseConfigurationError());
}

async function urlToDataUrl(url) {
  const response = await fetch(url);
  if (!response.ok) throw new Error("A shared audit photo could not be downloaded.");
  const blob = await response.blob();
  return await new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = () => reject(reader.error);
    reader.readAsDataURL(blob);
  });
}

async function mapRemotePhoto(photo) {
  const { data } = supabase.storage.from(PHOTO_BUCKET).getPublicUrl(photo.image_path);
  return {
    id: photo.id,
    name: photo.file_name || "Audit photo.jpg",
    dataUrl: await urlToDataUrl(data.publicUrl)
  };
}

export async function loadSharedHarbourAudits() {
  ensureSupabase();
  const { data, error } = await supabase
    .from("harbour_audits")
    .select("id,title,auditor,created_label,created_at,updated_at,harbour_audit_defects(id,description,created_at,updated_at,harbour_audit_photos(id,file_name,image_path,created_at))")
    .order("updated_at", { ascending: false });

  if (error) throw error;

  return await Promise.all((data || []).map(async (audit) => ({
    id: audit.id,
    title: audit.title,
    auditor: audit.auditor || "",
    createdAt: audit.created_label || new Date(audit.created_at).toLocaleDateString("en-GB"),
    updatedAt: audit.updated_at,
    defects: await Promise.all((audit.harbour_audit_defects || []).map(async (defect) => ({
      id: defect.id,
      description: defect.description,
      updatedAt: defect.updated_at,
      photos: (await Promise.all((defect.harbour_audit_photos || []).map(async (photo) => {
        try {
          return await mapRemotePhoto(photo);
        } catch {
          return null;
        }
      }))).filter(Boolean)
    })))
  })));
}

function dataUrlToBlob(dataUrl) {
  const [metadata, encoded] = dataUrl.split(",");
  const mimeType = metadata.match(/data:([^;]+)/)?.[1] || "image/jpeg";
  const binary = window.atob(encoded || "");
  const bytes = new Uint8Array(binary.length);
  for (let index = 0; index < binary.length; index += 1) bytes[index] = binary.charCodeAt(index);
  return new Blob([bytes], { type: mimeType });
}

export async function syncHarbourAudit(audit) {
  ensureSupabase();
  const updatedAt = audit.updatedAt || new Date().toISOString();
  const { error: auditError } = await supabase.from("harbour_audits").upsert({
    id: audit.id,
    title: audit.title,
    auditor: audit.auditor || "",
    created_label: audit.createdAt || "",
    updated_at: updatedAt
  }, { onConflict: "id" });
  if (auditError) throw auditError;

  for (const defect of audit.defects || []) {
    const { error: defectError } = await supabase.from("harbour_audit_defects").upsert({
      id: defect.id,
      audit_id: audit.id,
      description: defect.description,
      updated_at: defect.updatedAt || updatedAt
    }, { onConflict: "id" });
    if (defectError) throw defectError;

    for (const photo of defect.photos || []) {
      if (!photo.dataUrl) continue;
      const imagePath = `${audit.id}/${defect.id}/${photo.id}.jpg`;
      const { error: uploadError } = await supabase.storage
        .from(PHOTO_BUCKET)
        .upload(imagePath, dataUrlToBlob(photo.dataUrl), { contentType: "image/jpeg", upsert: true });
      if (uploadError) throw uploadError;

      const { error: photoError } = await supabase.from("harbour_audit_photos").upsert({
        id: photo.id,
        defect_id: defect.id,
        file_name: photo.name || "Audit photo.jpg",
        image_path: imagePath
      }, { onConflict: "id" });
      if (photoError) throw photoError;
    }

    // Prune only photos that were deliberately replaced in this local edit.
    // Existing multi-photo defects remain untouched until a user edits them.
    const currentPhotoIds = new Set((defect.photos || []).map((photo) => photo.id));
    const { data: storedPhotos, error: storedPhotosError } = await supabase
      .from("harbour_audit_photos")
      .select("id,image_path")
      .eq("defect_id", defect.id);
    if (storedPhotosError) throw storedPhotosError;
    const stalePhotos = (storedPhotos || []).filter((photo) => !currentPhotoIds.has(photo.id));
    if (stalePhotos.length) {
      const stalePaths = stalePhotos.map((photo) => photo.image_path).filter(Boolean);
      if (stalePaths.length) {
        const { error: removeError } = await supabase.storage.from(PHOTO_BUCKET).remove(stalePaths);
        if (removeError) throw removeError;
      }
      const { error: staleRowsError } = await supabase
        .from("harbour_audit_photos")
        .delete()
        .in("id", stalePhotos.map((photo) => photo.id));
      if (staleRowsError) throw staleRowsError;
    }
  }
}

export async function deleteSharedHarbourAudit(audit) {
  ensureSupabase();
  const paths = (audit.defects || []).flatMap((defect) => (defect.photos || []).map((photo) => (
    `${audit.id}/${defect.id}/${photo.id}.jpg`
  )));
  if (paths.length) await supabase.storage.from(PHOTO_BUCKET).remove(paths);
  const { error } = await supabase.from("harbour_audits").delete().eq("id", audit.id);
  if (error) throw error;
}

export function subscribeToHarbourAuditChanges(onChange) {
  if (!supabase) return () => {};
  const channel = supabase
    .channel(`harbour-audits-${Math.random()}`)
    .on("postgres_changes", { event: "*", schema: "public", table: "harbour_audits" }, onChange)
    .on("postgres_changes", { event: "*", schema: "public", table: "harbour_audit_defects" }, onChange)
    .on("postgres_changes", { event: "*", schema: "public", table: "harbour_audit_photos" }, onChange)
    .subscribe();
  return () => supabase.removeChannel(channel);
}
