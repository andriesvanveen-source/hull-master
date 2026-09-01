import "./globals.css";
import SessionRouteRestore from "./components/SessionRouteRestore";

export const metadata = {
  title: "Hull Master",
  description: "Boat defect logging by discipline",
  manifest: "/manifest.webmanifest",
  applicationName: "Hull Master",
  appleWebApp: {
    capable: true,
    title: "Hull Master",
    statusBarStyle: "black-translucent"
  },
  icons: {
    icon: [{ url: "/robertson-caine-logo-transparent.png", type: "image/png" }],
    apple: [{ url: "/robertson-caine-logo-transparent.png", type: "image/png" }]
  }
};

export const viewport = {
  themeColor: "#071b2e"
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
