/* concatenate two terms */

concat(T1, T2, Result) :- 
				
				append(T1,T2,NewList),
				sort(NewList),
				Result =:= NewList.


