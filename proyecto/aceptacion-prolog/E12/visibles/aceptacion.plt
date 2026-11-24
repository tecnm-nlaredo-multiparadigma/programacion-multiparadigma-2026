:- begin_tests(aceptacion).
% Pruebas de aceptacion de las reglas (visibles) - equipo E12
% Se corre con:  swipl -g run_tests -t halt aceptacion.plt
:- consult(cotizador).

test('rechaza peso cero') :-
    cotizar(embarque('X01', 0, 220, general, comercio_mundial, none, none), R),
    assertion(R == error('X01', peso_invalido)).
test('rechaza distancia negativa') :-
    cotizar(embarque('X02', 5000, -5, general, comercio_mundial, none, none), R),
    assertion(R == error('X02', distancia_invalida)).
test('rechaza carga general arriba del peso maximo') :-
    cotizar(embarque('X03', 34001, 220, general, comercio_mundial, none, none), R),
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
    cotizar(embarque('V01', 7500, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V01', cotizacion(825000, 0, 825000, 42000, 0, 0, 867000))).
test('peso EXACTAMENTE en el umbral (15000 kg): lee tu criterio') :-
    cotizar(embarque('V02', 15000, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V02', cotizacion(825000, 0, 825000, 42000, 0, 0, 867000))).
test('un kilo arriba del umbral siempre lleva descuento') :-
    cotizar(embarque('V03', 15001, 220, general, comercio_mundial, none, none), R),
    assertion(R == ok('V03', cotizacion(825000, 66000, 759000, 42000, 0, 0, 801000))).
test('refrigerada paga su recargo') :-
    cotizar(embarque('V04', 5000, 240, refrigerada, comercio_mundial, none, none), R),
    assertion(R == ok('V04', cotizacion(900000, 0, 900000, 42000, 133000, 0, 1075000))).
test('peligrosa con numero UN paga recargo y cuota fija') :-
    cotizar(embarque('V05', 15500, 260, peligrosa, comercio_mundial, 'UN1203', none), R),
    assertion(R == ok('V05', cotizacion(975000, 78000, 897000, 42000, 299250, 0, 1238250))).
test('sobredimensionada con permiso puede pasar del peso maximo') :-
    cotizar(embarque('V06', 38000, 190, sobredimensionada, comercio_mundial, none, 'SCT-4471'), R),
    assertion(R == ok('V06', cotizacion(712500, 57000, 655500, 42000, 444975, 0, 1142475))).
test('el puente Colombia tiene su propia cuota') :-
    cotizar(embarque('V07', 5000, 200, general, colombia, none, none), R),
    assertion(R == ok('V07', cotizacion(750000, 0, 750000, 30000, 0, 0, 780000))).
test('un viaje corto paga el minimo') :-
    cotizar(embarque('V08', 900, 15, general, comercio_mundial, none, none), R),
    assertion(R == ok('V08', cotizacion(56250, 0, 56250, 42000, 0, 311750, 410000))).
test('lote mixto: resumen con cotizados, rechazados en orden y total por puente') :-
    resumen([embarque('L1', 15010, 220, general, comercio_mundial, none, none),
        embarque('L2', 5000, 220, refrigerada, colombia, none, none),
        embarque('L3', 0, 220, general, comercio_mundial, none, none),
        embarque('L4', 5000, 220, peligrosa, comercio_mundial, none, none),
        embarque('L5', 5000, 30, general, colombia, none, none),
        embarque('L6', 34100, 220, sobredimensionada, comercio_mundial, none, 'SCT-4471')], R),
    assertion(R == resumen(4, ['L3'-peso_invalido, 'L4'-falta_numero_un], 3482550, [comercio_mundial-2093550, colombia-1389000])).

:- end_tests(aceptacion).
