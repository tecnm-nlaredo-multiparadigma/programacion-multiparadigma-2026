# Qué repasar para el checkpoint 3

El miércoles 2 de diciembre habrá un checkpoint individual de 40 minutos en clase, sin IA. Repasa estos cuatro objetivos con tus propias palabras:

- **C4.1** Sigue una consulta Prolog paso a paso, escribe las sustituciones de variables y explica cuándo unifica o falla. Practica con [unificación](../11-unificacion/GUIA.md).
- **C4.2** Explica qué declara una consulta de SQL o una regla Prolog y qué parte decide el motor. Practica con [el taller SQL](../12-sql-declarativo/).
- **C5.1** Dibuja dos lecturas y dos escrituras que pierdan un incremento y explica cómo una prueba controla ese orden. Practica con [el contador](../13-carreras/).
- **C5.2** Describe quién posee los datos, qué mensajes viajan entre procesos y cómo el receptor conserva el orden de los rechazos. Repasa [el lote](GUIA-DEL-LOTE.md).

## Práctica antes del checkpoint

Intenta estas preguntas antes de ejecutar los ejemplos o consultar la respuesta. Puedes hacerlas aunque tu proyecto siga en desarrollo.

1. En Prolog tienes los hechos `cruza(a, colombia).` y `cruza(b, comercio_mundial).` ¿Qué sustitución da `cruza(X, colombia)` y por qué falla `cruza(b, colombia)`?
2. En el taller SQL quieres sumar los centavos de las cotizaciones válidas por puente. ¿Qué filas conservas y cómo agrupas? ¿Qué parte del trabajo decide el motor de SQLite?
3. Dos procesos leen un contador cuando vale 0. Ambos calculan 1 y después ambos escriben 1. ¿Qué resultado queda? ¿Dónde pondrías una barrera de mensajes para reproducirlo siempre?
4. Una tarea termina para el embarque 3 antes que para el 1. Ambos fueron rechazados. ¿Qué dato puede acompañar cada mensaje para que el resumen conserve el orden de llegada?

<details>
<summary>Respuestas para comprobar tu razonamiento</summary>

1. `X = a`. El único hecho para `b` tiene un puente distinto.
2. Conserva las filas con `total_centavos IS NOT NULL`, agrupa con `GROUP BY puente` y suma con `SUM(total_centavos)`. El motor decide cómo ejecutar la consulta.
3. Queda 1. Haz que ambos procesos confirmen su lectura y se detengan antes de escribir. Libéralos cuando tengas los dos avisos.
4. Envía el índice de entrada junto con el resultado. El receptor puede ordenar los rechazos por ese índice.

</details>
