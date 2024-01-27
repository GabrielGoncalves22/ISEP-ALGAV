% Ficha 2


%Problema 1 - alinea a 
media([],0):-!.
media(L,M):-contasoma(L,C,S), M is S/C.

contasoma([],0,0).
contasoma([X|L],C,S):- contasoma(L,C1,S1), C is C1+1, S is S1+X.

%Problema 1 - alinea b
menor([X],X):-!.
menor([X|L],M):- menor(L,M1), ((X<M1,!,M is X) ; M is M1).

%Problema 1 - alinea c
contaPI([],0,0).
contaPI([X|L],P,I):- contaPI(L,P1,I1), R is X mod 2, ((R==0,!,P is P1+1,I is I1);(I is I1+1,P is P1)).

%Problema 1 - alinea d
menorFrenteLista([],[]):-!.
menorFrenteLista(L,[M|L1]):- menor(L,M), apaga1(M,L,L1).

apaga1(X,[X|L],L).
apaga1(X,[Y|L],[Y|L1]):-apaga1(X,L,L1).


%Problema 5
substitui(_,_,[],[]).
substitui(X,Y,[X|L],[Y|L1]):- !, substitui(X,Y,L,L1).
substitui(X,Y,[Z|L],[Z|L1]):- substitui(X,Y,L,L1).

%Problema 6
insere(X,1,L,[X|L]):-!.
insere(X,N,[Y|L],[Y|L1]):- N1 is N-1,insere(X,N1,L,L1).

%Problema 9
diferenca(L1,L2,LD):-diferenca1(L1,L2,LD1),diferenca1(L2,L1,LD2),append(LD1,LD2,LD).

diferenca1([],_,[]).
diferenca1([X|L1],L2,LD):-member(X,L2),!,diferenca1(L1,L2,LD).
diferenca1([X|L1],L2,[X|LD]):-diferenca1(L1,L2,LD).

%Problema 10
flatten([],[]).
flatten([[H|T]|L], LF):- !, append([H|T],L,L1), flatten(L1,LF).
flatten([X|L],[X|LF]):- flatten(L,LF).

%Problema 11
combinacao(0,_,[]):-!.
combinacao(N,[X|L],[X|T]):-N1 is N-1, combinacao(N1,L,T).
combinacao(N,[_|L],T):- combinacao(N,L,T).

%Problema 12
permutacao([],[]).
permutacao(L,[X|L1]):-apaga1(X,L,Li),permutacao(Li,L1).