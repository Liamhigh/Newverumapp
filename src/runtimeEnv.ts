export const GEMINI_API_KEY: string =
  (typeof window !== "undefined" &&
    (window as any).__env?.VITE_API_KEY) ||
  (import.meta.env?.VITE_API_KEY as string) ||
  "";
