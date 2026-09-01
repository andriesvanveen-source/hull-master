"use client";

import { Camera } from "lucide-react";
import { useEffect, useMemo, useRef, useState } from "react";
import HomeBackButton from "../components/HomeBackButton";
import {
  compressStockPhoto,
  loadCachedStockState,
  loadStockState,
  saveStockStateLocally,
  syncCategory,
  syncStockItem
} from "../../lib/stockCodesStorage";
import styles from "./stockCodes.module.css";

export default function StockCodesPage() {
  const [state, setState] = useState({ categories: [], items: [] });
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
      })
      .catch((error) => setMessage(`Working locally. ${error.message || "Supabase is not ready."}`));
  }, []);

  const selectedItem = state.items.find((item) => item.id === selectedId);
  const visibleItems = useMemo(() => {
    const words = query.toLowerCase().trim().split(/\s+/).filter(Boolean);
    return state.items.filter((item) => {
      if (categoryFilter !== "all" && item.categoryId !== categoryFilter) return false;
      const searchable = [item.stockCode, item.description, item.categoryName, ...(item.searchTerms || [])]
        .join(" ").toLowerCase();
      return words.every((word) => searchable.includes(word));
    });
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

  async function addItem(form) {
    const formData = new FormData(form);
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
      stockCode: String(formData.get("stockCode") || "").trim(),
      description: String(formData.get("description") || "").trim(),
      searchTerms: String(formData.get("searchTerms") || "").split(/[,\n]/).map((term) => term.trim()).filter(Boolean),
      categoryId: category.id,
      categoryName: category.name,
      imageDataUrl,
      imagePath: "",
      pendingSync: true,
      createdAt: new Date().toISOString()
    };
    if (!item.stockCode || !item.description) throw new Error("Stock code and description are required.");

    const nextState = {
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

  if (view === "add") {
    return <AddItemView categories={state.categories} onBack={() => setView("list")} onSave={addItem} />;
  }

  if (view === "detail" && selectedItem) {
    return (
      <div className={styles.shell}>
        <HomeBackButton />
        <main className={styles.page}>
          <button className={styles.back} type="button" onClick={() => setView("list")}>← Parts</button>
          <article className={styles.detail}>
            {selectedItem.imageDataUrl ? <img src={selectedItem.imageDataUrl} alt={selectedItem.description} /> : <div className={styles.noImage}>No photo</div>}
            <div>
              <span className={styles.category}>{selectedItem.categoryName}</span>
              <h1>{selectedItem.description}</h1>
              <p className={styles.code}>{selectedItem.stockCode}</p>
              {selectedItem.searchTerms.length ? <p className={styles.terms}>{selectedItem.searchTerms.join(" · ")}</p> : null}
              {selectedItem.pendingSync ? <p className={styles.pending}>Saved locally · waiting to sync</p> : null}
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

function AddItemView({ categories, onBack, onSave }) {
  const [categoryId, setCategoryId] = useState(categories[0]?.id || "");
  const [error, setError] = useState("");
  const [saving, setSaving] = useState(false);
  const [photoPreview, setPhotoPreview] = useState("");
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
    setSaving(true);
    try { await onSave(event.currentTarget); } catch (saveError) { setError(saveError.message); setSaving(false); }
  }

  return (
    <div className={styles.shell}>
      <HomeBackButton />
      <main className={styles.formPage}>
        <button className={styles.back} type="button" onClick={onBack}>← Cancel</button>
        <h1>Add stock item</h1>
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
          <label>Stock code<input name="stockCode" required autoComplete="off" /></label>
          <label>Description<textarea name="description" required rows="3" /></label>
          <label>Search words<textarea name="searchTerms" rows="3" placeholder="Alternative names, separated by commas" /></label>
          <label>Category<select name="categoryId" value={categoryId} onChange={(event) => setCategoryId(event.target.value)} required>
            {categories.map((category) => <option key={category.id} value={category.id}>{category.name}</option>)}
            <option value="new">+ New category</option>
          </select></label>
          {categoryId === "new" ? <label>New category<input name="newCategory" required /></label> : null}
          {error ? <p className={styles.error}>{error}</p> : null}
          <button className={styles.primary} type="submit" disabled={saving}>{saving ? "Saving..." : "Save item"}</button>
        </form>
      </main>
    </div>
  );
}
