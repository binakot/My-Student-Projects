//умножение квадратных матриц матриц порядка n
unit MulMatrixN;

interface

uses data;

procedure mulMatrix(var a:Matrix; b:MAtrix; n:integer);

implementation

procedure mulmatrix(var a:Matrix; b:MAtrix; n:integer);
var i,j,k:integer; res:matrix;
begin
  for i:=1 to n do
  for j:=1 to n do
    res[i,j]:=0;

  for i:=1 to n do
  for j:=1 to n do
  for k:=1 to n do
    res[i,j]:=res[i,j]+(a[i,k]*b[k,j]);

  a:=res;
end;

end.
