jednokrotnie(X, L) :- select(X, L, L1),
               \+ member(X, L1).


dwukrotnie(X, L) :- select(X, L, L1),
		 			jednokrotnie(X, L1).


% sprawdzamy czy pomiędzy dwoma jest parzysta liczba elementów
spelnia(X) :- \+ (
                   member(M, X),
                   append(_, [M| L4], X),
                   append(L5, [M | _], L4),
                   length(L5, D),
                   \+ (0 is D mod 2), !
                   ).




make_list(0, L, L) :- !.
make_list(MAX, List, Return) :- MAX > 0,
                NEXT is MAX-1,
                make_list(NEXT, [MAX|List], Return).

% mamy zapewnione że będzie
%parzysta liczba elementów i że będą każde 2 i tlyko 2
lista(N, X) :- make_list(N, [], Pierwsza_polowa),
               make_list(N, [], Droga_polowa),
               append(Pierwsza_polowa, Droga_polowa, Lista),
               permutation(Lista, X),
               spelnia(X).
