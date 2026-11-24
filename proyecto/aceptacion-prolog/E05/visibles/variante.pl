% Reglas tarifarias del equipo E05, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3900).

cuota_puente(comercio_mundial, 39500).
cuota_puente(colombia, 41500).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(8000, 9, a_partir_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 12, 0).
recargo(peligrosa, 25, 90000).
recargo(sobredimensionada, 35, 120000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(440000).
peso_maximo(34000).
