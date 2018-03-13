srodkowy([X], X).

% Obzcinamy pierwszy i ostatni element
srodkowy(L, X)  :- append([_|L1], [_], L),
                    srodkowy(L1, X).
