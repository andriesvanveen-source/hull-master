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
    <div className="app-shell">
      <header className="topbar">
        <div className="brand">
          <div className="brand-mark">HM</div>
          <div>
            <p className="brand-title">Hull Master</p>
            <p className="brand-subtitle">Commissioning defect log</p>
          </div>
        </div>
        <div className="toolbar">
          <span className="pill">{totals.boats} boats</span>
          <span className="pill">{totals.defects} defects</span>
        </div>
      </header>

      <main className="main">
        <section className="page-head">
          <span className="eyebrow">Boat Register</span>
          <h1>Select or create a boat</h1>
          <p className="muted">Create a hull record, then open it to log commissioning defects by discipline.</p>
        </section>

        <section className="boat-register">
          <div className="panel">
            <div className="panel-header">
              <div>
                <h2>Boats</h2>
                <p className="muted">Open a boat to log and review defects.</p>
              </div>
              <button
                className="add-boat-button"
                type="button"
                aria-label="Add boat"
                onClick={() => {
                  setIsAddingBoat((current) => !current);
                  setError("");
                }}
              >
                +
              </button>
            </div>
            <div className="panel-body">
              {isAddingBoat ? (
                <form className="quick-boat-form" onSubmit={handleCreateBoat}>
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
              {state.boats.length === 0 ? (
                <div className="empty">No boats yet. Create the first boat to start logging defects.</div>
              ) : (
                <div className="boat-list">
                  {state.boats.map((boat) => {
                    const disciplineCount = new Set(boat.defects.map((defect) => defect.discipline)).size;

                    return (
                      <article className="boat-card" key={boat.id}>
                        <div>
                          <div className="boat-name">{boat.name}</div>
                          <div className="stat-row">
                            <span className="pill">{boat.defects.length} defects</span>
                            <span className="pill">{disciplineCount || 0} active disciplines</span>
                          </div>
                        </div>
                        <Link className="button" href={`/boats/${boat.id}`}>Open log</Link>
                      </article>
                    );
                  })}
                </div>
              )}
            </div>
          </div>
        </section>

      </main>
    </div>
  );
}
