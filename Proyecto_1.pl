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

listaConNumUnDigito([]).
listaConNumUnDigito([L|L1]):-
  number(L),
  L<10,
  L>0,
  listaConNumUnDigito(L1).

tableroValido(T,N):-
  nPorN(T,N),
  append(T,L),
  listaConNumUnDigito(L).

%Izq=3, Der=4, Arr=1 y abajo=2
movsPosibles(X,Y,N,L):-
  (X \= 1, X \= N,LX = [3, 4];
  X = 1, LX = [4];
  X = N, LX = [3]),
  (Y \= 1, Y \= N,LY = [1, 2];
  Y = 1, LY= [2];
  Y = N, LY=[1]),
  append(LX,LY,L).

saltos([T|T1],X,Y,[LMov|LOtrosMov],LSec,LSaltos):-
  descabezaTablero(T,X,Y,ElemPos).
  (LMov = 1,
    [ElemPos|LSec]);
  (LMov = 2);
  (LMov = 3);
  (LMov = 4);

main(T,Sol):-
  tableroValido(T,N),
  X=1, Y=1,
  movsPosibles(X,Y,N,L),
  salto(T,X,Y,L,LSec,LSaltos).
