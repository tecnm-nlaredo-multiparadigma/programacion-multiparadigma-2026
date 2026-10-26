// Taller 5 · Composición o herencia
// Lo mismo, sin clases: cada extra es una función que recibe un monto y regresa otro.
// Una cotización es el viaje más la LISTA de extras que lleva.
// Regla: en este archivo no hay `class` ni `extends`.

export type Ajuste = (monto: number) => number;

const pct = (monto: number, p: number): number => Math.floor((monto * p + 50) / 100);

// 1 · Los tres extras. Una línea cada uno.
export const frio: Ajuste = (_monto) => {
  throw new Error('por implementar'); // el monto más su 18 %
};

export const seguro: Ajuste = (_monto) => {
  throw new Error('por implementar'); // el monto más su 2 %
};

export const express: Ajuste = (_monto) => {
  throw new Error('por implementar'); // el monto más $500.00 fijos (50000 centavos)
};

// 2 · El flete (km × tarifa) y, encima, cada ajuste en el orden de la lista.
//     Pista: es un reduce.
export function cotizar(_km: number, _tarifaKm: number, _ajustes: readonly Ajuste[]): number {
  throw new Error('por implementar');
}

void pct;
