unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Buttons, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    SB1: TSpeedButton;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
 tochka = record
  x:integer;
  y:integer;
  z:integer;
 end;
var
  Form1: TForm1;
    xc,j,yc,zc:integer;
    x,y,i,x1,x2,x3,y1,y2,y3,z,z1,z2,z3,xa,xb,za,zb:integer;
    Fon:array[0..537,0..433]of integer;
    Ver1,Ver2:array[1..3] of tochka;
implementation

{$R *.dfm}

function P(x,y,z:real):TPoint;
begin
  P.X:= xc+round((y*2-round(x/sqrt(2))));
  P.Y:= yc-round((z*2-round(x/sqrt(2))));
end;

procedure Osi;
begin
  with form1.image1.Canvas do
    begin
      pen.Color:=clBlack;
      moveto(xc,yc);lineto(X,yc);
      moveto(xc,yc);lineto(xc,0);
      moveto(xc,yc);lineto(X-2*xc,2*yc);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  i:=0;
  x:=form1.image1.Width;
  xc:=form1.image1.Width  div 2;
  yc:=form1.image1.Height div 2;
  Osi;
  for i:=0 to 537 do
  for j:=0 to 433 do
    fon[i,j]:=0;
end;

procedure triangle(color2:Tcolor);
var t:tochka;
    tdch,i,j:integer;
begin
  ver1[1].x:=p(x1,y1,z1).x; ver1[1].y:=p(x1,y1,z1).y; ver1[1].z:=z1;
  ver1[2].x:=p(x2,y2,z2).x; ver1[2].y:=p(x2,y2,z2).y; ver1[2].z:=z2;
  ver1[3].x:=p(x3,y3,z3).x; ver1[3].y:=p(x3,y3,z3).y; ver1[3].z:=z3;
//Сортировка вершины треугольника по игрикам
  for i:=1 to 3 do
  for j:=1 to 3-i do
    if ver1[i].y>ver1[i+1].y then
      begin
        t:=ver1[i];
        ver1[i]:=ver1[i+1];
        ver1[i+1]:=t
      end;
//Основные циклы
//первая часть треугольника
  for i:=ver1[1].y+1 to ver1[2].y do
    begin
      xa:=round(ver1[1].x+(ver1[2].x-ver1[1].x)*((i-ver1[1].y)/(ver1[2].y-ver1[1].y)));
      xb:=round(ver1[1].x+(ver1[3].x-ver1[1].x)*((i-ver1[1].y)/(ver1[3].y-ver1[1].y)));
      if xa>xb then
        begin
          tdch:=xa;
          xa:=xb;
          xb:=tdch
        end;
      za:=round(ver1[1].z+(ver1[2].z-ver1[1].z)*((i-ver1[1].y)/(ver1[2].y-ver1[1].y)));
      zb:=round(ver1[1].z+(ver1[3].z-ver1[1].z)*((i-ver1[1].y)/(ver1[3].y-ver1[1].y)));
      if za>zb then
        begin
          tdch:=za;
          za:=zb;
          zb:=tdch
        end;
      for j:=xa+1 to xb do
        begin
          z:=round(za+(zb-za)*((j-xa)/(xb-xa)));
          if fon[j,i]<z then
            begin
              form1.image1.Canvas.Pixels[j,i]:=color2;
              fon[j,i]:=z
            end;
        end;
    end;
//Вторая часть треугльника
for i:=ver1[2].y+1 to ver1[3].y do
  begin
    xa:=round(ver1[2].x+(ver1[3].x-ver1[2].x)*((i-ver1[2].y)/(ver1[3].y-ver1[2].y)));
    xb:=round(ver1[1].x+(ver1[3].x-ver1[1].x)*((i-ver1[1].y)/(ver1[3].y-ver1[1].y)));
    if xa>xb then
      begin
        tdch:=xa;
        xa:=xb;
        xb:=tdch
      end;
    za:=round(ver1[2].z+(ver1[3].z-ver1[2].z)*((i-ver1[2].y)/(ver1[3].y-ver1[2].y)));
    zb:=round(ver1[1].z+(ver1[3].z-ver1[1].z)*((i-ver1[1].y)/(ver1[3].y-ver1[1].y)));
    if za>zb then
      begin
        tdch:=za;
        za:=zb;
        zb:=tdch
      end;
    for j:=xa+1 to xb do
      begin
        z:=round(za+(zb-za)*((j-xa)/(xb-xa)));
        if fon[j,i]<z then
          begin
            form1.image1.Canvas.Pixels[j,i]:=color2;
            fon[j,i]:=z
          end;
      end;
  end;
end;

procedure TForm1.SB1Click(Sender: TObject);
var t:tochka;
    tdch:integer;
begin
  x1:=strtoint(edit1.text);
  y1:=strtoint(edit2.text);
  z1:=strtoint(edit3.text);
  x2:=strtoint(edit4.text);
  y2:=strtoint(edit5.text);
  z2:=strtoint(edit6.text);
  x3:=strtoint(edit7.text);
  y3:=strtoint(edit8.text);
  z3:=strtoint(edit9.text);

  triangle(colorbox1.Selected);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  x1:=strtoint(edit10.text);
  y1:=strtoint(edit11.text);
  z1:=strtoint(edit12.text);
  x2:=strtoint(edit13.text);
  y2:=strtoint(edit14.text);
  z2:=strtoint(edit15.text);
  x3:=strtoint(edit16.text);
  y3:=strtoint(edit17.text);
  z3:=strtoint(edit18.text);

  triangle(colorbox2.Selected);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  form1.image1.Canvas.FillRect(rect(0,0,image1.Width,image1.Height));
  osi;
  for i:=0 to 537 do
  for j:=0 to 433 do
    fon[i,j]:=0;
end;

end.
