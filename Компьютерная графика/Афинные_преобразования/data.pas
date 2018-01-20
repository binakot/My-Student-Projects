unit data;

interface

uses math;

procedure madeRx(var fi:real);
procedure madeRy(var fi:real);
procedure madeRz(var fi:real);

type matrix = array[1..4,1..4] of real;
var Rx,Ry,Rz:matrix;

implementation

procedure madeRx(var fi:real);
begin
  Rx[1,1]:=1;
  Rx[1,2]:=0;
  Rx[1,3]:=0;
  Rx[1,4]:=0;
  Rx[2,1]:=0;
  Rx[2,2]:=cos(fi);
  Rx[2,3]:=sin(fi);
  Rx[2,4]:=0;
  Rx[3,1]:=0;
  Rx[3,2]:=-sin(fi);
  Rx[3,3]:=cos(fi);
  Rx[3,4]:=0;
  Rx[4,1]:=0;
  Rx[4,2]:=0;
  Rx[4,3]:=0;
  Rx[4,4]:=1;
end;

procedure madeRy(var fi:real);
begin
  Ry[1,1]:=cos(fi);
  Ry[1,2]:=0;
  Ry[1,3]:=-sin(fi);
  Ry[1,4]:=0;
  Ry[2,1]:=0;
  Ry[2,2]:=1;
  Ry[2,3]:=0;
  Ry[2,4]:=1;
  Ry[3,1]:=sin(fi);
  Ry[3,2]:=0;
  Ry[3,3]:=cos(fi);
  Ry[3,4]:=0;
  Ry[4,1]:=0;
  Ry[4,2]:=0;
  Ry[4,3]:=0;
  Ry[4,4]:=1;
end;

procedure madeRz(var fi:real);
begin
  Rz[1,1]:=cos(fi);
  Rz[1,2]:=sin(fi);
  Rz[1,3]:=0;
  Rz[1,4]:=0;
  Rz[2,1]:=-sin(fi);
  Rz[2,2]:=cos(fi);
  Rz[2,3]:=0;
  Rz[2,4]:=0;
  Rz[3,1]:=0;
  Rz[3,2]:=0;
  Rz[3,3]:=1;
  Rz[3,4]:=0;
  Rz[4,1]:=0;
  Rz[4,2]:=0;
  Rz[4,3]:=0;
  Rz[4,4]:=1;
end;

end.
