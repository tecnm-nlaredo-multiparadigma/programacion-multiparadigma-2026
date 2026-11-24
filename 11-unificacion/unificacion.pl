% Taller 6 - Unificacion paso a paso
% Completa los tres predicados. Verifica con:  swipl -g run_tests -t halt pruebas.plt
% (o pega este archivo y pruebas.plt en SWISH y consulta  ?- run_tests.)

% requiere(Tipo, Documento): hechos del dominio
requiere(peligrosa, numero_un).
requiere(sobredimensionada, permiso).

% 1. mismo_puente(+E1, +E2): los dos embarques cruzan por el mismo puente.
%    Un embarque es  embarque(Id, PesoKg, Tipo, Puente, Documentos)  y Documentos es una lista.
%    Sin  ==  ni  =  en el cuerpo: que lo diga el patron de la cabeza.
mismo_puente(_E1, _E2) :- fail.

% 2. falta(+Embarque, -Doc): el embarque requiere el documento Doc y no lo trae.
falta(_Embarque, _Doc) :- fail.

% 3. aplica_descuento(+PesoKg, +Descuento): Descuento es  descuento(UmbralKg, Pct, Criterio)
%    con Criterio  a_partir_de  (el umbral exacto si cuenta) o  mas_de  (no cuenta).
%    Dos clausulas, una por criterio. Sin  ->  ni  ;
aplica_descuento(_Peso, _Descuento) :- fail.
