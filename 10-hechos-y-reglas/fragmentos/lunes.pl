% Lunes 9 de noviembre - Hechos, reglas y consultas
% Pegalo completo en el panel izquierdo de SWISH (https://swish.swi-prolog.org) o cargalo con
%   swipl fragmentos/lunes.pl
% y haz las consultas de cada fragmento en el panel de la derecha (o en el prompt ?-).

% ------------------------------------------------------------ hechos: lo que es verdad
% puente(Nombre, Ciudad)
puente(comercio_mundial, nuevo_laredo).
puente(colombia, colombia).

% carga(Tipo)
carga(general).
carga(refrigerada).
carga(peligrosa).
carga(sobredimensionada).

% requiere(Tipo, Documento)
requiere(peligrosa, numero_un).
requiere(sobredimensionada, permiso).

% embarque(Id, PesoKg, Tipo, Puente)
embarque('EMB-1', 5000, general, comercio_mundial).
embarque('EMB-2', 9000, refrigerada, colombia).
embarque('EMB-3', 12000, peligrosa, comercio_mundial).
embarque('EMB-4', 40000, sobredimensionada, colombia).
embarque('EMB-5', 7000, general, colombia).

% trae(Id, Documento)
trae('EMB-3', numero_un).

% ------------------------------------------------------------ reglas: lo que se deduce
% Un embarque es pesado si pasa de 10000 kg.
pesado(Id) :- embarque(Id, Peso, _, _), Peso > 10000.

% Un embarque esta documentado si su tipo no requiere nada, o si trae lo que requiere.
documentado(Id) :- embarque(Id, _, Tipo, _), \+ requiere(Tipo, _).
documentado(Id) :- embarque(Id, _, Tipo, _), requiere(Tipo, Doc), trae(Id, Doc).

% Dos embarques van juntos si cruzan por el mismo puente.
juntos(A, B) :- embarque(A, _, _, P), embarque(B, _, _, P), A \== B.

% ------------------------------------------------------------ fragmentos (consultas)
% F1  ?- carga(peligrosa).
% F2  ?- carga(granel).
% F3  ?- embarque('EMB-2', Peso, Tipo, Puente).
% F4  ?- embarque(Id, _, _, colombia).            (pide mas respuestas con ;)
% F5  ?- pesado(Id).
% F6  ?- documentado('EMB-4').
% F7  ?- documentado(Id).
% F8  ?- juntos('EMB-1', Otro).
