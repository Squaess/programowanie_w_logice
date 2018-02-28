left_of(olowek, klepsydra).
left_of(klepsydra, motyl).
left_of(motyl, ryba).
left_of(aparat, rower).

above(rower, olowek).
above(aparat, motyl).
above(konik, rower).

right_of(X, Y) :- left_of(Y, X).
below(X, Y) :- above(Y, X).

rec_left_of(X,Y) :- left_of(X,Y) ; (left_of(X, Z), rec_left_of(Z,Y)).
rec_above(X, Y) :- above(X, Y) ; (above(X, Z), rec_above(Z, Y)).
rec_right_of(X, Y) :- rec_left_of(Y,X).
rec_below(X,Y) :- rec_above(Y, X).



higher(X, Y) :- rec_above(X, Y);
                        (
                          (
                             rec_above(X, Z),
                             (
                                rec_left_of(Z, Y);
                                rec_right_of(Z, Y)
                            )
                          )
                        ).
