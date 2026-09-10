"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { Fragment, use, useEffect, useMemo, useState } from "react";
import styles from "./qualityBoat.module.css";
import { codeDiscipline, deleteQualityBoat, findQualityBoat, newQualityDefect, updateQualityBoat } from "../../qualityControlStorage";
import { exportQualityExcel, exportQualityPdf } from "../../qualityControlExport";

function normalize(value) { return String(value || "").toLowerCase().replace(/[^a-z0-9]+/g, " ").trim(); }
const QUALITY_INSPECTORS = ["Imran Majiet", "Imtiyaaz Hassan Hoosain", "Jodi Jackson", "Kyle Carl Adams", "Moegamat Saleem Philander", "Mogamat Yunis Jabaar", "Riyaaz Harold", "Sheldon Barends", "Zunaid Hoosen"];
function uniqueItemSuggestions(entries) {
  const seen = new Set();
  return entries.filter((entry) => {
    const key = normalize(entry.item);
    if (!key || seen.has(key)) return false;
    seen.add(key);
    return true;
  });
}
function uniqueValues(entries, field) {
  const seen = new Set();
  return entries.map((entry) => entry[field]).filter((value) => {
    const key = normalize(value);
    if (!key || seen.has(key)) return false;
    seen.add(key);
    return true;
  }).sort((a, b) => a.localeCompare(b));
}
function scoreMatch(entry, values) {
  const area = normalize(values.area);
  const item = normalize(values.item);
  const failure = normalize(values.failure);
  const description = normalize(values.description);
  let score = normalize(entry.area) === area ? 8 : 0;
  if (item && normalize(entry.item) === item) score += 12;
  else if (item && (normalize(entry.item).includes(item) || item.includes(normalize(entry.item)))) score += 5;
  if (failure && normalize(entry.issue) === failure) score += 8;
  const haystack = normalize(`${entry.defect} ${entry.item} ${entry.issue}`);
  description.split(" ").filter((word) => word.length > 3).forEach((word) => { if (haystack.includes(word)) score += 1; });
  return score;
}

export default function QualityBoatPage({ params }) {
  const { boatId } = use(params);
  const router = useRouter();
  const [boat, setBoat] = useState(null);
  const [loaded, setLoaded] = useState(false);
  const [catalog, setCatalog] = useState([]);
  const [draftArea, setDraftArea] = useState("");
  const [drafts, setDrafts] = useState({});
  const [message, setMessage] = useState("");

  useEffect(() => {
    setBoat(findQualityBoat(boatId));
    setLoaded(true);
    fetch("/quality-control/area-common-defects.json").then((response) => response.json()).then(setCatalog).catch(() => setCatalog([]));
  }, [boatId]);

  const catalogAreas = useMemo(() => [...new Set(catalog.map((entry) => entry.area))].sort(), [catalog]);
  function save(nextBoat) { const saved = updateQualityBoat(nextBoat); setBoat({ ...saved }); setMessage(""); }
  function matchCode(values) {
    if (!values.item?.trim() && !values.failure?.trim() && !values.description?.trim()) return "";
    const candidates = catalog.map((entry) => ({ entry, score: scoreMatch(entry, values) })).filter((match) => match.score > 8).sort((a, b) => b.score - a.score);
    return Number(candidates[0]?.entry.code) || "";
  }
  function updateBoatField(field, value) { save({ ...boat, [field]: value }); }
  function setAreaInspector(area, inspector) {
    save({ ...boat, areaInspectors: { ...(boat.areaInspectors || {}), [area]: inspector } });
  }
  function addArea(event) {
    event.preventDefault();
    const area = draftArea.trim();
    if (!area || boat.areas.includes(area)) return;
    save({ ...boat, areas: [...boat.areas, area] });
    setDraftArea("");
  }
  function removeArea(area) {
    if (boat.defects.some((defect) => defect.area === area)) return setMessage("Remove this area's defects before removing the area.");
    save({ ...boat, areas: boat.areas.filter((item) => item !== area), completedAreas: boat.completedAreas.filter((item) => item !== area) });
  }
  function setDraft(area, field, value) {
    setDrafts((current) => {
      const next = { ...(current[area] || {}), [field]: value };
      if (field === "item") { next.failure = ""; next.description = ""; }
      if (field === "failure") next.description = "";
      return { ...current, [area]: next };
    });
  }
  function addDefect(area) {
    const draft = drafts[area] || {};
    if (!draft.item?.trim() || !draft.failure?.trim() || !draft.description?.trim()) return setMessage("Complete Item/Part/Subcomponent, Failure and Description before adding the defect.");
    const code = matchCode({ ...draft, area });
    if (!code) return setMessage("No matching common defect code was found. Refine the item, failure or description.");
    const defect = newQualityDefect({ area, item: draft.item.trim(), failure: draft.failure.trim(), description: draft.description.trim(), code, concern: false, discipline: codeDiscipline(code) });
    save({ ...boat, defects: [...boat.defects, defect] });
    setDrafts((current) => ({ ...current, [area]: {} }));
  }
  function updateDefect(defectId, field, value) {
    const defects = boat.defects.map((defect) => {
      if (defect.id !== defectId) return defect;
      const next = { ...defect, [field]: value, updatedAt: new Date().toISOString() };
      if (field === "code") return { ...next, discipline: codeDiscipline(value) };
      if (!["item", "failure", "description"].includes(field)) return next;
      const code = matchCode(next);
      return { ...next, code: code || next.code, discipline: codeDiscipline(code || next.code) };
    });
    save({ ...boat, defects });
  }
  function removeDefect(defectId) { save({ ...boat, defects: boat.defects.filter((defect) => defect.id !== defectId) }); }
  function deleteBoat() {
    if (!window.confirm(`Delete ${boat.name}? This local audit cannot be recovered.`)) return;
    deleteQualityBoat(boat.id);
    router.push("/quality-control");
  }

  if (!loaded) return <main className={styles.loading}>Loading quality audit...</main>;
  if (!boat) return <main className={styles.loading}>Audit not found. <Link href="/quality-control">Back to boats</Link></main>;

  return (
    <div className={styles.shell}>
      <main className={styles.page}>
        <nav className={styles.nav}>
          <Link href="/quality-control">← All boats</Link>
          <div className={styles.actions}>
            <button type="button" onClick={() => window.print()}>Print</button>
            <button type="button" onClick={() => exportQualityPdf(boat)}>PDF</button>
            <button type="button" onClick={() => exportQualityExcel(boat)}>Excel</button>
            <button type="button" className={styles.danger} onClick={deleteBoat}>Delete</button>
          </div>
        </nav>

        <header className={styles.auditHeader}>
          <div><label>Hull Number</label><input value={boat.name} onChange={(event) => setBoat((current) => ({ ...current, name: event.target.value.toUpperCase() }))} onBlur={(event) => updateBoatField("name", event.target.value.trim().toUpperCase())} /></div>
          <p>{message || "Saved locally in this browser"}</p>
        </header>

        <section className={styles.tableWrap}>
          <datalist id="quality-inspector-options">{QUALITY_INSPECTORS.map((name) => <option key={name} value={name} />)}</datalist>
          <table className={styles.auditTable}>
            <thead><tr><th aria-label="Remove"></th><th>Concern</th><th>Item/Part /sub component</th><th>Failure</th><th>Description</th><th>Code</th><th>Discipline</th></tr></thead>
            <tbody>
              {boat.areas.map((area) => (
                <Fragment key={area}>
                  <tr className={styles.areaRow}><td colSpan="7"><div><strong>{area}</strong><span className={styles.areaControls}><label className={styles.inspectorField}>Inspector<input list="quality-inspector-options" value={boat.areaInspectors?.[area] || ""} onChange={(event) => setAreaInspector(area, event.target.value)} placeholder="Select or type a name" /></label><button type="button" onClick={() => removeArea(area)}>Remove</button></span></div></td></tr>
                  {boat.defects.filter((defect) => defect.area === area).map((defect) => (
                    <tr key={defect.id}>
                      <td><button className={styles.remove} type="button" onClick={() => removeDefect(defect.id)} aria-label={`Remove ${defect.item}`}>−</button></td>
                      <td className={styles.concern}><label><input type="checkbox" checked={Boolean(defect.concern)} onChange={(event) => updateDefect(defect.id, "concern", event.target.checked)} /><span aria-hidden="true">×</span><span className={styles.srOnly}>Concern</span></label></td>
                      <td><input value={defect.item} onChange={(event) => updateDefect(defect.id, "item", event.target.value)} /></td>
                      <td><input value={defect.failure} onChange={(event) => updateDefect(defect.id, "failure", event.target.value)} /></td>
                      <td><textarea value={defect.description} onChange={(event) => updateDefect(defect.id, "description", event.target.value)} /></td>
                      <td><input className={styles.codeInput} inputMode="numeric" value={defect.code} onChange={(event) => updateDefect(defect.id, "code", event.target.value)} aria-label={`Code for ${defect.item}`} /></td><td>{defect.discipline}</td>
                    </tr>
                  ))}
                  <tr className={styles.draftRow}>
                    <td></td>
                    <td></td>
                    <td><select value={drafts[area]?.item || ""} onChange={(event) => setDraft(area, "item", event.target.value)} aria-label={`${area} item, part or subcomponent`}><option value="">Select item/part/subcomponent</option>{uniqueItemSuggestions(catalog.filter((entry) => normalize(entry.area) === normalize(area))).sort((a, b) => a.item.localeCompare(b.item)).map((entry) => <option key={normalize(entry.item)} value={entry.item}>{entry.item}</option>)}</select></td>
                    <td><select value={drafts[area]?.failure || ""} onChange={(event) => setDraft(area, "failure", event.target.value)} disabled={!drafts[area]?.item} aria-label={`${area} failure mode`}><option value="">{drafts[area]?.item ? "Select failure mode" : "Select an item first"}</option>{uniqueValues(catalog.filter((entry) => normalize(entry.area) === normalize(area) && normalize(entry.item) === normalize(drafts[area]?.item)), "issue").map((failure) => <option key={normalize(failure)} value={failure}>{failure}</option>)}</select></td>
                    <td><select value={drafts[area]?.description || ""} onChange={(event) => setDraft(area, "description", event.target.value)} disabled={!drafts[area]?.failure} aria-label={`${area} defect description`}><option value="">{drafts[area]?.failure ? "Select defect description" : "Select a failure mode first"}</option>{uniqueValues(catalog.filter((entry) => normalize(entry.area) === normalize(area) && normalize(entry.item) === normalize(drafts[area]?.item) && normalize(entry.issue) === normalize(drafts[area]?.failure)), "defect").map((description) => <option key={normalize(description)} value={description}>{description}</option>)}</select></td>
                    <td className={styles.code}>{matchCode({ ...(drafts[area] || {}), area }) || "–"}</td>
                    <td><button className={styles.add} type="button" onClick={() => addDefect(area)}>Add</button></td>
                  </tr>
                </Fragment>
              ))}
            </tbody>
          </table>
        </section>

        <form className={styles.addArea} onSubmit={addArea}>
          <input value={draftArea} onChange={(event) => setDraftArea(event.target.value)} list="quality-area-options" placeholder="Select or type an area" aria-label="Area to add" />
          <datalist id="quality-area-options">{catalogAreas.map((area) => <option key={area} value={area} />)}</datalist>
          <button type="submit">Add Area</button>
        </form>

        <section className={styles.printOnly}>
          <h1>Quality Control Audit — Hull {boat.name}</h1>
          <table><thead><tr><th rowSpan="2">No</th><th rowSpan="2">Concerns</th><th rowSpan="2">Code</th><th rowSpan="2">Item/Part /sub component</th><th rowSpan="2">Failure</th><th rowSpan="2">Description</th><th rowSpan="2">Repaired by</th><th rowSpan="2">Repaired Date</th><th rowSpan="2">TL/BM CHECK</th><th colSpan="2">QC</th></tr><tr><th>RWK</th><th>ACC</th></tr></thead><tbody>{boat.areas.flatMap((area) => [<tr className={styles.printArea} key={`${area}-head`}><td colSpan="11">{area} · Inspector: {boat.areaInspectors?.[area] || "Not assigned"}</td></tr>, ...boat.defects.filter((defect) => defect.area === area).map((defect, index) => <tr key={`${defect.id}-print`}><td>{index + 1}</td><td>{defect.concern ? "X" : ""}</td><td>{defect.code}</td><td>{defect.item}</td><td>{defect.failure}</td><td>{defect.description}</td><td></td><td></td><td></td><td></td><td></td></tr>)])}</tbody></table>
        </section>
      </main>
    </div>
  );
}
