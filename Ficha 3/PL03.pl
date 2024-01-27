% PL03

% Exercício a
liga(a,c).
liga(c,g).

liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

% Exercício b
cam(O, D, R):-
    cam(O, D, [O], R).

cam(O, O, _, [O]).

cam(O, D, V, [O|R]):-
    liga(O, X),
    \+ member(X, V),
    cam(X, D, [X|V], R).

% Exercício d
todos_cam(O, D, T):-
    findall(R, cam(O, D, R), T).

% Exercício e
menor_cam([M], M).

menor_cam([X|Y], M):-
    menor_cam(Y, M),
    length(X, XL),
    length(M, ML),
    ML < XL.

menor_cam([X|_], X).

todos_cam_menor(O, D, M):-
    findall(R, cam(O, D, R), T),
    menor_cam(T, M).


% Testes
absoluto([], [], []).
absoluto([X|L1], [Y|L2], [Z|L3]):-
    ((X > Y,!, Z is X - Y); Z is Y - X),
    absoluto(L1, L2, L3).

ordem_lista(X1, X2, [X1, X2 | _]).

ordem_lista(X1, X2, [_|L]):-
    ordem_lista(X1, X2, L).

b(X, [H|T], C):-b1(X, T, C, H).

b1(X, [Y|L], C, H):- 
    X > H,
    H1 is Y + H,
    b1(X, L, C, H1).

b1(_, _, C, C).