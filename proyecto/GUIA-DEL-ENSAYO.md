# Guía del ensayo individual

Entrega `ensayo/<control>.md`, de una a dos páginas. Usa estas tres secciones: **Por qué cada paradigma**, **Qué se ganó y qué se perdió** y **La medición**. Incluye motor Elixir, modelo TypeScript, reglas Prolog y lote concurrente. Explica al menos una limitación concreta en cada versión.

Copia `plantilla-lote/comparar.exs` y el archivo `aceptacion-lote/EXX/visibles/reglas_lote.exs` a `motor/`. Desde esa carpeta corre `mix run comparar.exs reglas_lote.exs`. Anota la mediana de cinco muestras, tu equipo y la versión de Elixir. El script comprueba que ambos resúmenes coincidan.

Para medir el costo del cambio, usa una rama de prueba. Agrega `perecedera` con la misma regla en cada variante y registra las líneas de código y datos modificadas con `git diff --stat`. Indica si el lote reutilizó el motor y por eso no necesitó cambios propios. Incluye una tabla con las líneas por versión y otra con ambos tiempos. Explica qué observaste en tu caso. La rama de medición puede quedar fuera de `main`.
