
skladnik( X * Y) --> czynnik(X), [sep(*)], skladnik(Y).
skladnik(X mod Y) --> czynnik(X), [sep(mod)], skladnik(Y).
skladnik(X / Y) --> czynnik(X), [sep(/)], skladnik(Y).
skladnik(X) --> czynnik(X).

czynnik(id(X)) --> [id(X)].
czynnik(int(X)) --> [int(X)].
czynnik(X) --> [sep('(')], wyrazenie(X), [sep(')')].


wyrazenie( X + Y) --> skladnik(X), [sep(+)], wyrazenie(Y).
wyrazenie( X - Y) --> skladnik(X), [sep(-)], wyrazenie(Y).
wyrazenie(X) --> skladnik(X).

instrukcja(assign(X , Y)) --> [id(X), sep(:=)], wyrazenie(Y).
instrukcja(read(X)) --> [key(read), id(X)].
instrukcja(write(X)) --> [key(write)], wyrazenie(X).
instrukcja(while(WAR, PROG)) --> [key(while)], warunek(WAR), [key(do)], program(PROG), [key(od)]. %% dlacze nie może być ostatnie
intrukcja(if(WAR, PROG1, PROG2)) --> [key(if)], warunek(WAR), key(then), program(PROG1), [key(else)], program(PROG2).
intrukcja(if(WAR, PROG)) --> [key(if)], warunek(WAR), [key(then)], program(PROG), [key(fi)].

program([X | Y]) --> instrukcja(X), [sep(;)], program(Y).
program([]) --> [].

warunek(X ; Y) --> koniunkcja(X), [key(or)], warunek(Y).
warunek(X) --> koniunkcja(X).

koniunkcja(X ',' Y) --> prosty(X), [key(and)], koniunkcja(Y).
koniunkcja(X) --> prosty(X).

prosty(X =:= Y) --> wyrazenie(X), [sep(=)], wyrazenie(Y).
prosty(X =\= Y) --> wyrazenie(X), [sep(/=)], wyrazenie(Y).
prosty(X < Y) --> wyrazenie(X), [sep(<)], wyrazenie(Y).
prosty(X > Y) --> wyrazenie(X), [sep(>)], wyrazenie(Y).
prosty(X >= Y) --> wyrazenie(X), [sep(>=)], wyrazenie(Y).
prosty(X =< Y) --> wyrazenie(X), [sep(=<)], wyrazenie(Y).
prosty(X) --> [sep('(')], warunek(X), [sep(')')].
