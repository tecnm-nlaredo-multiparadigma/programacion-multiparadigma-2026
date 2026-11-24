:- begin_tests(aceptacion).
% Pruebas de aceptacion de las reglas (visibles) - equipo E03
% Se corre con:  swipl -g run_tests -t halt aceptacion.plt
:- consult(cotizador).

test('rechaza peso cero') :-
    cotizar(embarque('X01', 0, 220, general, comercio_mundial, none, none), R),
    assertion(R == error('X01', peso_invalido)).
test('rechaza distancia negativa') :-
    cotizar(embarque('X02', 5000, -5, general, comercio_mundial, none, none), R),
    assertion(R == error('X02', distancia_invalida)).
test('rechaza carga general arriba del peso maximo') :-
    cotizar(embarque('X03', 30001, 220, general, comercio_mundial, none, none), R),
    assertion(R == error('X03', excede_peso_maximo)).
test('rechaza peligrosa sin numero UN') :-
    cotizar(embarque('X04', 5000, 220, peligrosa, comercio_mundial, none, none), R),
    assertion(R == error('X04', falta_numero_un)).
test('rechaza sobredimensionada sin permiso') :-
    cotizar(embarque('X05', 5000, 220, sobredimensionada, comercio_mundial, none, none), R),
    assertion(R == error('X05', falta_permiso)).
test('rechaza un tipo de carga que no existe') :-
    cotizar(embarque('X06', 5000, 220, granel, comercio_mundial, none, none), R),
    assertion(R == error('X06', tipo_desconocido)).
test('rechaza un puente que no existe') :-
    cotizar(embarque('X07', 5000, 220, general, laredo_iv, none, none), R),
    assertion(R == error('X07', puente_desconocido)).
test('carga general por debajo del umbral: flete mas cuota, sin descuento') :-
    cotizar(embarque('V01', 6000, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V01', cotizacion(858000, 0, 858000, 52000, 0, 0, 910000))).
test('peso EXACTAMENTE en el umbral (12000 kg): lee tu criterio') :-
    cotizar(embarque('V02', 12000, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V02', cotizacion(858000, 51480, 806520, 52000, 0, 0, 858520))).
test('un kilo arriba del umbral siempre lleva descuento') :-
    cotizar(embarque('V03', 12001, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V03', cotizacion(858000, 51480, 806520, 52000, 0, 0, 858520))).
test('refrigerada paga su recargo') :-
    cotizar(embarque('V04', 5000, 240, refrigerada, comercio_mundial, none, none), R),
    assertion(R == ok('V04', cotizacion(936000, 0, 936000, 52000, 127320, 0, 1115320))).
test('peligrosa con numero UN paga recargo y cuota fija') :-
    cotizar(embarque('V05', 12500, 260, peligrosa, comercio_mundial, 'UN1203', none), R),
    assertion(R == ok('V05', cotizacion(1014000, 60840, 953160, 52000, 288290, 0, 1293450))).
test('sobredimensionada con permiso puede pasar del peso maximo') :-
    cotizar(embarque('V06', 34000, 190, sobredimensionada, comercio_mundial, none, 'SCT-4471'), R),
    assertion(R == ok('V06', cotizacion(741000, 44460, 696540, 52000, 433443, 0, 1181983))).
test('el puente Colombia tiene su propia cuota') :-
    cotizar(embarque('V07', 5000, 200, general, colombia, none, none), R),
    assertion(R == ok('V07', cotizacion(780000, 0, 780000, 33500, 0, 0, 813500))).
test('un viaje corto paga el minimo') :-
    cotizar(embarque('V08', 900, 15, general, comercio_mundial, none, none), R),
    assertion(R == ok('V08', cotizacion(58500, 0, 58500, 52000, 0, 269500, 380000))).
test('lote mixto: resumen con cotizados, rechazados en orden y total por puente') :-
    resumen([embarque('L1', 12010, 220, general, comercio_mundial, none, none),
        embarque('L2', 5000, 220, refrigerada, colombia, none, none),
        embarque('L3', 0, 220, general, comercio_mundial, none, none),
        embarque('L4', 5000, 220, peligrosa, comercio_mundial, none, none),
        embarque('L5', 5000, 30, general, colombia, none, none),
        embarque('L6', 30100, 220, sobredimensionada, comercio_mundial, none, 'SCT-4471')], R),
    assertion(R == resumen(4, ['L3'-peso_invalido, 'L4'-falta_numero_un], 3589434, [comercio_mundial-2199974, colombia-1389460])).

:- end_tests(aceptacion).
