% Reglas tarifarias del equipo E04, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(4150).

cuota_puente(comercio_mundial, 46500).
cuota_puente(colombia, 35500).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(15000, 6, mas_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 18, 15000).
recargo(peligrosa, 30, 75000).
recargo(sobredimensionada, 40, 120000).

% base_recargo(flete | subtotal)
base_recargo(subtotal).

minimo(350000).
peso_maximo(30000).
