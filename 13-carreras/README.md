# Taller 8 Actualización perdida

**Entrega:** miércoles 2 de diciembre, 23:59. [Calendario de cierre](../CIERRE-TERCER-PARCIAL.md).

Copia [contador.ex](../proyecto/plantilla-lote/contador.ex) a `motor/lib/cotizador/contador.ex`. El contador lee el total, calcula un valor nuevo y lo escribe. Dibuja qué pasa si dos procesos leen el mismo valor antes de que cualquiera escriba.

En ExUnit, lanza dos procesos. Usa el callback opcional de `incrementar/2` para que cada proceso avise que leyó y espere un mensaje de tu prueba. Libera ambos después de recibir los dos avisos. Espera su finalización antes de comprobar que el total sea 2. Usa esperas con límite de tiempo. No dependas de `Process.sleep/1`.

Guarda primero la prueba que falla. Luego diseña la corrección con un proceso que reciba los incrementos y posea el total. Conserva la firma pública para poder ejecutar la misma prueba y coloca el callback fuera de la operación serializada para evitar bloquear al proceso que posee el total.

Entrega tu explicación y el enlace al commit de la prueba en `talleres/24-nov/<control>/respuestas.md`. El archivo integrable vive en `motor/test/carrera_test.exs`.
