is_prime(2) .

is_prime(X) :- X > 2,
                        for(2,ceiling(sqrt(X)),X).
for(BEG, END, X) :- BEG > END,!.
for(BEG, END, X) :- X mod BEG =\= 0,
                                  for(BEG+1, END, X).

prime(LO, HI, X) :- between(LO, HI, X), is_prime(X).
