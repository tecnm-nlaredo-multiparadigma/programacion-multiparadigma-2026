// PRUEBAS DE ACEPTACION · Segundo parcial · Programacion Multiparadigma
// Equipo E04. Generado por el docente: NO se edita. Si una prueba te parece mal, abre un issue.
import { describe, it, expect } from 'vitest';
import { cotizar, despachar } from '../src/modelo.js';
import type { Borrador, Cotizado, Despachado, Rechazado, Reglas } from '../src/modelo.js';

const REGLAS: Reglas = {
  tarifaKm: 4150,
  cuotaPuente: { comercio_mundial: 46500, colombia: 35500 },
  descuento: { umbralKg: 15000, pct: 6, criterio: 'mas_de' },
  recargo: { general: { pct: 0, fija: 0 }, refrigerada: { pct: 18, fija: 15000 }, peligrosa: { pct: 30, fija: 75000 }, sobredimensionada: { pct: 40, fija: 120000 } },
  baseRecargo: 'subtotal',
  minimo: 350000,
  pesoMaximoKg: 30000,
};

describe('cotizar', () => {
  it('carga general por debajo del umbral: flete mas cuota, sin descuento', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V01', pesoKg: 7500, distanciaKm: 220, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 913000, descuento: 0, flete: 913000, cuotaPuente: 46500, recargo: 0, ajusteMinimo: 0, total: 959500 });
  });
  it('peso EXACTAMENTE en el umbral (15000 kg): lee tu criterio', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V02', pesoKg: 15000, distanciaKm: 220, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 913000, descuento: 0, flete: 913000, cuotaPuente: 46500, recargo: 0, ajusteMinimo: 0, total: 959500 });
  });
  it('un kilo arriba del umbral siempre lleva descuento', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V03', pesoKg: 15001, distanciaKm: 220, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 913000, descuento: 54780, flete: 858220, cuotaPuente: 46500, recargo: 0, ajusteMinimo: 0, total: 904720 });
  });
  it('refrigerada paga su recargo', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V04', pesoKg: 5000, distanciaKm: 240, tipo: 'refrigerada', puente: 'comercio_mundial' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 996000, descuento: 0, flete: 996000, cuotaPuente: 46500, recargo: 202650, ajusteMinimo: 0, total: 1245150 });
  });
  it('peligrosa con numero UN paga recargo y cuota fija', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V05', pesoKg: 15500, distanciaKm: 260, tipo: 'peligrosa', puente: 'comercio_mundial', numeroUn: 'UN1203' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 1079000, descuento: 64740, flete: 1014260, cuotaPuente: 46500, recargo: 393228, ajusteMinimo: 0, total: 1453988 });
  });
  it('sobredimensionada con permiso puede pasar del peso maximo', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V06', pesoKg: 34000, distanciaKm: 190, tipo: 'sobredimensionada', puente: 'comercio_mundial', permiso: 'SCT-4471' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 788500, descuento: 47310, flete: 741190, cuotaPuente: 46500, recargo: 435076, ajusteMinimo: 0, total: 1222766 });
  });
  it('el puente Colombia tiene su propia cuota', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V07', pesoKg: 5000, distanciaKm: 200, tipo: 'general', puente: 'colombia' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 830000, descuento: 0, flete: 830000, cuotaPuente: 35500, recargo: 0, ajusteMinimo: 0, total: 865500 });
  });
  it('un viaje corto paga el minimo', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'V08', pesoKg: 900, distanciaKm: 15, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    expect(r.estado).toBe('cotizado');
    if (r.estado === 'cotizado') expect(r.cotizacion).toMatchObject({ fleteBruto: 62250, descuento: 0, flete: 62250, cuotaPuente: 46500, recargo: 0, ajusteMinimo: 241250, total: 350000 });
  });
  it('rechaza peso cero', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'X01', pesoKg: 0, distanciaKm: 220, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    expect(r).toMatchObject({ estado: 'rechazado', motivo: 'peso_invalido' });
  });
  it('rechaza distancia negativa', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'X02', pesoKg: 5000, distanciaKm: -5, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    expect(r).toMatchObject({ estado: 'rechazado', motivo: 'distancia_invalida' });
  });
  it('rechaza carga general arriba del peso maximo', () => {
    const r = cotizar({ estado: 'borrador', embarque: { id: 'X03', pesoKg: 30001, distanciaKm: 220, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    expect(r).toMatchObject({ estado: 'rechazado', motivo: 'excede_peso_maximo' });
  });
});

describe('despachar', () => {
  it('un embarque cotizado se despacha con folio y conserva su cotizacion', () => {
    const c = cotizar({ estado: 'borrador', embarque: { id: 'V01', pesoKg: 7500, distanciaKm: 220, tipo: 'general', puente: 'comercio_mundial' } }, REGLAS);
    if (c.estado !== 'cotizado') throw new Error('debia cotizarse');
    const d = despachar(c, 'F-100');
    expect(d).toMatchObject({ estado: 'despachado', folio: 'F-100', cotizacion: c.cotizacion });
  });
});

// ---------------------------------------------------------------------------
// Los estados invalidos NO deben compilar. Cada linea marcada con @ts-expect-error
// tiene que ser un error de tipos en TU modelo. Si tu modelo la acepta, `tsc`
// falla con "Unused '@ts-expect-error' directive" y la puerta de tipos queda en rojo.
// Estas funciones nunca se ejecutan: solo las revisa el compilador.
// ---------------------------------------------------------------------------
export const estadosQueNoCompilan = [
  (b: Borrador) => {
    // @ts-expect-error un borrador no se puede despachar: primero se cotiza
    despachar(b, 'F-001');
  },
  (x: Rechazado) => {
    // @ts-expect-error un embarque rechazado no se puede despachar
    despachar(x, 'F-002');
  },
  (x: Rechazado) => {
    // @ts-expect-error un rechazado no tiene cotizacion
    return x.cotizacion;
  },
  (x: Cotizado): Despachado => {
    // @ts-expect-error un despachado sin folio no existe
    return { estado: 'despachado', embarque: x.embarque, cotizacion: x.cotizacion };
  },
  (): Borrador => ({
    estado: 'borrador',
    // @ts-expect-error una carga peligrosa sin numero UN no existe
    embarque: { id: 'N1', pesoKg: 10, distanciaKm: 10, tipo: 'peligrosa', puente: 'colombia' },
  }),
  (): Borrador => ({
    estado: 'borrador',
    // @ts-expect-error una carga sobredimensionada sin permiso no existe
    embarque: { id: 'N2', pesoKg: 10, distanciaKm: 10, tipo: 'sobredimensionada', puente: 'colombia' },
  }),
  (): Borrador => ({
    estado: 'borrador',
    // @ts-expect-error un tipo de carga que no existe no compila
    embarque: { id: 'N3', pesoKg: 10, distanciaKm: 10, tipo: 'granel', puente: 'colombia' },
  }),
  (): Borrador => ({
    estado: 'borrador',
    // @ts-expect-error un puente que no existe no compila
    embarque: { id: 'N4', pesoKg: 10, distanciaKm: 10, tipo: 'general', puente: 'laredo_iv' },
  }),
];
