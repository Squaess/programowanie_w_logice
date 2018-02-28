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
rec_right_of(X, Y) :- rec_left_of(Y,X).
rec_below(X,Y) :- rec_above(Y, X).

higher(X, Y) :- rec_above(X, Y);
                        (
                          (
                            rec_left_of(X, Z);
                            rec_right_of(X, Z)
                          ),
                            rec_above(Z, Y)
                          );
                          (
                            (
                               rec_left_of(Y, W);
                               rec_right_of(Y, W)
                            ),
                               rec_below(W, X)
                          ).
                          /**
                          (
                              rec_above(X,Z1),
                              (
                                  rec_left_of(Z1,Z2);
                                  rec_right_of(Z1, Z2);
                              )
                          )
*/
