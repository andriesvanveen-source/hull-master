"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import { BOAT_MODELS, BOAT_NAME_PATTERN } from "../lib/constants";
import { exportBoatReport } from "../lib/pdfReport";
import { createBoat, loadState, subscribeToStateChanges } from "../lib/storage";

export default function HomePage() {
  const [state, setState] = useState({ boats: [] });
  const [boatName, setBoatName] = useState("");
  const [error, setError] = useState("");
  const [hasLoaded, setHasLoaded] = useState(false);
  const [isAddingBoat, setIsAddingBoat] = useState(false);
  const [selectedModel, setSelectedModel] = useState("all");

  useEffect(() => {
    let isMounted = true;

    async function refreshState() {
      try {
        const nextState = await loadState();

        if (isMounted) {
          setState(nextState);
          setError("");
        }
      } catch (loadError) {
        if (isMounted) {
          setError(loadError.message || "Could not load boats from Supabase.");
        }
      } finally {
        if (isMounted) {
          setHasLoaded(true);
        }
      }
    }

    refreshState();
    const unsubscribe = subscribeToStateChanges(refreshState);

    return () => {
      isMounted = false;
      unsubscribe();
    };
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

  const visibleBoats = useMemo(() => {
    if (selectedModel === "all") {
      return state.boats;
    }

    return state.boats.filter((boat) => boat.name.slice(0, 2) === selectedModel);
  }, [selectedModel, state.boats]);

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

  async function handleCreateBoat(event) {
    event.preventDefault();
    const normalizedName = boatName.trim().toUpperCase();

    if (!normalizedName) {
      setError("Enter a boat name.");
      return;
    }

    if (!BOAT_NAME_PATTERN.test(normalizedName)) {
      setError("Use a hull name like C1001, C2001, B5001, B8001, B9001, or C5001.");
      return;
    }

    if (state.boats.some((boat) => boat.name === normalizedName)) {
      setError(`${normalizedName} already exists.`);
      return;
    }

    try {
      const nextBoat = await createBoat(normalizedName);

      setState((current) => ({
        boats: [nextBoat, ...current.boats]
      }));
      setBoatName("");
      setError("");
      setIsAddingBoat(false);
    } catch (createError) {
      setError(createError.message || "Could not create boat in Supabase.");
    }
  }

  async function handleExportBoatReport(boat) {
    try {
      await exportBoatReport(boat);
      setError("");
    } catch (exportError) {
      setError(exportError.message || "Could not export PDF report.");
    }
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

        <div className="model-filter">
          <label htmlFor="boatModelFilter">Model</label>
          <select
            id="boatModelFilter"
            value={selectedModel}
            onChange={(event) => setSelectedModel(event.target.value)}
            aria-label="Filter boats by model"
          >
            <option value="all">All boats</option>
            {BOAT_MODELS.map((model) => (
              <option key={model} value={model}>{model}</option>
            ))}
          </select>
        </div>

        {error ? <p className="muted form-error">{error}</p> : null}

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
          </form>
        ) : null}

        <section className="boat-register" aria-label="Boat audits">
          {!hasLoaded ? (
            <div className="empty register-empty">Loading boats...</div>
          ) : state.boats.length === 0 ? (
            <div className="empty register-empty">No boats yet. Create the first audit to start logging defects.</div>
          ) : visibleBoats.length === 0 ? (
            <div className="empty register-empty">No {selectedModel} boats found.</div>
          ) : (
            <div className="boat-list">
              {visibleBoats.map((boat) => {
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
                    <button
                      className="pdf-button"
                      type="button"
                      onClick={() => handleExportBoatReport(boat)}
                    >
                      <span className="pdf-icon" aria-hidden="true"></span>
                      PDF
                    </button>
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
