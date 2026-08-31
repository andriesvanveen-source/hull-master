"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { Fragment, useEffect, useMemo, useRef, useState } from "react";
import { normalizeDefectText, parseCommonDefectsCsv } from "../../../lib/commonDefects";
import {
  BOAT_MODELS,
  BOAT_NAME_PATTERN,
  COMMON_DEFECT_AREAS,
  COMMISSIONING_ENGINEER_PLACEHOLDER,
  DISCIPLINES,
  GENERAL_AREA,
  getBoatAreas,
  getCommonDefectAreaNames,
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
  loadBoatEditorState,
  subscribeToBoatChanges,
  updateBoatAreas,
  updateBoatCompletedAreas,
  updateBoatCommissioningEngineer,
  updateBoatName,
  updateDefectRecord
} from "../../../lib/storage";

const boatCacheKey = (boatId) => `hull-master:boat-cache:v1:${boatId}`;

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
  const [defectTextDrafts, setDefectTextDrafts] = useState({});
  const [defectDisciplineDrafts, setDefectDisciplineDrafts] = useState({});
  const [showRepeatDefects, setShowRepeatDefects] = useState(false);
  const [boatNameDraft, setBoatNameDraft] = useState("");
  const [commissioningEngineerDraft, setCommissioningEngineerDraft] = useState("");
  const [newAreaName, setNewAreaName] = useState("");
  const [isAddingArea, setIsAddingArea] = useState(false);
  const [isSavingBoat, setIsSavingBoat] = useState(false);
  const [isSavingEngineer, setIsSavingEngineer] = useState(false);
  const [isSavingAreas, setIsSavingAreas] = useState(false);
  const [isSavingAreaProgress, setIsSavingAreaProgress] = useState(false);
  const [blankRowsByArea, setBlankRowsByArea] = useState({});
  const [localDraftBoatId, setLocalDraftBoatId] = useState("");
  const latestStateRequest = useRef(0);
  const savingDraftAreas = useRef(new Set());
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
      const cachedState = JSON.parse(window.localStorage.getItem(boatCacheKey(params.boatId)) || "null");
      if (Array.isArray(cachedState?.boats)) {
        setState(cachedState);
        setHasLoaded(true);
      }
    } catch {
      window.localStorage.removeItem(boatCacheKey(params.boatId));
    }

    async function refreshState() {
      const requestId = latestStateRequest.current + 1;
      latestStateRequest.current = requestId;

      try {
        const nextState = await loadBoatEditorState(params.boatId);

        if (isMounted && requestId === latestStateRequest.current) {
          if (pendingMutations.current > 0) {
            queuedRealtimeRefresh.current = true;
            return;
          }

          setState(nextState);
          setSaveError("");
        }
      } catch (loadError) {
        if (isMounted && requestId === latestStateRequest.current) {
          setSaveError(loadError.message || "Could not load boat log from Supabase.");
        }
      } finally {
        if (isMounted) {
          setReportDate((current) => current || new Date());
          setHasLoaded(true);
        }
      }
    }

    refreshStateRef.current = refreshState;
    refreshState();
    const unsubscribe = subscribeToBoatChanges(params.boatId, () => {
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
  }, [params.boatId]);

  useEffect(() => {
    if (hasLoaded && state.boats.some((boat) => boat.id === params.boatId)) {
      try {
        window.localStorage.setItem(boatCacheKey(params.boatId), JSON.stringify(state));
      } catch {
        window.localStorage.removeItem(boatCacheKey(params.boatId));
      }
    }
  }, [hasLoaded, params.boatId, state]);

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
  const localDraftKey = `hull-master:drafts:${params.boatId}`;
  const boatAreas = useMemo(() => getBoatAreas(boat), [boat]);
  const areAllAreasComplete = boatAreas.length > 0
    && boatAreas.every((area) => (boat?.completedAreas || []).includes(area));
  const previousBoat = useMemo(() => findPreviousBoat(boat, state.boats), [boat, state.boats]);
  const repeatedDefectTexts = useMemo(() => {
    if (!previousBoat) {
      return new Set();
    }

    return new Set(
      previousBoat.defects
        .map((defect) => normalizeDefectText(defect.text))
        .filter(Boolean)
    );
  }, [previousBoat]);
  const shouldHighlightRepeats = showRepeatDefects && repeatedDefectTexts.size > 0;
  const areaOptions = useMemo(() => {
    const fromCommonDefects = Object.keys(commonDefectsByArea).filter((area) => area !== "all");
    const existingAreas = new Set(boatAreas.map((area) => area.toLowerCase()));

    return [...new Set([...COMMON_DEFECT_AREAS, ...fromCommonDefects])]
      .filter((area) => !existingAreas.has(area.toLowerCase()));
  }, [boatAreas, commonDefectsByArea]);

  useEffect(() => {
    if (!activeBoatId) return;
    try {
      const saved = JSON.parse(window.localStorage.getItem(localDraftKey) || "{}");
      setDrafts(saved.drafts || {});
      setDefectTextDrafts(saved.defectTextDrafts || {});
      setDefectDisciplineDrafts(saved.defectDisciplineDrafts || {});
      setBlankRowsByArea(saved.blankRowsByArea || {});
      if (typeof saved.newAreaName === "string") setNewAreaName(saved.newAreaName);
    } catch {
      window.localStorage.removeItem(localDraftKey);
    } finally {
      setLocalDraftBoatId(activeBoatId);
    }
  }, [activeBoatId, localDraftKey]);

  useEffect(() => {
    if (!activeBoatId || localDraftBoatId !== activeBoatId) return;
    window.localStorage.setItem(localDraftKey, JSON.stringify({
      drafts,
      defectTextDrafts,
      defectDisciplineDrafts,
      blankRowsByArea,
      newAreaName
    }));
  }, [activeBoatId, localDraftKey, localDraftBoatId, drafts, defectTextDrafts, defectDisciplineDrafts, blankRowsByArea, newAreaName]);

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
    const areasToLoad = [...new Set(boatAreas.flatMap(getCommonDefectAreaNames))]
      .filter((area) => !loadedFullDefectAreas[area]);

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

  function clearDefectTextDraft(defectId) {
    setDefectTextDrafts((current) => {
      const nextDrafts = { ...current };
      delete nextDrafts[defectId];
      return nextDrafts;
    });
  }

  async function saveBoatAreas(nextAreas) {
    setIsSavingAreas(true);

    try {
      const updatedBoat = await runSupabaseMutation(() => (
        updateBoatAreas(boat.id, orderBoatAreas(nextAreas))
      ));
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

  async function toggleAreaComplete(area) {
    if (isSavingAreaProgress) {
      return;
    }

    const completed = new Set(boat.completedAreas || []);
    completed.has(area) ? completed.delete(area) : completed.add(area);
    updateBoatInState({ ...boat, completedAreas: [...completed] });
    setIsSavingAreaProgress(true);

    try {
      const updatedBoat = await runSupabaseMutation(() => (
        updateBoatCompletedAreas(boat.id, [...completed])
      ));
      updateBoatInState({
        ...boat,
        completedAreas: updatedBoat.completedAreas
      });
      setSaveError("");
    } catch (updateError) {
      updateBoatInState(boat);
      setSaveError(updateError.message || "Could not save area progress.");
    } finally {
      setIsSavingAreaProgress(false);
    }
  }

  function restoreDefectToState(defect, originalIndex) {
    setState((current) => ({
      boats: current.boats.map((item) => {
        if (item.id !== params.boatId || item.defects.some((entry) => entry.id === defect.id)) {
          return item;
        }

        const defects = [...item.defects];
        defects.splice(Math.min(originalIndex, defects.length), 0, defect);
        return { ...item, defects };
      })
    }));
  }

  async function setAllAreasComplete(shouldComplete) {
    if (isSavingAreaProgress) {
      return;
    }

    const nextCompletedAreas = shouldComplete ? [...boatAreas] : [];
    updateBoatInState({ ...boat, completedAreas: nextCompletedAreas });
    setIsSavingAreaProgress(true);

    try {
      const updatedBoat = await runSupabaseMutation(() => (
        updateBoatCompletedAreas(boat.id, nextCompletedAreas)
      ));
      updateBoatInState({
        ...boat,
        completedAreas: updatedBoat.completedAreas
      });
      setSaveError("");
    } catch (updateError) {
      updateBoatInState(boat);
      setSaveError(updateError.message || "Could not save area progress.");
    } finally {
      setIsSavingAreaProgress(false);
    }
  }

  async function saveDraftDefect(area, draftInput, options = {}) {
    const draft = draftInput || drafts[area] || { text: "", discipline: "" };

    if (!draft.text.trim() || draft.isSaving || savingDraftAreas.current.has(area)) {
      return;
    }

    savingDraftAreas.current.add(area);

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
      const nextDefect = await runSupabaseMutation(() => createDefect({
        boatId: params.boatId,
        text: draft.text,
        discipline: draft.discipline,
        area
      }));

      setState((current) => ({
        boats: current.boats.map((item) => {
          if (item.id !== params.boatId) {
            return item;
          }

          return {
            ...item,
            defects: item.defects.some((defect) => defect.id === nextDefect.id)
              ? item.defects
              : [...item.defects, nextDefect]
          };
        })
      }));
      setDrafts((current) => ({
        ...current,
        [area]: { text: "", discipline: "" }
      }));
      setSaveError("");
      return nextDefect;
    } catch (createError) {
      setDrafts((current) => ({
        ...current,
        [area]: { ...draft, isSaving: false, isOpen: true }
      }));
      setSaveError(createError.message || "Could not save defect to Supabase.");
      return null;
    } finally {
      savingDraftAreas.current.delete(area);
    }
  }

  async function addDefectFromBlank(area) {
    await saveDraftDefect(area);
  }

  async function addDefectAndContinue(area) {
    const saved = await saveDraftDefect(area, null, { closeImmediately: true });
    if (saved) {
      setDrafts((current) => ({
        ...current,
        [area]: { text: "", discipline: "", isOpen: true }
      }));
    }
  }

  async function updateDefect(defectId, field, value) {
    if (field === "text" && !value.trim()) {
      await removeDefect(defectId);
      return;
    }

    if (field === "discipline") {
      setDefectDisciplineDrafts((current) => ({ ...current, [defectId]: value }));
    }

    updateDefectInState(defectId, (defect) => ({
      ...defect,
      [field]: value
    }));

    try {
      await runSupabaseMutation(() => updateDefectRecord(defectId, { [field]: value }));
      if (field === "discipline") {
        setDefectDisciplineDrafts((current) => {
          const next = { ...current };
          delete next[defectId];
          return next;
        });
      }
      setSaveError("");
    } catch (updateError) {
      setSaveError(updateError.message || "Could not update defect in Supabase.");
    }
  }

  async function removeDefect(defectId) {
    const originalIndex = boat.defects.findIndex((defect) => defect.id === defectId);
    const removedDefect = boat.defects[originalIndex];

    if (!removedDefect) {
      return;
    }

    setEditingDefectId((current) => (current === defectId ? null : current));
    clearDefectTextDraft(defectId);
    removeDefectFromState(defectId);

    try {
      await runSupabaseMutation(() => deleteDefect(defectId));
      setSaveError("");
    } catch (deleteError) {
      restoreDefectToState(removedDefect, originalIndex);
      setSaveError(deleteError.message || "Could not delete defect from Supabase.");
    }
  }

  function getAreaCommonDefects(area) {
    const defects = getCommonDefectAreaNames(area)
      .flatMap((areaName) => commonDefectsByArea[areaName] || []);

    if (defects.length === 0) {
      return commonDefectsByArea.all || [];
    }

    const seenDefects = new Set();

    return defects.filter((defect) => {
      const key = `${normalizeDefectText(defect.text)}|${defect.discipline || ""}`;

      if (seenDefects.has(key)) {
        return false;
      }

      seenDefects.add(key);
      return true;
    });
  }

  function findCommonDefect(value, area) {
    const normalizedValue = normalizeDefectText(value);

    return getAreaCommonDefects(area).find((defect) => normalizeDefectText(defect.text) === normalizedValue);
  }

  async function saveDefectText(defectId, value) {
    const currentDefect = boat.defects.find((defect) => defect.id === defectId);

    if (!currentDefect) {
      clearDefectTextDraft(defectId);
      return;
    }

    if (!value.trim()) {
      clearDefectTextDraft(defectId);
      await updateDefect(defectId, "text", value);
      return;
    }

    if (value === currentDefect.text) {
      clearDefectTextDraft(defectId);
      setSaveError("");
      return;
    }

    const matchedDefect = findCommonDefect(value, currentDefect.area);
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
      await runSupabaseMutation(() => updateDefectRecord(defectId, patch));
      clearDefectTextDraft(defectId);
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
    clearDefectTextDraft(defectId);

    try {
      await runSupabaseMutation(() => updateDefectRecord(defectId, {
        text: selectedDefect.text,
        discipline: selectedDefect.discipline
      }));
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

    const auditedAreas = boatAreas.filter((area) => (boat.completedAreas || []).includes(area));

    if (auditedAreas.length === 0) {
      setSaveError("Select at least one area as audited before exporting the PDF.");
      return;
    }

    try {
      const createdAt = await exportBoatReport(boat, {
        showRepeatDefects,
        previousBoat,
        blankRowsByArea,
        areas: auditedAreas
      });
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
      const updatedBoat = await runSupabaseMutation(() => updateBoatName(boat.id, normalizedName));

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
      const updatedBoat = await runSupabaseMutation(() => (
        updateBoatCommissioningEngineer(boat.id, normalizedEngineer)
      ));

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
      await runSupabaseMutation(() => deleteBoat(boat.id));
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
      const nextBoat = await runSupabaseMutation(() => duplicateBoat(boat, normalizedName));
      const nextState = {
        boats: state.boats.some((item) => item.id === nextBoat.id)
          ? state.boats.map((item) => (item.id === nextBoat.id ? nextBoat : item))
          : [nextBoat, ...state.boats]
      };

      setState(nextState);

      try {
        window.localStorage.setItem(boatCacheKey(nextBoat.id), JSON.stringify(nextState));
      } catch {
        window.localStorage.removeItem(boatCacheKey(nextBoat.id));
      }

      setSaveError("");
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

  function setBlankRowCount(area, value) {
    const nextValue = Math.max(0, Math.min(20, Number(value) || 0));
    setBlankRowsByArea((current) => ({
      ...current,
      [area]: nextValue
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
            {showRepeatDefects && previousBoat ? <span>Repeat defects highlighted from {previousBoat.name}</span> : null}
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
          <p className="autosave-note">{saveError || "Drafts save locally first, then sync to Supabase"}</p>
        </header>

        <div className="repeat-toggle-row">
          <label className="repeat-toggle">
            <input
              type="checkbox"
              checked={areAllAreasComplete}
              onChange={(event) => setAllAreasComplete(event.target.checked)}
              disabled={isSavingAreaProgress || boatAreas.length === 0}
            />
            <span className="toggle-track" aria-hidden="true">
              <span className="toggle-thumb"></span>
            </span>
            <span>
              <strong>All areas audited</strong>
              <small>{areAllAreasComplete ? "Entire commissioning list complete" : "Mark every area as audited"}</small>
            </span>
          </label>
          <label className="repeat-toggle">
            <input
              type="checkbox"
              checked={showRepeatDefects}
              onChange={(event) => setShowRepeatDefects(event.target.checked)}
              disabled={!previousBoat}
            />
            <span className="toggle-track" aria-hidden="true">
              <span className="toggle-thumb"></span>
            </span>
            <span>
              <strong>Repeat defects</strong>
              <small>{previousBoat ? `Compare with ${previousBoat.name}` : "No previous boat"}</small>
            </span>
          </label>
          {shouldHighlightRepeats ? (
            <div className="repeat-key">
              <span className="repeat-swatch"></span>
              <span>Repeated from {previousBoat.name}</span>
            </div>
          ) : null}
        </div>

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
                        <div className="area-heading-content">
                          <span>{area}</span>
                          <div className="area-heading-actions">
                            <label className="area-complete-toggle">
                              <input
                                type="checkbox"
                                checked={(boat.completedAreas || []).includes(area)}
                                onChange={() => toggleAreaComplete(area)}
                                disabled={isSavingAreaProgress}
                              />
                              <span>Audited</span>
                            </label>
                            <button
                              className="area-remove-button"
                              type="button"
                              onClick={() => removeArea(area)}
                              disabled={isSavingAreas || isPinnedGeneralArea || defects.length > 0 || boatAreas.length <= 1}
                              title={isPinnedGeneralArea ? `${GENERAL_AREA} always stays at the bottom` : defects.length > 0 ? "Remove this area's defects before removing the area" : "Remove area"}
                            >
                              Remove
                            </button>
                          </div>
                        </div>
                      </td>
                    </tr>
                    {defects.map((defect) => {
                      const isRepeatDefect = shouldHighlightRepeats && repeatedDefectTexts.has(normalizeDefectText(defect.text));
                      const defectDraftValue = defectTextDrafts[defect.id] ?? defect.text;

                      return (
                      <tr className={`entry-row${isRepeatDefect ? " repeat-defect-row" : ""}`} key={defect.id}>
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
                              value={defectDraftValue}
                              suggestions={getDefectSuggestions(defectDraftValue, area)}
                              onChange={(value) => setDefectTextDrafts((current) => ({
                                ...current,
                                [defect.id]: value
                              }))}
                              onSelect={(selectedDefect) => selectExistingDefect(defect.id, selectedDefect)}
                              onBlur={() => {
                                setEditingDefectId(null);
                                saveDefectText(defect.id, defectTextDrafts[defect.id] ?? defect.text);
                              }}
                              placeholder="Type a defect..."
                              autoFocus
                            />
                          ) : (
                            <button
                              className="defect-text-button"
                              type="button"
                              onClick={() => {
                                setDefectTextDrafts((current) => ({
                                  ...current,
                                  [defect.id]: defect.text
                                }));
                                setEditingDefectId(defect.id);
                              }}
                              title="Edit defect"
                            >
                              {defect.text}
                            </button>
                          )}
                        </td>
                        <td>
                          <select
                            className="table-select"
                            value={defectDisciplineDrafts[defect.id] ?? defect.discipline}
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
                      );
                    })}
                    {drafts[area]?.isOpen ? (
                      <tr className="entry-row draft-row" key={`${area}-blank`}>
                        <td className="remove-cell"></td>
                        <td>
                          <DefectSearchInput
                            value={drafts[area]?.text || ""}
                            suggestions={getDefectSuggestions(drafts[area]?.text || "", area)}
                            onChange={(value) => updateDraft(area, "text", value)}
                            onSelect={(selectedDefect) => selectDraftDefect(area, selectedDefect)}
                            onBlur={(event) => {
                              const nextTarget = event.relatedTarget;
                              const currentRow = event.currentTarget.closest("tr");

                              if (nextTarget instanceof HTMLElement && nextTarget.closest("tr") === currentRow) {
                                return;
                              }

                              addDefectFromBlank(area);
                            }}
                            onEnter={() => addDefectAndContinue(area)}
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
                        <div className="blank-row-control">
                          <span>Printable blank rows</span>
                          <div className="blank-row-stepper">
                            <button
                              type="button"
                              onClick={() => setBlankRowCount(area, (blankRowsByArea[area] || 0) - 1)}
                              disabled={(blankRowsByArea[area] || 0) === 0}
                              aria-label={`Remove a printable blank row from ${area}`}
                            >
                              −
                            </button>
                            <input
                              type="number"
                              inputMode="numeric"
                              min="0"
                              max="20"
                              value={blankRowsByArea[area] || 0}
                              onChange={(event) => setBlankRowCount(area, event.target.value)}
                              aria-label={`Printable blank rows for ${area}`}
                            />
                            <button
                              type="button"
                              onClick={() => setBlankRowCount(area, (blankRowsByArea[area] || 0) + 1)}
                              disabled={(blankRowsByArea[area] || 0) === 20}
                              aria-label={`Add a printable blank row to ${area}`}
                            >
                              +
                            </button>
                          </div>
                        </div>
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
                      defects.map((defect) => {
                        const isRepeatDefect = shouldHighlightRepeats && repeatedDefectTexts.has(normalizeDefectText(defect.text));

                        return (
                        <tr className={`audit-entry-row${isRepeatDefect ? " repeat-defect-row" : ""}`} key={`${defect.id}-report`}>
                          <td>{isGeneralArea(area) ? "" : rowNumbers[defect.id]}</td>
                          <td>{defect.text}</td>
                          <td>{defect.discipline || "-"}</td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        );
                      })
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

function parseBoatSequence(name) {
  const normalizedName = String(name || "").toUpperCase();
  const modelPrefix = [...BOAT_MODELS]
    .sort((left, right) => right.length - left.length)
    .find((model) => normalizedName.startsWith(model));

  if (modelPrefix) {
    const number = Number(normalizedName.slice(modelPrefix.length));

    if (Number.isFinite(number)) {
      return {
        prefix: modelPrefix,
        number
      };
    }
  }

  const match = normalizedName.match(/^([A-Z]+)(\d+)$/);

  if (!match) {
    return null;
  }

  return {
    prefix: match[1],
    number: Number(match[2])
  };
}

function findPreviousBoat(currentBoat, boats) {
  const current = parseBoatSequence(currentBoat?.name);

  if (!current) {
    return null;
  }

  return boats
    .filter((boat) => boat.id !== currentBoat.id)
    .map((boat) => ({
      boat,
      sequence: parseBoatSequence(boat.name)
    }))
    .filter(({ sequence }) => sequence && sequence.prefix === current.prefix && sequence.number < current.number)
    .sort((left, right) => right.sequence.number - left.sequence.number)[0]?.boat || null;
}

function DefectSearchInput({
  ariaLabel,
  autoFocus = false,
  onBlur,
  onChange,
  onEnter,
  onSelect,
  placeholder,
  suggestions,
  value
}) {
  const [isFocused, setIsFocused] = useState(false);
  const isSelectingSuggestion = useRef(false);
  const suggestionPointer = useRef(null);
  const hasSuggestions = isFocused && suggestions.length > 0;

  function handleSelect(selectedDefect) {
    isSelectingSuggestion.current = true;
    setIsFocused(false);
    onSelect(selectedDefect);
    if (document.activeElement instanceof HTMLElement) {
      document.activeElement.blur();
    }
    window.setTimeout(() => {
      isSelectingSuggestion.current = false;
    }, 180);
  }

  function handleSuggestionPointerDown(event) {
    isSelectingSuggestion.current = true;
    suggestionPointer.current = {
      x: event.clientX,
      y: event.clientY,
      moved: false
    };
  }

  function handleSuggestionPointerMove(event) {
    const pointer = suggestionPointer.current;

    if (!pointer) {
      return;
    }

    const distanceX = Math.abs(event.clientX - pointer.x);
    const distanceY = Math.abs(event.clientY - pointer.y);

    if (distanceX > 8 || distanceY > 8) {
      pointer.moved = true;
    }
  }

  function resetSuggestionPointer() {
    window.setTimeout(() => {
      isSelectingSuggestion.current = false;
      suggestionPointer.current = null;
    }, 180);
  }

  function handleSuggestionPointerUp(event, selectedDefect) {
    const pointer = suggestionPointer.current;

    if (!pointer?.moved) {
      event.preventDefault();
      handleSelect(selectedDefect);
      return;
    }

    resetSuggestionPointer();
  }

  return (
    <div className="defect-search-cell">
      <input
        className="table-input"
        value={value}
        onChange={(event) => onChange(event.target.value)}
        onKeyDown={(event) => {
          if (event.key === "Enter" && onEnter && value.trim()) {
            event.preventDefault();
            onEnter();
          }
        }}
        onFocus={() => setIsFocused(true)}
        onBlur={(event) => {
          if (isSelectingSuggestion.current) {
            return;
          }
          window.setTimeout(() => setIsFocused(false), 120);
          onBlur?.(event);
        }}
        placeholder={placeholder}
        aria-label={ariaLabel}
        autoComplete="off"
        autoCorrect="off"
        spellCheck={false}
        autoFocus={autoFocus}
      />
      {hasSuggestions ? (
        <div className="defect-suggestions" role="listbox">
          {suggestions.map((defect, index) => (
            <button
              className="defect-suggestion"
              key={`${defect.text}-${defect.discipline}-${index}`}
              type="button"
              onPointerDown={handleSuggestionPointerDown}
              onPointerMove={handleSuggestionPointerMove}
              onPointerCancel={resetSuggestionPointer}
              onPointerUp={(event) => handleSuggestionPointerUp(event, defect)}
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

