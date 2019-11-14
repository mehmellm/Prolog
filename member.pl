nums( [3,6,7,1,5,9,8,4,2] ).
lets( [h,d,g,f,s,k,l,j,a]).


mymember(X, [X|_]).
mymember(X, [_|Rest]) :- mymember(X, Rest).


