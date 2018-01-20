unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function getpix(x: Integer; y: Integer): tcolor;
    procedure putpix(x: Integer; y: Integer);
    procedure zalzat(x,y: integer);
    procedure OnStrZal(x,y: integer);
    procedure push(x: Integer; y: Integer; var i: Integer);
    procedure pop(var x: Integer; var y: Integer; var i: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CurCol: tcolor;
  mas: array [1..1000000] of integer;
  x,y: array [1..100] of integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 image1.Canvas.Rectangle(10,10,200,200);
 image1.Canvas.Rectangle(30,30,180,180);
 image1.Canvas.Ellipse(10,220,240,360);
 image1.Canvas.Ellipse(30,240,220,340);
 image1.Canvas.MoveTo(300,10);
 image1.Canvas.LineTo(600,50);
 image1.Canvas.LineTo(550,130);
 image1.Canvas.LineTo(620,350);
 image1.Canvas.LineTo(350,200);
 image1.Canvas.LineTo(350,100);
 image1.Canvas.LineTo(300,10);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CurCol:=getpix(x,y);
  if button=mbleft then ZalZat(x,y)
  else OnStrZal(x,y);
end;

procedure TForm1.putpix(x: Integer; y: Integer);
begin
 image1.Canvas.Pixels[x,y]:=clGreen;
end;

function TForm1.getpix(x: Integer; y: Integer): tcolor;
begin
 getpix:=getpixel(image1.Canvas.Handle,x,y);
end;

procedure TForm1.zalzat(x,y: integer);
var
 i: integer;
begin
 i:=0;
 push(x,y,i);
 while i<>0 do
   begin
     pop(x,y,i);
     putpix(x,y);
     if (getpix(x+1,y)=curcol) and (getpix(x+1,y)<>clGreen) then push(x+1,y,i);
     if (getpix(x-1,y)=curcol) and (getpix(x-1,y)<>clGreen) then push(x-1,y,i);
     if (getpix(x,y+1)=curcol) and (getpix(x,y+1)<>clGreen) then push(x,y+1,i);
     if (getpix(x,y-1)=curcol) and (getpix(x,y-1)<>clGreen) then push(x,y-1,i);
  end;
end;

procedure TForm1.OnStrZal(x,y: integer);
var
 x0,y0: integer;
begin
 x0:=x;
 y0:=y;
 putpix(x0,y0);
 while (getpix(x0-1,y0)=curcol) and (getpix(x0-1,y0)<>clGreen) do
   begin
     dec(x0);
     putpix(x0,y0);
     if (getpix(x0,y-1)=curcol) and (getpix(x0,y-1)<>clGreen) then OnStrZal(x0,y-1);
     if (getpix(x0,y+1)=curcol) and (getpix(x0,y+1)<>clGreen) then OnStrZal(x0,y+1);
   end;
 x0:=x;
 y0:=y;
 while (getpix(x0+1,y0)=curcol) and (getpix(x0+1,y0)<>clGreen) do
   begin
     inc(x0);
     putpix(x0,y0);
     if (getpix(x0,y-1)=curcol) and (getpix(x0,y-1)<>clGreen) then OnStrZal(x0,y-1);
     if (getpix(x0,y+1)=curcol) and (getpix(x0,y+1)<>clGreen) then OnStrZal(x0,y+1);
   end;
 x0:=x;
 y0:=y;
 if (getpix(x0,y-1)=curcol) and (getpix(x0,y-1)<>clGreen) then OnStrZal(x0,y-1);
 if (getpix(x0,y+1)=curcol) and (getpix(x0,y+1)<>clGreen) then OnStrZal(x0,y+1);
end;

procedure TForm1.push(x: Integer; y: Integer; var i: Integer);
begin
  inc(i);
  mas[i]:=x;
  inc(i);
  mas[i]:=y;
end;

procedure TForm1.pop(var x: Integer; var y: Integer; var i: Integer);
begin
  y:=mas[i];
  dec(i);
  x:=mas[i];
  dec(i);
end;

end.
