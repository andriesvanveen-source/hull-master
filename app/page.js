import Link from "next/link";
import styles from "./home.module.css";

const apps = [
  { href: "/commissioning", eyebrow: "Build & handover", title: "Hullmaster Commissioning", description: "Manage vessels, record commissioning defects and continue active inspections.", icon: "HM", tone: "navy" },
  { href: "/pdf-signoff", eyebrow: "Document utility", title: "PDF Sign-off Table", description: "Add R&C sign-off tables beside photographs in exception report PDFs.", icon: "PDF", tone: "teal" },
  { href: "/harbour-audit", eyebrow: "Inspection tool", title: "Harbour Audit Buddy", description: "Capture harbour audit findings, attach photos and generate a complete report.", icon: "HA", tone: "amber" }
];

export default function HomePage() {
  return (
    <main className={styles.shell}>
      <section className={styles.hero}>
        <div className={styles.brand}><span className={styles.mark}>HM</span><span>Hullmaster</span></div>
        <p className={styles.kicker}>Marine operations workspace</p>
        <h1>Everything you need,<br />ready from one harbour.</h1>
        <p className={styles.intro}>Choose a tool to begin. Each application has its own permanent address, so you can bookmark it and return directly to your work.</p>
      </section>
      <section className={styles.apps} aria-labelledby="tools-heading">
        <div className={styles.sectionHeading}>
          <div><p>Workspace</p><h2 id="tools-heading">Select an application</h2></div>
          <span className={styles.status}><i /> 3 tools available</span>
        </div>
        <div className={styles.grid}>
          {apps.map((app, index) => (
            <Link className={styles.card} href={app.href} key={app.href}>
              <div className={styles.cardTop}><span className={`${styles.appIcon} ${styles[app.tone]}`}>{app.icon}</span><span className={styles.number}>0{index + 1}</span></div>
              <p className={styles.eyebrow}>{app.eyebrow}</p>
              <h3>{app.title}</h3>
              <p className={styles.description}>{app.description}</p>
              <span className={styles.open}>Open application <b aria-hidden="true">→</b></span>
            </Link>
          ))}
        </div>
      </section>
      <footer className={styles.footer}><span>Hullmaster Operations Suite</span><span>Bookmark any application URL for direct access</span></footer>
    </main>
  );
}

