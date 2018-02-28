le(a, a).
le(b, b).
le(c, c).
le(d, d).
le(e, e).

le(a, b).
le(a, e).
le(a, c).

le(d, b).
le(d, c).
le(d, e).

le(b, c).
le(b, e).

/* przykladowy czesciowy porzadek*/
/*                 c   e
 *                   \ /
 *                    b
 *	                 / \
 *	               a    d
 */
 in_relation(X) :- le(X,_); le(_,X).
 zwrotny :- \+ ( in_relation(X), \+ le(X,X) ).
przechodni :- \+ (
                        in_relation(X),
                        in_relation(Y),
                        in_relation(Z),
                        X \= Y, Y \= Z, X \= Z,
                        le(X,Y), le(Y,Z), \+ le(X,Z)).

slabo_antysymetryczny :- \+ (in_relation(X), in_relation(Y),
                                                    le(X,Y), le(Y,X), X \= Y).
czesciowy_porzadek :- zwrotny, przechodni, slabo_antysymetryczny.
