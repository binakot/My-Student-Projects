program zad474;
uses crt;
var n,b1,b2,b3,b4,b5,b51,b52,i,fact:integer;
g:text;
begin
clrscr;
assign(g,'C:\g.txt');
write('n=');readln(n);
b1:=n;

b2:=sqr(n);

b3:=1;
for i:=1 to n do
b3:=b3*n;

b4:=1;
for i:=1 to n+1 do
b4:=b4*2;

b51:=1; b52:=1;
for i:=1 to n do
b51:=b51*2;
for i:=1 to n+1 do
b52:=b52*3;
b5:=b51+b52;

rewrite(g);
write(g,b1,' ',b2,' ',b3,' ',b4,' ',b5);
close(g);
end.


