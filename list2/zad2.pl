% jeśli wyciągniemy X to nie może już go być w tej liście
jednokrotnie(X, L) :- select(X, L, L1),
                \+ member(X, L1).


dwukrotnie(X, L) :- select(X, L, L1),
		 			jednokrotnie(X, L1).
