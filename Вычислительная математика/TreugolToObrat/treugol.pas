//разложения на нижнюю и верхнюю треугольные матрицы

unit treugol;

interface

uses data;

procedure maketreugol(a:matrix; n:integer; var t,r:matrix);

implementation

procedure maketreugol(a:matrix; n:integer; var t,r:matrix);
var i,j,k,m:integer; t1,r1:matrix; sum:real;
begin

//установка значений матриц t и r
for i:=1 to n do
for j:=1 to n do
  begin
    t1[i,j]:=0;
    r1[i,j]:=0
  end;

//заполнение матрицы t,r
for m:=1 to n do
  begin
    for i:=m to n do
      begin
        sum:=0;
        for k:=1  to m-1 do
          sum:=sum+t1[i,k]*r1[k,m];
        t1[i,m]:=a[i,m]-sum;
      end;
    for j:=m+1 to n do
      begin
        sum:=0;
        for k:=1 to m-1 do
          sum:=sum+t1[m,k]*r1[k,j];
        r1[m,j]:=(A[m,j]-sum)/t1[m,m];
     end;
  end;

//заполнение диагонали матрицы U
for i:=1 to n do
  r1[i,i]:=1;

t:=t1; r:=r1;

end;

end. 

