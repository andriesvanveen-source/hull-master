"use client";

import { useEffect, useState } from "react";
import styles from "./InstallAppButton.module.css";

export default function InstallAppButton() {
  const [installPrompt, setInstallPrompt] = useState(null);
  const [instructions, setInstructions] = useState("");
  const [isStandalone, setIsStandalone] = useState(false);

  useEffect(() => {
    const standalone = window.matchMedia("(display-mode: standalone)").matches || window.navigator.standalone === true;
    setIsStandalone(standalone);

    const handleInstallPrompt = (event) => {
      event.preventDefault();
      setInstallPrompt(event);
    };
    const handleInstalled = () => setIsStandalone(true);
    window.addEventListener("beforeinstallprompt", handleInstallPrompt);
    window.addEventListener("appinstalled", handleInstalled);
    return () => {
      window.removeEventListener("beforeinstallprompt", handleInstallPrompt);
      window.removeEventListener("appinstalled", handleInstalled);
    };
  }, []);

  async function install() {
    if (installPrompt) {
      await installPrompt.prompt();
      await installPrompt.userChoice;
      setInstallPrompt(null);
      return;
    }

    const isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent);
    setInstructions(isIOS
      ? "Tap Share, then Add to Home Screen."
      : "Open your browser menu and choose Add to Home screen or Install app.");
  }

  if (isStandalone) return null;

  return (
    <div className={styles.installWrap}>
      <button className={styles.installButton} type="button" onClick={install}>Add to Home Screen</button>
      {instructions ? (
        <div className={styles.instructions} role="dialog" aria-label="Add Hull Master to your home screen">
          <span>{instructions}</span>
          <button type="button" onClick={() => setInstructions("")} aria-label="Close instructions">×</button>
        </div>
      ) : null}
    </div>
  );
}
