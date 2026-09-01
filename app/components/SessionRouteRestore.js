"use client";

import { useEffect, useRef } from "react";
import { usePathname, useRouter } from "next/navigation";

export const LAST_ROUTE_KEY = "hull-master:last-session-route";
export const HOME_INTENT_KEY = "hull-master:intentional-home";

function isRestorableRoute(pathname) {
  return /^\/(commissioning|boats\/|pdf-signoff|harbour-audit|stock-codes)(\/|$)/.test(pathname || "");
}

export default function SessionRouteRestore() {
  const pathname = usePathname();
  const router = useRouter();
  const browserBackRef = useRef(false);

  useEffect(() => {
    const handlePopState = () => {
      browserBackRef.current = true;
    };

    window.addEventListener("popstate", handlePopState);
    return () => window.removeEventListener("popstate", handlePopState);
  }, []);

  useEffect(() => {
    if (pathname === "/") {
      const navigationEntry = window.performance.getEntriesByType("navigation")[0];
      const arrivedThroughHistory = browserBackRef.current || navigationEntry?.type === "back_forward";

      if (arrivedThroughHistory) {
        browserBackRef.current = false;
        window.sessionStorage.removeItem(LAST_ROUTE_KEY);
        return;
      }

      if (window.sessionStorage.getItem(HOME_INTENT_KEY) === "1") {
        window.sessionStorage.removeItem(HOME_INTENT_KEY);
        window.sessionStorage.removeItem(LAST_ROUTE_KEY);
        return;
      }

      const lastRoute = window.sessionStorage.getItem(LAST_ROUTE_KEY);
      if (isRestorableRoute(lastRoute)) {
        router.replace(lastRoute);
      }
      return;
    }

    if (isRestorableRoute(pathname)) {
      window.sessionStorage.setItem(LAST_ROUTE_KEY, pathname);
    }
  }, [pathname, router]);

  return null;
}
