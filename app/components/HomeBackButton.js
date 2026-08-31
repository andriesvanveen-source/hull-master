"use client";

import Link from "next/link";
import styles from "./HomeBackButton.module.css";
import { HOME_INTENT_KEY } from "./SessionRouteRestore";

export default function HomeBackButton() {
  return (
    <Link
      className={styles.back}
      href="/"
      aria-label="Back to Hull Master home"
      onClick={() => window.sessionStorage.setItem(HOME_INTENT_KEY, "1")}
    >
      <span aria-hidden="true">←</span>
      Home
    </Link>
  );
}
