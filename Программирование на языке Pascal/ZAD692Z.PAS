program zad692z;
uses crt;
type mas=array[1..10,1..10] of integer;
var a:mas; i,j,n,max:integer;

procedure matrix(var n:integer);
begin
for i:=1 to n do
for j:=1 to n do
a[i,j]:=random(100)
end;

procedure maxIn(var a:mas; var n:integer);
begin
matrix(n);
max:=a[1,n];
for i:=1 to n do
for j:=1 to n do
begin
if i<=j then
 if i+j>n then
   if a[i,j]>max then max:=a[i,j];
end;
writeln('Max=',max)
end;

begin
clrscr;
randomize;
write('n=');readln(n);
MaxIn(a,n);
repeat until keypressed;
end.