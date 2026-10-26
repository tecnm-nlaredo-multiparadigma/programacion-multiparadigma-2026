type Tipo = 'general' | 'refrigerada' | 'peligrosa' | 'sobredimensionada';
interface Politica { pct: number; fija: number }

export const POLITICAS: Record<Tipo, Politica> = {
  general: { pct: 0, fija: 0 },
  refrigerada: { pct: 18, fija: 15000 },
  peligrosa: { pct: 20, fija: 75000 },
  sobredimensionada: { pct: 35, fija: 150000 },
  perecedera: { pct: 12, fija: 20000 },
};
