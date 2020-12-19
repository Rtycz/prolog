read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([[H,N]|T]):-write_str(H),write('?'),write(N),nl,write_list_str(T).

read_list_str(List):-read_str(A,N,Flag), read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,N,Flag), append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

addsortList(List, N, X):- addsortList(List, N, [], X).
addsortList([],N,Left,X):- append(Left,[N], X).
addsortList([[Str,D]|T],[Str2,D2],Left,X ):- D>D2, append(Left,[[Str2,D2]],Left1), append(Left1,[[Str,D]|T], X).
addsortList([H|T],N,Left,X):-  append(Left,[H],Left1), addsortList(T,N,Left1,X).

sortList(List,X):- sortList(List,[],X).
sortList([], Sort,Sort).
sortList([H|T], Sort,X):- addsortList(Sort,H,Sort1), sortList(T,Sort1,X).

colsogl(Str,N):-Sogl=[98, 99, 100, 103, 104, 106, 107, 108, 109, 110, 112, 113, 114, 115, 116, 118, 119, 120, 121, 122, 102],
                colsogl(Sogl,Str,0,0,N).
colsogl(_,[],I,O,N):-O > 0,N is I / O; O is N.
colsogl(Sogl,[H|T],I,O,N):-in_list(Sogl,H), I1 is I+1,O1 is O + 1, colsogl(Sogl,T,I1,O1,N),!.
colsogl(Sogl,[H|T],I,O,N):-O1 is O + 1, colsogl(Sogl,T,I,O1,N),!.

getspisdlinstr(List,X):- getspisdlinstr(List,[],X).
getspisdlinstr([],X,X).
getspisdlinstr([H|T],Spis,X):-colsogl(H,N), getspisdlinstr(T,[[H,N]|Spis],X),!.


pr:-	see('D:/!Windows/4 Course/Prolog/idz3.txt'),read_list_str(List),seen,
		tell('D:/!Windows/4 Course/Prolog/out3.txt'),getspisdlinstr(List,X),sortList(X,SortX),write_list_str(SortX),told.
