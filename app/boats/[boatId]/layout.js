"use client";

import { useEffect, useState } from "react";
import { DEFAULT_COMMISSIONING_ENGINEER } from "../../../lib/constants";
import { loadState, subscribeToStateChanges } from "../../../lib/storage";

export default function BoatLayout({ children, params }) {
  const [engineer, setEngineer] = useState(DEFAULT_COMMISSIONING_ENGINEER);

  useEffect(() => {
    let isMounted = true;

    async function refreshEngineer() {
      try {
        const nextState = await loadState();
        const boat = nextState.boats.find((item) => item.id === params.boatId);

        if (isMounted) {
          setEngineer(boat?.commissioningEngineer || DEFAULT_COMMISSIONING_ENGINEER);
        }
      } catch (_error) {
        if (isMounted) {
          setEngineer(DEFAULT_COMMISSIONING_ENGINEER);
        }
      }
    }

    refreshEngineer();
    const unsubscribe = subscribeToStateChanges(refreshEngineer);

    return () => {
      isMounted = false;
      unsubscribe();
    };
  }, [params.boatId]);

  return (
    <>
      <div
        style={{
          background: "#0b2d49",
          color: "#fffdf8",
          fontFamily: "Courier New, Courier, monospace",
          fontSize: "12px",
          fontWeight: 700,
          letterSpacing: "0.08em",
          padding: "10px 20px",
          textAlign: "center",
          textTransform: "uppercase"
        }}
      >
        Commissioning Engineer: {engineer}
      </div>
      {children}
    </>
  );
}
