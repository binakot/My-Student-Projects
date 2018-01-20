program zad694m;
uses crt;
type mas=array[1..10,1..10] of integer;
var a:mas; i,j,n:integer;

procedure Matrix(var n:integer);
begin
for i:=1 to n do
for j:=1 to n do
a[i,j]:=j;

for i:=n downto 1 do
for j:=n downto 1 do
if i<>1 then
if j<>1 then
a[i,j]:=a[i,j-i+1];

for i:=1 to n do
for j:=1 to n do
a[j,i]:=a[i,j];

for i:=1 to n do
for j:=1 to n do
if j=n then writeln(a[i,j]) else write(a[i,j],' ');
end;

begin
clrscr;
readln(n);
matrix(n);
repeat until keypressed;
end.