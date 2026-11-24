% Reglas tarifarias del equipo E09, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(4000).

cuota_puente(comercio_mundial, 43000).
cuota_puente(colombia, 31000).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(8000, 10, a_partir_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 10, 0).
recargo(peligrosa, 30, 90000).
recargo(sobredimensionada, 35, 120000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(430000).
peso_maximo(34000).
