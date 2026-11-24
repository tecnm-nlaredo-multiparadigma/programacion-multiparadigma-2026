# Guía del lote concurrente

**Entrega:** viernes 4 de diciembre, 23:59 · etiqueta `final` en `main`. [Calendario de cierre](../CIERRE-TERCER-PARCIAL.md).

1. Trabaja en una rama desde el motor Elixir que ya funciona. Copia `aceptacion-lote/EXX/visibles/lote_test.exs` a `motor/test/` usando tu equipo.
2. Identifica qué información recibe y devuelve `Cotizador.cotizar/2`. Prueba primero con tres embarques: uno válido y dos rechazados. Conserva el identificador y el puente al enviar cada resultado al proceso que resume.
3. Implementa `Cotizador.Lote.resumen/2`. Si eliges `Task.async_stream`, toma en cuenta el orden y qué harás si una tarea falla. Si recibes mensajes directamente, registra el índice de entrada para reconstruir el orden. Agrega los resultados en el proceso que recibe. Mantén ambos puentes en el mapa, incluso con cero cotizaciones.
4. Ejecuta `mix test test/lote_test.exs` desde `motor/`. Compara el resumen completo con el motor secuencial.
5. Completa el [taller de carrera](../13-carreras/) y enlaza en tu PR el commit de la prueba que falla y el de la corrección. Integra con revisión de tu compañero.
