% Reglas tarifarias del equipo E11, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3350).

cuota_puente(comercio_mundial, 46500).
cuota_puente(colombia, 31000).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(12000, 8, a_partir_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 18, 15000).
recargo(peligrosa, 20, 50000).
recargo(sobredimensionada, 40, 120000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(280000).
peso_maximo(34000).
