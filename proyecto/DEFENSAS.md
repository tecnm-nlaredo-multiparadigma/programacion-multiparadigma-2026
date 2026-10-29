# Defensas del segundo parcial

Diez minutos por equipo (nueve de defensa y uno para el cambio de equipo), en clase, en la computadora del profesor, con su repositorio en la etiqueta
`parcial-2`. No necesitan traer nada conectado: pasan al frente y usan el teclado del profesor.

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

## Qué pasa en los nueve minutos

Al empezar se pregunta quién escribió el motor: ese es A. **A A se le pregunta por el modelo
(TypeScript) y a B por el motor (Elixir).** Cada quien contesta solo; el otro no ayuda.

| Minuto | Quién | Qué |
|---|---|---|
| 0 – 1 | A | **Explica** una decisión del modelo: el profesor señala las líneas |
| 1 – 4 | A | **Modifica** el modelo en vivo y corre `npm run verificar` |
| 4 – 5 | B | **Explica** una decisión del motor |
| 5 – 7½ | B | **Encuentra** un defecto que el profesor metió en el motor antes de que pasaran |
| 7½ – 8 | uno | Una pregunta sobre la parte del otro |

Sin IA durante la defensa; el editor sí. A los 9 minutos se termina, como esté.

Si su equipo no tiene modelo, a los dos se les pregunta por el motor.

## Cómo se decide tu nivel

Cada evidencia vale 0, 1 o 2:

| | 2 | 1 | 0 |
|---|---|---|---|
| **Explica** | Dices **por qué** está así y qué se ganaría o perdería de otra forma | Dices **qué** hace, pero no por qué | No sabes qué hace |
| **Modifica** | Lo haces solo y corres las pruebas | Lo terminas con una pista | No lo terminas |
| **Encuentra** | Lees la prueba que falla, llegas a la línea y dices qué regla rompe | Llegas con una pista | No lo encuentras |

| Suma | 6 | 5 | 4 | 1 a 3 | 0 |
|---|---|---|---|---|---|
| **Nivel** | 4 | 3 | 2 | 1 | 0 |
| **Coeficiente** | 1.00 | 0.85 | 0.70 | 0.40 | 0 |

**Tu nivel final es el menor entre tu nivel y el de tu compañero más uno.** Si tu compañero queda por
debajo de ti, bajas un nivel, nunca más de uno. Tu calificación del proyecto es la calidad (la mide
el calificador sobre la etiqueta) por tu coeficiente.

## Cómo prepararse

- Cada quien lee **todo** el código del otro, no solo el suyo.
- Cada quien practica agregar un tipo de carga en las dos versiones: en el motor (una cláusula) y en
  el modelo (una fila de la tabla y un caso en la unión).
- Practiquen leer una prueba en rojo: uno mete un error pequeño en el código del otro, corre las
  pruebas y el otro sigue el mensaje hasta la línea.
- El equipo que sigue espera en primera fila desde que empieza el anterior.
