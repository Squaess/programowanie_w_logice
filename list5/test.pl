zdarzenie(1505, ['Euklides', przetlumaczony, na, lacine]).
zdarzenie(1410, [bitwa, pod, 'Warna']).

zaczynamy1(Zdarzenie) :- read(Data), zdarzenie(Data, Zdarzenie).

spacje(0) :- !.
spacje(N) :- write(' '), N1 is N -1, spacje(N1).


pp( [ H | T ] ,  I ) :-
            ! ,
             J is I+3,
            pp(H,  J ) ,
            ppx(T,  J ) .
pp(X,  I ) :-
            tab( I ) ,
            write(X) ,
            nl.
ppx( [ ] ,  _) .
ppx( [H | T] ,  I ) :-
            pp(H,  I ) ,
            ppx(T,  I ) .
