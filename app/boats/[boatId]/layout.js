import { COMMISSIONING_ENGINEERS } from "../../../lib/constants";

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
      <datalist id="commissioningEngineerOptions">
        {COMMISSIONING_ENGINEERS.map((engineer) => (
          <option key={engineer} value={engineer} />
        ))}
      </datalist>
      <script
        dangerouslySetInnerHTML={{
          __html: `
            (() => {
              const applyEngineerList = () => {
                const input = document.querySelector('input[aria-label="Commissioning engineer"]');
                if (input) input.setAttribute('list', 'commissioningEngineerOptions');
              };

              applyEngineerList();
              new MutationObserver(applyEngineerList).observe(document.body, { childList: true, subtree: true });
            })();
          `
        }}
      />
      {children}
    </>
  );
}
