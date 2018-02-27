on(b1, b2).
on(b2, b3).
on(b3, b4).
on(b4, b5).
on(b6, b7).
on(b7, b8).

above(X, Y) :- on(X,Y) ; (on(X, Z), above(Z,Y)).
