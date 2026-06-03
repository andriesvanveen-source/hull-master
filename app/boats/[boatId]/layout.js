export default function BoatLayout({ children }) {
  return (
    <>
      <style>{`
        .boat-name-editor + .log-kicker {
          margin-top: 14px;
        }

        .boat-name-editor + .log-kicker + .boat-name-editor .boat-name-input {
          width: min(380px, 100%);
          min-height: 42px;
          font-family: Arial, Helvetica, sans-serif;
          font-size: 18px;
          font-weight: 700;
          line-height: 1.2;
          text-transform: none;
        }
      `}</style>
      {children}
    </>
  );
}
