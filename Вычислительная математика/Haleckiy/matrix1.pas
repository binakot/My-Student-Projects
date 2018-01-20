unit matrix1;
interface

uses math;

type
    mat=array[1..5,1..5] of real;
    mas=array[1..4] of real;

var
   z,e:integer;
   R:mat; b,c:mas;

   procedure MakeT(x:mat;var T1,T2:mat; m:integer);
   procedure Transpos(var x:mat; m:integer);
   function Znak:integer;
   function recombin(var y:mat; r:byte):boolean;
   procedure Determinant(x:mat;var det:real; m:integer);
   procedure Mul(x,y:mat;var c:mat; m:integer);
   procedure MakeOT1(x:mat;var y:mat;m:integer);
   procedure MakeOT2(x:mat;var y:mat;m:integer);
   Function Chack(x,y:mat; m:integer):boolean;
   procedure zero(var x:mat; m:integer);
   procedure Round(var x:mat; m:integer);

implementation

     procedure MakeT(x:mat;var T1,T2:mat; m:integer);
     var k:byte;
     i,j:integer;
     s : real;
     begin
          for i:=1 to m do
          for j:=1 to m do
          begin
               if i=j then T2[i,j]:=1
               else T2[i,j]:=0;
               T1[i,j]:=0
          end;
          for i:=1 to m do
            t1[i,1]:=x[i,1];
          for j:=2 to m do
            T2[1,j]:=x[1,j]/T1[1,1];
          for i:=2 to m do
          for j:=2 to m do
          begin
               s:=0;
               if i>=j then
               begin
                    for k:=1 to i-1 do
                    s:=s+t1[i,k]*t2[k,j];
                    t1[i,j]:=x[i,j]-s
               end else
               begin
                    for k:=1 to i-1 do
                    s:=s+t1[i,k]*t2[k,j];
                    T2[i,j]:=(x[i,j]-s)/t1[i,i];
               end;
          end;
     end;

     procedure Transpos(var x:mat; m:integer);
     var c:real;
     i,j:integer;
     begin
          for i:=1 to m-1 do
          for j:=i+1 to m do
          begin
               c:=x[i,j];
               x[i,j]:=x[j,i];
               x[j,i]:=c;
          end;
     end;

     function recombin(var y:mat; r:byte):boolean;
     var s:real;
     k,v:byte;
     i,j:integer;
     begin
          v:=0;
          for k:=e to r do
          if y[e,k]<>0 then break
          else v:=v+1;
          z:=abs(k-e);
          if v=r then
          begin
               recombin:=true;
               exit;
          end else recombin:=false;
          for i:=e to e do
          for j:=e to r do
          begin
                s:=y[j,e];
                y[j,e]:=y[j,k];
                y[j,k]:=s;
          end;
     end;
     function Znak:integer;
     begin
          if (z mod 2 <>0) then
          znak:=-1 else znak:=1;
     end;

     procedure Determinant(x:mat;var det:real; m:integer);
     var i,j:integer;
     begin
          if det=0 then
          begin
               det:=1;
               e:=1;
          end;
          if x[e,e]=0 then
          if recombin(x,m) then
          begin
                Det:=0;
                exit;
          end;

          b[e]:=x[e,e];
          Det:=znak*b[e]*det;

          for i:=e+1 to m do
          for j:=e+1 to m do
          begin
               x[i,j]:=x[i,j]-(x[i,e]*x[e,j])/x[e,e];
          end;

          if e=m then
          exit
          else begin
               e:=e+1;
               Determinant(x,det,m);
          end;
     end;
     procedure Mul(x,y:mat;var c:mat; m:integer);
     var k:byte;  i,j:integer;
     begin
          zero(c,m);
          for i:=1 to m do
          for j:=1 to m do
          for k:=1 to m do
          c[i,j]:=c[i,j]+x[i,k]*y[k,j];
     end;

     procedure MakeOT1(x:mat;var y:mat; m:integer);
     var k:byte;  i,j:integer;
     s:real;
     begin
          zero(y,m);
          for i:=1 to m do
          for j:=1 to m do
            if i=j then
            y[i,j]:=1/x[i,i] else
            begin
                 s:=0;
                 for k:=j to i-1 do
                  s:=s+x[i,k]*y[k,j];
                 y[i,j]:=-s/x[i,i];
            end;
     end;
     procedure MakeOT2(x:mat;var y:mat;m:integer);
     var k:byte;  i,j:integer;
     s:real;
     begin
          for i:=1 to m do
          for j:=1 to m do
           if i=j then y[i,j]:=1
           else y[i,j]:=0;
          for j:=m downto 2 do
          for i:=j-1 downto 1 do
          begin
               s:=0;
               for k:=j downto i+1 do
                s:=s+x[i,k]*y[k,j];
               y[i,j]:=-s;
          end;
     end;

     Function Chack(x,y:mat; m:integer):boolean;
     var sch,i,j:integer;
     begin
          sch:=0;
          for i:=1 to m do
          for j:=1 to m do
          if x[i,j]<>y[i,j] then break
          else sch:=sch+1;
          if sch=m*m then
          Chack:=true else Chack:=false;
     end;
     procedure zero(var x:mat; m:integer);
     var i,j:integer;
     begin
          for i:=1 to m do
          for j:=1 to m do
          x[i,j]:=0;
     end;
     procedure Round(var x:mat; m:integer);
     var i,j:integer;
     begin
          for i:=1 to m do
          for j:=1 to m do
          x[i,j]:=(trunc(x[i,j]*100))/100;
     end;
end.