unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

function limit(x,y : real) : boolean;
begin
  if (deltaY - y < 0)or(x > Form1.Image1.Width) then
    result := true
  else
    result := false;
end;

procedure TForm2.FormActivate(Sender: TObject);
var i : integer;
    t : real;
begin
  i := 0;

  StringGrid1.Cells[0,0] := 't';
  StringGrid1.Cells[1,0] := 'Ax';
  StringGrid1.Cells[2,0] := 'Ay';
  StringGrid1.Cells[3,0] := 'Vx';
  StringGrid1.Cells[4,0] := 'Vy';
  StringGrid1.Cells[5,0] := 'x';
  StringGrid1.Cells[6,0] := 'y'; 

//Параметры модели
  Angle1 := StrToFloat(Form1.Edit1.Text);
  Angle2 := StrToFloat(Form1.Edit2.Text);
  V1 := StrToFloat(Form1.Edit3.Text);
  V2 := StrToFloat(Form1.Edit4.Text);
  m := StrToFloat(Form1.Edit6.Text);
  d := StrToFloat(Form1.Edit7.Text);
  NumOfExp := StrToInt(Form1.Edit5.Text);
  deltaT := StrToFloat(Form1.Edit9.Text);
  k1 := 6 * Pi * dyn * (d / 2);
  S := Pi * sqr(d / 2);
  k2 := 0.5 * c * S * p;
//Входные параметры
  CurV := Random(Round(V2 - V1)) + V1;
  CurAngle := Random(Round(Angle2 - Angle1)) + Angle1;
  x := 0;
  y := 0;
  Ax := 0;
  Ay := -g;
  Vx := CurV * cos(CurAngle * 3.141592 / 180);
  Vy := CurV * sin(CurAngle * 3.141592 / 180);
  t := 0;

  i := i + 1;
  StringGrid1.RowCount := i;
  StringGrid1.Cells[0,i] := FloatToStr(t);
  StringGrid1.Cells[1,i] := FloatToStr(Ax);
  StringGrid1.Cells[2,i] := FloatToStr(Ay);
  StringGrid1.Cells[3,i] := FloatToStr(Vx);
  StringGrid1.Cells[4,i] := FloatToStr(Vy);
  StringGrid1.Cells[5,i] := FloatToStr(x);
  StringGrid1.Cells[6,i] := FloatToStr(y);

//Расчетные формулы
  repeat
    Ax := 0;
    Ay := -g;
    dVx := Ax * deltaT;
    dVy := Ay * deltaT;
    Vx := Vx + dVx;
    Vy := Vy + dVy;
    dx := Vx * deltaT + (Ax * sqr(deltaT) ) / 2;
    dy := Vy * deltaT + (Ay * sqr(deltaT) ) / 2;
    x := x + dx;
    y := y + dy;

    t := t + deltaT;

    i := i + 1;
    StringGrid1.RowCount := i;

    StringGrid1.Cells[0,i] := FloatToStr(t);
    StringGrid1.Cells[1,i] := FloatToStr(Ax);
    StringGrid1.Cells[2,i] := FloatToStr(Ay);
    StringGrid1.Cells[3,i] := FloatToStr(Vx);
    StringGrid1.Cells[4,i] := FloatToStr(Vy);
    StringGrid1.Cells[5,i] := FloatToStr(x);
    StringGrid1.Cells[6,i] := FloatToStr(y);
  until limit(x,y)or(y = 0)

end;

end.
