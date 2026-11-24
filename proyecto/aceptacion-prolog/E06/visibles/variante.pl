% Reglas tarifarias del equipo E06, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(4100).

cuota_puente(comercio_mundial, 50500).
cuota_puente(colombia, 36000).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(10000, 9, mas_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 18, 25000).
recargo(peligrosa, 30, 75000).
recargo(sobredimensionada, 40, 120000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(400000).
peso_maximo(30000).
