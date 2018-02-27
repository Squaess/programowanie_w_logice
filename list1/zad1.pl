ojciec(adam, wojtek).
ojciec(adam, maria).
ojciec(michal, adam).

matka(karolina, wojtek).
matka(karolina, maria).
matka(ania, karolina).

mezczyzna(adam).
mezczyzna(wojtek).
mezczyzna(michal).

kobieta(karolina).
kobieta(ania).
kobieta(maria).

rodzic(adam, wojtek).
rodzic(karolina, wojtek).
rodzic(adam, maria).
rodzic(karolina, maria).
rodzic(ania, karolina).
rodzic(michal, adam).

jest_matka(X) :- matka(X, Y).
jest_ojcem(X) :- ojciec(X, Y).
jest_synem(X) :- mezczyzna(X).
%% jest_synem(X) :- mezczyzna(X) ,
%%                  rodzic(Y,X).
siostra(X, Y) :- kobieta(X),
              (
                (matka(M,X), matka(M,Y), X \= Y)
                ;
                (ojciec(O, X), ojciec(O, Y), X \= Y)
              ).

dziadek(X, Y) :- mezczyzna(X),
                  ojciec(X,Z),
                  rodzic(Z,Y).

rodzenstwo(X, Y) :- (( matka(M,X), matka(M,Y) ) ;
                    ( ojciec(O,X), ojciec(O,Y) ) ),
                    X \= Y.
