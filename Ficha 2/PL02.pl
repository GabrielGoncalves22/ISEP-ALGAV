% PL02

% Exercício 1
% Alínea A
soma_lista([], 0, 0):-!.

soma_lista([H|T], S, C):-
    soma_lista(T, S1, C1),
    S is H + S1,
    C is C1 + 1.

calc_media(L, M):-
    soma_lista(L, S, C),
    C > 0,
    M is S / C.

% Alínea B
menor([X], X).

menor([X|Y], M):-
    menor(Y, M),
    X > M.

menor([X|_], X).

% Alínea C
contar_pares_impares([], 0, 0):-!.

contar_pares_impares([H|T], P, I):-
    contar_pares_impares(T, P1, I1),
    (H mod 2 =:= 0, P is P1 + 1, I is I1;
     H mod 2 =\= 0, I is I1 + 1, P is P1).

% Alínea D
% FALTA FAZER

% Exercício 2
concatena([], L, L).

concatena([A|B], C, [A|D]):-concatena(B, C, D).

% Exercício 3
inverte(L, LI):-inverte1(L, [], LI).

inverte1([], L, L).

inverte1([X|L], L2, L3):- inverte1(L, [X|L2], L3).

% Exercício 4
apaga(_, [ ], [ ]).

apaga(X, [X|L], M):- !, apaga(X, L, M).

apaga(X, [Y|L], [Y|M]):- apaga(X, L, M).

% Exercício 6
insere(X, 1, L, [X|L]).

insere(X, P, [H|T], [H|R]) :-
    P > 1,
    P1 is P - 1,
    insere(X, P1, T, R).

% Exercício 7
membro(X, [X|_]).

membro(X, [_|L]):- membro(X, L).

uniao([ ], L, L).

uniao([X|L1], L2, LU):- 
    membro(X, L2),
    !,
    uniao(L1, L2, LU).

uniao([X|L1], L2, [X|LU]):-uniao(L1, L2, LU).

% Exercício 8
interseccao([ ], _, [ ]).

interseccao([X|L1], L2, [X|LI]):-
    membro(X, L2),
    !,
    interseccao(L1, L2, LI).

interseccao([_|L1], L2, LI):- interseccao(L1, L2, LI).

% Exercício 10
meu_flatten([], []).

meu_flatten([X|Y], L):-
    is_list(X),
    concatena(X, Y, Z),
    meu_flatten(Z, L).

meu_flatten([X|Y], [X|L]):-
    meu_flatten(Y, L).

% Exercício 11
combinacao(0, _, []):-!.

combinacao(N, [X|Y], [X|L]):-
    N1 is N - 1,
    combinacao(N1, Y, L).

combinacao(N, [_|Y], L):-
    combinacao(N, Y, L).

% Exercício 12
permutacao([], []).

permutacao(L, [X|L1]):-
    membro(X, L),
    delete(L, X, LR),
    permutacao(LR, L1).