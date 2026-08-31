"use client";

import { useEffect } from "react";
import { usePathname, useRouter } from "next/navigation";

export const LAST_ROUTE_KEY = "hull-master:last-session-route";
export const HOME_INTENT_KEY = "hull-master:intentional-home";

function isRestorableRoute(pathname) {
  return /^\/(commissioning|boats\/|pdf-signoff|harbour-audit)(\/|$)/.test(pathname || "");
}

export default function SessionRouteRestore() {
  const pathname = usePathname();
  const router = useRouter();

  useEffect(() => {
    if (pathname === "/") {
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
