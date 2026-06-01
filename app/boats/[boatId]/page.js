"use client";

import Link from "next/link";
import { Fragment, useEffect, useMemo, useState } from "react";
import { normalizeDefectText, parseCommonDefectsCsv } from "../../../lib/commonDefects";
import { BOAT_AREAS, DISCIPLINES } from "../../../lib/constants";
import { createDefect, loadState, saveState } from "../../../lib/storage";

export default function BoatLogPage({ params }) {
  const [state, setState] = useState({ boats: [] });
  const [hasLoaded, setHasLoaded] = useState(false);
  const [drafts, setDrafts] = useState({});
  const [commonDefects, setCommonDefects] = useState([]);
  const [reportDate, setReportDate] = useState(null);

  useEffect(() => {
    setState(loadState());
    setReportDate(new Date());
    setHasLoaded(true);
  }, []);

  useEffect(() => {
    let isMounted = true;

    fetch("/common-defects.csv")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Common defect CSV not found");
        }

        return response.text();
      })
      .then((csvText) => {
        if (isMounted) {
          setCommonDefects(parseCommonDefectsCsv(csvText));
        }
      })
      .catch(() => {
        if (isMounted) {
          setCommonDefects([]);
        }
      });

    return () => {
      isMounted = false;
    };
  }, []);

  const boat = state.boats.find((item) => item.id === params.boatId);

  const areaRows = useMemo(() => {
    return BOAT_AREAS.reduce((acc, area) => {
      acc[area] = boat ? boat.defects.filter((defect) => defect.area === area) : [];
      return acc;
    }, {});
  }, [boat]);

  const rowNumbers = useMemo(() => {
    if (!boat) {
      return {};
    }

    let current = 1;
    const numbers = {};

    BOAT_AREAS.forEach((area) => {
      boat.defects
        .filter((defect) => defect.area === area && defect.text.trim())
        .forEach((defect) => {
          numbers[defect.id] = current;
          current += 1;
        });
    });

    return numbers;
  }, [boat]);

  function updateState(nextState) {
    setState(nextState);
    saveState(nextState);
  }

  function addDefectFromBlank(area) {
    const draft = drafts[area] || { text: "", discipline: "" };

    if (!draft.text.trim()) {
      return;
    }

    const nextDefect = createDefect({
      text: draft.text,
      discipline: draft.discipline,
      area
    });
    const nextState = {
      boats: state.boats.map((item) => {
        if (item.id !== params.boatId) {
          return item;
        }

        return {
          ...item,
          defects: [...item.defects, nextDefect]
        };
      })
    };

    updateState(nextState);
    setDrafts((current) => ({
      ...current,
      [area]: { text: "", discipline: "" }
    }));
  }

  function updateDefect(defectId, field, value) {
    const nextState = {
      boats: state.boats.map((item) => {
        if (item.id !== params.boatId) {
          return item;
        }

        return {
          ...item,
          defects: item.defects
            .map((defect) => {
              if (defect.id !== defectId) {
                return defect;
              }

              return {
                ...defect,
                [field]: value
              };
            })
            .filter((defect) => defect.text.trim())
        };
      })
    };

    updateState(nextState);
  }

  function findCommonDefect(value) {
    const normalizedValue = normalizeDefectText(value);

    return commonDefects.find((defect) => normalizeDefectText(defect.text) === normalizedValue);
  }

  function updateDefectText(defectId, value) {
    const matchedDefect = findCommonDefect(value);

    const nextState = {
      boats: state.boats.map((item) => {
        if (item.id !== params.boatId) {
          return item;
        }

        return {
          ...item,
          defects: item.defects
            .map((defect) => {
              if (defect.id !== defectId) {
                return defect;
              }

              return {
                ...defect,
                text: value,
                discipline: matchedDefect?.discipline || defect.discipline
              };
            })
            .filter((defect) => defect.text.trim())
        };
      })
    };

    updateState(nextState);
  }

  function getDefectSuggestions(value) {
    const query = normalizeDefectText(value);

    if (!query) {
      return commonDefects.slice(0, 8);
    }

    return commonDefects
      .filter((defect) => normalizeDefectText(defect.text).includes(query))
      .slice(0, 8);
  }

  function selectExistingDefect(defectId, selectedDefect) {
    const nextState = {
      boats: state.boats.map((item) => {
        if (item.id !== params.boatId) {
          return item;
        }

        return {
          ...item,
          defects: item.defects.map((defect) => {
            if (defect.id !== defectId) {
              return defect;
            }

            return {
              ...defect,
              text: selectedDefect.text,
              discipline: selectedDefect.discipline || defect.discipline
            };
          })
        };
      })
    };

    updateState(nextState);
  }

  async function exportReport() {
    if (document.activeElement instanceof HTMLElement) {
      document.activeElement.blur();
    }

    const createdAt = new Date();
    const safeBoatName = boat.name.replace(/[^a-z0-9-]+/gi, "-").replace(/^-|-$/g, "") || "hull";
    const defectCount = boat.defects.filter((defect) => defect.text.trim()).length;
    const { jsPDF } = await import("jspdf");
    const { default: autoTable } = await import("jspdf-autotable");
    const doc = new jsPDF({ orientation: "portrait", unit: "mm", format: "a4" });
    const pageWidth = doc.internal.pageSize.getWidth();
    const pageHeight = doc.internal.pageSize.getHeight();
    const generatedAt = createdAt.toLocaleString();
    const tableRows = [];

    BOAT_AREAS.forEach((area) => {
      const defects = areaRows[area] || [];

      tableRows.push([
        {
          content: area,
          colSpan: 7,
          styles: {
            fillColor: [223, 232, 227],
            fontStyle: "bold",
            fontSize: 9.5,
            textColor: [23, 33, 30],
            halign: "left"
          }
        }
      ]);

      if (defects.length === 0) {
        tableRows.push([
          {
            content: "- no defects logged -",
            colSpan: 7,
            styles: {
              fontStyle: "italic",
              halign: "center",
              textColor: [110, 110, 110]
            }
          }
        ]);
        return;
      }

      defects.forEach((defect) => {
        tableRows.push([
          String(rowNumbers[defect.id] || ""),
          defect.text,
          defect.discipline || "-",
          "",
          "",
          "",
          ""
        ]);
      });
    });

    doc.setFillColor(11, 45, 73);
    doc.rect(0, 0, pageWidth, 22, "F");
    doc.setTextColor(255, 255, 255);
    doc.setFont("helvetica", "bold");
    doc.setFontSize(18);
    doc.text("Yacht Commissioning Audit", 12, 13);
    doc.setFontSize(9);
    doc.text("Hull Master", pageWidth - 12, 13, { align: "right" });

    doc.setTextColor(20, 28, 34);
    doc.setFontSize(10);
    doc.setFont("helvetica", "normal");
    doc.roundedRect(12, 29, pageWidth - 24, 28, 2, 2);
    doc.setFont("helvetica", "bold");
    doc.text("Hull Number", 18, 37);
    doc.text("Report Date", 68, 37);
    doc.text("Logged Defects", 18, 49);
    doc.text("Report Type", 68, 49);
    doc.setFont("helvetica", "normal");
    doc.text(boat.name, 18, 43);
    doc.text(generatedAt, 68, 43);
    doc.text(String(defectCount), 18, 55);
    doc.text("Commissioning Defect Audit", 68, 55);

    autoTable(doc, {
      startY: 64,
      head: [[
        "#",
        "Defect",
        "Discipline",
        "Team Member",
        "Date",
        "Team Leader",
        "Commissioning Engineer"
      ]],
      body: tableRows,
      theme: "grid",
      tableLineColor: [130, 144, 139],
      tableLineWidth: 0.25,
      margin: { left: 12, right: 12, top: 30, bottom: 16 },
      styles: {
        font: "helvetica",
        fontSize: 6.8,
        cellPadding: 1.5,
        lineColor: [130, 144, 139],
        lineWidth: 0.25,
        minCellHeight: 8,
        textColor: [17, 17, 17],
        valign: "middle"
      },
      headStyles: {
        fillColor: [47, 58, 56],
        textColor: [255, 255, 255],
        fontStyle: "bold",
        halign: "center",
        lineColor: [130, 144, 139],
        lineWidth: 0.25
      },
      columnStyles: {
        0: { cellWidth: 8, halign: "center" },
        1: { cellWidth: 62 },
        2: { cellWidth: 18, halign: "center" },
        3: { cellWidth: 25 },
        4: { cellWidth: 18 },
        5: { cellWidth: 25 },
        6: { cellWidth: 30 }
      },
      didDrawPage: (data) => {
        const pageNumber = doc.internal.getNumberOfPages();

        if (pageNumber > 1) {
          doc.setFillColor(11, 45, 73);
          doc.rect(0, 0, pageWidth, 16, "F");
          doc.setTextColor(255, 255, 255);
          doc.setFont("helvetica", "bold");
          doc.setFontSize(10);
          doc.text(`Yacht Commissioning Audit - Hull ${boat.name}`, 12, 10);
        }

        doc.setDrawColor(130, 144, 139);
        doc.line(12, pageHeight - 11, pageWidth - 12, pageHeight - 11);
        doc.setFont("helvetica", "normal");
        doc.setFontSize(8);
        doc.setTextColor(95, 103, 99);
        doc.text(`Generated ${generatedAt}`, 12, pageHeight - 6);
        doc.text(`Page ${data.pageNumber}`, pageWidth - 12, pageHeight - 6, { align: "right" });
      }
    });

    setReportDate(createdAt);
    doc.save(`${safeBoatName}-commissioning-audit.pdf`);
  }

  function updateDraft(area, field, value) {
    const matchedDefect = field === "text" ? findCommonDefect(value) : null;

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

  function selectDraftDefect(area, selectedDefect) {
    setDrafts((current) => ({
      ...current,
      [area]: {
        text: selectedDefect.text,
        discipline: selectedDefect.discipline || current[area]?.discipline || "",
        isOpen: true
      }
    }));
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
            <div className="panel-body empty">Boat not found. Return to the boat register and select a boat.</div>
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
          <button className="export-button" type="button" onClick={exportReport}>Export PDF</button>
        </div>

        <header className="print-report-header">
          <h1>Yacht Commissioning Audit</h1>
          <div>
            <span>Hull {boat.name}</span>
            <span>{reportDate ? reportDate.toLocaleString() : ""}</span>
          </div>
        </header>

        <header className="log-header">
          <div>
            <p className="log-kicker">Hull Number</p>
            <h1 className="log-title">{boat.name}</h1>
          </div>
          <p className="autosave-note">Auto-saves as you type</p>
        </header>

        <section className="sheet-table-wrap">
          <table className="sheet-table">
            <thead>
              <tr>
                <th>Defect Description</th>
                <th className="discipline-col">Discipline</th>
              </tr>
            </thead>
            <tbody>
              {BOAT_AREAS.map((area) => {
                const defects = areaRows[area] || [];

                return (
                  <Fragment key={area}>
                    <tr className="area-row" key={`${area}-heading`}>
                      <td colSpan="2">{area}</td>
                    </tr>
                    {defects.map((defect) => (
                      <tr className="entry-row" key={defect.id}>
                        <td>
                          <DefectSearchInput
                            value={defect.text}
                            suggestions={getDefectSuggestions(defect.text)}
                            onChange={(value) => updateDefectText(defect.id, value)}
                            onSelect={(selectedDefect) => selectExistingDefect(defect.id, selectedDefect)}
                            placeholder="Type a defect..."
                          />
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
                        <td>
                          <DefectSearchInput
                            value={drafts[area]?.text || ""}
                            suggestions={getDefectSuggestions(drafts[area]?.text || "")}
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
                      <td colSpan="2">
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
              {BOAT_AREAS.map((area) => {
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
                          <td>{rowNumbers[defect.id]}</td>
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
    onSelect(selectedDefect);
    setIsFocused(false);
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
