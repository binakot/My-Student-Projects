unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons, ComCtrls, Math, XPMan;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    StatusBar1: TStatusBar;
    SpeedButton2: TSpeedButton;
    XPManifest1: TXPManifest;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure putpixel(x,y: integer);
    procedure DDA;
    procedure Bresenham;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x0,y0,x1,y1: integer;
  buf: tbitmap;
  m: boolean;
implementation

{$R *.dfm}

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form1.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 radiobutton1.Checked:=true;
 buf:=tbitmap.Create;
 buf.Height:=image1.Height;
 buf.Width:=image1.Width;
 m:=false;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 x0:=x;
 y0:=y;
 buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
 m:=true;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if m=true then
  begin
   image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
   x1:=x;
   y1:=y;
   if radiobutton1.Checked=true then DDA
   else Bresenham;
  end;
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 m:=false;
 x1:=x;
 y1:=y;
 if radiobutton1.Checked=true then DDA
 else Bresenham;
end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 try
  x0:=strtoint(edit1.Text);
  y0:=strtoint(edit2.Text);
  x1:=strtoint(edit3.Text);
  y1:=strtoint(edit4.Text);
 except
  on EConvertError do
   begin
    showmessage('Введены неверные данные!');
    exit;
   end;
 end;
 if (x0>299) or (x0<0) or (x1>299) or (x1<0) or
    (y0>299) or (y0<0) or (y1>299) or (y1<0) then
  begin
   showmessage('Выход за пределы допустимых значений!');
   exit;
  end;
 if radiobutton1.Checked=true then DDA
 else Bresenham;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
 p,b: tcolor;
begin
 p:=image1.Canvas.Pen.Color;
 b:=image1.Canvas.Brush.Color;
 image1.Canvas.Pen.Color:=clwhite;
 image1.Canvas.Brush.Color:=clwhite;
 image1.Canvas.Rectangle(0,0,image1.Height,image1.Width);
 image1.Canvas.Pen.Color:=p;
 image1.Canvas.Brush.Color:=b;
end;

procedure TForm1.putpixel(x,y: integer);
 begin
  image1.Canvas.Pixels[x,y]:=clblack;
 end;

procedure TForm1.DDA;
var
 l,i: integer;
 dx,dy: real;
 x,y: array [0..300] of real;
begin
 if (x0=x1) and (y0=y1) then
  begin
   putpixel(x0,y0);
   exit;
  end;
 if abs(x1-x0)>abs(y1-y0) then l:=abs(x1-x0)
 else l:=abs(y1-y0);
 dx:=(x1-x0)/l;
 dy:=(y1-y0)/l;
 i:=0;
 x[i]:=x0;
 y[i]:=y0;
 inc(i);
 while i<l do
  begin
   x[i]:=x[i-1]+dx;
   y[i]:=y[i-1]+dy;
   inc(i);
  end;
 x[i]:=x1;
 y[i]:=y1;
 i:=0;
 while i<l do
  begin
   putpixel(round(x[i]),round(y[i]));
   inc(i);
  end;
end;

procedure TForm1.Bresenham;
var
  x,y,dx,dy,sx,sy,z,e,i: integer;
  parity : Boolean;
begin
 if (x0=x1) and (y0=y1) then
  begin
   putpixel(x0,y0);
   exit;
  end;
  x:=x0;
  y:=y0;
  dx:=abs(x1-x0);
  dy:=abs(y1-y0);
  sx:=sign(x1-x0);
  sy:=sign(y1-y0);
  if dy>dx then
   begin
    z:=dx;
    dx:=dy;
    dy:=z;
    parity:=true;
   end
  else parity:=false;
  e:=2*dy-dx;
  i:=1;
  repeat
   putpixel(x,y);
   while e>=0 do
    begin
     if parity then x:=x+sx
     else y:=y+sy;
     e:=e-2*dx;
    end;
   if parity then y:=y+sy
   else x:=x+sx;
   e:=e+2*dy;
   inc(i);
  until i>dx;
  putpixel(x,y);
end;

end.
