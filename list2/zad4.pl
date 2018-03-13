ma(ewa, zegarek).
%ma(ewa, buty).
ma(tomek, bulka).
ma(sylwia, telefon).

daje(1, ewa, zegarek, tomek).
daje(5, tomek, bulka, sylwia).
daje(3, tomek, zegarek, sylwia).
daje(11, sylwia, zegarek, ewa).


% ktoś ma i dokópki nie oddał lub wcale nie oddał
ma(Kiedy, Kto, Co) :-
  (
    ma(Kto, Co),
    daje(K, Kto, Co, _),
    X is K-1,
    between(0, X, Kiedy)
  )
  ;
  (
    ma(Kto, Co),
    \+ daje(_, Kto, Co, _),
    between(0, inf, Kiedy)
  ).


ma(Kiedy, Kto, Co) :- (
                        daje(Time, Ktos, Co, Kto),
                        Ktos \= Kto,
                        daje(K, Kto, Co, _),
                        X is K-1,
                        between(Time, X, Kiedy)
                      ) ;
                      (
                        daje(Time, Ktos, Co, Kto),
                        Ktos \= Kto,

                        \+ (
                            daje(Time1, Kto, Co, _),
                            Time1 >= Time
                            ),
                        between(Time, inf, Kiedy)
                      ).
