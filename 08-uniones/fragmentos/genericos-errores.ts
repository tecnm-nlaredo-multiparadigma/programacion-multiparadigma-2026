// Lunes 26 · genéricos · fragmentos que NO compilan, a propósito: npm run genericos:tipos

function primeroNum(lista: number[]): number | undefined {
  return lista[0];
}
// --- Fragmento 1b · la función de números no acepta textos
export const a = primeroNum(['nld', 'mty']);

function primero<T>(lista: T[]): T | undefined {
  return lista[0];
}
// --- Fragmento 4 · con el genérico, TypeScript sabe que es un texto
export const b = primero(['nld', 'mty'])?.toFixed(2);

type Resultado<T, E> = { ok: true; valor: T } | { ok: false; error: E };
function validarPeso(kg: number): Resultado<number, 'peso_invalido'> {
  return kg > 0 ? { ok: true, valor: kg } : { ok: false, error: 'peso_invalido' };
}
// --- Fragmento 5b · leer el valor sin preguntar si salió bien
export const c = validarPeso(0).valor;
