# Lecturas guiadas · Unidad 3 (TypeScript)

Cada lectura va con una guía o un taller. Léanla con su editor abierto: cada ejemplo se escribe y se
revisa con `npx tsc --noEmit`. Al final de cada una hay preguntas del tipo del **checkpoint del 6 de
noviembre**. No se entregan.

El manual oficial de TypeScript está en inglés. Las secciones son cortas y el código se entiende igual.

---

## Lectura 6 · Tablas en lugar de condicionales
**Con el taller 4 (`07-despacho`)**

- Manual de TypeScript · Utility Types, solo la sección **`Record<Keys, Type>`**:
  <https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type>

**Revísense:**
1. ¿Qué error da `tsc` si a un `Record<'a' | 'b', number>` le falta la llave `'b'`?
2. Un `switch` con `default` y una tabla `Record<Tipo, …>`: si agregan un tipo nuevo, ¿cuál de los dos
   avisa al compilar y por qué?
3. En Elixir, ¿qué cumple el papel de la tabla cuando deciden por tipo de carga?

---

## Lectura 7 · Uniones discriminadas
**Con la guía 08 (`08-uniones`)**

- Manual de TypeScript · Narrowing, las secciones **Discriminated unions**, **The `never` type** y
  **Exhaustiveness checking**:
  <https://www.typescriptlang.org/docs/handbook/2/narrowing.html#discriminated-unions>

**Revísense:**
1. ¿Qué tiene que tener una unión para ser "discriminada"?
2. Dentro de `if (c.estado === 'confirmada') { … }`, ¿qué tipo tiene `c`? ¿Y después del `if`?
3. Escriban el `default` con `never` de un `switch` y expliquen qué pasa si mañana se agrega un estado.

---

## Lectura 8 · Genéricos
**Con la guía 08 (`Resultado<T, E>`) y su modelo**

- Manual de TypeScript · Generics, la introducción y **Hello World of Generics**:
  <https://www.typescriptlang.org/docs/handbook/2/generics.html>

**Revísense:**
1. En `Resultado<T, E>`, ¿qué son `T` y `E`?
2. Escriban `Resultado<number, string>` con un valor de cada forma.
3. ¿Qué es en Elixir lo que `Resultado<T, E>` representa en TypeScript?
