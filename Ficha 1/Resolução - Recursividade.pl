% Ficha n 1 ALGAV


% Quest o 4a

potencia(_,0,1):-!.
potencia(B,N,P):- N<0,!,N1 is N+1,potencia(B,N1,P1),P is P1/B.
potencia(B,N,P):-N1 is N-1,potencia(B,N1,P1), P is P1*B.


% Quest o 4b

fatorial(0,1):-!.
fatorial(N,F):-N1 is N-1, fatorial(N1,F1), F is N*F1.

% Quest o 4c

somatorio(K,K,K):-!.
somatorio(J,K,S):-J1 is J+1, somatorio(J1,K,S1), S is S1+J.

% Quest o 4d

divisao(Dividendo,Divisor,0):-Dividendo<Divisor,!.
divisao(Dividendo,Divisor,D):-Dividendo1 is Dividendo-Divisor,divisao(Dividendo1,Divisor,D1),D is D1+1.

resto(Dividendo,Divisor,Dividendo):-Dividendo<Divisor,!.
resto(Dividendo,Divisor,R):-Dividendo1 is Dividendo-Divisor,resto(Dividendo1,Divisor,R).