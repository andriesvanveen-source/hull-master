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
              const normalise = (value) => value.trim().toLowerCase();
              let cachedAreaValues = [];

              const getExistingAreas = () => new Set(
                Array.from(document.querySelectorAll('.area-row td > span'))
                  .map((item) => normalise(item.textContent || ''))
                  .filter(Boolean)
              );

              const captureAreaValues = () => {
                const list = document.getElementById('boatAreaOptions');
                if (!list || cachedAreaValues.length > 0) return;
                cachedAreaValues = Array.from(list.options).map((option) => option.value).filter(Boolean);
              };

              const rebuildAreaOptions = () => {
                const list = document.getElementById('boatAreaOptions');
                if (!list) return;

                captureAreaValues();
                const existingAreas = getExistingAreas();
                const availableAreas = cachedAreaValues.filter((area) => !existingAreas.has(normalise(area)));

                list.innerHTML = '';
                availableAreas.forEach((area) => {
                  const option = document.createElement('option');
                  option.value = area;
                  list.appendChild(option);
                });
              };

              const applyEngineerList = () => {
                const input = document.querySelector('input[aria-label="Commissioning engineer"]');
                if (input) input.setAttribute('list', 'commissioningEngineerOptions');
              };

              const applyAreaHandlers = () => {
                const input = document.querySelector('input[aria-label="Add area"]');
                if (!input || input.dataset.areaFilterReady) return;

                input.dataset.areaFilterReady = 'true';
                input.addEventListener('pointerdown', rebuildAreaOptions, true);
                input.addEventListener('focus', rebuildAreaOptions, true);
                input.addEventListener('input', rebuildAreaOptions, true);
              };

              const applyEnhancements = () => {
                applyEngineerList();
                rebuildAreaOptions();
                applyAreaHandlers();
              };

              applyEnhancements();
              window.setTimeout(applyEnhancements, 200);
              window.setTimeout(applyEnhancements, 800);
              new MutationObserver(applyEnhancements).observe(document.body, { childList: true, subtree: true });
            })();
          `
        }}
      />
      {children}
    </>
  );
}
