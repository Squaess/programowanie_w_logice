:-consult('zad1.pl').

split(IN,OUT1,OUT2):-split(IN,OUT1,OUT2,1).
split(IN,OUT1,OUT2,1):-
	freeze(IN,(
		  IN=[]->OUT1=[],OUT2=[];
		  IN=[H|T],OUT1=[H|NOUT1],split(T,NOUT1,OUT2,2))).
split(IN,OUT1,OUT2,2):-
	freeze(IN,(
		   IN=[]->OUT1=[],OUT2=[];
		   IN=[H|T],OUT2=[H|NOUT2],split(T,OUT1,NOUT2,2))).

merge_sort(In,Out):-freeze(In, merge_sort2(In,Out)).

merge_sort2([],[]).
merge_sort2([H|T],Out):-freeze(T,
			       (T=[])->(Out=[H]);
			       (split([H|T],Out1,Out2),
				merge_sort(Out1,Out11),
				merge_sort(Out2,Out22),
merge(Out11,Out22,Out))).
