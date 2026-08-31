"use client";

import { useEffect, useMemo, useRef, useState } from "react";

import { createPdfObjectUrl } from "../../lib/pdfDownloads";

function revokeUrls(items) {
  items.forEach((item) => {
    if (item.url) {
      URL.revokeObjectURL(item.url);
    }
  });
}

export default function HomePage() {
  const inputRef = useRef(null);
  const archiveRef = useRef([]);
  const [isProcessing, setIsProcessing] = useState(false);
  const [error, setError] = useState("");
  const [archiveOpen, setArchiveOpen] = useState(false);
  const [archive, setArchive] = useState([]);

  const archiveCount = archive.length;
  const buttonLabel = useMemo(() => {
    if (isProcessing) {
      return "Processing...";
    }

    return "Choose PDFs";
  }, [isProcessing]);

  useEffect(() => {
    archiveRef.current = archive;
  }, [archive]);

  useEffect(() => {
    return () => revokeUrls(archiveRef.current);
  }, []);

  async function processFiles(fileList) {
    const pdfs = Array.from(fileList || []).filter((file) => file.name.toLowerCase().endsWith(".pdf"));

    if (!pdfs.length) {
      return;
    }

    setIsProcessing(true);
    setError("");

    const body = new FormData();
    pdfs.forEach((file) => body.append("pdfs", file));

    try {
      const response = await fetch("/api/process", {
        method: "POST",
        body
      });
      const payload = await response.json();

      if (!response.ok) {
        throw new Error(payload.error || "The PDFs could not be processed.");
      }

      const nextItems = (payload.results || []).map((result) => ({
        ...result,
        id: `${result.fileName}-${Date.now()}-${Math.random()}`,
        url: createPdfObjectUrl(result.base64)
      }));

      setArchive((current) => [...nextItems, ...current]);
      setArchiveOpen(true);
    } catch (processError) {
      setError(processError.message || "The PDFs could not be processed.");
    } finally {
      setIsProcessing(false);
      if (inputRef.current) {
        inputRef.current.value = "";
      }
    }
  }

  function clearArchive() {
    revokeUrls(archive);
    setArchive([]);
    setArchiveOpen(false);
  }

  return (
    <main className="page">
      <header className="hero">
        <h1>R&C Sign Off</h1>
        <p>Upload Exception Report PDFs. Each photo gets a sign-off table next to it.</p>
      </header>

      <section
        className={isProcessing ? "drop-card processing" : "drop-card"}
        onDragOver={(event) => event.preventDefault()}
        onDrop={(event) => {
          event.preventDefault();
          processFiles(event.dataTransfer.files);
        }}
      >
        <input
          ref={inputRef}
          className="hidden-input"
          type="file"
          accept="application/pdf,.pdf"
          multiple
          onChange={(event) => processFiles(event.target.files)}
        />
        <button
          className="choose-button"
          type="button"
          disabled={isProcessing}
          onClick={() => inputRef.current?.click()}
        >
          {buttonLabel}
        </button>
        <p>or drop files here</p>
      </section>

      {error && <p className="error-message">{error}</p>}

      <section className="archive-section">
        <button className="archive-button" type="button" onClick={() => setArchiveOpen((value) => !value)}>
          Archive ({archiveCount})
        </button>

        {archiveOpen && archiveCount > 0 && (
          <div className="archive-list">
            {archive.map((item) => (
              <a className="download-item" href={item.url} download={item.fileName} key={item.id}>
                <span>{item.fileName}</span>
                <small>{item.tables} tables added</small>
              </a>
            ))}
            <button className="clear-button" type="button" onClick={clearArchive}>
              Clear archive
            </button>
          </div>
        )}
      </section>
    </main>
  );
}

