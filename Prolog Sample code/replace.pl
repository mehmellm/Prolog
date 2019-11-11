thelist([a, g, r, b, t, s, f, h, d, e, k]).

replace( [], X, Y, [] ).
replace( [X | Rest1], X, Y, [Y | Rest2]) :- replace(Rest1, X, Y, Rest2).

replace( [Z | Rest1], X, Y, [Z | Rest2]) :- X \== Z,
					replace(Rest1, X, Y, Rest2).


