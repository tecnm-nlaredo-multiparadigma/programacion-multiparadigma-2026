# Proyecto del tercer parcial · El cotizador, en dos paradigmas más

Unidades 4 y 5 y cierre · calendario actualizado el 24 de noviembre

Mismo repositorio (`cotizador-eNN`), mismas reglas de su variante, mismos centavos. El parcial tiene
**dos entregas, un ensayo individual y una defensa final**.

> Ya escribieron el cotizador dos veces: en Elixir, sin mutar, y en TypeScript, con tipos que no dejan
> escribir un estado imposible. Ahora lo escriben una tercera vez en **Prolog**, donde las reglas no
> son código sino **datos que el motor consulta**, y luego vuelven a Elixir para cotizar **un lote
> completo con un proceso por embarque**. Las cuatro versiones tienen que dar exactamente los mismos
> centavos. Al final, cada quien escribe por qué cada paradigma para cada parte, qué ganó y qué
> perdió, con una medición propia.

## Qué construyen

| Parte | Unidad | Lenguaje | Dónde vive | Escribe / revisa | Qué demuestra |
|---|---|---|---|---|---|
| **Reglas** | 4 · Declarativo | Prolog + SQL | `reglas/cotizador.pl`, `reglas/variante.pl`, `reglas/resumen.sql` | A / B | Las reglas son hechos: agregar una es agregar una línea de datos, no tocar el programa |
| **Lote** | 5 · Concurrente | Elixir | `motor/lib/cotizador/lote.ex` | B / A | Un proceso por embarque, sin estado compartido; el mismo resumen que `Cotizador.resumen/2` |
| **Ensayo** | Cierre | Markdown | `ensayo/<tu número de control>.md` | cada quien el suyo | Por qué cada paradigma para cada parte, qué se ganó, qué se perdió, y una medición propia |

Cada parte de código es de 100 a 200 líneas. Pequeña a propósito.

## Fechas

| Qué | Cuándo | Cómo se entrega |
|---|---|---|
| **Entrega de las reglas** (Prolog + SQL) | **lun 30 nov, 23:59** | Etiqueta `reglas` en `main` |
| **Entrega final** (lote + ensayos) | **vie 4 dic, 23:59** | Etiqueta `final` en `main` |
| Checkpoint 3 (individual, sin IA) | jue 3 dic | 40 minutos, en clase |
| Defensa final del equipo (10 min) | lun 7 · mar 8 · mié 9 dic | En clase, con su repositorio en la etiqueta `final` |

La etiqueta se crea así, desde `main` actualizado:

```bash
git switch main && git pull
git tag reglas
git push origin reglas
```

Se califica lo que esté en la etiqueta a la hora de corte. Conserva el SHA de cada etiqueta.

## Parte 1 · Las reglas (Prolog y SQL)

Vive en `reglas/`. No se instala nada: se trabaja en SWISH (<https://swish.swi-prolog.org>) y, para
correr las pruebas, con `swipl` instalado o en CI. Tres archivos:

**`variante.pl`** son sus reglas tarifarias **como hechos**. Se lo damos hecho, en
`proyecto/aceptacion-prolog/EXX/visibles/variante.pl`:

```prolog
tarifa_km(3950).
cuota_puente(comercio_mundial, 45000).
cuota_puente(colombia, 42000).
descuento(8000, 5, a_partir_de).        % umbral en kg, porcentaje, criterio
recargo(refrigerada, 18, 15000).        % tipo, porcentaje, cuota fija
base_recargo(subtotal).
minimo(300000).
peso_maximo(32000).
```

**`cotizador.pl`** es el programa, y **no trae ningún número**: todo lo consulta de `variante.pl`.
Debe exponer:

```prolog
% cotizar(+Embarque, -Resultado)
%   Embarque  = embarque(Id, PesoKg, DistanciaKm, Tipo, Puente, NumeroUn, Permiso)
%               (none cuando no trae el documento)
%   Resultado = ok(Id, cotizacion(FleteBruto, Descuento, Flete, CuotaPuente, Recargo, AjusteMinimo, Total))
%             | error(Id, Motivo)

% resumen(+Embarques, -Resumen)
%   Resumen = resumen(Cotizados, [Id-Motivo, ...], Total, [comercio_mundial-C, colombia-D])
```

Los motivos de rechazo, su orden y las cuentas son **las mismas** del enunciado del segundo parcial
(`PROYECTO-PARCIAL-2.md`, "Las reglas del cotizador"). `rechazados` va en orden de llegada;
`por_puente` trae siempre los dos puentes.

Sus pruebas de aceptación están en `proyecto/aceptacion-prolog/EXX/visibles/aceptacion.plt`. Se
corren así, dentro de `reglas/`:

```bash
swipl -g run_tests -t halt aceptacion.plt
```

Condiciones que se revisan en la defensa, no en las pruebas:

- **Ningún número de su variante dentro de `cotizador.pl`.** Si cambian un hecho de `variante.pl`,
  el programa no se toca y las cotizaciones cambian.
- **Un rechazo es una cláusula de `rechazo/2`**, una por motivo, en el orden del enunciado. Nada de
  `->` para decidir por tipo de carga: la carga peligrosa sin número UN es un **patrón**.
- **Un predicado recursivo propio** sobre la lista del lote, sin `findall` ni `sum_list`. Tienen que
  poder decir cuál es su caso base.
- Si en SWISH una consulta regresa dos respuestas donde esperaban una, eso es un defecto: lo
  van a tener que explicar.

**`resumen.sql`** son tres consultas sobre la base `cotizaciones.db` que se publica con el taller 7
(`12-sql-declarativo/`): el total y la cuenta de cotizaciones por puente, los rechazos con su motivo
en orden, y las cargas peligrosas sin número UN. Cada consulta va precedida de `-- consulta 1`, `-- consulta 2`,
`-- consulta 3`. Se califica comparando su salida con la [salida esperada](../12-sql-declarativo/esperado.txt):

```bash
sqlite3 cotizaciones.db < resumen.sql
```

Copien el flujo de CI de `proyecto/plantilla-reglas/reglas.yml` a `.github/workflows/reglas.yml`. Con
eso, cada PR corre las pruebas de Prolog.

## Parte 2 · El lote (Elixir, concurrente)

Vive en `motor/lib/cotizador/lote.ex`, dentro del mismo proyecto `mix` del motor. Debe exponer:

```elixir
Cotizador.Lote.resumen(embarques, reglas)
# => exactamente lo mismo que Cotizador.resumen(embarques, reglas)
```

con una diferencia que no se ve en el resultado y sí en la defensa: **cada embarque se cotiza en su
propio proceso**, y el resumen se arma con los mensajes que esos procesos mandan de regreso. Nada de
estado compartido: ni `Agent`, ni `:ets`, ni una variable que todos escriban.

Además, el repositorio del curso trae en `proyecto/plantilla-lote/` un módulo `Cotizador.Contador`
**con una carrera sembrada**: cuenta cotizaciones desde varios procesos y, de vez en cuando, cuenta
de menos. Tienen que entregar:

1. **Una prueba que la reproduzca siempre**, no "a veces" (`motor/test/carrera_test.exs`).
2. **La corrección**, con procesos y mensajes, que haga pasar esa misma prueba.

Sus pruebas de aceptación del lote están en `proyecto/aceptacion-lote/EXX/visibles/lote_test.exs`.
Incluyen un lote de 1,000 embarques que se compara contra `Cotizador.resumen/2`.

Condiciones que se revisan en la defensa:

- Cada embarque en su propio proceso (`Task.async_stream`, o `spawn` + `send` + `receive`).
- El orden de `rechazados` sigue siendo el de llegada, aunque los procesos terminen en otro orden.
  Cómo lo logran es la pregunta más probable de la defensa.
- La prueba de la carrera falla **antes** de la corrección y pasa **después**. El historial de
  commits tiene que mostrar ese orden.

## Parte 3 · El ensayo (individual)

Un archivo por persona, `ensayo/<tu número de control>.md`, en la etiqueta `final`. De una a dos
páginas, con **estas tres secciones**, con estos títulos:

1. **Por qué cada paradigma.** Para cada una de las cuatro partes (motor, modelo, reglas, lote): por
   qué ese paradigma y no otro para esa parte.
2. **Qué se ganó y qué se perdió.** Al menos una pérdida real por paradigma. Un ensayo que no
   encuentra ninguna pérdida en ningún paradigma vale cero.
3. **La medición.** La tabla que preparas con el [script de medición y la guía del ensayo](GUIA-DEL-ENSAYO.md), con sus
   números: líneas que cambian para agregar el tipo de carga `perecedera` en cada versión, y tiempo
   del lote de 10,000 embarques en el motor y en el lote concurrente. Dos o tres renglones diciendo
   qué les dice la tabla.

El ensayo se lee en la defensa: a cada quien se le hace una pregunta sobre lo que escribió.

## Cómo trabajan en pareja

**A escribe las reglas y B las revisa; B escribe el lote y A lo revisa.** El ensayo es de cada quien.
Ningún PR entra a `main` sin la aprobación del otro ni con el CI en rojo.

> En la defensa final, **a A se le pregunta por el lote y a B por las reglas**, y a cada quien por su
> ensayo. Lo que escribió tu compañero lo tienes que poder explicar tú.

## Los talleres

Cuatro talleres, uno por semana, individuales, en `talleres/<fecha>/<tu número de control>/` del
repositorio del equipo. **2.5 puntos cada uno por entrega a tiempo.** El checkpoint 3 sale de ahí.

| Taller | Fecha de entrega | Carpeta |
|---|---|---|
| 6 · Unificación paso a paso | lun 30 nov, 23:59 | `talleres/10-nov/` |
| 7 · SQL es declarativo | lun 30 nov, 23:59 | `talleres/17-nov/` |
| 8 · Encontrar la carrera | mié 2 dic, 23:59 | `talleres/24-nov/` |
| 9 · Elegir el modelo correcto | jue 3 dic, 23:59 | `talleres/01-dic/` |

## El anillo

Dos revisiones, una por entrega, al equipo que les toca (consulta el [procedimiento de revisión](GUIA-DEL-ANILLO.md)).
Se abre un **issue** en el repositorio del otro equipo con la plantilla de diez preguntas.

| Revisión | De qué | Antes de |
|---|---|---|
| Anillo 1 | sus reglas en Prolog (etiqueta `reglas`) | mié 2 dic, 23:59 |
| Anillo 2 | su lote (etiqueta `final`) | lun 7 dic, 23:59 |

## Cómo se califica

| Componente | Peso | Quién lo mide |
|---|---|---|
| **Proyecto** = calidad × coeficiente de la defensa final | 60 % | El calificador automático y la defensa |
| Talleres 6 a 9, entregados a tiempo | 10 % | Se cuentan en GitHub: 2.5 puntos por taller |
| Anillo (dos issues: están o no están) | 10 % | GitHub |
| Checkpoint 3, individual y sin IA | 20 % | Formulario autocalificado |

**Calidad (0 a 100), automática, sobre las etiquetas:**

| Bloque | Puntos | Qué se corre |
|---|---|---|
| Reglas | 25 | Sus pruebas de aceptación en Prolog, en la etiqueta `reglas` |
| Consultas SQL | 10 | `resumen.sql` contra `cotizaciones.db`: 4 + 3 + 3 |
| Lote | 20 | Sus pruebas del lote y la prueba de la carrera, en la etiqueta `final` |
| Frontera | 15 | **Pruebas ocultas**: el kilo exacto, el lote vacío y el lote donde todo se rechaza, ahora en Prolog y en el lote |
| Ensayo | 20 | Existe el archivo de cada integrante con las tres secciones (10) y la tabla de medición con números (10) |
| Oficio | 10 | Commits con formato y PRs aprobados antes de integrarse |

**La defensa final** es de 10 minutos por equipo, con su repositorio en la etiqueta `final`: explicar una
decisión, hacer un cambio en vivo, encontrar un defecto que meto yo, y una pregunta sobre el ensayo de
cada quien. Cada quien sale con su nivel (0 a 4) y el coeficiente de siempre (1.00 · 0.85 · 0.70 ·
0.40 · 0). **Si tu compañero queda por debajo de ti, bajas un nivel, nunca más de uno.**

> La IA puede escribir su código. No puede presentar su defensa ni escribir lo que ustedes perdieron.

## Si algo falla

| Si pasa esto | Hagan esto |
|---|---|
| Una prueba de aceptación les parece incorrecta | Abran un issue en su repositorio y avísenme en Teams. No la editen |
| `swipl` no está en su máquina | Trabajen en SWISH y dejen que el CI corra las pruebas en cada PR |
| En SWISH una consulta da `true` y luego `false` | Es un punto de elección abierto: léanlo en la guía 10 |
| Se equivocaron de commit al etiquetar | `git tag -d reglas && git push --delete origin reglas` y vuelvan a etiquetar **antes** del corte |
