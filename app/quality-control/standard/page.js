import Link from "next/link";
import styles from "./standard.module.css";

const manualPath = "/quality-control/Quality Standards Manual.pdf";

export default function QualityStandardPage() {
  return (
    <div className={styles.shell}>
      <header className={styles.header}>
        <div className={styles.headerInner}>
          <Link className={styles.backButton} href="/quality-control">
            <span aria-hidden="true">←</span>
            Quality Control
          </Link>
          <h1>Quality Standard</h1>
          <a className={styles.downloadButton} href={manualPath} download>
            Download PDF
          </a>
        </div>
      </header>

      <main className={styles.viewer}>
        <object className={styles.pdf} data={manualPath} type="application/pdf">
          <div className={styles.fallback}>
            <h2>Open the Quality Standard</h2>
            <p>Your browser cannot display the PDF inside this page.</p>
            <a href={manualPath}>Open PDF in this tab</a>
          </div>
        </object>
      </main>
    </div>
  );
}
