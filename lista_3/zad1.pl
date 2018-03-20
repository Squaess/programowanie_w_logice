average(Average, List) :-
                            sum_list(List, Sum),
                            length(List, Count),
                            Average is Sum/Count.


list_sum(List, X) :-
            average(Avg, List),
            list_sum(List, 0, X, Avg).

list_sum([], X, X, _).

list_sum([H|T], RES, X, Avg) :-
              RES1 is RES + (H - Avg)^2,
              list_sum(T, RES1, X, Avg).


wariancja(L, X) :-
        list_sum(L, Suma),
        length(L,Count),
        X is Suma/Count.
