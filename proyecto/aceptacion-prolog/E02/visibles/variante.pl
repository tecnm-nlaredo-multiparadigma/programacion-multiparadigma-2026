% Reglas tarifarias del equipo E02, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(2750).

cuota_puente(comercio_mundial, 50000).
cuota_puente(colombia, 42000).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(10000, 6, mas_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 10, 25000).
recargo(peligrosa, 25, 50000).
recargo(sobredimensionada, 40, 150000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(430000).
peso_maximo(36000).
