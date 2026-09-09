import Link from "next/link";
import HomeBackButton from "../components/HomeBackButton";
import styles from "./qualityControl.module.css";

const manualPath = "/quality-control/Quality Standards Manual.pdf";
const workbookPath = "/quality-control/Quality Control Reference Workbook.xlsx";

export default function QualityControlPage() {
  return (
    <div className={styles.shell}>
      <HomeBackButton />
      <header className={styles.header}>
        <div className={styles.headerInner}>
          <div className={styles.brand}>
            <span className={styles.anchor} aria-hidden="true">⚓</span>
            <span>Quality Control</span>
          </div>
          <div className={styles.manualActions}>
            <a className={styles.headerButton} href={manualPath} target="_blank" rel="noreferrer">
              View standards
            </a>
            <a className={styles.headerButtonSecondary} href={manualPath} download>
              Download PDF
            </a>
          </div>
        </div>
      </header>

      <main className={styles.main}>
        <section className={styles.hero}>
          <p className={styles.kicker}>Quality audit</p>
          <h1>Boats</h1>
          <p className={styles.intro}>Quality Control audits will be managed here.</p>
        </section>

        <section className={styles.resources} aria-label="Quality Control resources">
          <article className={styles.card}>
            <span className={styles.cardTag}>STANDARD</span>
            <h2>Quality Standards Manual</h2>
            <p>Keep the approved quality standard open while completing boat audits.</p>
            <div className={styles.cardActions}>
              <a className={styles.primaryAction} href={manualPath} target="_blank" rel="noreferrer">Open manual</a>
              <a className={styles.secondaryAction} href={manualPath} download>Download</a>
            </div>
          </article>

          <article className={styles.card}>
            <span className={styles.cardTag}>REFERENCE</span>
            <h2>Quality Control workbook</h2>
            <p>All existing boat audit workbooks are combined into one multi-sheet reference file.</p>
            <a className={styles.primaryAction} href={workbookPath} download>Download workbook</a>
          </article>
        </section>

        <section className={styles.emptyState}>
          <h2>Quality audits</h2>
          <p>The boat register and audit workflow will be added here next.</p>
        </section>

        <Link className={styles.homeLink} href="/">Return to Hull Master</Link>
      </main>
    </div>
  );
}
