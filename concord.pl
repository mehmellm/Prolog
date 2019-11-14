%Lucas Mehmel
%CSC351L Lab5


:- dynamic(line_number/1).

 concord :- print('Enter the file name '),
		read(Filename),
		see(Filename),
		reset_all,
		repeat,
		read_in(Text),
		process(Text),
		peek_code(-1),
		seen,
		my_word_list(The_words),
		print_the_words(The_words).

reset_all :- set_line_number,
		remove_appears,
		remove_my_word_list,
		asserta(my_word_list([])).

set_line_number :- line_number(X), retract(line_number(X)), set_line_number.
set_line_number :- asserta(line_number(0)).

remove_appears :- retract(appears(_,_,_)), remove_appears.
remove_appears.

remove_my_word_list :- retract(my_word_list(_)), remove_my_word_list.
remove_my_word_list.

%Added by Lucas Mehmel

process([]).
process([First|Rest]) :- phelp(First), process(Rest).

%PHELP -------------------------------------------
%if word exists in wordList retracts
%it and increases count, then assertz it
phelp(First) :- line_number(X), retract(appears(First,X,Y)), !, Y1 is Y + 1, 
		Rule =.. [appears,First,X,Y1], assertz(Rule).

%if word not in wordList, take line #, create the rule, then asserta it, and add the word to the wordList
phelp(First) :- line_number(X), Rule =.. [appears,First,X,1], assertz(Rule),
		retract(my_word_list(N)), addw(First,N,Y), 
		Rule1 =.. [my_word_list,Y], asserta(Rule1).

%ADDW -------------------------------------------
%this is used to compare words and place them alphabetically in the wordList
addw(Text, [], [Text]) :- !.
addw(Text, [Text|Rest], [Text|Rest]) :- !.
addw(Text, [First|Rest], [Text,First|Rest]) :- aless(Text,First),!.
addw(Text, [First|Rest], [First|Rest1]) :- addw(Text,Rest,Rest1).

%PRINT ------------------------------------------
%This prints the wordList
print_the_words([]).
print_the_words([First|Rest]) :- nl, write(First), write(' '),
			write2(First), print_the_words(Rest).

%WRITE -------------------------------------------
%this helps print_the_words that prints the word and prints the line number aswell as the parentheses for 
%same word in the list multiple times and adds a comma for a word that is in multiple lines
write2(First) :- retract(appears(First,X,Y)), !,
		 write(X), write3(Y), write4(First).
write4(First) :- retract(appears(First,X,Y)), !,
		 write(','), write(' '), write(X), write3(Y),
		 write4(First).
write4(First).

write3(1).
write3(Y) :- write('('),write(Y), write(')').
% ----------------------------------------------
%Done with added code
/* need another process rule here */

/* code included from clocksin and mellish page 58 */
 aless(X,Y) :- name(X,L), name(Y,M), alessx(L,M).
 alessx([],[_|_]).
 alessx([X|_],[Y|_]) :- X < Y.
 alessx([P|Q],[R|S]) :- P = R, alessx(Q,S).
/* end include */

/* read in a sentence */
	/* ignore punctuation */
 read_in(X) :- peek_code(C),
		punct_char(C),
		get0(_),
		read_in(X).

	/* at the end of line ? */
 read_in([]) :- peek_code(10),
		get0(_),
		retract(line_number(X)), 
		X1 is X + 1, 
		asserta(line_number(X1)), 
		!.

	/* not punctuation or end of line */
 read_in([W|Ws]) :- read_token(W),
		read_in(Ws), !.

/* punctuation characters */
punct_char(33).	/* ! */
punct_char(34).	/* " */
punct_char(40).	/* ( */
punct_char(41).	/* ) */
punct_char(44).	/* , */
punct_char(46).	/* . */
punct_char(58).	/* : */
punct_char(59).	/* ; */
punct_char(63).	/* ? */


