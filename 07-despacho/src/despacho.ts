// Taller 4 · De condicionales a despacho
// Lo mismo que condicionales.ts, sin un solo switch ni if sobre el tipo:
// cada tipo de carga es UNA ENTRADA en una tabla con su política.

export type Tipo = 'general' | 'refrigerada' | 'peligrosa' | 'sobredimensionada';

export interface Politica {
  readonly pct: number;
  readonly fija: number;
  readonly documento: 'numeroUn' | 'permiso' | null;
  readonly etiqueta: string;
}

// 1 · Llena la tabla con los valores de condicionales.ts.
//     Record<Tipo, Politica> obliga a que haya una entrada por cada tipo.
export const POLITICAS: Record<Tipo, Politica> = {
  // por llenar
} as Record<Tipo, Politica>; // ← borra este "as ..." cuando la tabla esté completa

const pct = (monto: number, p: number): number => Math.floor((monto * p + 50) / 100);

// 2 · Cada función es una consulta a la tabla. Una línea cada una.
export function recargo(tipo: Tipo, base: number): number {
  throw new Error('por implementar');
}

export function documentoRequerido(tipo: Tipo): string | null {
  throw new Error('por implementar');
}

export function etiqueta(tipo: Tipo): string {
  throw new Error('por implementar');
}

// pct se usa en recargo; esta línea evita el aviso de "no se usa" mientras tanto
void pct;
