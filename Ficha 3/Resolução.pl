:-consult('c:/CARLOS/PROLOG/SWI/bc_grafo.pl').
% adaptar caminho acima

% 1b) Primeiro em Profundidade

dfs(Orig,Dest,Cam):- 
	dfs2(Orig,Dest,[Orig],Cam).

%condicao final: nodo actual = destino
dfs2(Dest,Dest,LA,Cam):-
	%caminho actual esta invertido
	reverse(LA,Cam).

dfs2(Act,Dest,LA,Cam):-
	%testar ligacao entre ponto 	
	%actual e um qualquer X
	liga(Act,X),
	
	%testar nao circularidade p/ nao 
	%visitar nodos ja visitados
	\+ member(X,LA),
	%chamada recursiva	
	dfs2(X,Dest,[X|LA],Cam).

% 1 d)

all_dfs(Orig,Dest,LCam):-findall(Cam,dfs(Orig,Dest,Cam),LCam).


% 1 e)

better_dfs(Orig,Dest,Cam):-all_dfs(Orig,Dest,LCam), shortlist(LCam,Cam,_).


shortlist([L],L,N):-!,length(L,N).
shortlist([L|LL],Lm,Nm):-shortlist(LL,Lm1,Nm1),
				length(L,NL),
			((NL<Nm1,!,Lm=L,Nm is NL);(Lm=Lm1,Nm is Nm1)).



% Primeiro em Profundidade com n veis de corte
 

dfscl(Orig,Dest,Cam,N):- 
	dfscl2(Orig,Dest,[Orig],Cam,N).

%condicao final: nodo actual = destino
dfscl2(Dest,Dest,LA,Cam,_):-
	%caminho actual esta invertido
	reverse(LA,Cam).

dfscl2(Act,Dest,LA,Cam,N):- N>0,
	%testar ligacao entre ponto 	%actual e um qualquer X
	liga(Act,X),	
	%testar nao circularidade p/ nao 
	%visitar nodos ja visitados
	\+ member(X,LA),N1 is N-1,
	%chamada recursiva	
	dfscl2(X,Dest,[X|LA],Cam,N1).


%Primeiro em Largura


bfs(Orig,Dest,Cam):-bfs2(Dest,[[Orig]],Cam).

%condicao final: destino = n    cabe a do caminho actual
bfs2(Dest,[[Dest|T]|_],Cam):-	
	%caminho actual est  invertido	
	reverse([Dest|T],Cam).	

bfs2(Dest,[LA|Outros],Cam):-	
	LA=[Act|_],		
	%calcular todos os n s adjacentes nao visitados e	
	%gerar um caminho novo c/ cada n  e caminho actual 	
	findall([X|LA],
		(Dest\==Act,liga(Act,X),\+ member(X,LA)),
		Novos),	
	%novos caminhos s o colocados no final da lista 
	%p/ posterior exploracao	
	append(Outros,Novos,Todos),		
	%chamada recursiva	
	bfs2(Dest,Todos,Cam).