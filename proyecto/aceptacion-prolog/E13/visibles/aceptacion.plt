:- begin_tests(aceptacion).
% Pruebas de aceptacion de las reglas (visibles) - equipo E13
% Se corre con:  swipl -g run_tests -t halt aceptacion.plt
:- consult(cotizador).

test('rechaza peso cero') :-
    cotizar(embarque('X01', 0, 220, general, comercio_mundial, none, none), R),
    assertion(R == error('X01', peso_invalido)).
test('rechaza distancia negativa') :-
    cotizar(embarque('X02', 5000, -5, general, comercio_mundial, none, none), R),
    assertion(R == error('X02', distancia_invalida)).
test('rechaza carga general arriba del peso maximo') :-
    cotizar(embarque('X03', 32001, 220, general, comercio_mundial, none, none), R),
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
    cotizar(embarque('V01', 4000, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V01', cotizacion(803000, 0, 803000, 40500, 0, 0, 843500))).
test('peso EXACTAMENTE en el umbral (8000 kg): lee tu criterio') :-
    cotizar(embarque('V02', 8000, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V02', cotizacion(803000, 64240, 738760, 40500, 0, 0, 779260))).
test('un kilo arriba del umbral siempre lleva descuento') :-
    cotizar(embarque('V03', 8001, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V03', cotizacion(803000, 64240, 738760, 40500, 0, 0, 779260))).
test('refrigerada paga su recargo') :-
    cotizar(embarque('V04', 5000, 240, refrigerada, comercio_mundial, none, none), R),
    assertion(R == ok('V04', cotizacion(876000, 0, 876000, 40500, 134980, 0, 1051480))).
test('peligrosa con numero UN paga recargo y cuota fija') :-
    cotizar(embarque('V05', 8500, 260, peligrosa, comercio_mundial, 'UN1203', none), R),
    assertion(R == ok('V05', cotizacion(949000, 75920, 873080, 40500, 257716, 0, 1171296))).
test('sobredimensionada con permiso puede pasar del peso maximo') :-
    cotizar(embarque('V06', 36000, 190, sobredimensionada, comercio_mundial, none, 'SCT-4471'), R),
    assertion(R == ok('V06', cotizacion(693500, 55480, 638020, 40500, 421408, 0, 1099928))).
test('el puente Colombia tiene su propia cuota') :-
    cotizar(embarque('V07', 5000, 200, general, colombia, none, none), R),
    assertion(R == ok('V07', cotizacion(730000, 0, 730000, 32000, 0, 0, 762000))).
test('un viaje corto paga el minimo') :-
    cotizar(embarque('V08', 900, 15, general, comercio_mundial, none, none), R),
    assertion(R == ok('V08', cotizacion(54750, 0, 54750, 40500, 0, 324750, 420000))).
test('lote mixto: resumen con cotizados, rechazados en orden y total por puente') :-
    resumen([embarque('L1', 8010, 220, general, comercio_mundial, none, none),
        embarque('L2', 5000, 220, refrigerada, colombia, none, none),
        embarque('L3', 0, 220, general, comercio_mundial, none, none),
        embarque('L4', 5000, 220, peligrosa, comercio_mundial, none, none),
        embarque('L5', 5000, 30, general, colombia, none, none),
        embarque('L6', 32100, 220, sobredimensionada, comercio_mundial, none, 'SCT-4471')], R),
    assertion(R == resumen(4, ['L3'-peso_invalido, 'L4'-falta_numero_un], 3400424, [comercio_mundial-2020224, colombia-1380200])).

:- end_tests(aceptacion).
