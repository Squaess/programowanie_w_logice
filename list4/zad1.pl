dodawanie(A, B, X) :-
      X = A + B.
odejmowanie(A, B, X) :-
      X = A - B.
mnozenie(A, B, X) :-
      X = A * B.
dzielenie(A, B, X) :-
      \+(
          ( 0 is B);
          ( 0.0 is B)
        ) -> X = A / B .

split(L, L1, L2) :-
        append(L1, L2, L),
	      L1 = [_ | _],
		  	L2 = [_ | _].

wyrazenie(Numbers, R, X) :-
        loop(Numbers, R, X),
 				R is X.

loop([X], _, X).

loop(L, R, X) :-
              split(L, L1, L2), !,
		    			loop(L1, R, Y),
		    			loop(L2, R, Z),
		   				(
						 	      dodawanie(Y, Z, X);
                    odejmowanie(Y, Z, X);
                    mnozenie(Y, Z, X);
                    dzielenie(Y, Z, X)
		   				).
