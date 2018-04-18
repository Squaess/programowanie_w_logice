scanner( Strumien, Tokeny ) :-
						czytaj(Strumien, Tokeny).

czytaj(Strumien, X) :-
						get_char(Strumien, C),
                        czytaj_dalej(C, [], X, Strumien).

czytaj_dalej(end_of_file, C, C, _) :-
                        !.

% czytaj dalej bierze pierwszyz nak C1 i decyduje co powinien dokleić
% jeślizaczyna się od WIELKIEJ litery to czytamy aż się skończą i robimy token: id(X)
% jeśli zaczyna się od małej litery to czytamy aż się skończą i sprawdzamy czy jest taki klucz
czytaj_dalej(C1, X, X2, Y) :-
                        biały(C1),
                        !,
                        get_char(Y, C2),
                        czytaj_dalej(C2, X, X2, Y).

czytaj_dalej(C1, X, X2, Y) :-
                    (
                        char_type(C1, upper) ->
                                    czytaj_identyfikator(C1, C2, '' , H, Y), !, makeToken(X, H, L2)
                        ; char_type(C1, lower) ->
                                    czytaj_klucz(C1, C2, '', H, Y), !, key(H), makeToken(X, H, L2)
                        ; isNumber(C1) ->
                                    czytaj_int(C1, C2, '', H, Y), !, makeToken(X, H, L2)
                        ; poczatek_sep(C1) ->
                                    czytaj_separator(C1, C2, "", H, Y), !, makeToken(X, H, L2)
                        ; writeln(C1)
                    ),!,
                    czytaj_dalej(C2, L2, X2, Y).

czytaj_klucz(end_of_file, end_of_file, L, L, _) :-
                        !.

czytaj_klucz(C, C, N, N, _ ) :-
                        biały(C);
                        separator(C);
                        poczatek_sep(C);
                        char_type(C, upper);
                        isNumber(C),
                        !.

czytaj_klucz(C1, C3, N1, N, Y) :-
                        atom_concat(N1, C1, N2),
                        get_char(Y, C2),
                        czytaj_klucz(C2, C3, N2, N, Y).

czytaj_identyfikator(end_of_file, end_of_file, L, L, _) :-
                        !.

czytaj_identyfikator(C, C, N, N, _) :-
                        biały(C);
                        poczatek_sep(C);
                        separator(C);
                        isNumber(C);
                        char_type(C, lower),
                        !.

czytaj_identyfikator(C1, C3, N1, N, Y) :-
                        atom_concat(N1, C1, N2),
                        get_char(Y, C2),
                        czytaj_identyfikator(C2, C3, N2, N, Y).

czytaj_int(end_of_file, end_of_file, L, L, _) :-
                        !.

czytaj_int(C, C, N, N,  _) :-
                    biały(C);
                    poczatek_sep(C);
                    separator(C);
                    char_type(C, lower);
                    char_type(C, upper),
                    !.

czytaj_int(C1, C3, N1, N, Y) :-
                    atom_concat(N1, C1, N2),
                    get_char(Y, C2),
                    czytaj_int(C2, C3, N2, N, Y).


czytaj_separator(C1, C3, N1, N, Y) :-
                    atom_concat(N1, C1, N2),
                    get_char(Y, C2),
                    (
                            poczatek_sep(C2) ->
                                    atom_concat(N2, C2, N),
                                    separator(N),
                                    get_char(Y, C3)
                            ; C3 = C2, N = N2
                    ),
                    !.



%Dodaje token X do listy L i zwraca L2
makeToken(_, end_of_file, _).
makeToken(L, X, L2) :-
					(
								key(X),
								append(L, [key(X)], L2)
					);
		      		(
								separator(X), append( L, [sep(X)], L2)
					);
			    	(
									atom_number(X, N),
									integer(N),
									N >= 0,
									append(L, [int(N)], L2)
				 	);
				 	(
									% atom_chars(X, Chars),
									% check_variable(Chars),
									append(L, [id(X)], L2)
				   ).

% addSeparator(L, X, L2) :-
% 							Y = sep(X),
% 							append( L, [Y], L2).

% check_variable(List) :-
% 							\+ (
% 												member(X, List),
%   											\+ char_type(X, upper)
% 									).



isNumber(X) :-
    atom_number(X, N),
    integer(N),
    N >= 0.

biały(' ').
biały('\t').
biały('\n').

key('read').
key('write').
key('if').
key('then').
key('else').
key('fi').
key('while').
key('do').
key('od').
key('and').
key('or').
key('mod').


separator(';').
separator('+').
separator('-').
separator('*').
separator('/').
separator('(').
separator(')').
separator('<').
separator('>').
separator('=<').
separator('>=').
separator(':=').
separator('=').
separator('/=').

poczatek_sep(';').
poczatek_sep('+').
poczatek_sep('-').
poczatek_sep('*').
poczatek_sep('/').
poczatek_sep('(').
poczatek_sep(')').
poczatek_sep('<').
poczatek_sep('>').
poczatek_sep(':').
poczatek_sep('=').
poczatek_sep('/').
