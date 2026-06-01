import "./globals.css";

export const metadata = {
  title: "Hull Master",
  description: "Boat defect logging by discipline"
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
