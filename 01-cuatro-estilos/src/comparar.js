import { embarques, REGLAS } from './datos.js';

// El mismo calculo, cuatro veces. Mismo resultado, cuatro formas de pensarlo.
// La pregunta del jueves no es cual es mejor, es: que hace visible cada uno
// y que esconde.

// ---------- 1. IMPERATIVO --------------------------------------------------
// El programa es una secuencia de pasos que modifican estado.
function totalImperativo(lista, r) {
  let total = 0;
  for (let i = 0; i < lista.length; i++) {
    const e = lista[i];
    let monto = e.distanciaKm * r.tarifaBaseUsdKm;
    if (e.pesoKg > r.umbralPesoKg) monto = monto * (1 + r.recargoSobrepesoPct);
    monto = monto + r.cuotaPuenteUsd;
    if (e.tipoCarga === r.tipoCargaRecargado) monto = monto * (1 + r.recargoCargaPct);
    total = total + monto;
  }
  return total;
}

// ---------- 2. ORIENTADO A OBJETOS ----------------------------------------
// El programa es un conjunto de objetos que responden mensajes.
class Embarque {
  constructor(datos, reglas) { this.datos = datos; this.reglas = reglas; }
  get flete() {
    const base = this.datos.distanciaKm * this.reglas.tarifaBaseUsdKm;
    return this.tieneSobrepeso ? base * (1 + this.reglas.recargoSobrepesoPct) : base;
  }
  get tieneSobrepeso() { return this.datos.pesoKg > this.reglas.umbralPesoKg; }
  get pagaRecargoCarga() { return this.datos.tipoCarga === this.reglas.tipoCargaRecargado; }
  cotizar() {
    const subtotal = this.flete + this.reglas.cuotaPuenteUsd;
    return this.pagaRecargoCarga ? subtotal * (1 + this.reglas.recargoCargaPct) : subtotal;
  }
}
function totalOO(lista, r) {
  return lista.map((d) => new Embarque(d, r)).reduce((acc, e) => acc + e.cotizar(), 0);
}

// ---------- 3. FUNCIONAL ---------------------------------------------------
// El programa es la composicion de funciones sin efectos.
const flete       = (r) => (e) => e.distanciaKm * r.tarifaBaseUsdKm;
const conSobrepeso = (r) => (e) => (m) => e.pesoKg > r.umbralPesoKg ? m * (1 + r.recargoSobrepesoPct) : m;
const conPuente   = (r) => (m) => m + r.cuotaPuenteUsd;
const conCarga    = (r) => (e) => (m) => e.tipoCarga === r.tipoCargaRecargado ? m * (1 + r.recargoCargaPct) : m;
const cotizarF    = (r) => (e) => conCarga(r)(e)(conPuente(r)(conSobrepeso(r)(e)(flete(r)(e))));
const totalFuncional = (lista, r) => lista.map(cotizarF(r)).reduce((a, b) => a + b, 0);

// ---------- 4. DECLARATIVO (reglas como datos) -----------------------------
// El programa describe QUE se cumple; un motor generico decide COMO aplicarlo.
const reglasDeclarativas = [
  { cuando: (e, r) => e.pesoKg > r.umbralPesoKg,             aplica: (m, r) => m * (1 + r.recargoSobrepesoPct) },
  { cuando: ()      => true,                                  aplica: (m, r) => m + r.cuotaPuenteUsd },
  { cuando: (e, r) => e.tipoCarga === r.tipoCargaRecargado,   aplica: (m, r) => m * (1 + r.recargoCargaPct) },
];
function totalDeclarativo(lista, r) {
  return lista.reduce((total, e) => {
    const monto = reglasDeclarativas.reduce(
      (m, regla) => (regla.cuando(e, r) ? regla.aplica(m, r) : m),
      e.distanciaKm * r.tarifaBaseUsdKm
    );
    return total + monto;
  }, 0);
}

const fmt = (n) => '$' + n.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
console.log('imperativo  ', fmt(totalImperativo(embarques, REGLAS)));
console.log('orientado a objetos', fmt(totalOO(embarques, REGLAS)));
console.log('funcional   ', fmt(totalFuncional(embarques, REGLAS)));
console.log('declarativo ', fmt(totalDeclarativo(embarques, REGLAS)));
