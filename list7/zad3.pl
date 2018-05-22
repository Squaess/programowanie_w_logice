[zad1].
[zad2].
%
% merge_sort([EL1], EL1).
%
%
% merge_sort(IN, OUT) :-
%     split(IN, L1, L2),
%     writeln(L1),
%     writeln(L2),
%     merge_sort(L1, OUT1),
%     merge_sort(L2, OUT2),
%     mergelist(OUT1, OUT2, OUT).

    mergesort([],[]).
    mergesort([X], [X]).
            %freeze(X, true).

    mergesort(IN, OUT):-
            freeze(IN, (split(IN, Left, Right),
    	    mergesort(Left, Sorted1),
    		mergesort(Right, Sorted2),
            merge1(Sorted1, Sorted2, OUT))),!.
