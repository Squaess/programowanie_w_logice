average(Average, List) :-
                            sum_list(List, Sum),
                            length(List, Count),
                            Average is Sum/Count.

%list_sum([], 0).
%list_sum([Head | Tail], TotalSum) :-
%                                  list_sum(Tail, Sum1),
%                                  Total = Head + Sum1.
list_sum(List, X) :-
            list_sum(List, 0, X).

list_sum([], X, X).

list_sum([H|T], RES, X) :-
              RES1 is RES + (H - AVG)^2,
              list_sum(T, RES1, X).

%sum(LIST,SUM) :- sum(LIST,0,SUM).
%sum([],SUM,SUM).
%sum([A|LIST],RES,SUM):-sum(A,RES2,SUM), RES1 is RES+RES2,sum(LIST,RES1,SUM).
%sum([H|LIST],RES,SUM):-RES1 is RES+H,sum(LIST,RES1,SUM).
