% Jueves 12 de noviembre - Aritmetica, listas y recursion
% Cargalo en SWISH o con  swipl fragmentos/jueves.pl  y consulta cada fragmento.

% ------------------------------------------------------------ aritmetica: = no es is
% F1  ?- X = 3 + 4.
% F2  ?- X is 3 + 4.
% F3  ?- 7 is 3 + 4.
% F4  ?- X is (790000 * 5 + 50) // 100.

% Un porcentaje redondeado al centavo, mitades hacia arriba.
pct(Monto, P, R) :- R is (Monto * P + 50) // 100.

% F5  ?- pct(790000, 5, D).
% F6  ?- pct(792500, 18, R).

% ------------------------------------------------------------ listas: cabeza y cola
% F7  ?- [C | R] = [1200, 800, 950].
% F8  ?- [_, Segundo | _] = [1200, 800, 950].

% ------------------------------------------------------------ recursion: caso base y paso
% largo(Lista, N): cuantos elementos tiene.
largo([], 0).
largo([_ | R], N) :- largo(R, N0), N is N0 + 1.

% suma(Lista, S): la suma de sus numeros.
suma([], 0).
suma([X | R], S) :- suma(R, S0), S is S0 + X.

% F9   ?- largo([1200, 800, 950], N).
% F10  ?- suma([1200, 800, 950], S).

% pesados(Lista, Umbral, Pesados): los embarques (Id-Peso) que pasan del umbral.
pesados([], _, []).
pesados([Id-P | R], U, [Id-P | Ps]) :- P > U, !, pesados(R, U, Ps).
pesados([_ | R], U, Ps) :- pesados(R, U, Ps).

% F11  ?- pesados(['EMB-1'-5000, 'EMB-3'-12000, 'EMB-4'-40000], 10000, P).

% ------------------------------------------------------------ findall: todas las respuestas en una lista
embarque('EMB-1', 5000, comercio_mundial).
embarque('EMB-2', 9000, colombia).
embarque('EMB-4', 40000, colombia).

% F12  ?- findall(Id, embarque(Id, _, colombia), Ids).
% F13  ?- findall(P, embarque(_, P, _), Pesos), suma(Pesos, Total).
