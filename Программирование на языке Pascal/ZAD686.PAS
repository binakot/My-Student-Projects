program zad686;
uses crt;
var n:integer; a:array[1..100,1..100] of integer;

procedure Matrix;
var i,j:integer;
begin
for i:=1 to 2*n do
for j:=1 to 2*n do
if (i<=n)and(j<=n) then a[i,j]:=1 else
if (i<=n)and(j>n) then a[i,j]:=2 else
if (i>n)and(j<=n) then a[i,j]:=3 else
a[i,j]:=4
end;

procedure Output;
var i,j:integer;
begin
for i:=1 to 2*n do
for j:=1 to 2*n do
if j=2*n then writeln(' ',a[i,j]) else write(' ',a[i,j])
end;
begin
clrscr;
write('n=');readln(n);
Matrix;
output;
readkey
end.