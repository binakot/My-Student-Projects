program zad963;
uses crt,graph;
var driver,mode,error,x1,y1,x2,y2,i:integer;

procedure test(var x,y:integer);
begin
line(x,y,x+40,y);
line(x+20,y,x+20,y+60);

line(x+50,y,x+50,y+60);
line(x+50,y,x+70,y);
line(x+50,y+30,x+70,y+30);
line(x+50,y+60,x+70,y+60);

line(x+80,y,x+100,y);
line(x+80,y,x+80,y+60);
line(x+80,y+60,x+100,y+60);

line(x+110,y,x+150,y);
line(x+130,y,x+130,y+60);
end;

begin
clrscr;
driver:=detect;
initgraph(driver,mode,'');
error:=graphresult;
if error<>grok then
begin
textcolor(red);
writeln('Error')
end
else
begin
x1:=0; y1:=240;
x2:=520; y2:=240;
for i:=1 to 320 do
if x1=x2 then break else begin
delay(1000);
cleardevice;
x1:=x1+1;
x2:=x2-1;
test(x1,y1);
test(x2,y2)
end
end;
repeat until keypressed;
end.