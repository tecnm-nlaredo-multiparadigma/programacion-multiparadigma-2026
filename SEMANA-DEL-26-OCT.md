# Semana del 26 al 30 de octubre

Cierre de la unidad 3 y del proyecto del segundo parcial. Primero actualicen el repositorio del curso:

```bash
cd programacion-multiparadigma-2026
git pull
```

## El plan

| Día | Qué | Dónde | Entrega |
|---|---|---|---|
| **Lun 26** | Genéricos: `Resultado<T, E>` | `08-uniones/GUIA.md`, sección 3 · Lectura 8 | |
| **Mar 27** | **Taller 5:** composición o herencia (individual) | `09-composicion/GUIA.md` | Mar 27, 23:59 |
| **Mié 28** | Modelo, etapas 2 y 3 | `proyecto/GUIA-DEL-MODELO.md` | PR integrado |
| **Jue 29** | Cierre de la unidad 3 · **entrega final** | | Jue 29, 23:59 |
| **Vie 30** | **Defensas:** E08 · E02 · E12 · E03 · E11 | `proyecto/DEFENSAS.md` | |

## Fechas que cuentan

- **Taller 5:** martes 27 de octubre, 23:59, en `talleres/27-oct/<tu número de control>/`. Vale 2 puntos.
- **Entrega final (motor + modelo):** jueves 29 de octubre, 23:59. Etiqueta `parcial-2` en `main`.
- **Defensas:** viernes 30 de octubre, martes 3 y miércoles 4 de noviembre. El orden está en
  `proyecto/DEFENSAS.md`.
- **Checkpoint 2** (individual, sin IA): viernes 6 de noviembre.

## La entrega final, paso a paso

Con el motor y el modelo integrados en `main`:

```bash
git switch main && git pull
npm run verificar
cd motor && mix test && mix format --check-formatted && cd ..
git tag parcial-2
git push origin parcial-2
```

Se califica lo que esté en la etiqueta a las 23:59 del jueves.

**E06, E08 y E12 no tienen la etiqueta `hito-1`.** El hito se califica con lo que había al corte del
viernes 23; el motor vuelve a contar en la entrega final (25 puntos de calidad), así que tiene que estar
en la etiqueta `parcial-2`.

## Cómo pedir ayuda

En el canal de Teams, así:

> **Guía o etapa:** Modelo, etapa 2.
> **Esperaba:** 11 de 12 pruebas · **Me sale:** `excede_peso_maximo` en la sobredimensionada
> **Mi código:** (solo el tipo o la función)
