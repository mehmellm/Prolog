father(david,peter).
father(peter,harold).
father(peter,helen).
father(peter,sherry).
father(harold,christopher).
mother(maude,peter).
mother(martha,harold).
mother(martha,helen).
mother(martha,sherry).
mother(helen,arnold).
mother(sherry,sonya).
male(david).
male(peter).
male(harold).
male(christopher).
male(arnold).
female(maude).
female(martha).
female(helen).
female(sherry).
female(sonya).
citizen_of(peter,unitedstates).


citizen_of(X,Y) :- father(Z,X), citizen_of(Z,Y).
citizen_of(X,Y) :- mother(Z,X), citizen_of(Z,Y).

sibling(X,Y) :- father(Z,X), father(Z,Y), mother(W,X), mother(W,Y), X \== Y.


sister(X,Y) :- female(X), sibling(X,Y).
brother(X,Y) :- male(X), sibling(X,Y).

aunt(X,Y) :- female(X), father(Z,Y), sibling(X,Z).
aunt(X,Y) :- female(X), mother(Z,Y), sibling(X,Z).

uncle(X,Y) :- male(X), father(Z,Y), sibling(X,Z).
uncle(X,Y) :- male(X), mother(Z,Y), sibling(X,Z).
