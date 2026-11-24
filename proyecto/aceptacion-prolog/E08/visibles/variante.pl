% Reglas tarifarias del equipo E08, como hechos. Montos en centavos, porcentajes enteros.
% Este archivo es DATOS: el programa (cotizador.pl) no trae ningun numero.

tarifa_km(2700).

cuota_puente(comercio_mundial, 50500).
cuota_puente(colombia, 39500).

% descuento(UmbralKg, Porcentaje, Criterio)   Criterio: a_partir_de | mas_de
descuento(15000, 6, mas_de).

% recargo(Tipo, Porcentaje, CuotaFija)
recargo(general, 0, 0).
recargo(refrigerada, 15, 25000).
recargo(peligrosa, 30, 50000).
recargo(sobredimensionada, 35, 120000).

% base_recargo(flete | subtotal)
base_recargo(flete).

minimo(450000).
peso_maximo(32000).
