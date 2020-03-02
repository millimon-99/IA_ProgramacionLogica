tablero([[1,4,5,8],[7,4,1,9],[2,5,6,5],[9,8,3,5]]).
tablero2([[1,4,5],[7,4,1],[2,5,6]]).

main(T,ListaNums):-
  %tableroValido(T,N),!,
  length(T,N),
  buscaOrigen(T,ListaNums,X,Y),
  buscarCadena(T,ListaNums,X,Y,N,Cad),
  escribeResp(X,Y,Cad),
  fail.
  
buscarCadena(T,[X|ListaNums],X,Y,N,Cad):-
  salto(T,ListaNums,X,Y,N,Cad).

salto(_,[],_,_,_,[]).

salto(T,[Num|ListaNums],X,Y,N,['oeste'|Cad]):-
  Xo is X-1,
  Xo>0,
  buscarNum(T,Num,Xo,Y),
  salto(T,ListaNums,Xo,Y,N,Cad).

salto(T,[Num|ListaNums],X,Y,N,['este'|Cad]):-
  Xo is X+1,
  Xo=<N,
  buscarNum(T,Num,Xo,Y),
  salto(T,ListaNums,Xo,Y,N,Cad).

salto(T,[Num|ListaNums],X,Y,N,['norte'|Cad]):-
  Yo is Y-1,
  Yo>0,
  buscarNum(T,Num,X,Yo),
  salto(T,ListaNums,X,Yo,N,Cad).

salto(T,[Num|ListaNums],X,Y,N,['sur'|Cad]):-
  Yo is Y+1,
  Yo=<N,
  buscarNum(T,Num,X,Yo),
  salto(T,ListaNums,X,Yo,N,Cad).


escribeResp(X,Y,Cad):-
  write('Punto de origen: '),
  write(X),write(','),write(Y),nl,
  write('Saltos: '),
  write(Cad),nl.

coordenadaValida(X,Y,N):-
  X>0, X<N, Y>0, Y>N.

buscaOrigen(Tablero,[Num|_],X,Y):-
  buscarNum(Tablero,Num,X,Y).

buscarNum([],_,_,_):-false.
buscarNum([Fila|Cola],Num,X,Y):-
  buscarFila(Fila,Num,X,Y);
  buscarNum(Cola,Num,X,Y2),
  Y is Y2+1.

buscarFila([],_,_):-false.
buscarFila([Num|_],Num,1,1).
buscarFila([N|Cola],Num,X,Y):-
  buscarFila(Cola,Num,X2,Y),
  X is X2+1.

tamanoR([],1).
tamanoR([_|Z],N):-
  tamanoR(Z,N1), N is N1+1.

tamanoC([],0).
tamanoC([_|Z],N):-
  tamanoC(Z,N1), N is N1+1.

nPorN([T|T1],NumCol):-
  tamanoR(T1,NumRow),
  tamanoC(T,NumCol1),
  NumRow==NumCol1,
siguientesCol(T1,NumRow,NumCol).

siguientesCol([],N,N).
siguientesCol([T|T1],NumRow,NumCol):-
  tamanoC(T,NumCol1),
  NumRow==NumCol1,
  siguientesCol(T1,NumRow,NumCol).

listaDigitos([]).
listaDigitos([L|L1]):-
  number(L),
  L<10,
  L>0,
  listaDigitos(L1).

tableroValido(T,N):-
  nPorN(T,N),
  append(T,L),
  listaDigitos(L).
