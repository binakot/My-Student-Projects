program zad129k;
uses crt,graph;
var driver,mode,error:integer;
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
circle(320,180,40);
circle(300,170,5);
circle(340,170,5);
ellipse(320,300,0,360,40,80);
line(320,170,290,100);
line(290,100,275,100);
line(320,170,350,100);
line(350,100,365,100);
line(300,370,300,400);
line(280,400,300,400);
line(340,370,340,400);
line(360,400,340,400);
line(340,250,400,230);
line(300,250,240,230);
line(340,250,350,280);
line(300,250,290,280);
line(290,280,240,230);
line(350,280,400,230);
repeat until keypressed;
end.