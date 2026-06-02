"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import { createBoat, loadState, saveState } from "../lib/storage";

export default function HomePage() {
  const [state, setState] = useState({ boats: [] });
  const [boatName, setBoatName] = useState("");
  const [error, setError] = useState("");
  const [isAddingBoat, setIsAddingBoat] = useState(false);

  useEffect(() => {
    setState(loadState());
  }, []);

  const totals = useMemo(() => {
    return state.boats.reduce(
      (acc, boat) => {
        acc.defects += boat.defects.length;
        return acc;
      },
      { boats: state.boats.length, defects: 0 }
    );
  }, [state.boats]);

  function getBoatUpdatedAt(boat) {
    return boat.defects.reduce((latest, defect) => {
      const defectDate = new Date(defect.createdAt || boat.createdAt || 0);
      return defectDate > latest ? defectDate : latest;
    }, new Date(boat.createdAt || 0));
  }

  function formatRelativeTime(date) {
    const timestamp = date.getTime();

    if (!timestamp) {
      return "just now";
    }

    const diffMs = Date.now() - timestamp;
    const minutes = Math.max(1, Math.floor(diffMs / 60000));

    if (minutes < 60) {
      return `${minutes}m ago`;
    }

    const hours = Math.floor(minutes / 60);

    if (hours < 24) {
      return `${hours}h ago`;
    }

    const days = Math.floor(hours / 24);
    return `${days}d ago`;
  }

  function updateState(nextState) {
    setState(nextState);
    saveState(nextState);
  }

  function handleCreateBoat(event) {
    event.preventDefault();
    const normalizedName = boatName.trim().toUpperCase();

    if (!normalizedName) {
      setError("Enter a boat name.");
      return;
    }

    if (!/^C\d{3,5}$/.test(normalizedName)) {
      setError("Use a hull name like C2024.");
      return;
    }

    if (state.boats.some((boat) => boat.name === normalizedName)) {
      setError(`${normalizedName} already exists.`);
      return;
    }

    const nextState = {
      boats: [createBoat(normalizedName), ...state.boats]
    };

    updateState(nextState);
    setBoatName("");
    setError("");
    setIsAddingBoat(false);
  }

  return (
    <div className="register-shell">
      <main className="register-page">
        <header className="register-topbar">
          <div className="register-brand">
            <span className="register-anchor" aria-hidden="true">{"\u2693"}</span>
            <span className="register-kicker">Commissioning Log</span>
          </div>
          <p className="register-count">{totals.boats} {totals.boats === 1 ? "hull" : "hulls"}</p>
        </header>

        <section className="register-hero">
          <h1>Boats</h1>
          <button
            className="new-audit-button"
            type="button"
            onClick={() => {
              setIsAddingBoat((current) => !current);
              setError("");
            }}
          >
            <span aria-hidden="true">+</span>
            New audit
          </button>
        </section>

        {isAddingBoat ? (
          <form className="quick-boat-form register-form" onSubmit={handleCreateBoat}>
            <input
              id="boatName"
              value={boatName}
              onChange={(event) => setBoatName(event.target.value)}
              placeholder="C2024"
              autoComplete="off"
              aria-label="Boat name"
              autoFocus
            />
            <button className="button" type="submit">Add</button>
            <button
              className="button secondary"
              type="button"
              onClick={() => {
                setBoatName("");
                setError("");
                setIsAddingBoat(false);
              }}
            >
              Cancel
            </button>
            {error ? <p className="muted form-error">{error}</p> : null}
          </form>
        ) : null}

        <section className="boat-register" aria-label="Boat audits">
          {state.boats.length === 0 ? (
            <div className="empty register-empty">No boats yet. Create the first audit to start logging defects.</div>
          ) : (
            <div className="boat-list">
              {state.boats.map((boat) => {
                const updatedAt = getBoatUpdatedAt(boat);
                const defectLabel = boat.defects.length === 1 ? "defect" : "defects";

                return (
                  <article className="boat-card" key={boat.id}>
                    <Link className="boat-main-link" href={`/boats/${boat.id}`}>
                      <span className="boat-name">{boat.name}</span>
                      <span className="boat-meta">
                        {boat.defects.length} {defectLabel}{" \u00b7 "}updated {formatRelativeTime(updatedAt)}
                      </span>
                    </Link>
                    <Link className="pdf-button" href={`/boats/${boat.id}`}>
                      <span className="pdf-icon" aria-hidden="true"></span>
                      PDF
                    </Link>
                  </article>
                );
              })}
            </div>
          )}
        </section>
      </main>
    </div>
  );
}
