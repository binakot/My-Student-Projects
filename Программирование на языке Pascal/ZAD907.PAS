program zad907;
uses crt,graph;
label l1;
var driver,mode,error:integer;
x,y,r:integer; c:char;
begin
clrscr;
driver:=detect;
initgraph(driver,mode,'');
error:=graphResult;
if error<>grOk then
begin
writeln('error')
end
else
begin
x:=100;
y:=100;
r:=20;
l1:
cleardevice;
circle(x,y,r);
c:=readkey;
case c of
#72: y:=y-20;
#80: y:=y+20;
#77: x:=x+20;
#75: x:=x-20;
#13: halt;
#60: r:=r-5;
#62: r:=r+5
end;
goto l1
end;
readkey
end.
