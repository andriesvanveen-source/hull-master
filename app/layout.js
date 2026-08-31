import "./globals.css";
import SessionRouteRestore from "./components/SessionRouteRestore";

export const metadata = {
  title: "Hull Master",
  description: "Boat defect logging by discipline"
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <SessionRouteRestore />
        {children}
      </body>
    </html>
  );
}
