program zad456;
uses crt;
var n:integer;
z:char;

function fib(nn:integer):integer;
begin
if nn=0 then fib:=0 else
if nn=1 then fib:=1 else
fib:=fib(nn-1)+fib(nn-2);
end;

begin
repeat
write('n=');
readln(n);
until n>=0;
writeln(n,'-й элемент последовательности фибоначи равен ',fib(n));
readkey;
end.