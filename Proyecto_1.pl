%Si el tablero es nxn con números entre 0 y 9
tableroValido(Tablero).
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
  
