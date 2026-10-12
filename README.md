# Programación Multiparadigma — Agosto–diciembre 2026

Instituto Tecnológico de Nuevo Laredo · Ingeniería en Sistemas Computacionales
Especialidad en Desarrollo de Aplicaciones · Grupo S2-DDD2502

Este repositorio tiene el material de cada sesión. **Es de solo lectura para ustedes**:
clónalo, corre los ejemplos, y trabaja en TU repositorio del proyecto.

```bash
git clone https://github.com/tecnm-nlaredo-multiparadigma/programacion-multiparadigma-2026.git
cd programacion-multiparadigma-2026
```

Para actualizarlo cuando suba material nuevo:

```bash
git pull
```

## Contenido

| Carpeta | Sesión | Unidad |
|---|---|---|
| `01-cuatro-estilos/` | Jueves 27 de agosto | 1 · Fundamentos |
| `02-sintaxis-y-semantica/` | Miércoles 2 de septiembre | 1 · Fundamentos |
| `03-ci-en-rojo/` | Jueves 3 de septiembre | 1 · Fundamentos |
| `04-sin-mutacion/` | 30 de septiembre al 8 de octubre | 2 · Funcional |
| `05-pipe-y-with/` | Martes 13 de octubre | 2 · Funcional |
| `06-mutacion-escondida/` | Taller 3 · jueves 15 de octubre | 2 · Funcional |

**Semana del 12 al 16 de octubre:** empieza por [`SEMANA-DEL-12-OCT.md`](SEMANA-DEL-12-OCT.md).
Las lecturas de la unidad están en [`LECTURAS-UNIDAD-2.md`](LECTURAS-UNIDAD-2.md) y el proyecto del
parcial en [`proyecto/`](proyecto/).

Las carpetas aparecen conforme avanza el semestre.

## El proyecto

Todo el grupo construye el mismo sistema: un **cotizador de cruce fronterizo de carga**.
A cada equipo se le asigna una **variante distinta de las reglas tarifarias**.

El proyecto no es trabajo aparte del temario: **el entregable de cada unidad es el proyecto
creciendo**, en el paradigma de esa unidad, y siempre en el mismo repositorio.

| Unidad | Entrega | Subsistema | Lenguaje |
|---|---|---|---|
| 1 | Semana 3 | Carta del proyecto y repositorio con CI en verde | TypeScript |
| 2 | Semana 5 | Motor de calculo puro, sin estado mutable | Elixir |
| 3 | Semana 8 | Modelo de dominio tipado: los estados invalidos no compilan | TypeScript |
| 4 | Semana 10 | Motor de reglas declarativo: las reglas como datos | Prolog / SQL |
| 5 | Semana 13 | Procesamiento concurrente de un lote de cotizaciones | Elixir |
| Cierre | Semana 16 | Integracion y ensayo comparativo con una medicion propia | Todos |

Cada subsistema es de 100 a 200 lineas: pequeno a proposito. Sin el ensayo comparativo no se
acredita el proyecto.

## El repositorio del proyecto

El proyecto se trabaja en pareja y el repositorio es de los dos, las cinco unidades.
Los once pasos para crearlo, con los comandos y qué hacer si algo falla, están en
[`GUIA-REPOSITORIO-DEL-PROYECTO.md`](GUIA-REPOSITORIO-DEL-PROYECTO.md).

## Instalación

| Cuándo | Guía |
|---|---|
| Antes del jueves 27 de agosto | [`INSTALACION.md`](INSTALACION.md) — Node, VS Code, Git y GitHub (20 min) |
| Antes del lunes 7 de septiembre | [`INSTALACION-ELIXIR.md`](INSTALACION-ELIXIR.md) — Elixir, para la unidad 2 (15 min) |
| No se instala | Prolog: se usa SWISH en el navegador (unidad 4) |

## Los cinco paradigmas del curso

| Paradigma | Papel | Lenguaje |
|---|---|---|
| Imperativo | De aquí vienes. No se enseña: es el punto de partida | — |
| Funcional | Unidad 2 | Elixir |
| Objetos | Unidad 3 | TypeScript |
| Declarativo y lógico | Unidad 4 | Prolog y SQL |
| Concurrente | Unidad 5 | Elixir |

## Recursos

Todo abierto y gratuito. No se pide ningún libro.

| Área | Recurso |
|---|---|
| TypeScript | TypeScript Handbook · typescript-eslint.io |
| Elixir | Elixir School (hay versión en español) · hexdocs.pm/elixir |
| Prolog | Learn Prolog Now! interactivo · SWISH (corre en el navegador, no se instala) |
| Paradigmas | Van Roy, *Programming Paradigms for Dummies* |
| Práctica | Exercism — tracks de TypeScript, Elixir y Prolog |
| Git | conventionalcommits.org (versión en español) |
