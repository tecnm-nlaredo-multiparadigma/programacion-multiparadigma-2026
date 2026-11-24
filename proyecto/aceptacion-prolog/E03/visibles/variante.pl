% Reglas tarifarias del equipo E03, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3900).

cuota_puente(comercio_mundial, 52000).
cuota_puente(colombia, 33500).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(12000, 6, a_partir_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 12, 15000).
recargo(peligrosa, 25, 50000).
recargo(sobredimensionada, 45, 120000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(380000).
peso_maximo(30000).
