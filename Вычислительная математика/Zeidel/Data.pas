unit Data;

interface

type mass=array[1..5] of extended;    //столбец
     matrix=array[1..5,1..5] of extended;  //матрица

var
  a,at,alfa,olda:matrix;  //Исходная матрица, матрица alfa
  x,x0,b,b1,beta,oldb:mass;   //Столбец корней уровнения, столбец приближенний, столбец свободныщ членов, стобец для проверки, столбец beta
  n,k:integer;  //Размерность, шаг
  E,normAlfa,normBeta,norma,n1,n2:extended; //Эпсилон, нормы

implementation

end.

