import Link from "next/link";
import HomeBackButton from "../components/HomeBackButton";
import styles from "./qualityControl.module.css";

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
          <Link className={styles.headerButton} href="/quality-control/standard">
            Quality Standard
          </Link>
        </div>
      </header>

      <main className={styles.main}>
        <section className={styles.hero}>
          <p className={styles.kicker}>Quality audit</p>
          <h1>Boats</h1>
          <p className={styles.intro}>Quality Control audits will be managed here.</p>
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
