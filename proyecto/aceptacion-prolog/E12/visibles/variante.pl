% Reglas tarifarias del equipo E12, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(3750).

cuota_puente(comercio_mundial, 42000).
cuota_puente(colombia, 30000).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(15000, 8, mas_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 12, 25000).
recargo(peligrosa, 25, 75000).
recargo(sobredimensionada, 45, 150000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(410000).
peso_maximo(34000).
