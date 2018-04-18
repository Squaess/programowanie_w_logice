scanner( Strumien, Tokeny ) :-
						czytaj(Strumien, Tokeny).

czytaj(Strumien, X) :-
						get_char(Strumien, C),
						czytaj_dalej(C, [],  X, Strumien).

czytaj_dalej(end_of_file, L, L, _) :-
						!.

% Dla uproszczenia Strumien = Y
czytaj_dalej(C1, X,  X2, Y)  :-
						biały(C1),
						!,
						get_char(Y, C2),
						czytaj_dalej(C2, X,  X2,  Y).

czytaj_dalej(C1, L,  X,  Y) :-
						czytaj_slowo(C1, C2, '', H, Y),
						!,
						%check_word(L, H, L2),
						%addToken(L, H, L2), 		% musimy jeszcze sprawdzic czy nie ma
																	% srednika na koncu oraz czy slowo nie ma separatorów bez spacji
						czytaj_dalej(C2, L2, X, Y).


czytaj_slowo(end_of_file, end_of_file, N, N, _) :-
						!.


czytaj_slowo(C, C, N, N, _) :-
						biały(C),
						!.

czytaj_slowo(C1, C3, N1, N, Y) :-
						atom_concat(N1, C1, N2),
						get_char(Y, C2),
						czytaj_slowo(C2, C3, N2, N, Y).

biały(' ').
biały('\t').
biały('\n').

check_word(L, X, L2) :-
						writeln(X),
						atom_chars(X, Atoms),
						select(SEP, Atoms, Atoms2),
						separator(SEP),
						append(L3, L4, Atoms2),
						spelnia(L3),
						!,
						atom_chars(T, L4),
						check_word(L, T, L5),
						append(L3, L5, L2).

spelnia(L1) :-
				atom_chars(X, L1),
				(
					key(X);
					(
							atom_number(X, N),
							integer(N),
							N >= 0
					);
					check_variable(L1)
				).

addToken(L, X, L2) :-
						!,
						atom_chars(X, Atoms), %rozbijamy na char
						last(Atoms, Last), %sprawdzenie czy ostatni to srednik
						Last = ';' ->							%jesli tak
											(
														select(Last, Atoms, Command),
														!,
														atom_chars(T, Command ), %trzeba ponownie zlozyc w "slowo"
														makeToken(L, T, L3),
														%addSeparator(L3, Last, L2)
                                                        append(L3, [sep(Last)], L2)
											);
											makeToken(L, X, L2).

%Dodaje token do listy L
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
									atom_chars(X, Chars),
									check_variable(Chars),
									append(L, [id(X)], L2)
				   ).


% Dodaj do L odpowiedni klucz/separator/.... i oddaj w L2
/*
addKey(L, X, L2) :-
							Y = key(X),
							append(L, [Y], L2).*/

addSeparator(L, X, L2) :-
							Y = sep(X),
							append( L, [Y], L2).
                            /*
addInt(L, X, L2) :-
							Y = int(X),
							append(L, [Y], L2).
addId(L, X, L2) :-
							Y = id(X),
							append(L, [Y], L2).
*/
check_variable(List) :-
							\+ (
												member(X, List),
  											\+ char_type(X, upper)
									).


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
