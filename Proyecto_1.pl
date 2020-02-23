%Si el tablero es nxn con números entre 0 y 9
tamanoR([],1).
tamanoR([_|Z],N):-
  tamanoR(Z,N1), N is N1+1.
tamanoC([],0).
tamanoC([_|Z],N):-
  tamanoC(Z,N1), N is N1+1.
listaConNumUnDigito([]).
listaConNumUnDigito([L|L1]):-
  L/10==0,listaConNumUnDigito(L1).
tableroValido([],0).
tableroValido([T|T1],NumRow,NumCol):-
  tamanoR(T1,NumRow),
  tamanoC(T,NumCol),
  NumCol==NumRow,
  tableroValido(T1,NumRow2,NumCol).

%Si en ListaMov y ListaNums tienen todas las soluciones
%de Tablero, partiedn de la fila X, columna Y y de n saltos
saltosEnPosicion(Tablero,X,Y,ListaMov,ListaNums).
%Si ListaMov y ListaNums son una solución valida para Tablero
salto(Tablero,ListaMov,ListaNums).
%Si se obtiene todos las posibles secuencias de números y
%movimientos desde Tablero para todas las posiciones
%sin repeticiones
saltosTablero(Tablero,ListaMov,ListaNums).
% +extra
solucion(Saltos,X,Y,Movimientos):-
