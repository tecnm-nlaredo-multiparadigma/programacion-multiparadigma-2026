// Guía 08 · Uniones discriminadas: el estado que no se puede escribir.
// Una cita en la aduana pasa por cuatro estados:
//   solicitada → confirmada (con hora) o cancelada (con motivo)
//   confirmada → atendida (con folio) o cancelada
//
// Hoy todo es UN tipo con campos opcionales: compila cualquier cosa, incluso lo imposible.
// Tu trabajo: reescribir los tipos como uniones discriminadas (ver la guía) y las funciones.

export type Motivo = string;

export type Mercancia = { tipo: string; numeroUn?: string };

export type Cita = {
  estado: string;
  pedimento: string;
  mercancia: Mercancia;
  hora?: string;
  motivo?: Motivo;
  folio?: string;
};

export type Solicitada = Cita;
export type Confirmada = Cita;
export type Cancelada = Cita;
export type Atendida = Cita;

// El {:ok, _} | {:error, _} de Elixir, con tipos. Escríbelo como en la guía.
export type Resultado<T, E> = unknown;

// Confirma en horario de 08:00 a 17:59; fuera de eso: error 'fuera_de_horario'.
export function confirmar(s: Solicitada, hora: string): Resultado<Confirmada, Motivo> {
  throw new Error('por implementar');
}

export function cancelar(c: Solicitada | Confirmada, motivo: Motivo): Cancelada {
  throw new Error('por implementar');
}

export function atender(c: Confirmada, folio: string): Atendida {
  throw new Error('por implementar');
}

// Un texto por estado (ver las pruebas). Un switch sobre c.estado.
export function describir(c: Cita): string {
  throw new Error('por implementar');
}
