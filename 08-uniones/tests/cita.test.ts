import { describe, it, expect } from 'vitest';
import { confirmar, cancelar, atender, describir } from '../src/cita.js';
import type { Solicitada, Confirmada } from '../src/cita.js';

const solicitada: Solicitada = { estado: 'solicitada', pedimento: 'P-100', mercancia: { tipo: 'general' } };
const confirmada: Confirmada = { estado: 'confirmada', pedimento: 'P-200', mercancia: { tipo: 'general' }, hora: '09:30' };

describe('las transiciones', () => {
  it('1 · confirmar en horario', () => {
    const r = confirmar(solicitada, '10:15');
    expect(r).toEqual({
      ok: true,
      valor: { estado: 'confirmada', pedimento: 'P-100', mercancia: { tipo: 'general' }, hora: '10:15' },
    });
  });

  it('2 · confirmar fuera de horario', () => {
    expect(confirmar(solicitada, '18:00')).toEqual({ ok: false, error: 'fuera_de_horario' });
    expect(confirmar(solicitada, '07:59')).toEqual({ ok: false, error: 'fuera_de_horario' });
  });

  it('3 · cancelar conserva el pedimento', () => {
    expect(cancelar(confirmada, 'sin_documentos')).toEqual({
      estado: 'cancelada',
      pedimento: 'P-200',
      mercancia: { tipo: 'general' },
      motivo: 'sin_documentos',
    });
  });

  it('4 · atender agrega el folio', () => {
    expect(atender(confirmada, 'A-9')).toMatchObject({ estado: 'atendida', hora: '09:30', folio: 'A-9' });
  });

  it('5 · el original no cambia', () => {
    atender(confirmada, 'A-9');
    expect(confirmada.estado).toBe('confirmada');
  });
});

describe('describir', () => {
  it('6 · un texto por estado', () => {
    expect(describir(solicitada)).toBe('P-100: solicitada');
    expect(describir(confirmada)).toBe('P-200: confirmada a las 09:30');
    expect(describir(cancelar(confirmada, 'fuera_de_horario'))).toBe('P-200: cancelada (fuera_de_horario)');
    expect(describir(atender(confirmada, 'A-9'))).toBe('P-200: atendida, folio A-9');
  });
});
