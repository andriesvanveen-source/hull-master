"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { Fragment, useEffect, useMemo, useState } from "react";
import { normalizeDefectText, parseCommonDefectsCsv } from "../../../lib/commonDefects";
import {
  BOAT_NAME_PATTERN,
  COMMON_DEFECT_AREAS,
  COMMISSIONING_ENGINEER_PLACEHOLDER,
  DISCIPLINES,
  GENERAL_AREA,
  getBoatAreas,
  isGeneralArea,
  orderBoatAreas
} from "../../../lib/constants";
import { exportBoatReport } from "../../../lib/pdfReport";
import {
  createDefect,
  deleteBoat,
  deleteDefect,
  duplicateBoat,
  loadCommonDefects,
  loadState,
  subscribeToStateChanges,
  updateBoatAreas,
  updateBoatCommissioningEngineer,
  updateBoatName,
  updateDefectRecord
} from "../../../lib/storage";

export default function BoatLogPage({ params }) {
  const router = useRouter();
  const [state, setState] = useState({ boats: [] });
  const [hasLoaded, setHasLoaded] = useState(false);
  const [drafts, setDrafts] = useState({});
  const [commonDefectsByArea, setCommonDefectsByArea] = useState({});
  const [loadedFullDefectAreas, setLoadedFullDefectAreas] = useState({});
  const [reportDate, setReportDate] = useState(null);
  const [saveError, setSaveError] = useState("");
  const [editingDefectId, setEditingDefectId] = useState(null);
  const [boatNameDraft, setBoatNameDraft] = useState("");
  const [commissioningEngineerDraft, setCommissioningEngineerDraft] = useState("");
  const [newAreaName, setNewAreaName] = useState("");
  const [isAddingArea, setIsAddingArea] = useState(false);
  const [isSavingBoat, setIsSavingBoat] = useState(false);
  const [isSavingEngineer, setIsSavingEngineer] = useState(false);
  const [isSavingAreas, setIsSavingAreas] = useState(false);

  useEffect(() => {
    let isMounted = true;

    async function refreshState() {
      try {
        const nextState = await loadState();

        if (isMounted) {
          setState(nextState);
          setSaveError("");
        }
      } catch (loadError) {
        if (isMounted) {
          setSaveError(loadError.message || "Could not load boat log from Supabase.");
        }
      } finally {
        if (isMounted) {
          setReportDate((current) => current || new Date());
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

  useEffect(() => {
    let isMounted = true;

    fetch("/area-common-defects.json")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Area common defects not found");
        }

        return response.json();
      })
      .then((areaDefects) => {
        if (isMounted) {
          setCommonDefectsByArea(areaDefects);
        }
      })
      .catch(() => {
        if (isMounted) {
          fetch("/common-defects.csv")
            .then((response) => response.ok ? response.text() : "")
            .then((csvText) => {
              if (isMounted && csvText) {
                setCommonDefectsByArea({ all: parseCommonDefectsCsv(csvText) });
              }
            })
            .catch(() => {
              if (isMounted) {
                setCommonDefectsByArea({});
              }
            });
        }
      });

    return () => {
      isMounted = false;
    };
  }, []);

  const boat = state.boats.find((item) => item.id === params.boatId);
  const activeBoatId = boat?.id;
  const activeBoatName = boat?.name;
  const activeCommissioningEngineer = boat?.commissioningEngineer || "";
  const boatAreas = useMemo(() => getBoatAreas(boat), [boat]);
  const areaOptions = useMemo(() => {
    const fromCommonDefects = Object.keys(commonDefectsByArea).filter((area) => area !== "all");
    const existingAreas = new Set(boatAreas.map((area) => area.toLowerCase()));

    return [...new Set([...COMMON_DEFECT_AREAS, ...fromCommonDefects])]
      .filter((area) => !existingAreas.has(area.toLowerCase()));
  }, [boatAreas, commonDefectsByArea]);

  useEffect(() => {
    if (activeBoatName) {
      setBoatNameDraft(activeBoatName);
    }
  }, [activeBoatId, activeBoatName]);

  useEffect(() => {
    if (activeBoatId) {
      setCommissioningEngineerDraft(activeCommissioningEngineer);
    }
  }, [activeBoatId, activeCommissioningEngineer]);

  useEffect(() => {
    let isMounted = true;
    const areasToLoad = boatAreas.filter((area) => !loadedFullDefectAreas[area]);

    if (areasToLoad.length === 0) {
      return () => {
        isMounted = false;
      };
    }

    areasToLoad.forEach((area) => {
      loadCommonDefects(area)
        .then((defects) => {
          if (!isMounted) {
            return;
          }

          if (defects.length > 0) {
            setCommonDefectsByArea((current) => ({
              ...current,
              [area]: defects
            }));
          }

          setLoadedFullDefectAreas((current) => ({
            ...current,
            [area]: true
          }));
        })
        .catch(() => {
          if (isMounted) {
            setLoadedFullDefectAreas((current) => ({
              ...current,
              [area]: true
            }));
          }
        });
    });

    return () => {
      isMounted = false;
    };
  }, [boatAreas, loadedFullDefectAreas]);

  const areaRows = useMemo(() => {
    return boatAreas.reduce((acc, area) => {
      acc[area] = boat ? boat.defects.filter((defect) => defect.area === area) : [];
      return acc;
    }, {});
  }, [boat, boatAreas]);

  const rowNumbers = useMemo(() => {
    if (!boat) {
      return {};
    }

    let current = 1;
    const numbers = {};

    boatAreas.filter((area) => !isGeneralArea(area)).forEach((area) => {
      boat.defects
        .filter((defect) => defect.area === area && defect.text.trim())
        .forEach((defect) => {
          numbers[defect.id] = current;
          current += 1;
        });
    });

    return numbers;
  }, [boat, boatAreas]);

  function updateBoatInState(updatedBoat) {
    setState((current) => ({
      boats: current.boats.map((item) => (
        item.id === updatedBoat.id ? updatedBoat : item
      ))
    }));
  }

  function updateDefectInState(defectId, updater) {
    setState((current) => ({
      boats: current.boats.map((item) => {
        if (item.id !== params.boatId) {
          return item;
        }

        return {
          ...item,
          defects: item.defects.map((defect) => (
            defect.id === defectId ? updater(defect) : defect
          ))
        };
      })
    }));
  }

  function removeDefectFromState(defectId) {
    setState((current) => ({
      boats: current.boats.map((item) => {
        if (item.id !== params.boatId) {
          return item;
        }

        return {
          ...item,
          defects: item.defects.filter((defect) => defect.id !== defectId)
        };
      })
    }));
  }

  async function saveBoatAreas(nextAreas) {
    setIsSavingAreas(true);

    try {
      const updatedBoat = await updateBoatAreas(boat.id, orderBoatAreas(nextAreas));
      updateBoatInState(updatedBoat);
      setSaveError("");
      return updatedBoat;
    } catch (updateError) {
      setSaveError(updateError.message || "Could not update boat areas.");
      return null;
    } finally {
      setIsSavingAreas(false);
    }
  }

  async function addArea(event) {
    event.preventDefault();
    const normalizedArea = newAreaName.trim();

    if (!normalizedArea) {
      setSaveError("Choose an area.");
      return;
    }

    if (boatAreas.some((area) => area.toLowerCase() === normalizedArea.toLowerCase())) {
      setSaveError(`${normalizedArea} is already on this boat.`);
      return;
    }

    const updatedBoat = await saveBoatAreas([...boatAreas, normalizedArea]);

    if (updatedBoat) {
      setNewAreaName("");
      setIsAddingArea(false);
    }
  }

  async function removeArea(area) {
    const defects = areaRows[area] || [];

    if (isGeneralArea(area)) {
      setSaveError(`${GENERAL_AREA} must stay at the bottom of every boat.`);
      return;
    }

    if (defects.length > 0) {
      setSaveError("Remove this area's defects before removing the area.");
      return;
    }

    if (boatAreas.length <= 1) {
      setSaveError("A boat needs at least one area.");
      return;
    }

    await saveBoatAreas(boatAreas.filter((item) => item !== area));
  }

  async function saveDraftDefect(area, draftInput, options = {}) {
    const draft = draftInput || drafts[area] || { text: "", discipline: "" };

    if (!draft.text.trim() || draft.isSaving) {
      return;
    }

    if (options.closeImmediately) {
      setDrafts((current) => ({
        ...current,
        [area]: { text: "", discipline: "" }
      }));
    } else {
      setDrafts((current) => ({
        ...current,
        [area]: { ...draft, isSaving: true }
      }));
    }

    try {
      const nextDefect = await createDefect({
        boatId: params.boatId,
        text: draft.text,
        discipline: draft.discipline,
        area
      });

      setState((current) => ({
        boats: current.boats.map((item) => {
          if (item.id !== params.boatId) {
            return item;
          }

          return {
            ...item,
            defects: [...item.defects, nextDefect]
          };
        })
      }));
      setDrafts((current) => ({
        ...current,
        [area]: { text: "", discipline: "" }
      }));
      setSaveError("");
    } catch (createError) {
      setDrafts((current) => ({
        ...current,
        [area]: { ...draft, isSaving: false, isOpen: true }
      }));
      setSaveError(createError.message || "Could not save defect to Supabase.");
    }
  }

  async function addDefectFromBlank(area) {
    await saveDraftDefect(area);
  }

  async function updateDefect(defectId, field, value) {
    if (field === "text" && !value.trim()) {
      removeDefectFromState(defectId);

      try {
        await deleteDefect(defectId);
        setSaveError("");
      } catch (deleteError) {
        setSaveError(deleteError.message || "Could not delete defect from Supabase.");
      }
      return;
    }

    updateDefectInState(defectId, (defect) => ({
      ...defect,
      [field]: value
    }));

    try {
      await updateDefectRecord(defectId, { [field]: value });
      setSaveError("");
    } catch (updateError) {
      setSaveError(updateError.message || "Could not update defect in Supabase.");
    }
  }

  async function removeDefect(defectId) {
    setEditingDefectId((current) => (current === defectId ? null : current));
    removeDefectFromState(defectId);

    try {
      await deleteDefect(defectId);
      setSaveError("");
    } catch (deleteError) {
      setSaveError(deleteError.message || "Could not delete defect from Supabase.");
    }
  }

  function getAreaCommonDefects(area) {
    return commonDefectsByArea[area] || commonDefectsByArea.all || [];
  }

  function findCommonDefect(value, area) {
    const normalizedValue = normalizeDefectText(value);

    return getAreaCommonDefects(area).find((defect) => normalizeDefectText(defect.text) === normalizedValue);
  }

  async function updateDefectText(defectId, value) {
    const currentDefect = boat.defects.find((defect) => defect.id === defectId);
    const matchedDefect = findCommonDefect(value, currentDefect?.area);

    if (!value.trim()) {
      await updateDefect(defectId, "text", value);
      return;
    }

    const patch = {
      text: value,
      ...(matchedDefect?.discipline ? { discipline: matchedDefect.discipline } : {})
    };

    updateDefectInState(defectId, (defect) => ({
      ...defect,
      text: value,
      discipline: matchedDefect?.discipline || defect.discipline
    }));

    try {
      await updateDefectRecord(defectId, patch);
      setSaveError("");
    } catch (updateError) {
      setSaveError(updateError.message || "Could not update defect in Supabase.");
    }
  }

  function getDefectSuggestions(value, area) {
    const query = normalizeDefectText(value);
    const areaDefects = getAreaCommonDefects(area);

    if (!query) {
      return areaDefects;
    }

    return areaDefects
      .filter((defect) => normalizeDefectText(defect.text).includes(query));
  }

  async function selectExistingDefect(defectId, selectedDefect) {
    updateDefectInState(defectId, (defect) => ({
      ...defect,
      text: selectedDefect.text,
      discipline: selectedDefect.discipline || defect.discipline
    }));

    try {
      await updateDefectRecord(defectId, {
        text: selectedDefect.text,
        discipline: selectedDefect.discipline
      });
      setEditingDefectId(null);
      setSaveError("");
    } catch (updateError) {
      setSaveError(updateError.message || "Could not update defect in Supabase.");
    }
  }

  async function exportReport() {
    if (document.activeElement instanceof HTMLElement) {
      document.activeElement.blur();
    }

    try {
      const createdAt = await exportBoatReport(boat);
      setReportDate(createdAt);
      setSaveError("");
    } catch (exportError) {
      setSaveError(exportError.message || "Could not export PDF report.");
    }
  }

  async function saveBoatName(event) {
    event.preventDefault();
    const normalizedName = boatNameDraft.trim().toUpperCase();

    if (!normalizedName) {
      setSaveError("Enter a boat number.");
      return;
    }

    if (!BOAT_NAME_PATTERN.test(normalizedName)) {
      setSaveError("Use a hull name like C1001, C2001, B5001, B8001, B9001, or C5001.");
      return;
    }

    if (state.boats.some((item) => item.id !== boat.id && item.name === normalizedName)) {
      setSaveError(`${normalizedName} already exists.`);
      return;
    }

    if (normalizedName === boat.name) {
      setBoatNameDraft(normalizedName);
      setSaveError("");
      return;
    }

    setIsSavingBoat(true);

    try {
      const updatedBoat = await updateBoatName(boat.id, normalizedName);

      updateBoatInState(updatedBoat);
      setBoatNameDraft(updatedBoat.name);
      setSaveError("");
    } catch (updateError) {
      setSaveError(updateError.message || "Could not update boat number.");
    } finally {
      setIsSavingBoat(false);
    }
  }

  async function saveCommissioningEngineer(event) {
    event.preventDefault();
    const normalizedEngineer = commissioningEngineerDraft.trim();

    if (normalizedEngineer === activeCommissioningEngineer) {
      setCommissioningEngineerDraft(normalizedEngineer);
      setSaveError("");
      return;
    }

    setIsSavingEngineer(true);

    try {
      const updatedBoat = await updateBoatCommissioningEngineer(boat.id, normalizedEngineer);

      updateBoatInState(updatedBoat);
      setCommissioningEngineerDraft(updatedBoat.commissioningEngineer || "");
      setSaveError("");
    } catch (updateError) {
      setSaveError(updateError.message || "Could not update commissioning engineer.");
    } finally {
      setIsSavingEngineer(false);
    }
  }

  async function deleteCurrentBoat() {
    const confirmed = window.confirm("Are you sure you want to delete this boat?");

    if (!confirmed) {
      return;
    }

    try {
      await deleteBoat(boat.id);
      router.push("/");
    } catch (deleteError) {
      setSaveError(deleteError.message || "Could not delete boat.");
    }
  }

  async function duplicateCurrentBoat() {
    const suggestedName = boat.name.replace(/^C(\d+)$/, (_match, number) => `C${Number(number) + 1}`);
    const nextName = window.prompt("Enter the new boat number for the duplicate:", suggestedName);

    if (nextName === null) {
      return;
    }

    const normalizedName = nextName.trim().toUpperCase();

    if (!BOAT_NAME_PATTERN.test(normalizedName)) {
      setSaveError("Use a hull name like C1001, C2001, B5001, B8001, B9001, or C5001.");
      return;
    }

    if (state.boats.some((item) => item.name === normalizedName)) {
      setSaveError(`${normalizedName} already exists.`);
      return;
    }

    try {
      const nextBoat = await duplicateBoat(boat, normalizedName);
      router.push(`/boats/${nextBoat.id}`);
    } catch (duplicateError) {
      setSaveError(duplicateError.message || "Could not duplicate boat.");
    }
  }

  function updateDraft(area, field, value) {
    const matchedDefect = field === "text" ? findCommonDefect(value, area) : null;

    setDrafts((current) => ({
      ...current,
      [area]: {
        text: current[area]?.text || "",
        discipline: matchedDefect?.discipline || current[area]?.discipline || "",
        isOpen: current[area]?.isOpen || false,
        [field]: value
      }
    }));
  }

  async function selectDraftDefect(area, selectedDefect) {
    const selectedDraft = {
      text: selectedDefect.text,
      discipline: selectedDefect.discipline || drafts[area]?.discipline || "",
      isOpen: true
    };

    await saveDraftDefect(area, selectedDraft, { closeImmediately: true });
  }

  function openDraft(area) {
    setDrafts((current) => ({
      ...current,
      [area]: {
        text: current[area]?.text || "",
        discipline: current[area]?.discipline || "",
        isOpen: true
      }
    }));
  }

  if (!hasLoaded) {
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
          <Link className="button secondary" href="/">Back to boats</Link>
        </header>
        <main className="main">
          <div className="panel">
            <div className="panel-body empty">Loading boat log...</div>
          </div>
        </main>
      </div>
    );
  }

  if (!boat) {
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
          <Link className="button secondary" href="/">Back to boats</Link>
        </header>
        <main className="main">
          <div className="panel">
            <div className="panel-body empty">
              {saveError || "Boat not found. Return to the boat register and select a boat."}
            </div>
          </div>
        </main>
      </div>
    );
  }

  return (
    <div className="log-shell">
      <main className="log-page">
        <div className="log-nav">
          <Link className="back-link" href="/">{"<-"} All boats</Link>
          <div className="log-actions">
            <button className="export-button secondary-action" type="button" onClick={duplicateCurrentBoat}>Duplicate</button>
            <button className="export-button danger-action" type="button" onClick={deleteCurrentBoat}>Delete</button>
            <button className="export-button" type="button" onClick={exportReport}>Export PDF</button>
          </div>
        </div>

        <header className="print-report-header">
          <h1>Yacht Commissioning Audit</h1>
          <div>
            <span>Hull {boat.name}</span>
            <span>{reportDate ? reportDate.toLocaleString() : ""}</span>
            <span>Commissioning Engineer: {activeCommissioningEngineer}</span>
          </div>
        </header>

        <header className="log-header">
          <div>
            <p className="log-kicker">Hull Number</p>
            <form className="boat-name-editor" onSubmit={saveBoatName}>
              <input
                className="boat-name-input"
                value={boatNameDraft}
                onChange={(event) => setBoatNameDraft(event.target.value)}
                aria-label="Boat number"
                disabled={isSavingBoat}
              />
            </form>
            <p className="log-kicker">Commissioning Engineer</p>
            <form className="boat-name-editor" onSubmit={saveCommissioningEngineer}>
              <input
                className="boat-name-input"
                value={commissioningEngineerDraft}
                onChange={(event) => setCommissioningEngineerDraft(event.target.value)}
                onBlur={saveCommissioningEngineer}
                placeholder={COMMISSIONING_ENGINEER_PLACEHOLDER}
                aria-label="Commissioning engineer"
                disabled={isSavingEngineer}
              />
            </form>
          </div>
          <p className="autosave-note">{saveError || "Auto-saves to Supabase as you type"}</p>
        </header>

        <section className="sheet-table-wrap">
          <table className="sheet-table">
            <thead>
              <tr>
                <th className="remove-col" aria-label="Remove defect"></th>
                <th>Defect Description</th>
                <th className="discipline-col">Discipline</th>
              </tr>
            </thead>
            <tbody>
              {boatAreas.map((area) => {
                const defects = areaRows[area] || [];
                const isPinnedGeneralArea = isGeneralArea(area);

                return (
                  <Fragment key={area}>
                    <tr className="area-row" key={`${area}-heading`}>
                      <td colSpan="3">
                        <span>{area}</span>
                        <button
                          type="button"
                          onClick={() => removeArea(area)}
                          disabled={isSavingAreas || isPinnedGeneralArea || defects.length > 0 || boatAreas.length <= 1}
                          title={isPinnedGeneralArea ? `${GENERAL_AREA} always stays at the bottom` : defects.length > 0 ? "Remove this area's defects before removing the area" : "Remove area"}
                          style={{
                            float: "right",
                            minHeight: "24px",
                            border: "1px solid rgba(255,255,255,0.5)",
                            borderRadius: "999px",
                            padding: "0 10px",
                            background: "rgba(255,255,255,0.12)",
                            color: "inherit",
                            fontFamily: "Arial, Helvetica, sans-serif",
                            fontSize: "12px",
                            fontWeight: 800,
                            opacity: isPinnedGeneralArea || defects.length > 0 || boatAreas.length <= 1 ? 0.45 : 1
                          }}
                        >
                          Remove
                        </button>
                      </td>
                    </tr>
                    {defects.map((defect) => (
                      <tr className="entry-row" key={defect.id}>
                        <td className="remove-cell">
                          <button
                            className="remove-defect-button"
                            type="button"
                            onClick={() => removeDefect(defect.id)}
                            aria-label={`Remove ${defect.text}`}
                            title="Remove defect"
                          >
                            -
                          </button>
                        </td>
                        <td>
                          {editingDefectId === defect.id ? (
                            <DefectSearchInput
                              value={defect.text}
                              suggestions={getDefectSuggestions(defect.text, area)}
                              onChange={(value) => updateDefectText(defect.id, value)}
                              onSelect={(selectedDefect) => selectExistingDefect(defect.id, selectedDefect)}
                              onBlur={() => setEditingDefectId(null)}
                              placeholder="Type a defect..."
                              autoFocus
                            />
                          ) : (
                            <button
                              className="defect-text-button"
                              type="button"
                              onClick={() => setEditingDefectId(defect.id)}
                              title="Edit defect"
                            >
                              {defect.text}
                            </button>
                          )}
                        </td>
                        <td>
                          <select
                            className="table-select"
                            value={defect.discipline}
                            onChange={(event) => updateDefect(defect.id, "discipline", event.target.value)}
                            aria-label={`${area} discipline`}
                          >
                            <option value="">-</option>
                            {DISCIPLINES.map((item) => (
                              <option key={item} value={item}>{item}</option>
                            ))}
                          </select>
                        </td>
                      </tr>
                    ))}
                    {drafts[area]?.isOpen ? (
                      <tr className="entry-row draft-row" key={`${area}-blank`}>
                        <td className="remove-cell"></td>
                        <td>
                          <DefectSearchInput
                            value={drafts[area]?.text || ""}
                            suggestions={getDefectSuggestions(drafts[area]?.text || "", area)}
                            onChange={(value) => updateDraft(area, "text", value)}
                            onSelect={(selectedDefect) => selectDraftDefect(area, selectedDefect)}
                            onBlur={() => addDefectFromBlank(area)}
                            placeholder="Type a defect..."
                            ariaLabel={`${area} defect description`}
                            autoFocus
                          />
                        </td>
                        <td>
                          <select
                            className="table-select"
                            value={drafts[area]?.discipline || ""}
                            onChange={(event) => updateDraft(area, "discipline", event.target.value)}
                            onBlur={() => addDefectFromBlank(area)}
                            aria-label={`${area} new defect discipline`}
                          >
                            <option value="">-</option>
                            {DISCIPLINES.map((item) => (
                              <option key={item} value={item}>{item}</option>
                            ))}
                          </select>
                        </td>
                      </tr>
                    ) : null}
                    <tr className="add-defect-row" key={`${area}-add`}>
                      <td colSpan="3">
                        <button className="add-defect-button" type="button" onClick={() => openDraft(area)}>
                          +
                        </button>
                      </td>
                    </tr>
                  </Fragment>
                );
              })}
            </tbody>
          </table>
        </section>

        <div style={{ display: "grid", gap: "10px", justifyItems: "center", marginTop: "18px" }}>
          <button
            className="button secondary"
            type="button"
            onClick={() => {
              setIsAddingArea((current) => !current);
              setNewAreaName("");
              setSaveError("");
            }}
          >
            Add Area
          </button>
          {isAddingArea ? (
            <form className="quick-boat-form" onSubmit={addArea} style={{ width: "min(520px, 100%)" }}>
              <select
                value={newAreaName}
                onChange={(event) => setNewAreaName(event.target.value)}
                aria-label="Area to add"
                disabled={isSavingAreas || areaOptions.length === 0}
              >
                <option value="">Select area</option>
                {areaOptions.map((area) => (
                  <option key={area} value={area}>{area}</option>
                ))}
              </select>
              <button className="button" type="submit" disabled={isSavingAreas || !newAreaName}>Add</button>
            </form>
          ) : null}
          {isAddingArea && areaOptions.length === 0 ? (
            <p className="autosave-note" style={{ marginTop: 0 }}>All suggested areas are already on this boat.</p>
          ) : null}
        </div>

        <section className="print-table-wrap">
          <table className="audit-report-table">
            <thead>
              <tr>
                <th className="audit-number-col">#</th>
                <th>Defect</th>
                <th className="audit-discipline-col">Discipline</th>
                <th className="audit-signoff-col">Team Member</th>
                <th className="audit-date-col">Date</th>
                <th className="audit-signoff-col">Team Leader</th>
                <th className="audit-signoff-col">Commissioning Engineer</th>
              </tr>
            </thead>
            <tbody>
              {boatAreas.map((area) => {
                const defects = areaRows[area] || [];

                return (
                  <Fragment key={`${area}-report`}>
                    <tr className="audit-area-row">
                      <td colSpan="7">{area}</td>
                    </tr>
                    {defects.length === 0 ? (
                      <tr className="audit-empty-row">
                        <td colSpan="7">- no defects logged -</td>
                      </tr>
                    ) : (
                      defects.map((defect) => (
                        <tr className="audit-entry-row" key={`${defect.id}-report`}>
                          <td>{isGeneralArea(area) ? "" : rowNumbers[defect.id]}</td>
                          <td>{defect.text}</td>
                          <td>{defect.discipline || "-"}</td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                      ))
                    )}
                  </Fragment>
                );
              })}
            </tbody>
          </table>
        </section>

        <p className="table-tip">Tip: numbering is continuous across all areas and only counts defects with descriptions.</p>
      </main>
    </div>
  );
}

function DefectSearchInput({
  ariaLabel,
  autoFocus = false,
  onBlur,
  onChange,
  onSelect,
  placeholder,
  suggestions,
  value
}) {
  const [isFocused, setIsFocused] = useState(false);
  const hasSuggestions = isFocused && suggestions.length > 0;

  function handleSelect(selectedDefect) {
    setIsFocused(false);
    if (document.activeElement instanceof HTMLElement) {
      document.activeElement.blur();
    }
    onSelect(selectedDefect);
  }

  return (
    <div className="defect-search-cell">
      <input
        className="table-input"
        value={value}
        onChange={(event) => onChange(event.target.value)}
        onFocus={() => setIsFocused(true)}
        onBlur={() => {
          window.setTimeout(() => setIsFocused(false), 120);
          onBlur?.();
        }}
        placeholder={placeholder}
        aria-label={ariaLabel}
        autoComplete="off"
        autoFocus={autoFocus}
      />
      {hasSuggestions ? (
        <div className="defect-suggestions" role="listbox">
          {suggestions.map((defect, index) => (
            <button
              className="defect-suggestion"
              key={`${defect.text}-${defect.discipline}-${index}`}
              type="button"
              onMouseDown={(event) => {
                event.preventDefault();
                handleSelect(defect);
              }}
            >
              <span>{defect.text}</span>
              {defect.discipline ? <span className="suggestion-discipline">{defect.discipline}</span> : null}
            </button>
          ))}
        </div>
      ) : null}
    </div>
  );
}
