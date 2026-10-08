# Lecturas guiadas · Unidad 2 (Elixir)

Cada lectura es corta (15 a 20 minutos) y va con una clase. Léanla **después** de esa clase, con `iex`
abierto: cada ejemplo de la lectura se escribe y se corre, no solo se lee. Al final de cada una hay
preguntas para que se revisen ustedes mismos. **No se entregan**, pero son del mismo tipo que los
reactivos del checkpoint del 6 de noviembre.

Elixir School tiene versión en español. Si alguna lección no está traducida, el sitio la muestra en
inglés: léanla igual, el código es el mismo.

---

## Lectura 1 · Valores que no cambian
**Después de la clase "El lenguaje donde no se puede mutar"**

- Elixir School · Básico: <https://elixirschool.com/es/lessons/basics/basics>
- Elixir School · Colecciones, solo **Listas** y **Mapas**: <https://elixirschool.com/es/lessons/basics/collections>

Mientras leen, fíjense en esto: ninguna operación sobre listas o mapas cambia el original. Todas regresan
uno nuevo.

**Revísense:**
1. `m = %{peso: 1000}` y luego `Map.put(m, :peso, 2000)`. ¿Qué vale `m`? ¿Por qué?
2. ¿Qué diferencia hay entre `%{m | peso: 2000}` y `Map.put(m, :peso, 2000)` cuando la llave **no** existe en `m`? Pruébenlo.
3. `lista = [1, 2, 3]` y luego `[0 | lista]`. ¿Cuántas listas hay en memoria y cuáles comparten cajas?
4. En sus palabras: ¿qué es reasignar y qué es mutar? ¿Cuál permite Elixir?

---

## Lectura 2 · Descomponer, no preguntar
**Después de la clase "Descomponer, no preguntar"**

- Elixir School · Coincidencia de patrones: <https://elixirschool.com/es/lessons/basics/pattern_matching>
- Elixir School · Funciones, las secciones de **Coincidencia de patrones**, **Guardas** y **Funciones con nombre**: <https://elixirschool.com/es/lessons/basics/functions>

**Revísense:**
1. ¿Qué hace el operador pin `^`? Escriban un ejemplo donde sin `^` el resultado sería distinto.
2. `%{tipo: t} = %{id: 1, tipo: :general}`: ¿por qué coincide si el mapa de la derecha tiene más llaves?
3. Tienen dos cláusulas: `def f(%{tipo: _})` y `def f(%{tipo: :peligrosa})`. ¿En qué orden van, y qué avisa el compilador si las invierten?
4. ¿Qué dice una guarda `when` que la forma sola no puede decir? Den un ejemplo de su proyecto.

---

## Lectura 3 · Una lista es cabeza y cola
**Después de la clase "Una lista es cabeza y cola"**

- Elixir School · Funciones, sección **Funciones con nombre**: trae un ejemplo recursivo (`Length.of/1`) que es la fila que actuamos en clase: <https://elixirschool.com/es/lessons/basics/functions>
- Documentación oficial de Elixir · Recursion (en inglés; el código se entiende igual): <https://hexdocs.pm/elixir/recursion.html>

Mientras leen, tengan a la mano la receta de la clase: (1) ¿qué contesto con la lista vacía?, (2) separo
en `[cabeza | cola]`, (3) si alguien ya me resolvió la cola, ¿qué hago con la cabeza?

**Revísense:**
1. Con la receta, escriban `multiplicar/1`. ¿Qué contesta la lista vacía y por qué no es 0?
2. Sustituyan paso a paso, como en clase: `sumar([4, 1])` con `def sumar([]), do: 0` y `def sumar([c | cola]), do: c + sumar(cola)`.
3. ¿Qué pasa si escriben solo la cláusula `[cabeza | cola]` y llaman la función con `[]`? Lean el error: ¿qué les dice que llegó?
4. En `def f([]), do: ...` y `def f([h | t]), do: ...`: ¿cuántas funciones hay? ¿Cómo decide Elixir cuál cláusula usar?
5. El fragmento 3 usa una "mochila" (acumulador). Escriban `suma/1` con acumulador, sin `Enum`.

---

## Lectura 4 · Transformar, filtrar, reducir
**Después de la clase de map, filter y reduce**

- Elixir School · Enum: <https://elixirschool.com/es/lessons/basics/enum>
- Elixir School · Operador pipe: <https://elixirschool.com/es/lessons/basics/pipe_operator>

**Revísense:**
1. Un `for` que suma precios, uno que se queda con los embarques de más de 1000 kg y uno que duplica pesos: ¿cuál es `reduce`, cuál `filter` y cuál `map`?
2. Reescriban con `|>`: `Enum.sum(Enum.map(Enum.filter(es, &(&1.peso_kg > 1000)), & &1.peso_kg))`.
3. ¿En qué posición pone `|>` lo que viene de la izquierda?
4. ¿Por qué `Enum.reduce` no necesita una variable que cambie para acumular?
