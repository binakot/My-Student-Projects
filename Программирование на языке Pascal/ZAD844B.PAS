uses crt,graph;
var driver,mode,error:integer;
x,y,i,x0,y0:integer;
begin
clrscr;
driver:=detect;
initgraph(driver,mode,'');
error:=graphresult;
if error<>grok then
begin
textcolor(red);
writeln('error')
end
else
  begin
    cleardevice;
     line(0,240,639,240);
     line(639,240,625,243);
     line(639,240,625,237);
     line(320,0,320,479);
     line(320,0,317,14);
     line(320,0,323,14);
      x0:=320;
      y0:=240;
      i:=20;
 for x:=-320 to 320 do
  begin
   y:=round(-6*sqr(x/i)+3*(x/i));
   putpixel(x0+x,y0-y,2)
  end;
 readln;
 closegraph;
 end
end.