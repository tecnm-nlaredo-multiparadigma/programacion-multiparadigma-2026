// Jueves 22 · fragmentos 6 a 9 · npm run fragmentos
// Este archivo tiene errores A PROPÓSITO. tsc los lista con su número de línea:
// cada error dice qué estado imposible no se pudo escribir.

// --- Fragmento 6 · un tipo con campos opcionales: esto COMPILA
type CitaSuelta = {
  estado: string;
  pedimento: string;
  hora?: string;
  motivo?: string;
  folio?: string;
};
export const f6: CitaSuelta = { estado: 'atendida', pedimento: 'P-1' };

// Los cuatro estados como unión discriminada
type Solicitada = { estado: 'solicitada'; pedimento: string };
type Confirmada = { estado: 'confirmada'; pedimento: string; hora: string };
type Cancelada = { estado: 'cancelada'; pedimento: string; motivo: string };
type Atendida = { estado: 'atendida'; pedimento: string; hora: string; folio: string };
type Cita = Solicitada | Confirmada | Cancelada | Atendida;

// --- Fragmento 7 · una atendida sin folio: NO compila
export const f7: Atendida = { estado: 'atendida', pedimento: 'P-1', hora: '10:00' };

// --- Fragmento 8 · atender una solicitada: NO compila
function atender(c: Confirmada, folio: string): Atendida {
  return { ...c, estado: 'atendida', folio };
}
const s: Solicitada = { estado: 'solicitada', pedimento: 'P-9' };
export const f8 = atender(s, 'A-1');

// --- Fragmento 9 · horaDe compila; mal NO compila
export function horaDe(c: Cita): string {
  if (c.estado === 'confirmada') return c.hora;
  return 'sin hora';
}
export function mal(c: Cita): string {
  return c.hora;
}
