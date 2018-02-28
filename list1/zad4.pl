
le(a, a).
le(b, b).
le(c, c).
le(d, d).
%le(e, e).

le(a, b).
le(a, c).
%le(a, e).

le(d, b).
le(d, c).
%le(d, e).

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
najmniejszy(X) :- minimalny(X), \+ ( minimalny(Y), Y \= X).
maksymalny(X) :- le(X,X), \+ (le(X, Y), X \= Y).
najwiekszy(X) :- maksymalny(X), \+ ( maksymalny(Y), X \= Y).
