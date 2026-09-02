"use client";

import styles from "./HomeBackButton.module.css";
import { HOME_INTENT_KEY } from "./SessionRouteRestore";

export default function HomeBackButton() {
  function markHomeIntent() {
    window.sessionStorage.setItem(HOME_INTENT_KEY, "1");
  }

  return (
    <button
      type="button"
      className={styles.back}
      aria-label="Back to Hull Master home"
      onPointerDown={markHomeIntent}
      onClick={() => {
        markHomeIntent();
        window.location.assign("/");
      }}
    >
      <span aria-hidden="true">←</span>
      Home
    </button>
  );
}
