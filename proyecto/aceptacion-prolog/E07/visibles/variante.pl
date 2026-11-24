% Reglas tarifarias del equipo E07, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3700).

cuota_puente(comercio_mundial, 38500).
cuota_puente(colombia, 33500).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(12000, 8, a_partir_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 10, 0).
recargo(peligrosa, 30, 75000).
recargo(sobredimensionada, 45, 120000).

% base_recargo(flete | subtotal)
base_recargo(subtotal).

minimo(310000).
peso_maximo(34000).
