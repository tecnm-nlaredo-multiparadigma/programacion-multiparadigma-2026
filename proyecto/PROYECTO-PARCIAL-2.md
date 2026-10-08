# Proyecto del segundo parcial · El cotizador, en dos paradigmas

Unidades 2 y 3 · del lunes 28 de septiembre al viernes 6 de noviembre

El peso de este parcial está en **un proyecto por equipo** (60 %), en el mismo
repositorio que ya tienen (`cotizador-eNN`), con dos entregas y una defensa oral.

> Van a escribir **el mismo cotizador dos veces**: una en Elixir, donde no se puede mutar, y otra
> en TypeScript, con tipos que no dejan representar un estado imposible. Las dos versiones tienen
> que dar **exactamente los mismos centavos** con las mismas reglas. Si no coinciden, una de las
> dos está mal, y averiguar cuál es parte del trabajo.

## Qué construyen

| Parte | Unidad | Lenguaje | Dónde vive | Qué demuestra |
|---|---|---|---|---|
| **Motor** | 2 · Funcional | Elixir | `motor/` | Cálculo puro, sin estado mutable; coincidencia de patrones; orden superior |
| **Modelo** | 3 · Objetos y tipos | TypeScript | `src/modelo.ts` | Estados inválidos que no compilan; despacho en lugar de condicionales sobre el tipo |

Cada parte es de 100 a 200 líneas. Pequeño a propósito.

## Fechas

| Qué | Cuándo | Cómo se entrega |
|---|---|---|
| Arranque: variante asignada y primera prueba en verde | mié 7 oct, en clase | PR integrado con CI en verde |
| **Hito 1 · el motor** | **mié 21 oct, 23:59** | Etiqueta `hito-1` en `main` |
| **Entrega final · motor + modelo** | **jue 29 oct, 23:59** | Etiqueta `parcial-2` en `main` |
| Defensa del equipo (10 min) | vie 30 oct · mar 3 · mié 4 nov | En clase, con su repositorio abierto |
| Checkpoint 2 (individual, sin IA) | vie 6 nov | 20 minutos, en clase |

La etiqueta se crea así, desde `main` actualizado:

```bash
git switch main && git pull
git tag hito-1
git push origin hito-1
```

Lo que no está en la etiqueta a la hora de corte no existe. No hay prórroga: el calificador
corre solo, contra la etiqueta.

## Las reglas del cotizador

Todos los montos son **centavos enteros**. Nada de decimales: `$28.50` es `2850`. Las reglas de su
equipo están en `variantes-tarifarias.md` y ya vienen escritas como datos dentro de sus pruebas de
aceptación.

**Un embarque** tiene: `id`, `peso_kg`, `distancia_km`, `tipo` (`general`, `refrigerada`,
`peligrosa`, `sobredimensionada`), `puente` (`comercio_mundial` o `colombia`), y dos documentos
que solo algunas cargas exigen: `numero_un` (peligrosa) y `permiso` (sobredimensionada).

**Se rechaza** con el primer motivo que aplique, en este orden:

1. `peso_invalido` — peso de cero o menos
2. `distancia_invalida` — distancia de cero o menos
3. `tipo_desconocido` — un tipo que no está en la lista
4. `puente_desconocido` — un puente que no está en las reglas
5. `falta_numero_un` — peligrosa sin número UN
6. `falta_permiso` — sobredimensionada sin permiso
7. `excede_peso_maximo` — pasa del peso máximo (la sobredimensionada no tiene máximo)

**Se cotiza** así:

1. `flete_bruto` = distancia × tarifa por km
2. `descuento` = el porcentaje de descuento sobre el flete bruto, **si el peso cumple el umbral**.
   Ojo: unos equipos tienen "a partir de" y otros "más de". No es lo mismo en el kilo exacto.
3. `flete` = flete bruto − descuento
4. `cuota_puente` = la cuota del puente elegido
5. `recargo` = porcentaje del tipo de carga sobre la base que diga su variante (el flete, o el flete
   más la cuota) **más** la cuota fija del tipo
6. `total` = flete + cuota + recargo, pero nunca menos que la cotización mínima;
   `ajuste_minimo` es lo que se sumó para llegar al mínimo (casi siempre 0)

**Redondeo.** Un porcentaje se redondea al centavo, con las mitades hacia arriba:
`(monto × porcentaje + 50) div 100`. Si usan `/` y luego `round`, en algún caso van a fallar
por un centavo. Ese centavo es el punto.

### Un ejemplo resuelto (reglas de E01)

Refrigerada, 9,000 kg, 200 km, puente Colombia:

| Paso | Cuenta | Centavos |
|---|---|---|
| Flete bruto | 200 × 3950 | 790000 |
| Descuento (5 %, a partir de 8,000 kg: sí aplica) | (790000 × 5 + 50) div 100 | 39500 |
| Flete | 790000 − 39500 | 750500 |
| Cuota Colombia | | 42000 |
| Recargo (18 % sobre flete + cuota, más $150) | (792500 × 18 + 50) div 100 + 15000 | 157650 |
| Total | 750500 + 42000 + 157650 (arriba del mínimo) | **950150** |

## Parte 1 · El motor (Elixir)

Viven en `motor/`, que crean con `mix new motor --module Cotizador`. Deben exponer:

```elixir
Cotizador.cotizar(embarque, reglas)
# => {:ok, %{id:, flete_bruto:, descuento:, flete:, cuota_puente:, recargo:, ajuste_minimo:, total:}}
# => {:error, :motivo}

Cotizador.resumen(embarques, reglas)
# => %{cotizados: n, rechazados: [{id, motivo}, ...], total: centavos, por_puente: %{comercio_mundial: c, colombia: c}}
```

`rechazados` va en el mismo orden en que llegaron los embarques. `por_puente` trae siempre los dos
puentes, aunque alguno quede en 0.

Condiciones que se revisan en la defensa, no en las pruebas:

- **Nada de `if` para decidir por tipo de carga ni por criterio de descuento.** Eso se decide con
  cláusulas de función y coincidencia de patrones.
- **`resumen/2` se escribe con `Enum` y `|>`**, sin recursión a mano.
- **Una función, al menos, recursiva a mano**, sobre una lista, sin `Enum`. Ustedes eligen cuál y
  tienen que poder decir por qué ahí.
- Las reglas llegan como argumento. Ningún número de su variante escrito dentro del motor.

Copien sus pruebas a `motor/test/aceptacion_test.exs` y el flujo de CI de
`plantilla-motor/motor.yml` a su repositorio, en `.github/workflows/motor.yml`. Con eso, cada PR corre el motor.

## Parte 2 · El modelo (TypeScript)

Vive en `src/modelo.ts`. Es el mismo cálculo, pero ahora la pregunta es otra: **qué estados puede
tener un embarque, y cómo hacer que el compilador no deje escribir los que no existen.**

Un embarque pasa por cuatro estados: `borrador` → `cotizado` o `rechazado` → `despachado` (solo
desde cotizado, y con folio). Deben exportar:

```ts
export function cotizar(b: Borrador, r: Reglas): Cotizado | Rechazado
export function despachar(c: Cotizado, folio: string): Despachado
export type { Borrador, Cotizado, Rechazado, Despachado, Reglas }
```

Los nombres de los campos son los de las pruebas (`pesoKg`, `distanciaKm`, `numeroUn`, `permiso`,
`cotizacion`, `motivo`, `folio`). **Cómo se definen los tipos lo deciden ustedes.** Las pruebas de
aceptación traen al final ocho líneas que **no deben compilar**, marcadas con `@ts-expect-error`:
despachar un borrador, despachar un rechazado, leer la cotización de un rechazado, un despachado sin
folio, una carga peligrosa sin número UN, una sobredimensionada sin permiso, un tipo que no existe,
un puente que no existe. Si su modelo acepta cualquiera de esas, `npm run verificar` se pone en rojo.

Por eso en TypeScript solo existen tres motivos de rechazo: los otros cuatro ya no se pueden escribir.
Esa diferencia con Elixir es de lo que se va a hablar en la defensa.

Condiciones que se revisan en la defensa:

- **Cero `switch` o cadenas de `if` sobre el tipo de carga.** Cada tipo de carga es una entrada en
  una tabla o un objeto con su política. Agregar un tipo nuevo es agregar una entrada.
- **Composición, no herencia**, para los pasos del cálculo. Si hay una clase base, tiene que poder
  defenderla contra la alternativa.
- Un tipo genérico `Resultado<T, E>` para la validación: es el `{:ok, _} | {:error, _}` de Elixir.
- `tsconfig.json` incluye la carpeta `test/`, para que `tsc` revise las líneas que no deben compilar.

## Cómo trabajan en pareja

El repositorio es de los dos. Para este parcial, **A escribe el motor y B lo revisa; B escribe el
modelo y A lo revisa.** Ningún PR entra a `main` sin la aprobación del otro y con CI en verde.

> En la defensa, **al integrante A se le pregunta por el modelo, y a B por el motor.** Lo que escribió tu
> compañero lo tienes que poder explicar tú. Aprobar un PR sin leerlo se paga ahí.

## Los talleres

Cada semana hay un taller. **Se entrega el mismo día del taller, antes de las 23:59:** cada quien sube su
trabajo al repositorio del equipo, en `talleres/<fecha>/<tu número de control>/` (por ejemplo
`talleres/01-oct/22100181/`). Son cinco talleres en el parcial; la fecha de cada uno se anuncia en clase, **2 puntos cada uno
por entrega a tiempo**: 10 % del parcial. La carpeta con tu número de control es la que se cuenta.

**El checkpoint 2 sale de los talleres.** Sus reactivos son del mismo tipo que los ejercicios de
los martes, con otros datos. Si quieren saber qué estudiar para el 6 de noviembre, es eso.

## Cómo se califica

| Componente | Peso | Quién lo mide |
|---|---|---|
| **Proyecto** = calidad × coeficiente de defensa | 60 % | El calificador automático y la defensa |
| Talleres de los martes, entregados a tiempo | 10 % | Se cuentan en GitHub: 2 puntos por taller |
| Revisión del PR de otro equipo (anillo) | 10 % | Se ve en GitHub: está o no está |
| Checkpoint 2, individual y sin IA | 20 % | Formulario autocalificado |

**Calidad (0 a 100), automática, sobre las etiquetas:**

| Bloque | Puntos | Qué se corre |
|---|---|---|
| Hito 1 | 20 | Sus pruebas de aceptación del motor, en la etiqueta `hito-1` |
| Motor | 25 | Las mismas, en la etiqueta `parcial-2` |
| Modelo | 25 | `tsc` en verde (10) y sus pruebas de aceptación de TypeScript (15) |
| Frontera | 20 | **Pruebas ocultas** del docente: los mismos casos raros, un kilo más allá |
| Oficio | 10 | Commits con formato y PRs aprobados antes de integrarse |

Las pruebas ocultas no son trampa: cubren fronteras que su enunciado ya dice (el kilo exacto, el
peso máximo exacto, el medio centavo, el lote vacío). Si sus propias pruebas cubren sus fronteras,
las ocultas no les van a sorprender.

**La defensa** es de 10 minutos por equipo. Se abre su repositorio y yo elijo quién contesta cada
pregunta. Habrá tres cosas: explicar una decisión, hacer un cambio en vivo, y encontrar un defecto que
meto yo en su código delante de ustedes. Cada quien sale con su nivel (0 a 4), y el coeficiente es
el de siempre (1.00 · 0.85 · 0.70 · 0.40 · 0). **Si tu compañero queda por debajo de ti, bajas un
nivel, nunca más de uno.** Así funciona un equipo real: el sistema es de los dos.

> La IA puede escribir su código. No puede presentar su defensa.

## Si algo falla

| Si pasa esto | Hagan esto |
|---|---|
| Una prueba de aceptación les parece incorrecta | Abran un issue en su repositorio y avísenme en Teams. No la editen |
| Pasa en su máquina y falla en CI | Casi siempre es un archivo sin subir, o `mix format`. Lean el log completo |
| `mix format --check-formatted` falla | Corran `mix format` y suban el cambio |
| Se equivocaron de commit al etiquetar | `git tag -d hito-1 && git push --delete origin hito-1` y vuelvan a etiquetar **antes** del corte |
