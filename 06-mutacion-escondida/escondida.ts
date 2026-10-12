// Taller 3 · La mutación escondida
// Cinco funciones que parecen inocentes: reciben algo y regresan algo.
// Todas tienen una mutación escondida. Abajo está la demostración.
//
// ANTES de ejecutar: escribe en respuestas.md qué crees que imprime cada línea.
// Luego:  npx tsx escondida.ts

type Embarque = { id: string; pesoKg: number; documentos: { permiso: string | null } };

// 1 · Ordena los embarques del más ligero al más pesado.
function ordenarPorPeso(embarques: Embarque[]): Embarque[] {
  return embarques.sort((a, b) => a.pesoKg - b.pesoKg);
}

// 2 · Regresa las reglas con otro porcentaje de descuento.
function conDescuento(reglas: { descuentoPct: number }, pct: number) {
  reglas.descuentoPct = pct;
  return reglas;
}

// 3 · Lleva la cuenta de los embarques que ya se vieron.
const vistos: string[] = [];
function registrar(id: string): string[] {
  vistos.push(id);
  return vistos;
}

// 4 · Regresa una copia del embarque con su permiso.
function conPermiso(e: Embarque, permiso: string): Embarque {
  const copia = { ...e };
  copia.documentos.permiso = permiso;
  return copia;
}

// 5 · Calcula la fecha de entrega: la salida más unos días.
function fechaDeEntrega(salida: Date, dias: number): Date {
  salida.setDate(salida.getDate() + dias);
  return salida;
}

// ------------------------------------------------------------------ demostración
const lote: Embarque[] = [
  { id: "A", pesoKg: 1200, documentos: { permiso: null } },
  { id: "B", pesoKg: 800, documentos: { permiso: null } },
];
const ordenados = ordenarPorPeso(lote);
console.log("1 ·", lote.map((e) => e.id).join(","), ordenados === lote);

const base = { descuentoPct: 5 };
const promo = conDescuento(base, 10);
console.log("2 ·", base.descuentoPct, promo === base);

const primera = registrar("A");
const segunda = registrar("B");
console.log("3 ·", primera.length, primera === segunda);

const original: Embarque = { id: "C", pesoKg: 30000, documentos: { permiso: null } };
const conP = conPermiso(original, "SCT-77");
console.log("4 ·", original.documentos.permiso, original === conP);

const salida = new Date(2026, 9, 12); // 12 de octubre (los meses empiezan en 0)
const entrega = fechaDeEntrega(salida, 3);
console.log("5 ·", salida.getDate(), entrega.getDate());
