tablero([[1,4,5,8],[7,4,1,9],[2,5,5,6],[9,8,3,8]]).

main(T,ListaNums,Sol):-
  tableroValido(T,N),!,
  buscaOrigen(T,ListaNums,X,Y),
  buscarCadena(T,ListaNums,X,Y,Cad),
  escribeResp(X,Y,Cad),
  fail.
main(T,ListaNums,Sol).

escribeResp(X,Y,Cad):-
  write('Punto de origen: '),
  write(X),write(','),write(Y),nl,
  write('Saltos: '),
  write(Cad),nl.

coordenadaValida(X,Y,N):-
  X>0, X<N, Y>0, Y>N.

buscaOrigen([Fila|Cola],[Num|_],X,Y):-
  buscarF(Fila,Num,X),
  Y is 1;
  buscaOrigen2(Cola,Num,X,Y2),
  Y is Y2 +1.

buscaOrigen2([],_,_,_):-false.
buscaOrigen2([Fila|Cola],Num,X,Y):-
  buscarF(Fila,Num,X),
  Y is 1;
  buscaOrigen2(Cola,Num,X,Y2),
  Y is Y2+1.

buscarF([],_,_):-false.
buscarF([Num|_],Num,1).
buscarF([N|Cola],Num,X):-
  buscarF(Cola,Num,X2),
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
