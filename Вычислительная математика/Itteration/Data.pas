unit Data;

interface

type mass=array[0..5] of real;    //столбец
     matrix=array[0..5,0..5] of real;  //матрица

var
  a,a1,alfa,d,q,e:matrix;  //Исходная матрица, матрица alfa
  x,x0,b,b1,beta:mass;   //Столбец корней уровнения, столбец приближенний, столбец свободныщ членов, стобец для проверки, столбец beta
  n,k:integer;  //Размерность, шаг
  Eps,normAlfa,normAlfa2,normBeta,norma:real; //Эпсилон, нормы

implementation

end.

