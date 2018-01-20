program zad674;
uses crt;
var a:array[1..10] of integer;
b:array[1..100,1..100] of integer;
n,k:integer;

procedure readA10;
begin
randomize;
for k:=1 to 10 do
begin
write('a[',k,']=');
readln(a[k])
end
end;

procedure readmatrix;
var i,j:integer;
begin
for i:=1 to n do
for j:=1 to n do
b[i,j]:=random(30)
end;

procedure Zamena0;
var i,j:integer;
begin
for I:=1 to n do
for j:=1 to n do
for k:=1 to 10 do
if (i+j) mod 2=0 then
if a[k]=b[i,j] then
b[i,j]:=0
end;

procedure Output;
var i,j:integer;
begin
for i:=1 to n do
for j:=1 to n do
if j=n then writeln(b[i,j]) else write(' ',b[i,j]);
end;

begin
clrscr;
reada10;
write('n=');readln(n);
readmatrix;
Zamena0;
output;
readkey
end.