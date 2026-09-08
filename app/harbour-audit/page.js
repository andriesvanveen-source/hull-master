"use client";

import { ArrowLeft, Camera, Download, FileImage, FileText, Pencil, Plus, Ship, Trash2, X } from "lucide-react";
import { useEffect, useMemo, useRef, useState } from "react";
import jsPDF from "jspdf";
import HomeBackButton from "../components/HomeBackButton";
import { COMMISSIONING_ENGINEERS } from "../../lib/constants";
import {
  deleteSharedHarbourAudit,
  loadSharedHarbourAudits,
  subscribeToHarbourAuditChanges,
  syncHarbourAudit
} from "../../lib/harbourAuditSupabase";

const STORAGE_KEY = "harbour-audit-buddy-audits";
const DATABASE_NAME = "harbour-audit-buddy";
const DATABASE_VERSION = 1;
const DATABASE_STORE = "audit-state";
let auditSaveQueue = Promise.resolve();
let pdfLogoPromise;

function loadPdfLogo() {
  if (!pdfLogoPromise) {
    pdfLogoPromise = fetch("/robertson-caine-logo-transparent.png")
      .then((response) => {
        if (!response.ok) throw new Error("The PDF logo could not be loaded.");
        return response.blob();
      })
      .then(
        (blob) =>
          new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onload = () => resolve(reader.result);
            reader.onerror = () => reject(reader.error);
            reader.readAsDataURL(blob);
          })
      );
  }
  return pdfLogoPromise;
}

function openAuditDatabase() {
  return new Promise((resolve, reject) => {
    const request = window.indexedDB.open(DATABASE_NAME, DATABASE_VERSION);
    request.onupgradeneeded = () => {
      const database = request.result;
      if (!database.objectStoreNames.contains(DATABASE_STORE)) {
        database.createObjectStore(DATABASE_STORE);
      }
    };
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

async function loadAuditsLocally() {
  const database = await openAuditDatabase();
  try {
    return await new Promise((resolve, reject) => {
      const transaction = database.transaction(DATABASE_STORE, "readonly");
      const request = transaction.objectStore(DATABASE_STORE).get(STORAGE_KEY);
      request.onsuccess = () => resolve(Array.isArray(request.result) ? request.result : null);
      request.onerror = () => reject(request.error);
    });
  } finally {
    database.close();
  }
}

async function saveAuditsLocally(audits) {
  const database = await openAuditDatabase();
  try {
    await new Promise((resolve, reject) => {
      const transaction = database.transaction(DATABASE_STORE, "readwrite");
      transaction.objectStore(DATABASE_STORE).put(audits, STORAGE_KEY);
      transaction.oncomplete = () => resolve();
      transaction.onerror = () => reject(transaction.error);
      transaction.onabort = () => reject(transaction.error);
    });
  } finally {
    database.close();
  }
}

function queueAuditSave(audits) {
  auditSaveQueue = auditSaveQueue.catch(() => undefined).then(() => saveAuditsLocally(audits));
  return auditSaveQueue;
}

function todayText() {
  return new Intl.DateTimeFormat("en-GB", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric"
  }).format(new Date());
}

function uid() {
  return globalThis.crypto?.randomUUID ? globalThis.crypto.randomUUID() : `${Date.now()}-${Math.random()}`;
}

function normalizePhoto(dataUrl) {
  return new Promise((resolve, reject) => {
    const image = new Image();
    image.onload = () => {
      const maxSide = 1600;
      const scale = Math.min(1, maxSide / Math.max(image.naturalWidth, image.naturalHeight));
      const canvas = document.createElement("canvas");
      canvas.width = Math.max(1, Math.round(image.naturalWidth * scale));
      canvas.height = Math.max(1, Math.round(image.naturalHeight * scale));
      const context = canvas.getContext("2d");
      context.fillStyle = "#ffffff";
      context.fillRect(0, 0, canvas.width, canvas.height);
      context.drawImage(image, 0, 0, canvas.width, canvas.height);
      resolve(canvas.toDataURL("image/jpeg", 0.86));
    };
    image.onerror = reject;
    image.src = dataUrl;
  });
}

async function readFiles(files) {
  return Promise.all(
    Array.from(files || []).map(
      (file) =>
        new Promise((resolve, reject) => {
          const reader = new FileReader();
          reader.onload = async () => {
            try {
              resolve({
                id: uid(),
                name: file.name,
                dataUrl: await normalizePhoto(reader.result)
              });
            } catch {
              reject(new Error("One of the selected photos could not be read."));
            }
          };
          reader.onerror = reject;
          reader.readAsDataURL(file);
        })
    )
  );
}

function imageFormat(dataUrl) {
  return "JPEG";
}

function drawSignoffTable(doc, x, y, width, height, logoDataUrl) {
  const titleH = 34;
  const headerH = 18;
  const colW = width / 3;
  const titleY = y + titleH;
  const headerY = titleY + headerH;

  doc.setFillColor(255, 255, 255);
  doc.setDrawColor(0, 0, 0);
  doc.setLineWidth(0.55);
  doc.rect(x, y, width, height, "FD");
  doc.line(x, titleY, x + width, titleY);
  doc.line(x, headerY, x + width, headerY);
  doc.line(x + colW, titleY, x + colW, y + height);
  doc.line(x + colW * 2, titleY, x + colW * 2, y + height);

  const logoSize = 28;
  const titleText = "R&C Sign Off";
  const disciplineText = "Discipline:";
  doc.setFont("times", "bold");
  doc.setFontSize(10);
  const titleWidth = doc.getTextWidth(titleText);
  doc.setFontSize(6.2);
  const disciplineWidth = doc.getTextWidth(disciplineText);
  const lineWidth = Math.min(72, Math.max(38, width * 0.22));
  const groupWidth = logoSize + 7 + titleWidth + 8 + disciplineWidth + 6 + lineWidth;
  const groupX = x + Math.max(5, (width - groupWidth) / 2);
  const baseline = y + 21.5;

  if (logoDataUrl) {
    doc.addImage(logoDataUrl, "PNG", groupX, y + (titleH - logoSize) / 2, logoSize, logoSize);
  }

  doc.setTextColor(0, 0, 0);
  doc.setFont("times", "bold");
  doc.setFontSize(10);
  doc.text(titleText, groupX + logoSize + 7, baseline);
  doc.setFontSize(6.2);
  const disciplineX = groupX + logoSize + 7 + titleWidth + 8;
  doc.text(disciplineText, disciplineX, baseline);
  const lineX = disciplineX + disciplineWidth + 8;
  doc.line(lineX, baseline, Math.min(lineX + lineWidth, x + width - 4), baseline);

  doc.setFont("times", "bold");
  doc.setFontSize(6.6);
  ["Team Member", "Team Leader", "CE / QC"].forEach((label, index) => {
    doc.text(label, x + colW * index + colW / 2, titleY + 11.5, { align: "center" });
  });

  doc.setFont("times", "normal");
  doc.setFontSize(6.2);
  [0, 1, 2].forEach((index) => {
    doc.text("Date:", x + colW * index + 4, y + height - 6);
  });
}

function ensurePdfSpace(doc, y, neededHeight, margin) {
  const pageH = doc.internal.pageSize.getHeight();
  if (y + neededHeight <= pageH - margin) {
    return y;
  }

  doc.addPage();
  return margin;
}

function addPhotoDefect(doc, defect, defectNumber, y, layout, logoDataUrl) {
  const { margin, pageW, photoW, tableH } = layout;
  const rightX = margin + photoW + 28;
  const rightW = pageW - rightX - margin;

  for (const [photoIndex, photo] of defect.photos.entries()) {
    const size = doc.getImageProperties(photo.dataUrl);
    const photoH = Math.min(235, photoW * (size.height / size.width));
    const headingH = photoIndex === 0 ? 52 : 0;
    const rowH = Math.max(photoH, headingH + tableH);
    y = ensurePdfSpace(doc, y, rowH + 24, margin);

    doc.addImage(photo.dataUrl, imageFormat(photo.dataUrl), margin, y, photoW, photoH);

    let rightY = y + 10;
    if (photoIndex === 0) {
      doc.setTextColor(0, 0, 0);
      doc.setFont("helvetica", "bold");
      doc.setFontSize(12);
      doc.text(`Defect ${defectNumber}`, rightX, rightY);
      rightY += 20;

      doc.setFont("helvetica", "normal");
      doc.setFontSize(12);
      const lines = doc.splitTextToSize(defect.description || "No description", rightW);
      doc.text(lines, rightX, rightY);
      rightY += lines.length * 14 + 28;
    }

    const tableY = Math.max(y, rightY);
    drawSignoffTable(doc, rightX, tableY, rightW, tableH, logoDataUrl);
    y += Math.max(photoH, tableY - y + tableH) + 24;
  }

  return y;
}

function addNoPhotoDefect(doc, defect, defectNumber, y, layout, logoDataUrl) {
  const { margin, pageW, tableH } = layout;
  const tableW = Math.min(350, pageW - margin * 2 - 170);
  const tableX = pageW - margin - tableW;
  const leftW = tableX - margin - 34;
  y = ensurePdfSpace(doc, y, tableH + 28, margin);

  doc.setTextColor(0, 0, 0);
  doc.setFont("helvetica", "normal");
  doc.setFontSize(12);
  const lines = doc.splitTextToSize(`${defectNumber}. ${defect.description || "No description"}`, leftW);
  doc.text(lines, margin, y + 17);
  drawSignoffTable(doc, tableX, y, tableW, tableH, logoDataUrl);

  return y + Math.max(tableH, lines.length * 14) + 18;
}

async function exportAuditPdf(audit) {
  const doc = new jsPDF({ unit: "pt", format: "a4" });
  const pageW = doc.internal.pageSize.getWidth();
  const margin = 46;
  const layout = {
    margin,
    pageW,
    photoW: 150,
    tableH: 105
  };
  const logoDataUrl = await loadPdfLogo();

  const photoDefects = audit.defects.filter((defect) => defect.photos.length > 0);
  const noPhotoDefects = audit.defects.filter((defect) => defect.photos.length === 0);

  doc.setFont("helvetica", "bold");
  doc.setFontSize(22);
  doc.text(audit.title, pageW / 2, 50, { align: "center" });
  doc.setFont("helvetica", "normal");
  doc.setFontSize(12);
  doc.setTextColor(0, 0, 0);
  doc.text(`Generated: ${audit.createdAt}`, pageW / 2, 78, { align: "center" });
  doc.text(`Audited by: ${audit.auditor || "Not specified"}`, pageW / 2, 96, { align: "center" });

  doc.setFont("helvetica", "bold");
  doc.setFontSize(16);
  doc.text("Defects", margin, 130);

  let y = 160;
  let defectNumber = 1;
  for (const defect of photoDefects) {
    y = addPhotoDefect(doc, defect, defectNumber, y, layout, logoDataUrl);
    defectNumber += 1;
  }

  if (noPhotoDefects.length > 0) {
    y = ensurePdfSpace(doc, y, 46, margin);
    y += 6;
    doc.setTextColor(0, 0, 0);
    doc.setFont("helvetica", "bold");
    doc.setFontSize(16);
    doc.text("Additional Defects (No Photos)", margin, y);
    y += 28;
  }

  for (const defect of noPhotoDefects) {
    y = addNoPhotoDefect(doc, defect, defectNumber, y, layout, logoDataUrl);
    defectNumber += 1;
  }

  if (!audit.defects.length) {
    doc.setFont("helvetica", "normal");
    doc.setFontSize(12);
    doc.text("No defects recorded.", margin, y);
  }

  const fileName = `${audit.title} Audit.pdf`.replace(/[\\/:*?"<>|]+/g, "-");
  const pdfBlob = doc.output("blob");
  const pdfFile = new File([pdfBlob], fileName, { type: "application/pdf" });
  const isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent)
    || (navigator.platform === "MacIntel" && navigator.maxTouchPoints > 1);
  const canShareFile = isIOS
    && typeof navigator.share === "function"
    && typeof navigator.canShare === "function"
    && navigator.canShare({ files: [pdfFile] });

  if (canShareFile) {
    await navigator.share({ files: [pdfFile] });
    return;
  }

  doc.save(fileName);
}

export default function HomePage() {
  const fileRef = useRef(null);
  const [audits, setAudits] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [modalOpen, setModalOpen] = useState(false);
  const [newTitle, setNewTitle] = useState("");
  const [newAuditor, setNewAuditor] = useState("");
  const [selectedAuditor, setSelectedAuditor] = useState("all");
  const [activeId, setActiveId] = useState(null);
  const [description, setDescription] = useState("");
  const [photos, setPhotos] = useState([]);
  const [editingDefectId, setEditingDefectId] = useState(null);
  const [editingAuditDetails, setEditingAuditDetails] = useState(false);
  const [auditTitleDraft, setAuditTitleDraft] = useState("");
  const [auditAuditorDraft, setAuditAuditorDraft] = useState("");
  const [error, setError] = useState("");
  const [syncStatus, setSyncStatus] = useState("Loading saved audits...");
  const auditsRef = useRef([]);
  const sharedStartedRef = useRef(false);
  const pendingSyncIds = useRef(new Set());

  useEffect(() => {
    auditsRef.current = audits;
  }, [audits]);

  useEffect(() => {
    let isMounted = true;

    async function loadSavedAudits() {
      try {
        let indexedAudits = [];
        try {
          const storedAudits = await loadAuditsLocally();
          indexedAudits = Array.isArray(storedAudits) ? storedAudits : [];
        } catch {
          // Older/private browsers may deny IndexedDB; still recover any legacy audit list.
        }

        let legacyAudits = [];
        try {
          const legacyValue = window.localStorage.getItem(STORAGE_KEY);
          const parsedLegacyAudits = legacyValue ? JSON.parse(legacyValue) : [];
          legacyAudits = Array.isArray(parsedLegacyAudits) ? parsedLegacyAudits : [];
        } catch {
          // A damaged legacy backup must not prevent valid IndexedDB audits from loading.
        }

        const indexedIds = new Set(indexedAudits.map((audit) => audit.id));
        const savedAudits = [
          ...indexedAudits,
          ...legacyAudits.filter((audit) => !indexedIds.has(audit.id))
        ].map((audit) => ({
          ...audit,
          auditor: audit.auditor || "",
          updatedAt: audit.updatedAt || new Date().toISOString(),
          defects: (audit.defects || []).map((defect) => ({
            ...defect,
            updatedAt: defect.updatedAt || audit.updatedAt || new Date().toISOString()
          }))
        }));

        if (legacyAudits.some((audit) => !indexedIds.has(audit.id))) {
          try {
            await saveAuditsLocally(savedAudits);
          } catch {
            // Keep using the recovered in-memory data if migration is unavailable.
          }
        }

        // Intentionally retain localStorage as a read-only migration backup.
        if (isMounted) {
          setAudits(savedAudits);
          setSyncStatus("Saved locally");
        }
      } catch {
        if (isMounted) {
          setError("Saved audits could not be opened on this browser.");
        }
      } finally {
        if (isMounted) {
          setLoaded(true);
        }
      }
    }

    loadSavedAudits();
    return () => {
      isMounted = false;
    };
  }, []);

  useEffect(() => {
    if (!loaded) {
      return;
    }

    let isCurrent = true;
    queueAuditSave(audits)
      .catch(() => {
        if (isCurrent) {
          setError("This browser could not save the audit locally. Keep this page open and export the PDF before leaving.");
        }
      });

    return () => {
      isCurrent = false;
    };
  }, [audits, loaded]);

  useEffect(() => {
    if (!loaded || sharedStartedRef.current) return;
    sharedStartedRef.current = true;
    let isMounted = true;
    let refreshTimer;

    async function refreshSharedAudits({ migrateLocal = false } = {}) {
      try {
        const remoteAudits = await loadSharedHarbourAudits();
        if (!isMounted) return;
        const localAudits = auditsRef.current;
        const remoteIds = new Set(remoteAudits.map((audit) => audit.id));
        const merged = [
          ...remoteAudits.map((remoteAudit) => {
            const localAudit = localAudits.find((audit) => audit.id === remoteAudit.id);
            if (!localAudit) return remoteAudit;
            const localTime = Date.parse(localAudit.updatedAt || "") || 0;
            const remoteTime = Date.parse(remoteAudit.updatedAt || "") || 0;
            return pendingSyncIds.current.has(remoteAudit.id) || localTime > remoteTime
              ? localAudit
              : remoteAudit;
          }),
          ...localAudits.filter((audit) => !remoteIds.has(audit.id))
        ];
        auditsRef.current = merged;
        setAudits(merged);
        await queueAuditSave(merged);

        if (migrateLocal) {
          const failedAuditTitles = [];
          for (const audit of localAudits) {
            try {
              pendingSyncIds.current.add(audit.id);
              await syncHarbourAudit(audit);
              pendingSyncIds.current.delete(audit.id);
            } catch {
              // Keep the local version protected from stale realtime data. It will
              // be retried on the next load or after the next local edit.
              failedAuditTitles.push(audit.title || "Untitled audit");
            }
          }
          if (failedAuditTitles.length) {
            throw new Error(`${failedAuditTitles.length} locally saved audit${failedAuditTitles.length === 1 ? " is" : "s are"} still waiting to sync.`);
          }
        }
        setError("");
        setSyncStatus("All audits synced");
      } catch (syncError) {
        if (isMounted) {
          setSyncStatus("Saved locally — waiting to sync");
          setError(`Working locally. ${syncError.message || "Run the Harbour Audit Supabase SQL to enable sharing."}`);
        }
      }
    }

    refreshSharedAudits({ migrateLocal: true });
    const unsubscribe = subscribeToHarbourAuditChanges(() => {
      window.clearTimeout(refreshTimer);
      refreshTimer = window.setTimeout(() => refreshSharedAudits(), 250);
    });
    return () => {
      isMounted = false;
      window.clearTimeout(refreshTimer);
      unsubscribe();
    };
  }, [loaded]);

  const activeAudit = useMemo(() => audits.find((audit) => audit.id === activeId), [audits, activeId]);
  const auditorOptions = useMemo(() => [...new Set([
    ...COMMISSIONING_ENGINEERS,
    ...audits.map((audit) => audit.auditor).filter(Boolean)
  ])].sort((a, b) => a.localeCompare(b)), [audits]);
  const visibleAudits = useMemo(() => selectedAuditor === "all"
    ? audits
    : audits.filter((audit) => audit.auditor === selectedAuditor), [audits, selectedAuditor]);

  async function persistAndSync(nextAudits, changedAudit) {
    auditsRef.current = nextAudits;
    setAudits(nextAudits);
    pendingSyncIds.current.add(changedAudit.id);
    try {
      await queueAuditSave(nextAudits);
      setSyncStatus("Saved locally — syncing...");
      await syncHarbourAudit(changedAudit);
      pendingSyncIds.current.delete(changedAudit.id);
      setSyncStatus("All audits synced");
      setError("");
    } catch (syncError) {
      setSyncStatus("Saved locally — waiting to sync");
      setError(`Saved locally; sharing is pending. ${syncError.message || "Supabase is unavailable."}`);
    }
  }

  async function createAudit() {
    const title = newTitle.trim();
    const auditor = newAuditor.trim();
    if (!title || !auditor) {
      setError("Enter both a title and the auditor's name.");
      return;
    }
    const updatedAt = new Date().toISOString();
    const audit = {
      id: uid(),
      title,
      auditor,
      createdAt: todayText(),
      updatedAt,
      defects: []
    };
    const nextAudits = [audit, ...auditsRef.current];
    setActiveId(audit.id);
    setNewTitle("");
    setNewAuditor("");
    setModalOpen(false);
    await persistAndSync(nextAudits, audit);
  }

  function startEditingAuditDetails() {
    if (!activeAudit) return;
    setAuditTitleDraft(activeAudit.title || "");
    setAuditAuditorDraft(activeAudit.auditor || "");
    setEditingAuditDetails(true);
    setError("");
  }

  async function saveAuditDetails(event) {
    event.preventDefault();
    if (!activeAudit) return;
    const title = auditTitleDraft.trim();
    const auditor = auditAuditorDraft.trim();
    if (!title || !auditor) {
      setError("Enter both an audit name and the auditor's name.");
      return;
    }
    const changedAudit = {
      ...activeAudit,
      title,
      auditor,
      updatedAt: new Date().toISOString()
    };
    const nextAudits = auditsRef.current.map((audit) => audit.id === changedAudit.id ? changedAudit : audit);
    setEditingAuditDetails(false);
    await persistAndSync(nextAudits, changedAudit);
  }

  async function addPhotoFiles(files) {
    try {
      const [nextPhoto] = await readFiles(Array.from(files || []).slice(0, 1));
      if (nextPhoto) setPhotos([nextPhoto]);
      setError("");
    } catch {
      setError("One of the selected photos could not be read. Please try a JPG or PNG image.");
    } finally {
      if (fileRef.current) {
        fileRef.current.value = "";
      }
    }
  }

  function openPhotoPicker(useCamera) {
    if (!fileRef.current) return;
    fileRef.current.value = "";
    if (useCamera) {
      fileRef.current.setAttribute("capture", "environment");
    } else {
      fileRef.current.removeAttribute("capture");
    }
    fileRef.current.removeAttribute("multiple");
    fileRef.current.click();
  }

  function resetDefectEditor() {
    setEditingDefectId(null);
    setDescription("");
    setPhotos([]);
  }

  function startEditingDefect(defect) {
    setEditingDefectId(defect.id);
    setDescription(defect.description || "");
    setPhotos(Array.isArray(defect.photos) ? defect.photos : []);
    setError("");
    window.scrollTo({ top: 0, behavior: "smooth" });
  }

  async function saveDefect() {
    if (!activeAudit) {
      return;
    }
    if (!description.trim()) {
      setError("Enter a defect description before adding the defect.");
      return;
    }
    const updatedAt = new Date().toISOString();
    let changedAudit;
    const nextAudits = auditsRef.current.map((audit) => {
      if (audit.id !== activeAudit.id) return audit;
      if (editingDefectId) {
        changedAudit = {
          ...audit,
          updatedAt,
          defects: audit.defects.map((defect) => defect.id === editingDefectId
            ? { ...defect, description: description.trim(), photos, updatedAt }
            : defect)
        };
        return changedAudit;
      }
      changedAudit = {
        ...audit,
        updatedAt,
        defects: [...audit.defects, { id: uid(), description: description.trim(), photos, updatedAt }]
      };
      return changedAudit;
    });
    resetDefectEditor();
    if (changedAudit) await persistAndSync(nextAudits, changedAudit);
  }

  async function deleteAudit(id) {
    const audit = auditsRef.current.find((item) => item.id === id);
    const nextAudits = auditsRef.current.filter((item) => item.id !== id);
    auditsRef.current = nextAudits;
    setAudits(nextAudits);
    try {
      await queueAuditSave(nextAudits);
      if (audit) await deleteSharedHarbourAudit(audit);
      setError("");
    } catch (deleteError) {
      setError(`Deleted locally; shared deletion is pending. ${deleteError.message || "Supabase is unavailable."}`);
    }
  }

  async function handleExport(audit) {
    try {
      setError("");
      await exportAuditPdf(audit);
    } catch (exportError) {
      if (exportError?.name === "AbortError") {
        return;
      }
      setError("The PDF export failed. Try using JPG or PNG photos and export again.");
    }
  }

  if (activeAudit) {
    return (
      <>
        <header className="detail-topbar">
          <div className="detail-inner">
            <button className="icon-button" type="button" onClick={() => { resetDefectEditor(); setActiveId(null); }} aria-label="Back">
              <ArrowLeft size={16} />
            </button>
            <div className="detail-title">
              <h1>{activeAudit.title}</h1>
              <p>{activeAudit.defects.length} defects · {activeAudit.auditor || "Auditor not specified"}</p>
            </div>
            <div className="detail-actions">
              <button className="outline-small" type="button" onClick={startEditingAuditDetails}>
                <Pencil size={14} />
                Edit details
              </button>
              <button className="outline-small" type="button" onClick={() => handleExport(activeAudit)}>
                <Download size={14} />
                PDF
              </button>
            </div>
          </div>
        </header>

        <main className="detail-main">
          <p className="sync-status" aria-live="polite">{syncStatus}</p>
          {error && <p className="error-banner">{error}</p>}
          {editingAuditDetails && (
            <form className="card audit-details-form" onSubmit={saveAuditDetails}>
              <label>
                Audit name
                <input value={auditTitleDraft} onChange={(event) => setAuditTitleDraft(event.target.value)} />
              </label>
              <label>
                Auditor
                <input
                  list="detail-auditor-options"
                  value={auditAuditorDraft}
                  onChange={(event) => setAuditAuditorDraft(event.target.value)}
                />
                <datalist id="detail-auditor-options">
                  {auditorOptions.map((name) => <option value={name} key={name} />)}
                </datalist>
              </label>
              <div className="audit-details-actions">
                <button className="ghost-button" type="button" onClick={() => setEditingAuditDetails(false)}>Cancel</button>
                <button className="primary-small" type="submit" disabled={!auditTitleDraft.trim() || !auditAuditorDraft.trim()}>Save details</button>
              </div>
            </form>
          )}
          <section className="card add-card">
            <h2>{editingDefectId ? "Edit defect" : "Add defect"}</h2>
            <div className="description-field">
              <textarea
                rows={3}
                aria-label="Describe the defect"
                value={description}
                onChange={(event) => setDescription(event.target.value)}
              />
              {!description && <span className="description-placeholder">Describe the defect...</span>}
            </div>
            <input
              ref={fileRef}
              type="file"
              accept="image/*"
              hidden
              onChange={(event) => addPhotoFiles(event.target.files)}
            />
            <div className="photo-actions">
              <button className="outline-button" type="button" onClick={() => openPhotoPicker(true)}>
                <Camera size={16} />
                Take photo
              </button>
              <button className="outline-button" type="button" onClick={() => openPhotoPicker(false)}>
                <FileImage size={16} />
                Choose gallery
              </button>
            </div>
            {photos.length > 0 && (
              <div className="photo-strip">
                {photos.map((photo) => (
                  <img src={photo.dataUrl} alt="" key={photo.id} />
                ))}
              </div>
            )}
            <button
              className="primary-button"
              type="button"
              onClick={saveDefect}
              disabled={!description.trim()}
            >
              {editingDefectId ? <Pencil size={16} /> : <Plus size={16} />}
              {editingDefectId ? "Save changes" : "Add defect"}
            </button>
            {editingDefectId && (
              <button className="ghost-button edit-cancel" type="button" onClick={resetDefectEditor}>
                Cancel editing
              </button>
            )}
          </section>

          <section className="recorded">
            <h2>Recorded defects</h2>
            {activeAudit.defects.length === 0 ? (
              <p>No defects yet.</p>
            ) : (
              <div className="defect-list">
                {activeAudit.defects.map((defect) => (
                  <article className="card defect-card" key={defect.id}>
                    <div className="defect-card-heading">
                      <p>{defect.description || "No description"}</p>
                      <button className="edit-defect-button" type="button" onClick={() => startEditingDefect(defect)}>
                        <Pencil size={14} />
                        Edit
                      </button>
                    </div>
                    <span>{defect.photos.length} photos</span>
                    <div className="thumbs">
                      {defect.photos.map((photo) => (
                        <img src={photo.dataUrl} alt="" key={photo.id} />
                      ))}
                    </div>
                  </article>
                ))}
              </div>
            )}
          </section>
        </main>
      </>
    );
  }

  return (
    <>
      <HomeBackButton />
      <header className="topbar">
        <div className="topbar-inner">
          <div className="brand-icon">
            <Ship size={22} />
          </div>
          <div>
            <h1>Harbour Audits</h1>
            <p>Boat defect & sign-off reports</p>
          </div>
        </div>
      </header>

      <main className="list-main">
        <p className="sync-status" aria-live="polite">{syncStatus}</p>
        <div className="list-heading">
          <div>
            <h2>Audits</h2>
            <p>{visibleAudits.length === audits.length
              ? `${audits.length} ${audits.length === 1 ? "audit" : "audits"} recorded`
              : `${visibleAudits.length} of ${audits.length} audits shown`}</p>
          </div>
          <div className="list-heading-actions">
            <label className="audit-filter">
              <span>Auditor</span>
              <select value={selectedAuditor} onChange={(event) => setSelectedAuditor(event.target.value)}>
                <option value="all">All auditors</option>
                {auditorOptions.map((name) => <option value={name} key={name}>{name}</option>)}
              </select>
            </label>
            <button className="primary-small" type="button" onClick={() => setModalOpen(true)}>
              <Plus size={16} />
              New audit
            </button>
          </div>
        </div>

        {visibleAudits.length === 0 ? (
          <section className="card empty-card">
            <FileText size={30} />
            <h3>{audits.length ? "No matching audits" : "No audits yet"}</h3>
            <p>{audits.length ? "Choose another auditor to see their audits." : "Create your first audit to start logging defects."}</p>
          </section>
        ) : (
          <div className="audit-list">
            {visibleAudits.map((audit) => (
              <article className="card audit-row" key={audit.id}>
                <button className="audit-main" type="button" onClick={() => setActiveId(audit.id)}>
                  <strong>{audit.title}</strong>
                  <span>{audit.defects.length} defects · {audit.auditor || "Auditor not specified"} · {audit.createdAt}</span>
                </button>
                <div className="audit-actions">
                  <button className="outline-small" type="button" onClick={() => handleExport(audit)}>
                    <Download size={14} />
                    PDF
                  </button>
                  <button className="icon-button delete-audit-button" type="button" onClick={() => deleteAudit(audit.id)} aria-label="Delete audit">
                    <Trash2 size={16} />
                  </button>
                </div>
              </article>
            ))}
          </div>
        )}
      </main>
      {error && <p className="floating-error">{error}</p>}

      {modalOpen && (
        <div className="modal-backdrop" role="presentation">
          <div className="modal card" role="dialog" aria-modal="true" aria-labelledby="new-audit-title">
            <button className="modal-close" type="button" onClick={() => setModalOpen(false)} aria-label="Close">
              <X size={16} />
            </button>
            <h2 id="new-audit-title">New audit</h2>
            <label>
              Title / Boat number
              <input
                autoFocus
                placeholder="e.g. C1064 Saloon & Deck"
                value={newTitle}
                onChange={(event) => setNewTitle(event.target.value)}
                onKeyDown={(event) => {
                  if (event.key === "Enter") {
                    createAudit();
                  }
                }}
              />
            </label>
            <label>
              Auditor
              <input
                list="harbour-auditor-options"
                placeholder="Select or type a name"
                value={newAuditor}
                onChange={(event) => setNewAuditor(event.target.value)}
                onKeyDown={(event) => {
                  if (event.key === "Enter") createAudit();
                }}
              />
              <datalist id="harbour-auditor-options">
                {auditorOptions.map((name) => <option value={name} key={name} />)}
              </datalist>
            </label>
            <div className="modal-actions">
              <button className="ghost-button" type="button" onClick={() => setModalOpen(false)}>
                Cancel
              </button>
              <button className="primary-small" type="button" onClick={createAudit} disabled={!newTitle.trim() || !newAuditor.trim()}>
                Create
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
