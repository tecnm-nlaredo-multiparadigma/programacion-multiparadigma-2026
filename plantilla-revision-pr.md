# Plantilla de revision de PR

Diez preguntas. Contestas las que apliquen, en comentarios **sobre lineas concretas**
del pull request, no en un comentario general al final.

Una revision aceptable trae al menos **un hallazgo con caso reproducible**:
la linea, la entrada que la rompe, y que prueba deberia existir.

1. **Proposito.** ¿Puedo decir en una frase que hace este cambio sin leer el codigo?
2. **Frontera.** ¿Que pasa en el limite exacto de cada comparacion? (`>` contra `>=`)
3. **Vacio y nulo.** ¿Que pasa con lista vacia, cero, cadena vacia, `undefined`?
4. **Orden.** Si dos reglas se aplican al mismo embarque, ¿el orden cambia el resultado?
   ¿Esta ese orden documentado o es accidental?
5. **La prueba prueba algo.** Si rompo una linea del codigo, ¿alguna prueba se pone roja?
   Nombra cual linea y cual prueba.
6. **Estado.** ¿Se muta algo que llego como argumento? ¿Se comparte una referencia?
7. **Nombres.** ¿El nombre de la funcion dice el proposito o describe la implementacion?
8. **Duplicacion con diferencia.** ¿Hay dos bloques casi iguales? ¿La diferencia es
   intencional o es un error de copiado?
9. **La bitacora.** En "Lo que descarte", ¿la razon es tecnica o es "no me gusto"?
10. **Lo que yo habria hecho distinto**, y por que. Una linea. No es obligatorio
    que tenga razon quien revisa.

---

## Lo que NO cuenta como revision

- "Se ve bien", "todo correcto", "buen trabajo"
- Comentarios de formato que el linter ya atrapa
- Repetir lo que dice el titulo del PR
