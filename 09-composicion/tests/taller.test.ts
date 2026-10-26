import { describe, it, expect } from 'vitest';
import { readFileSync } from 'node:fs';
import { cotizar, frio, seguro, express } from '../src/composicion.js';
import { Cotizacion, Refrigerada, ConSeguro, RefrigeradaConSeguro } from '../src/herencia.js';

describe('paso 1 · los extras', () => {
  it('1 · frío suma 18 %, redondeando el medio centavo hacia arriba', () => {
    expect(frio(100000)).toBe(118000);
    expect(frio(150)).toBe(177);
  });
  it('2 · seguro suma 2 %', () => {
    expect(seguro(100000)).toBe(102000);
  });
  it('3 · express suma $500 fijos', () => {
    expect(express(100000)).toBe(150000);
  });
});

describe('paso 2 · cotizar', () => {
  it('4 · sin extras es el flete', () => {
    expect(cotizar(100, 3950, [])).toBe(395000);
  });
  it('5 · da los mismos centavos que la versión con herencia', () => {
    expect(cotizar(100, 3950, [])).toBe(new Cotizacion(100, 3950).total());
    expect(cotizar(100, 3950, [frio])).toBe(new Refrigerada(100, 3950).total());
    expect(cotizar(100, 3950, [seguro])).toBe(new ConSeguro(100, 3950).total());
    expect(cotizar(100, 3950, [frio, seguro])).toBe(new RefrigeradaConSeguro(100, 3950).total());
  });
  it('6 · una combinación que herencia.ts no tiene: los tres extras', () => {
    expect(cotizar(100, 3950, [frio, seguro, express])).toBe(525422);
  });
  it('7 · el orden importa cuando hay un monto fijo', () => {
    expect(cotizar(100, 1000, [express, seguro])).toBe(153000);
    expect(cotizar(100, 1000, [seguro, express])).toBe(152000);
  });
  it('8 · no modifica la lista de ajustes que recibe', () => {
    const lista = [frio, seguro];
    cotizar(100, 3950, lista);
    expect(lista).toEqual([frio, seguro]);
  });
});

describe('la regla del taller', () => {
  it('9 · composicion.ts no usa class ni extends', () => {
    const fuente = readFileSync(new URL('../src/composicion.ts', import.meta.url), 'utf8')
      .split('\n')
      .filter((l) => !l.trim().startsWith('//'))
      .join('\n');
    expect(fuente).not.toMatch(/\bclass\b/);
    expect(fuente).not.toMatch(/\bextends\b/);
  });
});
