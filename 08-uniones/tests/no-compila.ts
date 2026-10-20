// Estas líneas NO deben compilar. Cada @ts-expect-error tiene que ser un error de tipos
// en TU modelo. Si tu modelo acepta la línea, tsc dice "Unused '@ts-expect-error' directive".
// Este archivo no se ejecuta: solo lo revisa el compilador (npm run typecheck).
import { atender } from '../src/cita.js';
import type { Solicitada, Confirmada, Cancelada, Atendida, Cita } from '../src/cita.js';

export const noCompilan = [
  (s: Solicitada) => {
    // @ts-expect-error una cita solicitada no se puede atender: primero se confirma
    atender(s, 'A-1');
  },
  (c: Cancelada) => {
    // @ts-expect-error una cita cancelada no se puede atender
    atender(c, 'A-2');
  },
  (c: Cancelada) => {
    // @ts-expect-error una cita cancelada no tiene hora
    return c.hora;
  },
  (c: Confirmada): Atendida => {
    // @ts-expect-error una cita atendida sin folio no existe
    return { estado: 'atendida', pedimento: c.pedimento, mercancia: c.mercancia, hora: c.hora };
  },
  (): Solicitada => ({
    estado: 'solicitada',
    pedimento: 'P-1',
    // @ts-expect-error una mercancía peligrosa sin número UN no existe
    mercancia: { tipo: 'peligrosa' },
  }),
  (): Cita => ({
    // @ts-expect-error un estado que no existe no compila
    estado: 'extraviada',
    pedimento: 'P-2',
    mercancia: { tipo: 'general' },
  }),
];
