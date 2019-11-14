%Lucas Mehmel

:- dynamic(fib/2).

fib(X,Y) :- X1 is X - 1, X2 is X - 2, fib(X1,Y1), fib(X2,Y2), Y is Y1 + Y2,
	asserta(fib(X,Y)).

saveit :- open('fibData',write, Stream), savehelp(Stream,1), close(Stream).
savehelp(Str,X) :- retract(fib(X,Y)), !, write(Str,X), 
			write(Str, .),nl(Str), write(Str,Y),
			write(Str, .), nl(Str), X1 is X + 1, savehelp(Str, X1).
		


readit :- open('fibData',read,Stream),readhelp(Stream), close(Stream).
readhelp(Stream) :- \+ at_end_of_stream(Stream),!,
			read(Stream,X),read(Stream,Y), asserta(fib(X,Y)),
			 readhelp(Stream).

