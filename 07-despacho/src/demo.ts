// npm run despacho · la misma demostración que condicionales.ts, con la tabla
import { recargo, documentoRequerido, etiqueta, POLITICAS } from './despacho.js';
import type { Tipo } from './despacho.js';

const tipos = Object.keys(POLITICAS) as Tipo[];
if (tipos.length === 0) console.log('La tabla POLITICAS está vacía: llénala en src/despacho.ts');
for (const t of tipos) {
  console.log(t.padEnd(18), recargo(t, 100000), documentoRequerido(t), etiqueta(t));
}
