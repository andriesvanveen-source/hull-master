import Link from "next/link";
import styles from "./home.module.css";

const apps = [
  { href: "/commissioning", title: "Commissioning", icon: "HM" },
  { href: "/pdf-signoff", title: "PDF Sign-off Table", icon: "PDF" },
  { href: "/harbour-audit", title: "Harbour Audit Buddy", icon: "HA" }
];

export default function HomePage() {
  return (
    <main className={styles.shell}>
      <header className={styles.header}>
        <img
          className={styles.logo}
          src="/robertson-caine-logo-transparent.png"
          alt="Robertson and Caine International Yachts"
        />
        <h1>Hull Master</h1>
        <p>Select an application</p>
      </header>

      <nav className={styles.grid} aria-label="Hull Master applications">
        {apps.map((app) => (
          <Link className={styles.card} href={app.href} key={app.href}>
            <span className={styles.icon}>{app.icon}</span>
            <span>{app.title}</span>
            <b aria-hidden="true">→</b>
          </Link>
        ))}
      </nav>
    </main>
  );
}
