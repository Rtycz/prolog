/*�������� �� �������� ���� ������� �� true ���� ���, �� false*/
pr(N):-N<2, fail.
pr(2):-!.
pr(N):-pr(N,2).
pr(N,N):-!.
pr(N,I):- OST is N mod I, OST>0, I1 is I+1, pr(N,I1).
/*     ��������� �������� */
assign(List,List):-!.

solve(Elem,X):-solve(Elem,X,[],2).
solve(1,X,X,_):-!.
solve(Elem,X,X2,A):-Elem+1>A, pr(A), Ost is Elem mod A,Elem1 is Elem div A, Ost is 0, append(X,A,X2),solve(Elem1, X,X2, A),!.
solve(Elem,X,X2,A):- A1 is A + 1, solve(Elem, X,X2, A1).

f(N,L) :-
    N > 1, !,
    between(2,N,Candidate),
    Rest is N mod Candidate,
    (Rest == 0 ->
         Next is N div Candidate,
         L = [Candidate|L1],
         f(Next,L1),!).

f(1,[]).

cout([H|T]) :- write(H), write(' '), cout(T).

solve(X) :- f(X,L),cout(L). 






