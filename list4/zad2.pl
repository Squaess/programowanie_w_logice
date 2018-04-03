nalewo( X, Y, L) :-
  append( _, [X, Y| _], L).

obok(X, Y, L) :-
  nalewo(X, Y, L);
  nalewo(Y, X, L).

srodkowy([X], X).

% Obcinamy pierwszy i ostatni element
srodkowy(L, X)  :- append([_|L1], [_], L),
                    srodkowy(L1, X).

rybki(Kto) :-
    length(Domy, 5),
    Domy = [[_, nor, _, _, _] | _],
    srodkowy(Domy, SR), SR = [_, _, _, mleko, _],
    member([czer, angl, _, _, _], Domy),
    nalewo([ziel, _, _, _, _], [bialy, _, _, _, _], Domy),
    member([_, dun, _, herbata, _], Domy),
    obok([_, _, _, _, light],[_, _, kot, _, _], Domy),
    member([zol, _, _, _, cygaro], Domy),
    member([_, niemiec, _, _, fajka], Domy),
    obok([_, _, _, _, light], [_, _, _, woda, _],Domy),
    member([_, _, ptaki, _, bez_filtra], Domy),
    member([_, swe, psy, _, _], Domy),
    obok([_, nor, _, _, _], [nieb, _, _, _, _], Domy),
    obok([_, _, konie, _, _], [zol, _, _, _, _], Domy),
    member([_, _, _, piwo, mentol], Domy),
    member([ziel, _, _, kawa, _], Domy),
    member([_, Kto, rybki, _, _], Domy).
