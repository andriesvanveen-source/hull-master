import EngineerBanner from "./EngineerBanner";

export default function BoatLayout({ children }) {
  return (
    <>
      <EngineerBanner />
      {children}
    </>
  );
}
