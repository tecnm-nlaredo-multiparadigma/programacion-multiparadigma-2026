% Reglas tarifarias del equipo E13, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3650).

cuota_puente(comercio_mundial, 40500).
cuota_puente(colombia, 32000).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(8000, 8, a_partir_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 12, 25000).
recargo(peligrosa, 20, 75000).
recargo(sobredimensionada, 40, 150000).

% base_recargo(flete | subtotal)
base_recargo(subtotal).

minimo(420000).
peso_maximo(32000).
