# Semana del 19 al 23 de octubre

Empieza la unidad 3: TypeScript, con objetos y tipos. Primero actualicen el repositorio del curso:

```bash
cd programacion-multiparadigma-2026
git pull
```

## El plan

Desde hoy la pareja trabaja en paralelo: **A termina el motor; B empieza el modelo.**

| Día | Quién | Qué | Dónde | Entrega |
|---|---|---|---|---|
| **Mar 20** | Los dos | **Taller 4:** de condicionales a despacho (individual) | `07-despacho/GUIA.md` · Lectura 6 | Vie 23, 23:59 |
| **Mié 21** | A | Motor, etapa 3: recargos y mínimo | `proyecto/GUIA-DEL-MOTOR.md` | PR integrado |
| | B | Uniones discriminadas | `08-uniones/GUIA.md` · Lecturas 7 y 8 | No se entrega |
| **Jue 22** | A | Motor, etapa 4: el resumen | `proyecto/GUIA-DEL-MOTOR.md` | PR integrado |
| | B | Modelo, etapas 0 y 1 | `proyecto/GUIA-DEL-MODELO.md` | PR integrado |
| **Vie 23** | Los dos | **Hito 1** y **taller 4** | | 23:59 |

A también hace la guía 08 antes del lunes: en la defensa a A le preguntan por el modelo.

**Fechas que cuentan:**

- **Taller 4:** viernes 23 de octubre, 23:59, en `talleres/23-oct/<tu número de control>/`. Vale 2 puntos.
- **Hito 1 (el motor completo):** viernes 23 de octubre, 23:59. Etiqueta `hito-1` en `main`. Vale 20 de calidad.
- **Entrega final (motor + modelo):** jueves 29 de octubre, 23:59. Etiqueta `parcial-2`.

## El hito 1, paso a paso

Con las 16 pruebas en verde y todo integrado en `main`:

```bash
git switch main && git pull
cd motor && mix test && mix format --check-formatted && cd ..
git tag hito-1
git push origin hito-1
```

Se califica lo que esté en la etiqueta a las 23:59 del viernes. Si no llegan a 16, etiqueten lo que
tengan: cada prueba en verde cuenta.

## Las lecturas

`LECTURAS-UNIDAD-3.md`: la 6 con el taller 4, y la 7 y la 8 con la guía 08.

## Cómo pedir ayuda

En el canal de Teams, así:

> **Guía o etapa:** Modelo, etapa 1.
> **Esperaba:** `tsc` en verde · **Me sale:** `Unused '@ts-expect-error' directive` en la línea 98
> **Mi código:** (solo el tipo o la función)

## Si no les alcanza para todo

Prioridad: **1)** el hito 1, **2)** el taller 4, **3)** la etapa 1 del modelo, **4)** la guía 08.
