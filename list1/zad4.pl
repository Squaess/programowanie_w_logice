
le(a, a).
le(b, b).
le(c, c).
%le(d, d).
%le(e, e).

le(a, b).
%le(d, b).
le(b, c).
%le(b, e).

/* przykladowy czesciowy porzadek*/
/*                 c   e
 *                   \ /
 *                    b
 *	                 / \
 *	               a    d
 */

minimalny(X) :- le(X,X), \+ (le(Y, X), Y \= X).
najmniejszy(X) :- minimalny(X), \+ (le(Y,Y), Y \= X, minimalny(Y)).
maksymalny(X) :- le(X,X), \+ (le(X, Y), X \= Y).
najwiekszy(X) :- maksymalny(X), \+ (le(Y, Y), maksymalny(Y), X \= Y).
