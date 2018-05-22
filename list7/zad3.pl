
filozofowie:-
	thread_create(życie(1),ID1,[]),
	thread_create(życie(2),ID2,[]),
	thread_create(życie(3),ID3,[]),
	thread_create(życie(4),ID4,[]),
	thread_create(życie(5),ID5,[]),
	thread_join(ID1,_),
	thread_join(ID2,_),
	thread_join(ID3,_),
	thread_join(ID4,_),
	thread_join(ID5,_).

życie(ID):-
	myśli(ID),
	(   ID<5->
        Left is ID, Right is ID+1;
        Left is 5, Right is 1
  ),
	napisz(ID,'chce prawy widelec'),
	podnieś_widelec(ID,Right,p),
	napisz(ID,'chce lewy widelec'),
	podnieś_widelec(ID,Left,l),
	je(ID),
	odkłada_widelec(ID,Right,p),
	odkłada_widelec(ID,Left,l),
	życie(ID).

myśli(ID):-
	napisz(ID,"myśli"),
	sleep(ID).

podnieś_widelec(ID,W,K):-
	atom_concat('widelec',W,M),
	mutex_lock(M),
	(   K=p->
        napisz(ID,'podniósł prawy widelec');
        napisz(ID,'podniósł lewy widelec')
  ).

je(ID):-
	napisz(ID,"je"),
	sleep(ID).

odkłada_widelec(ID,W,K):-
	atom_concat('widelec',W,M),
	mutex_unlock(M),
	(   K=p->
        napisz(ID,'odkłada prawy widelec');
        napisz(ID,'odkłada lewy widelec')
  ).

napisz(ID,STRING):-
	mutex_lock(pisanie),
	format('[~w] ~w~n',[ID,STRING]),
	mutex_unlock(pisanie),
  sleep(1).
