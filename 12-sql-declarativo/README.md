# Taller 7 SQL declarativo

**Entrega:** lunes 30 de noviembre, 23:59. [Calendario de cierre](../CIERRE-TERCER-PARCIAL.md).

La base [cotizaciones.db](cotizaciones.db) contiene embarques sintéticos ya cotizados o rechazados. Cada fila tiene el orden de llegada, el identificador, el puente, el tipo, el número UN cuando existe y exactamente uno de los siguientes datos: total en centavos o motivo de rechazo.

1. Obtén una fila por puente con nombre, cantidad de cotizaciones válidas y suma de centavos. Ordena por nombre del puente.
2. Lista identificador y motivo de los rechazados, en orden de llegada.
3. Lista el identificador de las cargas peligrosas sin número UN, en orden de llegada.

Usa `COUNT`, `SUM`, `GROUP BY`, `IS NULL` y `ORDER BY` según corresponda. Examina el esquema con `sqlite3 cotizaciones.db '.schema embarques'`. Escribe tres consultas en `resumen.sql`, cada una precedida por un comentario `-- consulta 1`, `-- consulta 2` o `-- consulta 3`. Comprueba el resultado con:

```sh
sqlite3 -batch -noheader -separator '|' cotizaciones.db < resumen.sql > salida.txt
diff -u esperado.txt salida.txt
```

Entrega tu intento individual en `talleres/17-nov/<control>/resumen.sql`. Integra las consultas revisadas en `reglas/resumen.sql` para el corte `reglas`. [Salida esperada](esperado.txt) · [Datos en texto](datos.sql).
