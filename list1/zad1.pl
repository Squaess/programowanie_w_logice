ojciec(adam, wojtek).
ojciec(adam, maria).

matka(karolina, wojtek).
matka(karolina, maria).
matka(ania, karolina).

mezczyzna(adam).
mezczyzna(wojtek).

kobieta(karolina).
kobieta(ania).
kobieta(maria).

rodzic(adam, wojtek).
rodzic(karolina, wojtek).
rodzic(adam, maria).
rodzic(karolina, maria).
rodzic(ania, karolina).

jest_matka(X) :- matka(X, Y).
jest_ojcem(X) :- ojciec(X, Y).
jest_synem(X) :- mezczyzna(X).
siostra(X, Y) :- kobieta(X),
              (
                (matka(M,X), matka(M,Y), X \= Y) 
                ;
                (ojciec(O, X), ojciec(O, Y), X \= Y)
              ).
