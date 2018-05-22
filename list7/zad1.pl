
mergelist([],[],[]).

mergelist([X],[],[X]).

mergelist([],[Y],[Y]).

mergelist([X|List1], [Y|List2], [X|List]) :-
        X =< Y,
        !,
        mergelist(List1,[Y|List2],List).

mergelist([X|List1],[Y|List2],[Y|List]) :-
        mergelist([X|List1],List2,List).



merge1(IN1,IN2,OUT) :-
        freeze(IN1,
        freeze(IN2,(
        		IN1 = [H1 | T1],
        		IN2 = [H2 | T2],
        		      (H1 =< H2 ->
                          (
                            OUT = [H1 | NOUT],
        		            merge1(T1,IN2,NOUT)
        		           );
        		           (
                            OUT = [H2|NOUT],
                            merge1(IN1,T2,NOUT)
                           )
                      )
                );
                (
        			IN1 = [H1 | T1],
        	 		OUT = [H1 | NOUT],
                    merge1(T1, IN2, NOUT)
                );
                (
        			IN2 = [H2 | T2],
        	 		OUT = [H2 | NOUT],
        			merge1(IN1, T2, NOUT)
                )
    );
    OUT = []),
    !.
