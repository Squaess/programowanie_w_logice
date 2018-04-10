


czytaj(Strumien, X) :-
          get_char(Strumien, C),
          czytaj_dalej(C, [],  X, Strumien).

  czytaj_dalej(end_of_file, L, L, _) :-
          !.

czytaj_dalej(C, L, X, Y) :-
          biały(C),
          !,
          get_char(Y, C2),
          czytaj_dalej(C2, L, X, Y).

czytaj_dalej(C, L, X, Y) :-
            czytaj_slowo(C1, '', H, Y),
            czytaj_dalej()
