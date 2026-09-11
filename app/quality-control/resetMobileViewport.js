"use client";

export function resetMobileViewport() {
  if (typeof window === "undefined" || !window.matchMedia("(max-width: 720px)").matches) return () => {};
  const viewport = document.querySelector('meta[name="viewport"]');
  if (!viewport) return () => {};
  const originalContent = viewport.getAttribute("content") || "width=device-width, initial-scale=1";
  viewport.setAttribute("content", "width=device-width, initial-scale=1, maximum-scale=1");
  window.scrollTo({ top: 0, left: 0, behavior: "instant" });
  const timer = window.setTimeout(() => {
    viewport.setAttribute("content", "width=device-width, initial-scale=1, maximum-scale=5, user-scalable=yes");
    window.scrollTo({ top: 0, left: 0, behavior: "instant" });
  }, 120);
  return () => {
    window.clearTimeout(timer);
    viewport.setAttribute("content", originalContent);
  };
}
