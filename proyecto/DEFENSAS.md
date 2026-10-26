# Defensas del segundo parcial

Diez minutos por equipo, en clase, con su repositorio abierto en la etiqueta `parcial-2`.

## Orden

| Día | Equipos, en este orden |
|---|---|
| **Viernes 30 de octubre** | E08 · E02 · E12 · E03 · E11 |
| **Martes 3 de noviembre** | E05 · E10 · E01 · E07 |
| **Miércoles 4 de noviembre** | E06 · E13 · E04 · E09 |

El orden salió de un sorteo reproducible. Cualquiera puede comprobarlo con Python:

```python
import random
equipos = [f"E{i:02d}" for i in range(1, 14)]
random.Random(20261030).shuffle(equipos)
print(equipos)   # los primeros 5, los siguientes 4 y los últimos 4
```

## Qué pasa en los diez minutos

Se abre su repositorio y el profesor escoge quién contesta cada pregunta. **A A se le pregunta por el
modelo (TypeScript) y a B por el motor (Elixir).**

1. **Explicar una decisión.** Por ejemplo: por qué una cláusula y no un `if`, qué estado imposible
   evita un tipo, por qué composición y no herencia.
2. **Un cambio en vivo.** Por ejemplo: agregar un tipo de carga, o un motivo de rechazo.
3. **Encontrar un defecto** que el profesor mete en su código delante de ustedes.

Cada quien sale con su nivel (0 a 4); el coeficiente es el de siempre (1.00 · 0.85 · 0.70 · 0.40 · 0).
Si tu compañero queda por debajo de ti, bajas un nivel, nunca más de uno.

## Cómo prepararse

- Cada quien lee **todo** el código del otro, no solo el suyo.
- Cada quien practica agregar un tipo de carga en las dos versiones: en el motor (una cláusula) y en
  el modelo (una fila de la tabla y un caso en la unión).
- Tengan el repositorio clonado y las pruebas corriendo **antes** de su turno.
