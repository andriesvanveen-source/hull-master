"use client";

import { ArrowLeft, Camera, Download, FileText, Plus, Ship, Trash2, X } from "lucide-react";
import { useEffect, useMemo, useRef, useState } from "react";
import jsPDF from "jspdf";
import HomeBackButton from "../components/HomeBackButton";

const STORAGE_KEY = "harbour-audit-buddy-audits";

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

function imageSize(dataUrl) {
  return new Promise((resolve, reject) => {
    const image = new Image();
    image.onload = () => resolve({ width: image.naturalWidth, height: image.naturalHeight });
    image.onerror = reject;
    image.src = dataUrl;
  });
}

function imageFormat(dataUrl) {
  return "JPEG";
}

function drawSignoffTable(doc, x, y, width, height, logoDataUrl) {
  const titleH = 25;
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

  const logoSize = 12;
  const titleText = "R&C Sign Off";
  const disciplineText = "Discipline:";
  doc.setFont("times", "bold");
  doc.setFontSize(12);
  const titleWidth = doc.getTextWidth(titleText);
  doc.setFontSize(6.8);
  const disciplineWidth = doc.getTextWidth(disciplineText);
  const lineWidth = Math.min(72, Math.max(38, width * 0.22));
  const groupWidth = logoSize + 8 + titleWidth + 8 + disciplineWidth + 8 + lineWidth;
  const groupX = x + Math.max(5, (width - groupWidth) / 2);
  const baseline = y + 17;

  if (logoDataUrl) {
    doc.addImage(logoDataUrl, "PNG", groupX, y + 6.5, logoSize, logoSize);
  }

  doc.setTextColor(0, 0, 0);
  doc.setFont("times", "bold");
  doc.setFontSize(12);
  doc.text(titleText, groupX + logoSize + 8, baseline);
  doc.setFontSize(6.8);
  const disciplineX = groupX + logoSize + 8 + titleWidth + 8;
  doc.text(disciplineText, disciplineX, baseline);
  const lineX = disciplineX + disciplineWidth + 8;
  doc.line(lineX, baseline, Math.min(lineX + lineWidth, x + width - 4), baseline);

  doc.setFont("times", "bold");
  doc.setFontSize(7.4);
  ["Team Member", "Team Leader", "CE / QC"].forEach((label, index) => {
    doc.text(label, x + colW * index + colW / 2, titleY + 11.5, { align: "center" });
  });

  doc.setFont("times", "normal");
  doc.setFontSize(6.6);
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

async function addPhotoDefect(doc, defect, defectNumber, y, layout, logoDataUrl) {
  const { margin, pageW, photoW, tableH } = layout;
  const rightX = margin + photoW + 28;
  const rightW = pageW - rightX - margin;

  for (const [photoIndex, photo] of defect.photos.entries()) {
    const size = await imageSize(photo.dataUrl);
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
  const logoDataUrl = null;

  const photoDefects = audit.defects.filter((defect) => defect.photos.length > 0);
  const noPhotoDefects = audit.defects.filter((defect) => defect.photos.length === 0);

  doc.setFont("helvetica", "bold");
  doc.setFontSize(22);
  doc.text(audit.title, pageW / 2, 50, { align: "center" });
  doc.setFont("helvetica", "normal");
  doc.setFontSize(12);
  doc.setTextColor(0, 0, 0);
  doc.text(`Generated: ${audit.createdAt}`, pageW / 2, 78, { align: "center" });

  doc.setFont("helvetica", "bold");
  doc.setFontSize(16);
  doc.text("Defects", margin, 112);

  let y = 142;
  let defectNumber = 1;
  for (const defect of photoDefects) {
    y = await addPhotoDefect(doc, defect, defectNumber, y, layout, logoDataUrl);
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

  doc.save(`${audit.title} Audit.pdf`);
}

export default function HomePage() {
  const fileRef = useRef(null);
  const [audits, setAudits] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [modalOpen, setModalOpen] = useState(false);
  const [newTitle, setNewTitle] = useState("");
  const [activeId, setActiveId] = useState(null);
  const [description, setDescription] = useState("");
  const [photos, setPhotos] = useState([]);
  const [error, setError] = useState("");

  useEffect(() => {
    try {
      const stored = window.localStorage.getItem(STORAGE_KEY);
      if (stored) {
        const parsed = JSON.parse(stored);
        setAudits(Array.isArray(parsed) ? parsed : []);
      }
    } catch {
      window.localStorage.removeItem(STORAGE_KEY);
    }
    setLoaded(true);
  }, []);

  useEffect(() => {
    if (!loaded) {
      return;
    }

    try {
      window.localStorage.setItem(STORAGE_KEY, JSON.stringify(audits));
      setError("");
    } catch {
      setError("This browser could not save all photos locally. You can still export the current audit PDF.");
    }
  }, [audits, loaded]);

  const activeAudit = useMemo(() => audits.find((audit) => audit.id === activeId), [audits, activeId]);

  function createAudit() {
    const title = newTitle.trim();
    if (!title) {
      return;
    }
    const audit = {
      id: uid(),
      title,
      createdAt: todayText(),
      defects: []
    };
    setAudits((current) => [audit, ...current]);
    setActiveId(audit.id);
    setNewTitle("");
    setModalOpen(false);
  }

  async function addPhotoFiles(files) {
    try {
      const nextPhotos = await readFiles(files);
      setPhotos((current) => [...current, ...nextPhotos]);
      setError("");
    } catch {
      setError("One of the selected photos could not be read. Please try a JPG or PNG image.");
    } finally {
      if (fileRef.current) {
        fileRef.current.value = "";
      }
    }
  }

  function addDefect() {
    if (!activeAudit || (!description.trim() && !photos.length)) {
      return;
    }
    const defect = {
      id: uid(),
      description: description.trim(),
      photos
    };
    setAudits((current) =>
      current.map((audit) =>
        audit.id === activeAudit.id ? { ...audit, defects: [...audit.defects, defect] } : audit
      )
    );
    setDescription("");
    setPhotos([]);
  }

  function deleteAudit(id) {
    setAudits((current) => current.filter((audit) => audit.id !== id));
  }

  async function handleExport(audit) {
    try {
      setError("");
      await exportAuditPdf(audit);
    } catch {
      setError("The PDF export failed. Try using JPG or PNG photos and export again.");
    }
  }

  if (activeAudit) {
    return (
      <>
        <HomeBackButton />
        <header className="detail-topbar">
          <div className="detail-inner">
            <button className="icon-button" type="button" onClick={() => setActiveId(null)} aria-label="Back">
              <ArrowLeft size={16} />
            </button>
            <div className="detail-title">
              <h1>{activeAudit.title}</h1>
              <p>{activeAudit.defects.length} defects</p>
            </div>
            <button className="outline-small" type="button" onClick={() => handleExport(activeAudit)}>
              <Download size={14} />
              PDF
            </button>
          </div>
        </header>

        <main className="detail-main">
          {error && <p className="error-banner">{error}</p>}
          <section className="card add-card">
            <h2>Add defect</h2>
            <textarea
              placeholder="Describe the defect..."
              value={description}
              onChange={(event) => setDescription(event.target.value)}
            />
            <input
              ref={fileRef}
              type="file"
              accept="image/*"
              multiple
              hidden
              onChange={(event) => addPhotoFiles(event.target.files)}
            />
            <button className="outline-button" type="button" onClick={() => fileRef.current?.click()}>
              <Camera size={16} />
              Add photo
            </button>
            {photos.length > 0 && (
              <div className="photo-strip">
                {photos.map((photo) => (
                  <img src={photo.dataUrl} alt="" key={photo.id} />
                ))}
              </div>
            )}
            <button className="primary-button" type="button" onClick={addDefect}>
              <Plus size={16} />
              Add defect
            </button>
          </section>

          <section className="recorded">
            <h2>Recorded defects</h2>
            {activeAudit.defects.length === 0 ? (
              <p>No defects yet.</p>
            ) : (
              <div className="defect-list">
                {activeAudit.defects.map((defect) => (
                  <article className="card defect-card" key={defect.id}>
                    <p>{defect.description || "No description"}</p>
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
        <div className="list-heading">
          <div>
            <h2>Audits</h2>
            <p>{audits.length} {audits.length === 1 ? "audit" : "audits"} recorded</p>
          </div>
          <button className="primary-small" type="button" onClick={() => setModalOpen(true)}>
            <Plus size={16} />
            New audit
          </button>
        </div>

        {audits.length === 0 ? (
          <section className="card empty-card">
            <FileText size={30} />
            <h3>No audits yet</h3>
            <p>Create your first audit to start logging defects.</p>
          </section>
        ) : (
          <div className="audit-list">
            {audits.map((audit) => (
              <article className="card audit-row" key={audit.id}>
                <button className="audit-main" type="button" onClick={() => setActiveId(audit.id)}>
                  <strong>{audit.title}</strong>
                  <span>{audit.defects.length} defects · {audit.createdAt}</span>
                </button>
                <button className="outline-small" type="button" onClick={() => handleExport(audit)}>
                  <Download size={14} />
                  PDF
                </button>
                <button className="icon-button" type="button" onClick={() => deleteAudit(audit.id)} aria-label="Delete audit">
                  <Trash2 size={16} />
                </button>
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
            <div className="modal-actions">
              <button className="ghost-button" type="button" onClick={() => setModalOpen(false)}>
                Cancel
              </button>
              <button className="primary-small" type="button" onClick={createAudit}>
                Create
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
