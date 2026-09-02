# Programacion Multiparadigma · agosto–diciembre 2026

TecNM Campus Nuevo Laredo · Academia de Sistemas y Computacion
Especialidad en Desarrollo de Aplicaciones · Grupo **S2-DDD2502** · 25 estudiantes

Este repositorio es **material de clase**. Lo clonas y lo lees. Tu trabajo va en el
repositorio de tu pareja, que es publico y es de los dos.

## Lo que tienes que leer antes que nada

| Archivo | Que es |
|---|---|
| [`INSTALACION.md`](INSTALACION.md) | Node, Git y VS Code. Elixir hasta la semana 3. Prolog no se instala. |
| [`variantes-tarifarias.md`](variantes-tarifarias.md) | **La variante de reglas de tu equipo.** |
| [`contrato-de-pareja.md`](contrato-de-pareja.md) | Lo que firman los dos en la semana 3. Leelo completo. |
| [`anillo-de-revision.md`](anillo-de-revision.md) | A que equipo revisa el tuyo y quien revisa al tuyo. |
| [`plantilla-revision-pr.md`](plantilla-revision-pr.md) | Las diez preguntas con las que se revisa un PR. |
| [`competencias.md`](competencias.md) | Las 12 competencias con su clave, su unidad y su checkpoint. |

## Las tres reglas del curso

**1. Puedes usar IA sin restriccion para construir.** No es un permiso, es un
requisito. No se usan detectores de IA en esta materia, ni uno.

**2. La IA puede escribir tu codigo; no puede presentar tu defensa.**

```
calificacion del entregable = calidad x coeficiente de defensa
```

El coeficiente sale de la defensa oral frente al repositorio de tu equipo. Un
entregable perfecto con defensa de nivel 1 vale 40. Con defensa de nivel 0 vale 0.
Da igual quien escribio el codigo.

La defensa es **en pareja y los dos responden**. Si uno no puede sostener el codigo,
baja el coeficiente de los dos, con un tope de un nivel. Esta en el contrato.

**3. Hay un candado.** 12 competencias binarias, se necesitan **10 dominadas**
para acreditar, sin importar que tan bueno sea el proyecto. Se evaluan en
checkpoints de 20 minutos sin IA, al inicio de la sesion.

> Nadie reprueba por sorpresa. Consultas el tablero cualquier semana y sabes
> exactamente que te falta.

## El proyecto

Un dominio para todos —cotizacion de cruce fronterizo de carga— y **una variante de
reglas distinta por equipo**. Se trabaja en parejas, un repositorio por pareja. El proyecto no es trabajo aparte: el entregable de cada unidad es el
proyecto creciendo.

| Unidad | Entrega | Subsistema | Lenguaje |
|---|---|---|---|
| 1 | semana 3 | Carta del proyecto + repositorio con CI en verde | TypeScript |
| 2 | semana 5 | Motor de calculo puro, sin estado mutable | Elixir |
| 3 | semana 8 | Modelo de dominio tipado: los estados invalidos no compilan | TypeScript |
| 4 | semana 10 | Motor de reglas declarativo: reglas como datos | Prolog / SQL |
| 5 | semana 13 | Procesamiento concurrente de un lote de cotizaciones | Elixir |
| Cierre | semana 16 | Integracion + ensayo comparativo con una medicion propia | Todos |

Sin el ensayo comparativo no se acredita el proyecto. Quien no encuentre ninguna
perdida en ningun paradigma va a cero: quien no ve compromisos no esta eligiendo,
esta prefiriendo.

## Material por sesion

| Carpeta | Sesion | Tema |
|---|---|---|
| [`01-cuatro-estilos/`](01-cuatro-estilos/) | jue 27 ago | El mismo algoritmo en cuatro paradigmas |
| `02-sin-mutacion/` | mar 8 sep | Quitar la mutacion (Elixir) |
| `03-mutacion-escondida/` | mar 22 sep | Modulos "funcionales" con mutacion oculta |
| `04-despacho/` | mar 29 sep | De condicionales sobre tipo a despacho |
| `05-tipos/` | mar 6 oct | Estado invalido irrepresentable |
| `06-sql-declarativo/` | mar 27 oct | SQL, NULL y logica trivaluada |
| `07-especificacion/` | mar 3 nov | Especificacion ambigua contra precisa, con la salida del modelo |
| `08-carreras/` | lun 9 nov | Actualizacion perdida reproducida de forma determinista |
| `09-tres-modelos/` | lun 23 nov | Concurrencia en JavaScript, Go y Elixir lado a lado |

Se publican la semana previa a usarse.
