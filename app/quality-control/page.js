"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import HomeBackButton from "../components/HomeBackButton";
import styles from "./qualityControl.module.css";
import { exportQualityWorkbook } from "./qualityControlExport";
import { QUALITY_BOAT_MODELS, clearDeletedQualityBoat, createQualityBoat, flushQualityState, hydrateQualityReferenceAudits, initializeQualityState, loadQualityState, markQualityBoatSynced, mergeQualityStates } from "./qualityControlStorage";
import { deleteSharedQualityBoat, loadSharedQualityBoats, subscribeToQualityControlChanges, syncQualityBoat } from "../../lib/qualityControlSupabase";

export default function QualityControlPage() {
  const [state, setState] = useState({ boats: [] });
  const [loaded, setLoaded] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [name, setName] = useState("");
  const [error, setError] = useState("");
  const [syncStatus, setSyncStatus] = useState("Loading saved audits...");
  const [selectedModel, setSelectedModel] = useState("all");
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
        if (mounted) { setState(merged); setSyncStatus(`Synced from Supabase: ${merged.boats.length} boats`); setError(""); }
      } catch (loadError) {
        if (mounted) { setState(loadQualityState()); setSyncStatus("Saved locally — waiting to sync"); setError(loadError.message || "Run the Quality Control Supabase SQL to enable sharing."); }
      } finally { refreshing = false; }
    }
    async function bootstrap() {
      const localState = await initializeQualityState();
      if (mounted) { setState(localState); setLoaded(true); }
      if ((loadQualityState().referenceDataVersion || 0) < 2) {
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

  const defectCount = useMemo(
    () => state.boats.reduce((total, boat) => total + boat.defects.length, 0),
    [state.boats]
  );
  const visibleBoats = useMemo(() => [...(selectedModel === "all" ? state.boats : state.boats.filter((boat) => (boat.model || boat.name.slice(0, 2)) === selectedModel))].sort((a, b) => String(b.name || "").localeCompare(String(a.name || ""), undefined, { numeric: true, sensitivity: "base" })), [selectedModel, state.boats]);

  function addBoat(event) {
    event.preventDefault();
    const normalizedName = name.trim().toUpperCase();
    if (!normalizedName) return setError("Enter a hull number.");
    if (!QUALITY_BOAT_MODELS.includes(normalizedName.slice(0, 2))) return setError("Use a B5, B8, B9, C1, C2 or C5 hull number.");
    if (state.boats.some((boat) => boat.name === normalizedName)) return setError(`${normalizedName} already exists.`);
    const nextState = createQualityBoat(normalizedName);
    setState(nextState);
    setName("");
    setShowForm(false);
    setError("");
    setSyncStatus("Saved locally — syncing...");
    const boat = nextState.boats.find((entry) => entry.name === normalizedName);
    flushQualityState().then(() => syncQualityBoat(boat)).then(() => { const synced = markQualityBoatSynced(boat.id); setState(synced); setSyncStatus("All audits synced"); }).catch((syncError) => { setSyncStatus("Saved locally — waiting to sync"); setError(syncError.message || "The new audit is safely stored locally and will retry syncing."); });
  }

  async function exportVisibleBoats() {
    if (!visibleBoats.length) return setError("There are no boats in this filter to export.");
    setIsExporting(true);
    try { await exportQualityWorkbook(visibleBoats, `Quality Control - ${selectedModel === "all" ? "All boats" : selectedModel}.xlsx`); setError(""); }
    catch (exportError) { setError(exportError.message || "Could not export the selected boats."); }
    finally { setIsExporting(false); }
  }

  return (
    <div className={styles.shell}>
      <HomeBackButton />
      <main className={styles.registerPage}>
        <header className={styles.topbar}>
          <div className={styles.brand}><span className={styles.anchor} aria-hidden="true">⚓</span><span>Quality Control Log</span></div>
          <div className={styles.topbarActions}>
            <span>{state.boats.length} {state.boats.length === 1 ? "hull" : "hulls"}</span>
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
          <button type="button" onClick={exportVisibleBoats} disabled={isExporting || !visibleBoats.length}>{isExporting ? "Exporting..." : "Export selected"}</button>
        </div>

        <div className={styles.summary}>{syncStatus} · {defectCount} logged defects</div>
        <section className={styles.boatList} aria-label="Quality Control boat audits">
          {!loaded ? <div className={styles.empty}>Loading audits...</div> : state.boats.length === 0 ? (
            <div className={styles.empty}>No audits yet. Start a new audit to log defects.</div>
          ) : visibleBoats.length === 0 ? <div className={styles.empty}>No {selectedModel} boats found.</div> : visibleBoats.map((boat) => (
            <article className={styles.boatCard} key={boat.id}>
              <Link href={`/quality-control/boats/${boat.id}`}>
                <strong>{boat.name}</strong>
                <span>{boat.defects.length} {boat.defects.length === 1 ? "defect" : "defects"} · {boat.areas.length} areas</span>
                <small>{Object.values(boat.areaInspectors || {}).filter(Boolean).length} area inspectors assigned</small>
              </Link>
            </article>
          ))}
        </section>
      </main>
    </div>
  );
}
