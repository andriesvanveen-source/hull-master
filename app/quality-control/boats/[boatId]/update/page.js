"use client";

import Link from "next/link";
import { useParams } from "next/navigation";
import { useEffect, useMemo, useState } from "react";
import { findQualityBoat, initializeQualityState, qualityAuditType } from "../../../qualityControlStorage";
import styles from "./qualityUpdate.module.css";

function today() {
  return new Intl.DateTimeFormat("en-GB", { day: "2-digit", month: "2-digit", year: "numeric" }).format(new Date());
}

function numberOrBlank(value) {
  return value === "" ? "___" : value;
}

export default function QualityUpdatePage() {
  const { boatId } = useParams();
  const [boat, setBoat] = useState(null);
  const [loaded, setLoaded] = useState(false);
  const [date, setDate] = useState(today);
  const [notes, setNotes] = useState("");
  const [interior, setInterior] = useState("");
  const [exterior, setExterior] = useState("");
  const [remaining, setRemaining] = useState("");
  const [completed, setCompleted] = useState("");
  const [callbacks, setCallbacks] = useState("");
  const [sailSenseTotal, setSailSenseTotal] = useState("");
  const [sailSenseRemaining, setSailSenseRemaining] = useState("");
  const [sailSenseCompleted, setSailSenseCompleted] = useState("");
  const [excludedConcernIds, setExcludedConcernIds] = useState([]);
  const [copyStatus, setCopyStatus] = useState("");

  useEffect(() => {
    initializeQualityState().then(() => {
      setBoat(findQualityBoat(boatId));
      setLoaded(true);
    });
  }, [boatId]);

  const concerns = useMemo(() => (boat?.defects || []).filter((defect) => defect.concern), [boat]);
  const isHandover = qualityAuditType(boat) === "HO";
  const includedConcerns = concerns.filter((defect) => !excludedConcernIds.includes(defect.id));
  const suggestedExterior = remaining !== "" && interior !== "" ? Math.max(0, Number(remaining) - Number(interior)) : "";
  const suggestedInterior = remaining !== "" && exterior !== "" ? Math.max(0, Number(remaining) - Number(exterior)) : "";
  const suggestedRemaining = interior !== "" && exterior !== "" ? Number(interior) + Number(exterior) : "";
  const effectiveInterior = interior === "" ? suggestedInterior : interior;
  const effectiveExterior = exterior === "" ? suggestedExterior : exterior;
  const effectiveRemaining = remaining === "" ? suggestedRemaining : remaining;

  const message = useMemo(() => {
    if (!boat) return "";
    if (isHandover) {
      const lines = [
        `*${boat.name} Quality Report*`,
        "",
        date,
        ""
      ];
      lines.push(
        `Overall SailSense Total - ${numberOrBlank(sailSenseTotal)}`,
        `SailSense Defects Remaining - ${numberOrBlank(sailSenseRemaining)}`,
        `SailSense Defects Completed - ${numberOrBlank(sailSenseCompleted)}`,
        "",
        `Overall Cosmetic List - ${boat.defects.length}`,
        `Interior - ${numberOrBlank(effectiveInterior)}`,
        `Exterior - ${numberOrBlank(effectiveExterior)}`,
        `Defects Remaining - ${numberOrBlank(effectiveRemaining)}`,
        `Defects Completed - ${numberOrBlank(completed)}`,
        `Callbacks - ${numberOrBlank(callbacks)}`
      );
      if (notes.trim()) lines.push("", "Additional Notes:", notes.trim());
      if (includedConcerns.length) {
        lines.push("", "🚨🚨 *Concerns* 🚨🚨");
        let currentArea = "";
        includedConcerns.forEach((defect, index) => {
          if (defect.area !== currentArea) {
            currentArea = defect.area;
            lines.push("", currentArea);
          }
          lines.push(`${index + 1}. ${defect.description || defect.failure || defect.item}`);
        });
      }
      return lines.join("\n");
    }
    const lines = [
      `*${boat.name} Quality Report Update*`,
      `Date: ${date}`,
      "",
      `Overall Defect Total - ${boat.defects.length}`,
      `Overall Concerns Total - ${concerns.length}`
    ];
    if (notes.trim()) lines.push("", "Additional Notes:", notes.trim(), "");
    else lines.push("");
    lines.push(
      `Total Defects Remaining - ${numberOrBlank(effectiveRemaining)}`,
      `Interior Defects Remaining - ${numberOrBlank(effectiveInterior)}`,
      `Exterior Defects Remaining - ${numberOrBlank(effectiveExterior)}`,
      "",
      `Defects Completed from Previous Update - ${numberOrBlank(completed)}`,
      `Number of Callbacks - ${numberOrBlank(callbacks)}`
    );
    if (includedConcerns.length) {
      lines.push("", "🚨🚨 *Remaining Concerns* 🚨🚨");
      let currentArea = "";
      includedConcerns.forEach((defect, index) => {
        if (defect.area !== currentArea) {
          currentArea = defect.area;
          lines.push("", currentArea);
        }
        lines.push(`${index + 1}) ${defect.description || defect.failure || defect.item}`);
      });
    }
    return lines.join("\n");
  }, [boat, callbacks, completed, concerns.length, date, effectiveExterior, effectiveInterior, effectiveRemaining, includedConcerns, isHandover, notes, sailSenseCompleted, sailSenseRemaining, sailSenseTotal]);

  async function copyMessage() {
    try {
      await navigator.clipboard.writeText(message);
      setCopyStatus("Copied — ready to paste into WhatsApp.");
    } catch {
      setCopyStatus("Copy was blocked. Select the preview text and copy it manually.");
    }
  }

  function removeConcern(id) {
    setExcludedConcernIds((ids) => [...ids, id]);
  }

  if (!loaded) return <main className={styles.status}>Loading quality update…</main>;
  if (!boat) return <main className={styles.status}>Boat not found. <Link href="/quality-control">Back to boats</Link></main>;

  return (
    <main className={styles.page}>
      <header className={styles.header}>
        <div><Link href="/quality-control">← All boats</Link><p>Quality update</p><h1>{boat.name}</h1></div>
        <div className={styles.headerActions}>
          <button type="button" onClick={copyMessage}>Copy</button>
        </div>
      </header>

      {copyStatus ? <div className={styles.notice} role="status">{copyStatus}</div> : null}

      <section className={styles.formCard}>
        <div className={styles.totals}>
          <div><span>{isHandover ? "Cosmetic defects" : "Total defects"}</span><strong>{boat.defects.length}</strong></div>
          <div><span>Total concerns</span><strong>{concerns.length}</strong></div>
        </div>
        <div className={styles.fields}>
          <label>Date<input type="text" value={date} onChange={(event) => setDate(event.target.value)} /></label>
          {isHandover ? <>
            <label>Overall SailSense total<input inputMode="numeric" type="number" min="0" value={sailSenseTotal} onChange={(event) => setSailSenseTotal(event.target.value)} /></label>
            <label>SailSense defects remaining<input inputMode="numeric" type="number" min="0" value={sailSenseRemaining} onChange={(event) => setSailSenseRemaining(event.target.value)} /></label>
            <label>SailSense defects completed<input inputMode="numeric" type="number" min="0" value={sailSenseCompleted} onChange={(event) => setSailSenseCompleted(event.target.value)} /></label>
          </> : null}
          <label>{isHandover ? "Cosmetic defects remaining" : "Total defects remaining"}<input className={remaining === "" && effectiveRemaining !== "" ? styles.calculated : ""} inputMode="numeric" type="number" min="0" value={effectiveRemaining} onFocus={(event) => { if (remaining === "" && effectiveRemaining !== "") event.target.select(); }} onChange={(event) => setRemaining(event.target.value)} /></label>
          <label>{isHandover ? "Interior" : "Interior defects remaining"}<input className={interior === "" && effectiveInterior !== "" ? styles.calculated : ""} inputMode="numeric" type="number" min="0" value={effectiveInterior} onFocus={(event) => { if (interior === "" && effectiveInterior !== "") event.target.select(); }} onChange={(event) => setInterior(event.target.value)} /></label>
          <label>{isHandover ? "Exterior" : "Exterior defects remaining"}<input className={exterior === "" && effectiveExterior !== "" ? styles.calculated : ""} inputMode="numeric" type="number" min="0" value={effectiveExterior} onFocus={(event) => { if (exterior === "" && effectiveExterior !== "") event.target.select(); }} onChange={(event) => setExterior(event.target.value)} /></label>
          <label>{isHandover ? "Cosmetic defects completed" : "Defects completed from previous update"}<input inputMode="numeric" type="number" min="0" value={completed} onChange={(event) => setCompleted(event.target.value)} /></label>
          <label>{isHandover ? "Callbacks" : "Number of callbacks"}<input inputMode="numeric" type="number" min="0" value={callbacks} onChange={(event) => setCallbacks(event.target.value)} /></label>
          <label className={styles.notes}>Additional notes <span>(optional)</span><textarea rows="3" value={notes} onChange={(event) => setNotes(event.target.value)} /></label>
        </div>
      </section>

      <section className={styles.concernsCard}>
        <div className={styles.sectionTitle}>
          <div><p>Remaining concerns</p><h2>{includedConcerns.length} included</h2></div>
          <div className={styles.concernTools}><span>Remove completed concerns from this message only.</span><button className={styles.resetButton} type="button" onClick={() => setExcludedConcernIds([])} disabled={!excludedConcernIds.length}>Reset concerns</button></div>
        </div>
        {!includedConcerns.length ? <p className={styles.empty}>No remaining concerns selected.</p> : includedConcerns.map((defect) => (
          <article className={styles.concern} key={defect.id}>
            <div><small>{defect.area}</small><p>{defect.description || defect.failure || defect.item}</p></div>
            <button type="button" onClick={() => removeConcern(defect.id)} aria-label={`Remove ${defect.description || "concern"} from update`}>Remove</button>
          </article>
        ))}
      </section>

      <section className={styles.preview}><p>Message preview</p><pre>{message}</pre></section>
    </main>
  );
}
