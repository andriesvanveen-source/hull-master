import Link from "next/link";
import styles from "./HomeBackButton.module.css";

export default function HomeBackButton() {
  return (
    <Link className={styles.back} href="/" aria-label="Back to Hullmaster home">
      <span aria-hidden="true">←</span>
      Home
    </Link>
  );
}
