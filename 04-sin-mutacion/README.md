# 04 · Sin mutación

Unidad 2 · Paradigma funcional en Elixir

| Sesión | Qué se usa |
|---|---|
| El lenguaje donde no se puede mutar | `fragmentos/lun-28.exs` (se corren en `iex`, uno por uno) |
| Taller: quitar la mutación | `imperativo.ts`, `ejercicios/lib/sin_mutacion.ex` y `respuestas-plantilla.md` |
| Descomponer, no preguntar | `fragmentos/mie-30.exs`, `ejercicios/lib/patrones.ex` y `respuestas-patrones.md` |
| Una lista es cabeza y cola | `fragmentos/jue-01.exs` y `ejercicios/lib/recursion.ex` |

## Cómo se trabaja

```bash
cd 04-sin-mutacion/ejercicios
mix test test/sin_mutacion_test.exs    # taller
mix test test/patrones_test.exs        # patrones
mix test test/recursion_test.exs       # recursión
```

Todas arrancan en rojo. Cada función trae un `raise("por implementar")`: reemplázalo.

## Las reglas de cada día

- **Taller:** antes de escribir, di en voz alta qué muta la versión de TypeScript y quién más se entera.
- **Patrones:** ni un solo `if`, `cond` ni `case` sobre el tipo. Cada decisión es una cláusula.
- **Recursión:** nada de `Enum`, `List` ni `length/1`. Solo `[cabeza | cola]`.

La IA está permitida. Al final de cada sesión se le pregunta a alguien, al azar, por qué su versión cumple la regla del día.

## Cómo se entrega el taller

Talleres de esta carpeta: `talleres/01-oct/` (quitar la mutación: `sin_mutacion.ex` + `respuestas.md`) y
`talleres/06-oct/` (patrones: `patrones.ex` + `respuestas.md` desde `respuestas-patrones.md`). El ejemplo de abajo
es el del 1 de octubre; para el de patrones cambia la fecha y los archivos.

En el repositorio de tu pareja (`cotizador-eNN`), cada quien en su carpeta con su número de control,
**el mismo día del taller antes de las 23:59**. Supone que este repositorio y el de tu pareja están
clonados uno junto al otro.

```bash
cd cotizador-eNN
git switch main && git pull
git switch -c taller/01-oct-<control>

mkdir -p talleres/01-oct/<control>
cp ../programacion-multiparadigma-2026/04-sin-mutacion/ejercicios/lib/sin_mutacion.ex talleres/01-oct/<control>/
cp ../programacion-multiparadigma-2026/04-sin-mutacion/respuestas-plantilla.md talleres/01-oct/<control>/respuestas.md
# llena respuestas.md

git add talleres
git commit -m "docs: entrega del taller quitar la mutación"
git push -u origin taller/01-oct-<control>
```

Abre el PR. Tu pareja lo aprueba y lo integra con **Create a merge commit** (no squash): cuenta la hora de
tu commit, no la del merge.
