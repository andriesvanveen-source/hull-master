"use client";

import { useParams } from "next/navigation";
import { useEffect, useState } from "react";
import { DEFAULT_COMMISSIONING_ENGINEER } from "../../../lib/constants";
import { loadState, subscribeToStateChanges } from "../../../lib/storage";

export default function EngineerBanner() {
  const params = useParams();
  const boatId = params?.boatId;
  const [engineer, setEngineer] = useState(DEFAULT_COMMISSIONING_ENGINEER);

  useEffect(() => {
    if (!boatId) {
      return undefined;
    }

    let isMounted = true;

    async function refreshEngineer() {
      try {
        const nextState = await loadState();
        const boat = nextState.boats.find((item) => item.id === boatId);

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
  }, [boatId]);

  return (
    <div className="engineer-page-banner">
      Commissioning Engineer: {engineer}
    </div>
  );
}
