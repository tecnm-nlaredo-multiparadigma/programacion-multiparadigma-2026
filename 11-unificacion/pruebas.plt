:- begin_tests(unificacion).
:- consult(unificacion).

test('mismo puente: dos por colombia') :-
    mismo_puente(embarque('EMB-2', 9000, refrigerada, colombia, []),
                 embarque('EMB-5', 7000, general, colombia, [])).
test('mismo puente: puentes distintos', [fail]) :-
    mismo_puente(embarque('EMB-1', 5000, general, comercio_mundial, []),
                 embarque('EMB-2', 9000, refrigerada, colombia, [])).

test('falta: peligrosa sin numero UN') :-
    falta(embarque('EMB-3', 12000, peligrosa, comercio_mundial, []), Doc),
    assertion(Doc == numero_un).
test('falta: peligrosa que si lo trae', [fail]) :-
    falta(embarque('EMB-3', 12000, peligrosa, comercio_mundial, [numero_un]), _).
test('falta: la general no requiere nada', [fail]) :-
    falta(embarque('EMB-1', 5000, general, colombia, []), _).

test('descuento a partir de: el umbral exacto cuenta') :-
    aplica_descuento(8000, descuento(8000, 5, a_partir_de)).
test('descuento mas de: el umbral exacto no cuenta', [fail]) :-
    aplica_descuento(10000, descuento(10000, 7, mas_de)).
test('descuento mas de: un kilo arriba si') :-
    aplica_descuento(10001, descuento(10000, 7, mas_de)).
test('descuento a partir de: abajo del umbral no', [fail]) :-
    aplica_descuento(7999, descuento(8000, 5, a_partir_de)).
:- end_tests(unificacion).
