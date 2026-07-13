import type { Metadata } from "next";
import { Archivo, Source_Serif_4, JetBrains_Mono, Noto_Nastaliq_Urdu } from "next/font/google";
import "./globals.css";

const archivo = Archivo({
  variable: "--font-display",
  subsets: ["latin"],
  weight: ["400", "500", "600", "700", "800"],
});

const sourceSerif = Source_Serif_4({
  variable: "--font-serif",
  subsets: ["latin"],
  weight: ["500"],
});

const jetbrainsMono = JetBrains_Mono({
  variable: "--font-mono",
  subsets: ["latin"],
  weight: ["500"],
});

const notoNastaliqUrdu = Noto_Nastaliq_Urdu({
  variable: "--font-sindhi",
  subsets: ["arabic"],
  weight: ["400", "600"],
});

export const metadata: Metadata = {
  title: {
    default: "Shaheed Mohtarma Benazir Bhutto Medical University, Larkana",
    template: "%s | SMBBMU Larkana",
  },
  description:
    "Official website of Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, Sindh, Pakistan — news, noticeboard, admissions, faculty and institutes.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${archivo.variable} ${sourceSerif.variable} ${jetbrainsMono.variable} ${notoNastaliqUrdu.variable} antialiased bg-page text-primary font-display`}
      >
        {children}
      </body>
    </html>
  );
}
