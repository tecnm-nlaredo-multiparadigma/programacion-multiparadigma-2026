% Reglas tarifarias del equipo E01, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3950).

cuota_puente(comercio_mundial, 48500).
cuota_puente(colombia, 42000).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(8000, 5, a_partir_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 18, 15000).
recargo(peligrosa, 20, 75000).
recargo(sobredimensionada, 35, 150000).

% base_recargo(flete | subtotal)
base_recargo(subtotal).

minimo(290000).
peso_maximo(32000).
