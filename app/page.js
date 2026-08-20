"use client";

import Link from "next/link";
import { useEffect, useMemo, useRef, useState } from "react";
import {
  BOAT_MODELS,
  BOAT_NAME_PATTERN,
  COMMISSIONING_ENGINEER_PLACEHOLDER,
  COMMISSIONING_ENGINEERS,
  getBoatAreas
} from "../lib/constants";
import { exportBoatReport } from "../lib/pdfReport";
import { createBoat, loadBoat, loadRegisterState, subscribeToStateChanges } from "../lib/storage";

const REGISTER_CACHE_KEY = "hull-master:register-cache:v1";

export default function HomePage() {
  const [state, setState] = useState({ boats: [] });
  const [boatName, setBoatName] = useState("");
  const [commissioningEngineer, setCommissioningEngineer] = useState("");
  const [error, setError] = useState("");
  const [hasLoaded, setHasLoaded] = useState(false);
  const [isAddingBoat, setIsAddingBoat] = useState(false);
  const [selectedModel, setSelectedModel] = useState("all");
  const pendingMutations = useRef(0);
  const queuedRealtimeRefresh = useRef(false);
  const refreshStateRef = useRef(null);
  const refreshTimer = useRef(null);

  async function runSupabaseMutation(mutation) {
    pendingMutations.current += 1;

    try {
      return await mutation();
    } finally {
      pendingMutations.current -= 1;

      if (pendingMutations.current === 0 && queuedRealtimeRefresh.current) {
        queuedRealtimeRefresh.current = false;
        window.clearTimeout(refreshTimer.current);
        refreshTimer.current = window.setTimeout(() => refreshStateRef.current?.(), 80);
      }
    }
  }

  useEffect(() => {
    let isMounted = true;

    try {
      const cachedState = JSON.parse(window.localStorage.getItem(REGISTER_CACHE_KEY) || "null");
      if (Array.isArray(cachedState?.boats)) {
        setState(cachedState);
        setHasLoaded(true);
      }
    } catch {
      window.localStorage.removeItem(REGISTER_CACHE_KEY);
    }

    async function refreshState() {
      try {
        const nextState = await loadRegisterState();

        if (isMounted) {
          if (pendingMutations.current > 0) {
            queuedRealtimeRefresh.current = true;
            return;
          }

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

    refreshStateRef.current = refreshState;
    refreshState();
    const unsubscribe = subscribeToStateChanges(() => {
      if (pendingMutations.current > 0) {
        queuedRealtimeRefresh.current = true;
        return;
      }

      refreshState();
    });

    return () => {
      isMounted = false;
      refreshStateRef.current = null;
      window.clearTimeout(refreshTimer.current);
      unsubscribe();
    };
  }, []);

  useEffect(() => {
    if (hasLoaded) {
      try {
        window.localStorage.setItem(REGISTER_CACHE_KEY, JSON.stringify(state));
      } catch {
        window.localStorage.removeItem(REGISTER_CACHE_KEY);
      }
    }
  }, [hasLoaded, state]);

  const totals = useMemo(() => {
    return state.boats.reduce(
      (acc, boat) => {
        acc.defects += boat.defectCount || 0;
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
    if (boat.defects.length === 0) {
      return new Date(boat.updatedAt || boat.createdAt || 0);
    }

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
    const normalizedEngineer = commissioningEngineer.trim();

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
      const nextBoat = await runSupabaseMutation(() => createBoat(normalizedName, normalizedEngineer));

      setState((current) => ({
        boats: [nextBoat, ...current.boats]
      }));
      setBoatName("");
      setCommissioningEngineer("");
      setError("");
      setIsAddingBoat(false);
    } catch (createError) {
      setError(createError.message || "Could not create boat in Supabase.");
    }
  }

  async function handleExportBoatReport(boat) {
    try {
      const fullBoat = await loadBoat(boat.id);
      const auditedAreas = getBoatAreas(fullBoat)
        .filter((area) => (fullBoat.completedAreas || []).includes(area));

      if (auditedAreas.length === 0) {
        throw new Error("Select at least one area as audited before exporting the PDF.");
      }

      await exportBoatReport(fullBoat, { areas: auditedAreas });
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
            <input
              id="commissioningEngineer"
              list="commissioningEngineerOptions"
              value={commissioningEngineer}
              onChange={(event) => setCommissioningEngineer(event.target.value)}
              placeholder={COMMISSIONING_ENGINEER_PLACEHOLDER}
              autoComplete="name"
              aria-label="Commissioning engineer"
            />
            <datalist id="commissioningEngineerOptions">
              {COMMISSIONING_ENGINEERS.map((engineer) => (
                <option key={engineer} value={engineer} />
              ))}
            </datalist>
            <button className="button" type="submit">Add</button>
            <button
              className="button secondary"
              type="button"
              onClick={() => {
                setBoatName("");
                setCommissioningEngineer("");
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
                const defectCount = boat.defectCount || 0;
                const defectLabel = defectCount === 1 ? "defect" : "defects";
                const engineer = boat.commissioningEngineer || COMMISSIONING_ENGINEER_PLACEHOLDER;

                return (
                  <article className="boat-card" key={boat.id}>
                    <Link className="boat-main-link" href={`/boats/${boat.id}`}>
                      <span className="boat-name">{boat.name}</span>
                      <span className="boat-meta">
                        {defectCount} {defectLabel}{" \u00b7 "}updated {formatRelativeTime(updatedAt)}<br />
                        Engineer: {engineer}
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
