unit unit866;
interface
   procedure init_graph;
   procedure treugol;
implementation
  uses graph,crt;

  const enable:boolean=false;
        t=0.08;

  procedure init_graph;
   var driver,mode:integer;
   begin
    driver:=detect;
    initgraph(driver,mode,'');
    if graphresult<>grOk then
     writeln('error')
    else
     enable:=true;
   end;


  procedure treugol;
   var p:array[1..4] of pointtype;
         p2:pointtype;
       r,Px,Py,fi:real;
       x0,y0,i:integer;
       k,pause:integer;
   begin
    k:=4;
    pause:=100;
    if enable then begin
     x0:=getmaxx div 2;
     y0:=getmaxy div 2;

     r:=200;
     fi:=pi/2;
     for i:=1 to k do
     begin
      Px:=r*cos(fi);
      Py:=r*sin(fi);
      fi:=fi+(2*pi/3);
      p[i].x:=x0+round(Px);
      p[i].y:=y0-round(Py);
     end;

     drawpoly(k,p);
     readkey;

     repeat
      for i:=1 to k do
      begin
       if i=1 then
       begin
        p2.x:=p[2].x;
        p2.y:=p[2].y;
       end;
       if i<>k then
       begin
        p[i].x:=p[i].x+round((p[i+1].x-p[i].x)*t);
        p[i].y:=p[i].y+round((p[i+1].y-p[i].y)*t);
       end else begin
        p[i].x:=p[i].x+round((p2.x-p[i].x)*t);
        p[i].y:=p[i].y+round((p2.y-p[i].y)*t);
       end;
      end;
      drawpoly(k,p);
      delay(pause);
     until keypressed;
     readkey;
     readkey;
    end;
   end;

begin
end.







