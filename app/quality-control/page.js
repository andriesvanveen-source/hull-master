"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import HomeBackButton from "../components/HomeBackButton";
import styles from "./qualityControl.module.css";
import { exportQualityWorkbook } from "./qualityControlExport";
import { QUALITY_BOAT_MODELS, clearDeletedQualityBoat, createQualityBoat, flushQualityState, hydrateQualityReferenceAudits, initializeQualityState, loadQualityState, markQualityBoatSynced, mergeQualityStates, qualityAuditType, qualityHullNumber } from "./qualityControlStorage";
import { deleteSharedQualityBoat, loadSharedQualityBoats, subscribeToQualityControlChanges, syncQualityBoat } from "../../lib/qualityControlSupabase";

export default function QualityControlPage() {
  const [state, setState] = useState({ boats: [] });
  const [loaded, setLoaded] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [name, setName] = useState("");
  const [error, setError] = useState("");
  const [syncStatus, setSyncStatus] = useState("Loading saved audits...");
  const [selectedModel, setSelectedModel] = useState("all");
  const [selectedAuditType, setSelectedAuditType] = useState("QC3");
  const [newAuditType, setNewAuditType] = useState("QC3");
  const [isExporting, setIsExporting] = useState(false);

  useEffect(() => {
    let mounted = true;
    let refreshing = false;
    async function refresh() {
      if (refreshing) return;
      refreshing = true;
      try {
        let current = loadQualityState();
        const remoteBoats = await loadSharedQualityBoats();
        current = mergeQualityStates(current, remoteBoats, { remoteComplete: true });
        for (const boatId of current.deletedBoatIds || []) {
          await deleteSharedQualityBoat(boatId);
          current = clearDeletedQualityBoat(boatId);
        }
        for (const boat of current.boats.filter((entry) => entry.pendingSync)) {
          const matchingRemote = remoteBoats.find((entry) => entry.id === boat.id);
          const remoteAreaNames = new Set(matchingRemote?.areas || []);
          const remoteDefectIds = new Set((matchingRemote?.defects || []).map((defect) => defect.id));
          const alreadyStored = matchingRemote && boat.areas.every((area) => remoteAreaNames.has(area)) && boat.defects.every((defect) => remoteDefectIds.has(defect.id));
          if (!alreadyStored) await syncQualityBoat(boat);
          current = markQualityBoatSynced(boat.id);
        }
        const merged = mergeQualityStates(current, await loadSharedQualityBoats(), { remoteComplete: true });
        if (mounted) { setState(merged); setSyncStatus("Data synced from Supabase"); setError(""); }
      } catch (loadError) {
        if (mounted) { setState(loadQualityState()); setSyncStatus("Saved locally — waiting to sync"); setError(loadError.message || "Run the Quality Control Supabase SQL to enable sharing."); }
      } finally { refreshing = false; }
    }
    async function bootstrap() {
      const localState = await initializeQualityState();
      if (mounted) { setState(localState); setLoaded(true); }
      if ((loadQualityState().referenceDataVersion || 0) < 5) {
        try {
          const response = await fetch("/quality-control/reference-audits.json");
          if (!response.ok) throw new Error("Reference audits could not be loaded.");
          const hydrated = hydrateQualityReferenceAudits(await response.json());
          if (mounted) setState(hydrated);
        } catch { /* Existing local audits remain available. */ }
      }
      await refresh();
    }
    bootstrap().catch((storageError) => {
      if (!mounted) return;
      setState(loadQualityState());
      setLoaded(true);
      setSyncStatus("Offline storage unavailable");
      setError(storageError.message || "This browser could not open the Quality Control offline database.");
    });
    const unsubscribe = subscribeToQualityControlChanges(refresh);
    return () => { mounted = false; unsubscribe(); };
  }, []);

  const visibleBoats = useMemo(() => state.boats.filter((boat) => (selectedModel === "all" || (boat.model || qualityHullNumber(boat).slice(0, 2)) === selectedModel) && qualityAuditType(boat) === selectedAuditType).sort((a, b) => String(b.name || "").localeCompare(String(a.name || ""), undefined, { numeric: true, sensitivity: "base" })), [selectedAuditType, selectedModel, state.boats]);

  function addBoat(event) {
    event.preventDefault();
    const normalizedName = name.trim().toUpperCase();
    if (!normalizedName) return setError("Enter a hull number.");
    if (!QUALITY_BOAT_MODELS.includes(normalizedName.slice(0, 2))) return setError("Use a B5, B8, B9, C1, C2 or C5 hull number.");
    const fullName = `${normalizedName}_${newAuditType === "HO" ? "HO_Audit" : "QC3"}`;
    if (state.boats.some((boat) => boat.name === fullName)) return setError(`${fullName} already exists.`);
    const nextState = createQualityBoat(normalizedName, newAuditType);
    setState(nextState);
    setName("");
    setShowForm(false);
    setError("");
    setSyncStatus("Saved locally — syncing...");
    const boat = nextState.boats.find((entry) => entry.name === fullName);
    flushQualityState().then(() => syncQualityBoat(boat)).then(() => { const synced = markQualityBoatSynced(boat.id); setState(synced); setSyncStatus("All audits synced"); }).catch((syncError) => { setSyncStatus("Saved locally — waiting to sync"); setError(syncError.message || "The new audit is safely stored locally and will retry syncing."); });
  }

  async function exportVisibleBoats() {
    if (!visibleBoats.length) return setError("There are no boats in this filter to export.");
    setIsExporting(true);
    const modelLabel = selectedModel === "all" ? "All boats" : selectedModel;
    const auditLabel = selectedAuditType === "HO" ? "HO Audit" : "QC3";
    try { await exportQualityWorkbook(visibleBoats, `Quality Control - ${modelLabel} - ${auditLabel}.xlsx`); setError(""); }
    catch (exportError) { setError(exportError.message || "Could not export the selected boats."); }
    finally { setIsExporting(false); }
  }

  function openQualityUpdate(boatId) {
    window.location.assign(`/quality-control/boats/${boatId}/update`);
  }

  return (
    <div className={styles.shell}>
      <HomeBackButton />
      <main className={styles.registerPage}>
        <header className={styles.topbar}>
          <div className={styles.brand}><span className={styles.anchor} aria-hidden="true">⚓</span><span>Quality Control Log</span></div>
          <div className={styles.topbarActions}>
            <Link className={styles.standardButton} href="/quality-control/standard">Quality Standard</Link>
          </div>
        </header>

        <section className={styles.hero}>
          <div><p className={styles.kicker}>Quality audit</p><h1>Boats</h1></div>
          <button className={styles.newAuditButton} type="button" onClick={() => setShowForm((value) => !value)}><span aria-hidden="true">+</span> New audit</button>
        </section>

        {error ? <div className={styles.alert} role="alert">{error}</div> : null}
        {showForm ? (
          <form className={styles.newBoatForm} onSubmit={addBoat}>
            <input value={name} onChange={(event) => setName(event.target.value)} placeholder="Hull number" aria-label="Hull number" autoFocus />
            <select value={newAuditType} onChange={(event) => setNewAuditType(event.target.value)} aria-label="Audit type"><option value="QC3">QC3</option><option value="HO">HO Audit</option></select>
            <button type="submit">Add</button>
            <button type="button" className={styles.secondaryButton} onClick={() => setShowForm(false)}>Cancel</button>
          </form>
        ) : null}

        <div className={styles.modelFilter}>
          <label htmlFor="qualityModelFilter">Model</label>
          <select id="qualityModelFilter" value={selectedModel} onChange={(event) => setSelectedModel(event.target.value)}>
            <option value="all">All boats</option>
            {QUALITY_BOAT_MODELS.map((model) => <option key={model} value={model}>{model}</option>)}
          </select>
          <fieldset className={styles.auditTypeToggle} aria-label="Audit type">
            <legend>Audit type</legend>
            <button type="button" className={selectedAuditType === "QC3" ? styles.activeToggle : ""} aria-pressed={selectedAuditType === "QC3"} onClick={() => setSelectedAuditType("QC3")}>QC3 audit</button>
            <button type="button" className={selectedAuditType === "HO" ? styles.activeToggle : ""} aria-pressed={selectedAuditType === "HO"} onClick={() => setSelectedAuditType("HO")}>Handover audit</button>
          </fieldset>
          <button type="button" onClick={exportVisibleBoats} disabled={isExporting || !visibleBoats.length}>{isExporting ? "Exporting..." : "Export selected"}</button>
        </div>

        <div className={styles.summary}>{syncStatus}</div>
        <section className={styles.boatList} aria-label="Quality Control boat audits">
          {!loaded ? <div className={styles.empty}>Loading audits...</div> : state.boats.length === 0 ? (
            <div className={styles.empty}>No audits yet. Start a new audit to log defects.</div>
          ) : visibleBoats.length === 0 ? <div className={styles.empty}>No {selectedModel} boats found.</div> : visibleBoats.map((boat) => (
            <article className={styles.boatCard} key={boat.id}>
              <Link className={styles.boatAuditLink} href={`/quality-control/boats/${boat.id}`}>
                <strong>{boat.name}</strong>
                <span>{boat.defects.length} {boat.defects.length === 1 ? "defect" : "defects"} · {boat.defects.filter((defect) => defect.concern).length} {boat.defects.filter((defect) => defect.concern).length === 1 ? "concern" : "concerns"}</span>
              </Link>
              <button className={styles.qcUpdateButton} type="button" onClick={() => openQualityUpdate(boat.id)}>QC Update</button>
            </article>
          ))}
        </section>
      </main>
    </div>
  );
}
