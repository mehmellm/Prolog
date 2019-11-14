queens(N,Queen_places) :- range(1,N,N_list),
			my_permutation(N_list,Queen_places),
			safe(Queen_places),
			print_board(Queen_places,N),nl.


print_board(X,Y) :- nl,print_boardn(X,Y).
print_boardn([X|Xs],N) :- board2(N) , nl, write(' '), board(X,N,0), write('|'), nl, print_boardn(Xs,N).
print_boardn([],N) :- board2(N).

board(X,N,Y):- X > 1,Y =:= 0, X1 is X - 1, N1 is N - 1, write('|   '), board(X1,N1,Y).
board(X,N,Y):- X =:= 1, Y < 1,N > 0, N1 is N - 1 ,write('| Q '), board1(N1,1).
board1(N,Y):- Y > 0, N > 0, N1 is N - 1, write('|   '), board1(N1,Y).
board1(0,1).
board2(N):- write('- - '),N > 0, N1 is N - 1, board2(N1).
board2(0).



my_permutation(Xs,[Z|Zs]) :- myselect(Z,Xs,Ys), my_permutation(Ys,Zs).
my_permutation([],[]).

myselect(X,[X|Xs],Xs).
myselect(X,[Y|Ys],[Y|Zs]) :- myselect(X,Ys,Zs).

range(M,N,[M|Ns]) :- M < N, M1 is M + 1, range(M1,N,Ns).
range(N,N,[N]).


safe([Lf | Lr]) :- \+(attacked(Lf, Lr)), safe(Lr).
safe([]).

attacked(X, Xr) :- attack(X,1,Xr).
attack(X, N, [Z|Zr]) :- (X =:= Z + N ; X =:= Z - N).
attack(X, N, [Z|Zr]) :- N1 = N + 1, attack(X, N1, Zr). 
