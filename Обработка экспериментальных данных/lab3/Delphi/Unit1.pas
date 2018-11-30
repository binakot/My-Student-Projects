unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  vector = array [0..100] of real;

var
  x, y, c : vector;
  x0, x9, h, x1, p, p1, p2, e : real;
  n, i : integer;

implementation

{$R *.dfm}

function f(x:real):real;
begin
  f := sin(x);
end;

procedure Input (var n:integer; var x,y:vector);
var i:integer;
begin
 x0 := 1; // Левая граница построения сплайна
 x9 := 20; // Правая граница построения сплайна
 h := 1; // Шаг по оси X
 n := round((x9-x0)/h+1);
 x[0] := x0;
 y[0] := f(x0);
 for i:=1 to n do
   begin
     x[i]:=x[i-1]+h;
     y[i]:=f(x[i]);
   end;
end;

procedure Coeff(n:integer; var x,f,c:vector);
var i,j,m:integer;
    a,b,r:real;
    k:vector;
begin
  k[1]:=0;
  c[1]:=0;
  for i:=2 to n do
    begin
      j:=i-1;
      m:=j-1;
      a:=x[i]-x[j];
      b:=x[j]-x[m];
      r:=2*(a+b)-b*c[j];
      c[i]:=a/r;
      k[i]:=(3.0*((f[i]-f[j])/a-(f[j]-f[m])/b)-b*k[j])/r;
    end;
  c[n]:=k[n];
  for i:=n-1 downto 2 do
    c[i]:=k[i]-c[i]*c[i+1];
end;

procedure Spl (n:integer; var x,f,c:vector; x1:real; var p,p1,p2:real);
var i,j:integer;
    a,b,d,q,r:real;
begin
  i:=1;
  while (x1>x[i]) and (i<>n) do
    i:=i+1;
  j:=i-1;
  a:=f[j];
  b:=x[j];
  q:=x[i]-b;
  r:=x1-b;
  p:=c[i];
  d:=c[i+1];
  b:=(f[i]-a)/q - (d+2*p)*q/3.0;
  d:=(d-p)/q*r;
  p1:=b+r*(2*p+d);
  p2:=2*(p+d);
  p:=a+r*(b+r*(p+d/3.0))
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Input (n,x,y);
  Coeff (n,x,y,c);
  for i := 10 to 200 do
  begin
    Chart1.Series[0].AddXY(i*0.1,sin(i*0.1));
  end;   
  for i := 0 to n do
  begin
    Spl (n,x,y,c,x[i],p,p1,p2);
    e:=abs(y[i]-p)/abs(y[i]);
    Chart1.Series[1].AddXY(x[i],p);
  end;
end;
  
end.
