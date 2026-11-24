% Reglas tarifarias del equipo E10, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3150).

cuota_puente(comercio_mundial, 38000).
cuota_puente(colombia, 37500).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(10000, 5, mas_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 18, 0).
recargo(peligrosa, 30, 50000).
recargo(sobredimensionada, 35, 150000).

% base_recargo(flete | subtotal)
base_recargo(subtotal).

minimo(270000).
peso_maximo(30000).
