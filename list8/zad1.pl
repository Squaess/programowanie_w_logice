:- use_module(library(sgml)).

ex1(Term) :-
	load_html('index.html', Term, []).

:- use_module(library(xpath)).

ex2(TR) :-
	ex1(DOM),
	xpath(DOM, //tr, TR).

ex3(TD) :-
	ex2(TR),
	xpath(TR, td, TD).

ex4(HREF) :-
	ex1(DOM),
	xpath(DOM, //a(@href), HREF).

:- use_module(library(pwp)).

ex5 :-
		pwp_files('hello_in.html', 'hello_out.html').

ex6 :-
		pwp_files('table_in.html', 'table_out.html').

ex7 :-
		pwp_files('emails_in.html', 'emails_out.html').

:- use_module(library(sgml)).

task1(PLIK, LISTA) :-
	load_html(PLIK, LISTA, []).

task4(PLIK, HREF) :-
	task1(PLIK, DOM),
	xpath(DOM, //a(@href), HREF).

moje(PLIK, ARGS) :-
		task4(PLIK, HREF),
		parse_url(HREF, [A, B, C]),
		B =.. [_ | [ARGS]],
		C =.. [ _| [PATH]],
		writeln(HREF),
		writeln(A),
		writeln(B),
		writeln(C),
		writeln(' '),
		PATH \= '/index.html',
		PATH \= '/index.php'.

moje0(PLIK, LIST) :-
	setof(ARGS , moje(PLIK, ARGS), LIST).
