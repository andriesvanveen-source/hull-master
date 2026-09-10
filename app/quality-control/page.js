"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import HomeBackButton from "../components/HomeBackButton";
import styles from "./qualityControl.module.css";
import { createQualityBoat, loadQualityState } from "./qualityControlStorage";

export default function QualityControlPage() {
  const [state, setState] = useState({ boats: [] });
  const [loaded, setLoaded] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [name, setName] = useState("");
  const [error, setError] = useState("");

  useEffect(() => {
    setState(loadQualityState());
    setLoaded(true);
  }, []);

  const defectCount = useMemo(
    () => state.boats.reduce((total, boat) => total + boat.defects.length, 0),
    [state.boats]
  );

  function addBoat(event) {
    event.preventDefault();
    const normalizedName = name.trim().toUpperCase();
    if (!normalizedName) return setError("Enter a hull number.");
    if (state.boats.some((boat) => boat.name === normalizedName)) return setError(`${normalizedName} already exists.`);
    const nextState = createQualityBoat(normalizedName);
    setState(nextState);
    setName("");
    setShowForm(false);
    setError("");
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

        <div className={styles.summary}>Local browser storage · {defectCount} logged defects</div>
        <section className={styles.boatList} aria-label="Quality Control boat audits">
          {!loaded ? <div className={styles.empty}>Loading audits...</div> : state.boats.length === 0 ? (
            <div className={styles.empty}>No audits yet. Start a new audit to log defects.</div>
          ) : state.boats.map((boat) => (
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
