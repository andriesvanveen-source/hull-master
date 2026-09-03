const DATABASE_NAME = "pdf-signoff-archive";
const DATABASE_VERSION = 1;
const STORE_NAME = "archive";
const ARCHIVE_KEY = "processed-pdfs";

function openDatabase() {
  return new Promise((resolve, reject) => {
    const request = window.indexedDB.open(DATABASE_NAME, DATABASE_VERSION);
    request.onupgradeneeded = () => {
      if (!request.result.objectStoreNames.contains(STORE_NAME)) {
        request.result.createObjectStore(STORE_NAME);
      }
    };
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

async function runTransaction(mode, operation) {
  const database = await openDatabase();
  try {
    return await new Promise((resolve, reject) => {
      const transaction = database.transaction(STORE_NAME, mode);
      const request = operation(transaction.objectStore(STORE_NAME));
      let result;
      request.onsuccess = () => {
        result = request.result;
      };
      request.onerror = () => reject(request.error);
      transaction.oncomplete = () => resolve(result);
      transaction.onerror = () => reject(transaction.error);
      transaction.onabort = () => reject(transaction.error);
    });
  } finally {
    database.close();
  }
}

export async function loadPdfArchive() {
  const value = await runTransaction("readonly", (store) => store.get(ARCHIVE_KEY));
  return Array.isArray(value) ? value : [];
}

export async function savePdfArchive(items) {
  await runTransaction("readwrite", (store) => store.put(items, ARCHIVE_KEY));
}

export async function clearPdfArchive() {
  await runTransaction("readwrite", (store) => store.delete(ARCHIVE_KEY));
}
