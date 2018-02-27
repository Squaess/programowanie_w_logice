left_of(olowek, klepsydra).
left_of(klepsydra, motyl).
left_of(motyl, ryba).

above(rower, olowek).
above(aparat, motyl).
above(konik, rower).

right_of(X, Y) :- left_of(Y, X).
below(X, Y) :- above(Y, X).

rec_left_of(X,Y) :- left_of(X,Y) ; (left_of(X, Z), rec_left_of(Z,Y)).
rec_above(X, Y) :- above(X, Y) ; (above(X, Z), rec_above(Z, Y)).
higher(X, Y) :- rec_above(X,_) > rec_above(Y, _).
