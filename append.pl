nums( [3,6,7,1,5,9,8,4,2] ).
lets( [h,d,g,f,s,k,l,j,a]).

myappend( [], L, L).
myappend([X|L1], L2, [X|L3]) :- myappend( L1, L2, L3).
