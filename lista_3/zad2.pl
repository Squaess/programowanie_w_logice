max(M, X, X) :-
    X > M.
max(M, X, M) :-
    X =< M.

max_sum([],0).
max_sum(L, S) :-
    max_sum(L,0,0,S).

max_sum([],_,S,S).
max_sum([H|T], ML, MT, S) :-
    P is ML+H,
    max(H,P,ML1),
    max(MT,ML1,MT1),
    max_sum(T,ML1,MT1,S).
