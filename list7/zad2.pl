% split(L, L1, L2) :-
%     length(L, N),
%     split(L, L1, L2, N).
%
% split([],[],[], 0).
%
% split([X|L], [X|L1], L2, LEN) :-
%         0 is LEN mod 2,
%         !,
%         LEN2 is LEN -1,
%         split(L,L1,L2, LEN2).
%
% split([X|L], L1, [X|L2], LEN) :-
%         LEN2 is LEN -1,
%         split(L,L1, L2, LEN2).

split([], [], []).
split([X], [X], []).% freeze(X, true),!.
split([X, Y | IN], [X | OUT1], [Y | OUT2]) :- freeze(X, freeze(Y, (split(IN, OUT1, OUT2), !))).

split(X, OUT1, OUT2) :-
        freeze( X, (
        
        )).
