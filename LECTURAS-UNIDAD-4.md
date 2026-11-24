# Lecturas guiadas · Unidad 4 (Prolog y SQL)

Cada lectura va con una guía o un taller. Léanla con SWISH abierto (<https://swish.swi-prolog.org>):
cada ejemplo se pega y se consulta. Al final de cada una hay preguntas del tipo del **checkpoint del 3
de diciembre**. No se entregan.

*Learn Prolog Now!* está en inglés y es corto; el código se entiende igual.

---

## Lectura 9 · Hechos, reglas y consultas
**Con la guía 10 (`10-hechos-y-reglas`, lunes 9)**

- *Learn Prolog Now!*, capítulo 1, secciones **1.1** (los cuatro programas de ejemplo) y **1.2** (átomos,
  variables y términos compuestos):
  <https://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlch1>

**Revísense:**
1. ¿Qué diferencia hay entre `woman(mia)` y `woman(Mia)`?
2. ¿Qué responde Prolog a una consulta que no puede demostrar? ¿Significa que es falsa?
3. Escriban una regla `pesado(Id)` con dos condiciones y díganla en voz alta con "si" y "y".

---

## Lectura 10 · Unificación y búsqueda
**Con el taller 6 (`11-unificacion`, martes 10)**

- *Learn Prolog Now!*, capítulo 2, secciones **2.1 Unification** (hasta *Programming with unification*) y
  **2.2 Proof Search**:
  <https://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlch2>

**Revísense:**
1. ¿Unifican `f(X, b)` y `f(a, Y)`? ¿Con qué ligaduras?
2. ¿Por qué `f(X, X)` no unifica con `f(a, b)`?
3. Dibujen el árbol de búsqueda de una consulta con dos cláusulas candidatas, como el de 2.2. ¿En qué
   punto "regresa" Prolog?

---

## Lectura 11 · Recursión, listas y aritmética
**Con la guía 10 (`fragmentos/jueves.pl`, jueves 12) y la etapa 3 de las reglas**

- *Learn Prolog Now!*, capítulo 3, sección **3.1 Recursive Definitions** (el ejemplo 2, *Descendant*):
  <https://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlch3>
- Capítulo 4, secciones **4.1 Lists** y **4.2 Member**:
  <https://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlch4>
- Capítulo 5, sección **5.1 Arithmetic in Prolog** (la diferencia entre `=` e `is`):
  <https://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlch5>

**Revísense:**
1. ¿Qué responde `X = 2 + 3` y qué responde `X is 2 + 3`?
2. Escriban `suma/2` sobre una lista de números y digan cuál es el caso base.
3. `[X | R] = [a]`: ¿qué vale `R`? ¿Y por qué `[X | R] = []` falla?

---

## Lectura 12 · SQL es declarativo
**Con el taller 7 (`12-sql-declarativo`, martes 17)**

Se publica con el taller 7.
