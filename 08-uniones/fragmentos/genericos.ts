// Lunes 26 · genéricos · fragmentos que se ejecutan: npm run genericos

// --- Fragmento 1 · una función que solo sirve para números
function primeroNum(lista: number[]): number | undefined {
  return lista[0];
}
console.log('F1', primeroNum([1200, 800]));

// --- Fragmento 3 · con un hueco para el tipo
function primero<T>(lista: T[]): T | undefined {
  return lista[0];
}
console.log('F3', primero(['nld', 'mty']), primero([1200, 800]));

// --- Fragmento 5 · Resultado<T, E>: primero se pregunta, luego se lee
type Resultado<T, E> = { ok: true; valor: T } | { ok: false; error: E };
type Motivo = 'peso_invalido' | 'distancia_invalida';

function validarPeso(kg: number): Resultado<number, Motivo> {
  return kg > 0 ? { ok: true, valor: kg } : { ok: false, error: 'peso_invalido' };
}

const r = validarPeso(0);
if (r.ok) console.log('F5', 'peso', r.valor);
else console.log('F5', 'rechazado por', r.error);

// --- Fragmento 6 · encadenar: el `with` de Elixir, en TypeScript
function luego<T, U, E>(r: Resultado<T, E>, f: (valor: T) => Resultado<U, E>): Resultado<U, E> {
  return r.ok ? f(r.valor) : r;
}
function validarDistancia(km: number): Resultado<number, Motivo> {
  return km > 0 ? { ok: true, valor: km } : { ok: false, error: 'distancia_invalida' };
}
console.log('F6', luego(validarPeso(900), () => validarDistancia(200)));
console.log('F6', luego(validarPeso(900), () => validarDistancia(0)));
console.log('F6', luego(validarPeso(0), () => validarDistancia(0)));

// --- Fragmento 2 (se ejecuta al final porque truena) · con any se pierde todo
function primeroAny(lista: any[]): any {
  return lista[0];
}
const x = primeroAny(['nld', 'mty']);
console.log('F2', x.toFixed(2));
