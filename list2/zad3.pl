arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiagalny(X, X).

osiagalny(X, Y) :- sciezka(X,Y,[X]),
                  X \= Y.

sciezka(X, Y, _) :- arc(X, Y).
sciezka(X, Y, O) :-
       arc(X,Z),
       \+member(Z, O),
       sciezka(Z,Y, [X|O]).
