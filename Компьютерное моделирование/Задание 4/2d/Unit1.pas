unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Math;

type
  TForm1 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    BitBtn1: TBitBtn;
    Label17: TLabel;
    Edit13: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const Pi = 3.14159265;
      E0 = 8.85;
      hx = 1;
      hy = 1;

var
  Form1: TForm1;
  q1, q2, q3, q4 : real;
  x1, y1, x2, y2, x3, y3, x4, y4 : integer;
  x, y : real;
  massF : array[0..500,0..500] of real;
  n , m : integer;
  curF : real;
  h, Fsr : real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Image1.Canvas.Create;
end;

function GetOneF(q : real; x, y, i, k : integer) : real;
begin
 if sqrt(sqr(x - k * hx) + sqr(y - i * hy)) = 0 then
   result := 0
 else
   Result := (1 / (4 * Pi * E0)) * (q / sqrt(sqr(x - k * hx) + sqr(y - i * hy)))
end;

function GetAllF(i,k : integer) : real;
begin
  Result := - (GetOneF(q1,x1,y1,i,k) + GetOneF(q2,x2,y2,i,k) + GetOneF(q3,x3,y3,i,k) + GetOneF(q4,x4,y4,i,k))
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i, k : integer;
    TmpClr : TColor;
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);

  q1 := StrToFloat(Edit1.Text);
  q2 := StrToFloat(Edit4.Text);
  q3 := StrToFloat(Edit7.Text);
  q4 := StrToFloat(Edit10.Text);

  x1 := StrToInt(Edit2.Text);
  x2 := StrToInt(Edit5.Text);
  x3 := StrToInt(Edit8.Text);
  x4 := StrToInt(Edit11.Text);

  y1 := StrToInt(Edit3.Text);
  y2 := StrToInt(Edit6.Text);
  y3 := StrToInt(Edit9.Text);
  y4 := StrToInt(Edit12.Text);

  h := StrToFloat(Edit13.Text);

  Fsr := ( q1 + q2 + q3 + q4 ) / 4;

  {
  x := 0;
  y := 0;
  Image1.Canvas.Pen.Color := clYellow;
  repeat
    Image1.Canvas.MoveTo(Round(x),0);
    Image1.Canvas.LineTo(Round(x),Image1.Height);
    x := x + hx
  until x>=Image1.Width;
  repeat
    Image1.Canvas.MoveTo(0,Round(y));
    Image1.Canvas.LineTo(Image1.Width,Round(y));
    y := y + hy
  until y>=Image1.Height;
  Image1.Canvas.Refresh;
  }

  n := Round(Image1.Height/hy);
  m := Round(Image1.Width/hx);

  for i := 0 to n do
  for k := 0 to m do
    massF[i,k] := GetAllF(i,k);

  curF := - 10;
  repeat
    TmpClr := rgb(random(256), random(256), random(256));
    for i := 0 to n do
    for k := 0 to m do
      if (massF[i,k]-curF)*(massF[i,k+1]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k]) / (massF[i,k+1] - massF[i,k]) * hx;
          y := i * hy;
          Image1.Canvas.Pixels[Round(x),Round(y)] := TmpClr;
        end;
    for i := 0 to n do
    for k := 0 to m do
      if (massF[i,k]-curF)*(massF[i,k+1]-curF)<0 then
        begin
          y := i * hy + (curF - massF[i,k]) / (massF[i,k+1] - massF[i,k]) * hy;
          x := k * hx;
          Image1.Canvas.Pixels[Round(x),Round(y)] := TmpClr;
        end;
    curF := curF + h
  until curF>=0;

end;

end.
 