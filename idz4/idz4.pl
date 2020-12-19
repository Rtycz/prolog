name1("Tomas","James Tomas").
name1("Tomas","Tomas Gerbert").
name1("Gerbert","Tomas Gerbert").
name1("Gerbert","Gerbert Frensis").
name1("Frensis","Gerbert Frensis").
name1("Frensis","Frensis James").
name1("James","Frensis James").
name1("James","James Tomas").

membera(P,[P|_]):-!.
membera(P,[_|T]):-membera(P,T).

stronger(P1,P2,[P2|T]):-membera(P1,T),!.
stronger(P1,P2,[_|T]):-stronger(P1,P2,T).

insert_evry_position(X, [X|T], T).
insert_evry_position(X, [H|T], [H|S]):-insert_evry_position(X, T, S).

permutationa([], []).
permutationa([H|T], R):- permutationa(T, X), insert_evry_position(H, R, X).

solve(List):-
        permutationa(["James Tomas","Tomas Gerbert","Gerbert Frensis","Frensis James"],List),
        name1("Tomas", Tomas),
        name1("Gerbert",Gerbert),
        stronger(Gerbert, Tomas, List),

        name1("Frensis", Frensis),
        stronger(Frensis,Gerbert,List),

        name1("Gerbert", Gerbert_2),
        name1("James", James),
        stronger(James,Gerbert_2,List),

        name1("Frensis", Frensis_2),
        Frensis \= Frensis_2,
        Gerbert \= Gerbert_2,
        stronger(Gerbert_2, Frensis_2, List).
