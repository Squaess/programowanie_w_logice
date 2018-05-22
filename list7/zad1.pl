
merge(IN1,IN2,OUT):-
	freeze(IN1,freeze(IN2,merge2(IN1,IN2,OUT))).

merge2([],IN2,IN2):-!.
merge2(IN1,[],IN1):-!.
merge2(IN1,IN2,OUT):-
	IN1=[H1|T1],
	IN2=[H2|T2],
	(   H1=<H2->
        OUT=[H1|NOUT],
        merge(T1,IN2,NOUT);
      OUT=[H2|NOUT],merge(IN1,T2,NOUT)
	).
