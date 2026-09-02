"use client";

import { Camera } from "lucide-react";
import { useEffect, useMemo, useRef, useState } from "react";
import HomeBackButton from "../components/HomeBackButton";
import {
  compressStockPhoto,
  loadCachedStockState,
  loadStockState,
  normalizeStockCode,
  saveStockStateLocally,
  syncCategory,
  syncDeleteStockItem,
  syncStockItem
} from "../../lib/stockCodesStorage";
import styles from "./stockCodes.module.css";

export default function StockCodesPage() {
  const [state, setState] = useState({ categories: [], items: [], deletedItems: [] });
  const [query, setQuery] = useState("");
  const [categoryFilter, setCategoryFilter] = useState("all");
  const [view, setView] = useState("list");
  const [selectedId, setSelectedId] = useState("");
  const [message, setMessage] = useState("");

  useEffect(() => {
    const cached = loadCachedStockState();
    setState(cached);

    loadStockState()
      .then((remote) => {
        setState(remote);
        remote.categories.filter((category) => category.pendingSync).forEach(retryCategory);
        remote.items.filter((item) => item.pendingSync).forEach(retryItem);
        remote.deletedItems.forEach(retryDeletedItem);
      })
      .catch((error) => setMessage(`Working locally. ${error.message || "Supabase is not ready."}`));
    // This startup pass intentionally runs once; later changes are already persisted by the mutation helpers.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const selectedItem = state.items.find((item) => item.id === selectedId);
  const visibleItems = useMemo(() => {
    const words = query.toLowerCase().trim().split(/\s+/).filter(Boolean);
    return state.items.filter((item) => {
      if (categoryFilter !== "all" && item.categoryId !== categoryFilter) return false;
      const searchable = [item.stockCode, item.description, item.categoryName, ...(item.searchTerms || [])]
        .join(" ").toLowerCase();
      return words.every((word) => searchable.includes(word));
    }).sort((left, right) => (Number(right.orderCount) || 0) - (Number(left.orderCount) || 0) || left.description.localeCompare(right.description));
  }, [categoryFilter, query, state.items]);

  function replaceCategory(category) {
    setState((current) => {
      const next = {
        ...current,
        categories: current.categories.map((entry) => entry.id === category.id ? category : entry)
      };
      saveStockStateLocally(next);
      return next;
    });
  }

  function replaceItem(item) {
    setState((current) => {
      const next = { ...current, items: current.items.map((entry) => entry.id === item.id ? item : entry) };
      saveStockStateLocally(next);
      return next;
    });
  }

  async function retryCategory(category) {
    try { replaceCategory(await syncCategory(category)); } catch { /* Remains queued locally. */ }
  }

  async function retryItem(item) {
    try { replaceItem(await syncStockItem(item)); } catch { /* Remains queued locally. */ }
  }

  async function retryDeletedItem(item) {
    try {
      await syncDeleteStockItem(item);
      setState((current) => {
        const next = { ...current, deletedItems: current.deletedItems.filter((entry) => entry.id !== item.id) };
        saveStockStateLocally(next);
        return next;
      });
    } catch { /* Remains queued locally. */ }
  }

  async function addItem(form) {
    const formData = new FormData(form);
    const stockCode = String(formData.get("stockCode") || "").trim();
    const existingItem = state.items.find((entry) => normalizeStockCode(entry.stockCode) === normalizeStockCode(stockCode));
    if (existingItem) {
      const error = new Error(`Stock code ${existingItem.stockCode} has already been used.`);
      error.duplicateItemId = existingItem.id;
      throw error;
    }
    const categoryChoice = String(formData.get("categoryId") || "");
    const newCategoryName = String(formData.get("newCategory") || "").trim();
    let category = state.categories.find((entry) => entry.id === categoryChoice);

    if (categoryChoice === "new") {
      if (!newCategoryName) throw new Error("Enter the new category name.");
      category = { id: crypto.randomUUID(), name: newCategoryName, pendingSync: true };
    }
    if (!category) throw new Error("Select a category.");

    const photo = formData.get("photo");
    const imageDataUrl = photo instanceof File && photo.size ? await compressStockPhoto(photo) : "";
    const item = {
      id: crypto.randomUUID(),
      stockCode,
      description: String(formData.get("description") || "").trim(),
      searchTerms: String(formData.get("searchTerms") || "").split(/[,\n]/).map((term) => term.trim()).filter(Boolean),
      categoryId: category.id,
      categoryName: category.name,
      imageDataUrl,
      imagePath: "",
      orderCount: 0,
      pendingSync: true,
      createdAt: new Date().toISOString()
    };
    if (!item.stockCode || !item.description) throw new Error("Stock code and description are required.");

    const nextState = {
      ...state,
      categories: categoryChoice === "new" ? [...state.categories, category] : state.categories,
      items: [item, ...state.items]
    };
    setState(nextState);
    saveStockStateLocally(nextState);
    setSelectedId(item.id);
    setView("detail");
    setMessage("Saved locally. Syncing to Supabase...");

    try {
      if (category.pendingSync) replaceCategory(await syncCategory(category));
      replaceItem(await syncStockItem(item));
      setMessage("Saved to Supabase.");
    } catch (error) {
      setMessage(`Saved locally and queued for Supabase. ${error.message || ""}`);
    }
  }

  async function updateItem(form) {
    const formData = new FormData(form);
    const stockCode = String(formData.get("stockCode") || "").trim();
    const existingItem = state.items.find((entry) => entry.id !== selectedItem?.id && normalizeStockCode(entry.stockCode) === normalizeStockCode(stockCode));
    if (existingItem) {
      const error = new Error(`Stock code ${existingItem.stockCode} has already been used.`);
      error.duplicateItemId = existingItem.id;
      throw error;
    }
    const categoryChoice = String(formData.get("categoryId") || "");
    const newCategoryName = String(formData.get("newCategory") || "").trim();
    let category = state.categories.find((entry) => entry.id === categoryChoice);

    if (categoryChoice === "new") {
      if (!newCategoryName) throw new Error("Enter the new category name.");
      category = { id: crypto.randomUUID(), name: newCategoryName, pendingSync: true };
    }
    if (!category || !selectedItem) throw new Error("Select a category.");

    const photo = formData.get("photo");
    const replacementPhoto = photo instanceof File && photo.size ? await compressStockPhoto(photo) : "";
    const item = {
      ...selectedItem,
      stockCode,
      description: String(formData.get("description") || "").trim(),
      searchTerms: String(formData.get("searchTerms") || "").split(/[,\n]/).map((term) => term.trim()).filter(Boolean),
      categoryId: category.id,
      categoryName: category.name,
      imageDataUrl: replacementPhoto || selectedItem.imageDataUrl,
      pendingSync: true
    };
    if (!item.stockCode || !item.description) throw new Error("Stock code and description are required.");

    const nextState = {
      ...state,
      categories: categoryChoice === "new" ? [...state.categories, category] : state.categories,
      items: state.items.map((entry) => entry.id === item.id ? item : entry)
    };
    setState(nextState);
    saveStockStateLocally(nextState);
    setView("detail");
    setMessage("Updated locally. Syncing to Supabase...");

    try {
      if (category.pendingSync) replaceCategory(await syncCategory(category));
      replaceItem(await syncStockItem(item));
      setMessage("Changes saved to Supabase.");
    } catch (error) {
      setMessage(`Updated locally and queued for Supabase. ${error.message || ""}`);
    }
  }

  async function deleteItem() {
    if (!selectedItem || !window.confirm(`Remove ${selectedItem.description}?`)) return;

    const item = selectedItem;
    const nextState = {
      ...state,
      items: state.items.filter((entry) => entry.id !== item.id),
      deletedItems: [...state.deletedItems.filter((entry) => entry.id !== item.id), item]
    };
    setState(nextState);
    saveStockStateLocally(nextState);
    setSelectedId("");
    setView("list");
    setMessage("Removed locally. Syncing deletion to Supabase...");

    try {
      await syncDeleteStockItem(item);
      const syncedState = { ...nextState, deletedItems: nextState.deletedItems.filter((entry) => entry.id !== item.id) };
      setState(syncedState);
      saveStockStateLocally(syncedState);
      setMessage("Item removed from Supabase.");
    } catch (error) {
      setMessage(`Removed locally and queued for Supabase. ${error.message || ""}`);
    }
  }

  if (view === "add") {
    return <ItemFormView categories={state.categories} onBack={() => setView("list")} onSave={addItem} onOpenExisting={(id) => { setSelectedId(id); setView("detail"); }} />;
  }

  if (view === "edit" && selectedItem) {
    return <ItemFormView categories={state.categories} item={selectedItem} onBack={() => setView("detail")} onSave={updateItem} onDelete={deleteItem} onOpenExisting={(id) => { setSelectedId(id); setView("detail"); }} />;
  }

  if (view === "detail" && selectedItem) {
    return (
      <div className={styles.shell}>
        <main className={styles.page}>
          <button className={styles.back} type="button" onClick={() => setView("list")}>← Parts</button>
          <article className={styles.detail}>
            {selectedItem.imageDataUrl ? <img src={selectedItem.imageDataUrl} alt={selectedItem.description} /> : <div className={styles.noImage}>No photo</div>}
            <div className={styles.detailText}>
              <span className={styles.category}>{selectedItem.categoryName}</span>
              <h1>{selectedItem.description}</h1>
              <p className={styles.code}>{selectedItem.stockCode}</p>
              {selectedItem.searchTerms.length ? <p className={styles.terms}>{selectedItem.searchTerms.join(" · ")}</p> : null}
              {selectedItem.pendingSync ? <p className={styles.pending}>Saved locally · waiting to sync</p> : null}
              <button className={styles.editButton} type="button" onClick={() => setView("edit")}>Edit item</button>
            </div>
          </article>
          {message ? <p className={styles.message}>{message}</p> : null}
        </main>
      </div>
    );
  }

  return (
    <div className={styles.shell}>
      <HomeBackButton />
      <main className={styles.page}>
        <header className={styles.header}>
          <div><p>Hull Master</p><h1>Stock Codes</h1></div>
          <button className={styles.primary} type="button" onClick={() => setView("add")}>+ Add item</button>
        </header>
        <section className={styles.filters}>
          <input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search parts or stock codes" aria-label="Search parts" />
          <select value={categoryFilter} onChange={(event) => setCategoryFilter(event.target.value)} aria-label="Filter by category">
            <option value="all">All categories</option>
            {state.categories.map((category) => <option key={category.id} value={category.id}>{category.name}</option>)}
          </select>
        </section>
        {message ? <p className={styles.message}>{message}</p> : null}
        <section className={styles.list} aria-label="Stock items">
          {visibleItems.length ? visibleItems.map((item) => (
            <button className={styles.item} type="button" key={item.id} onClick={() => { setSelectedId(item.id); setView("detail"); }}>
              {item.imageDataUrl ? <img src={item.imageDataUrl} alt="" /> : <span className={styles.thumb}>No photo</span>}
              <span className={styles.itemText}><strong>{item.description}</strong><small>{item.stockCode} · {item.categoryName}</small></span>
              <span aria-hidden="true">›</span>
            </button>
          )) : <p className={styles.empty}>No matching parts.</p>}
        </section>
      </main>
    </div>
  );
}

function ItemFormView({ categories, item, onBack, onSave, onDelete, onOpenExisting }) {
  const [categoryId, setCategoryId] = useState(item?.categoryId || categories[0]?.id || "");
  const [error, setError] = useState("");
  const [saving, setSaving] = useState(false);
  const [duplicateItemId, setDuplicateItemId] = useState("");
  const [photoPreview, setPhotoPreview] = useState(item?.imageDataUrl || "");
  const photoRef = useRef(null);

  async function previewPhoto(files) {
    const file = files?.[0];
    if (!file) return;

    try {
      setPhotoPreview(await compressStockPhoto(file));
      setError("");
    } catch {
      setPhotoPreview("");
      setError("The selected photo could not be read. Please try a JPG or PNG image.");
    }
  }

  async function submit(event) {
    event.preventDefault();
    setDuplicateItemId("");
    setSaving(true);
    try { await onSave(event.currentTarget); } catch (saveError) {
      setError(saveError.message);
      setDuplicateItemId(saveError.duplicateItemId || "");
      setSaving(false);
    }
  }

  return (
    <div className={styles.shell}>
      <main className={styles.formPage}>
        <button className={styles.back} type="button" onClick={onBack}>← Cancel</button>
        <h1>{item ? "Edit stock item" : "Add stock item"}</h1>
        <form className={styles.form} onSubmit={submit}>
          <div className={styles.photoField}>
            <span>Photo</span>
            <input
              ref={photoRef}
              name="photo"
              type="file"
              accept="image/*"
              hidden
              onChange={(event) => previewPhoto(event.target.files)}
            />
            <button className={styles.photoButton} type="button" onClick={() => photoRef.current?.click()}>
              <Camera size={16} />
              {photoPreview ? "Change photo" : "Add photo"}
            </button>
            {photoPreview ? <img className={styles.photoPreview} src={photoPreview} alt="Selected stock item" /> : null}
          </div>
          <label>Stock code<input name="stockCode" required autoComplete="off" defaultValue={item?.stockCode || ""} /></label>
          <label>Description<textarea name="description" required rows="3" defaultValue={item?.description || ""} /></label>
          <label>Search words<textarea name="searchTerms" rows="3" placeholder="Alternative names, separated by commas" defaultValue={(item?.searchTerms || []).join(", ")} /></label>
          <label>Category<select name="categoryId" value={categoryId} onChange={(event) => setCategoryId(event.target.value)} required>
            {categories.map((category) => <option key={category.id} value={category.id}>{category.name}</option>)}
            <option value="new">+ New category</option>
          </select></label>
          {categoryId === "new" ? <label>New category<input name="newCategory" required /></label> : null}
          {error ? <p className={styles.error}>{error}</p> : null}
          {duplicateItemId ? <button className={styles.editButton} type="button" onClick={() => onOpenExisting?.(duplicateItemId)}>Go to existing item</button> : null}
          <button className={styles.primary} type="submit" disabled={saving}>{saving ? "Saving..." : item ? "Save changes" : "Save item"}</button>
          {item ? <button className={styles.deleteButton} type="button" onClick={onDelete}>Remove item</button> : null}
        </form>
      </main>
    </div>
  );
}
