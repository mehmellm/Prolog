sumList([], 0).
sumList([First|Rest],TheSum) :- sumList(Rest, RestSum), TheSum is RestSum + First.

listlength([], 0).
listlength([First|Rest], Length) :- listlength(Rest, NewLength), Length is NewLength + 1.

average([], 0).
average(List, Average) :- sumList(List,X), listlength(List, Y), Average is X / Y. 

adjacent(X,Y, [X,Y|Rest]).
adjacent(X,Y, [Y,X|Rest]).
adjacent(X,Y, [First|Rest]) :- adjacent(X,Y, Rest).
