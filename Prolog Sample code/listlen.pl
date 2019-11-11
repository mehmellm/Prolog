thelist([a, g, r, b, t, s, f, h, d, e, k]).

listlen([], 0).
listlen([X | Rest], N) :- listlen(Rest, RL),
				N is RL + 1.
