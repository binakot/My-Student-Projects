//нахождение обратной матрицы
unit ObratMatrix;

interface

uses data;

procedure obrM(var a:Matrix;n:integer);

implementation

//нахождение обратной матрицы
procedure obrM(var a:Matrix;n:integer);
var i,j,k:integer; l,e,u:matrix; sum:real;
begin

l:=a;

for i:=1 to n do
for j:=1 to n do
  begin
    if i=j then
      e[i,j]:=1
    else
      e[i,j]:=0;
    u[i,j]:=0
  end;

for i:=1 to n do begin
for j:=1 to n do begin
  sum:=0;
  if i=1 then
  for k:=2 to n do sum:=sum+l[i,k]*u[k,j] else
    begin
      for k:=1 to i-1 do sum:=sum+l[i,k]*u[k,j];
      for k:=i+1 to n do sum:=sum+l[i,k]*u[k,j];
   end;
   u[i,j]:=(e[i,j]-sum)/l[i,i];
   u[i,i]:=e[i,i]/l[i,i];
end;
end;

//присваиваем значение начальной матрице
for i:=1 to n do
for j:=1 to n do
  a[i,j]:=u[j,i];

end;


end.
