// Jueves 22 · fragmento 4 · npm run fragmento4
// Este archivo NO compila a propósito: tsc dice qué está mal.

type Tipo = 'general' | 'refrigerada';
interface Politica { pct: number; fija: number }

export const T: Record<Tipo, Politica> = {
  general: { pct: 0, fija: 0 },
  refrigerda: { pct: 18, fija: 15000 },
};
