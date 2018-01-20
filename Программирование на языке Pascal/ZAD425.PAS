program zad425;
uses crt;
var s,t:real;
function g(a,b:real):real;
begin
g:=(sqr(a)+sqr(b))/(sqr(a)+2*a*b+3*sqr(b)+4)
end;
begin
clrscr;
readln(s,t);
writeln((g(1.2,t)+g(t,s)-g(2*s-1,s*t)):0:3);
readkey
end.