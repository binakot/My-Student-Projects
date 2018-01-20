unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Math;

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
  result := false;
  if (x<0)or(x>Form1.Image1.Height)or(y<0)or(y>Form1.Image1.Width) then
    begin
      result := true;
      exit
    end;
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
  StringGrid1.Cells[7,0] := 'Angle';

  q1 := StrToFloat(Form1.Edit1.Text);
  m := StrToFloat(Form1.Edit2.Text);
  x1 := StrToFloat(Form1.Edit3.Text);
  y1 := StrToFloat(Form1.Edit4.Text);
  V := StrToFloat(Form1.Edit7.Text)*1000;
  angle := StrToFloat(Form1.Edit9.Text);
  q2 := StrToFloat(Form1.Edit8.Text);
  x2 := StrToFloat(Form1.Edit6.Text);
  y2 := StrToFloat(Form1.Edit5.Text);
  if Form1.RadioButton1.Checked then unlike := 1
  else unlike := -1;
  deltaT := StrToFloat(Form1.Edit10.Text);

  i := i + 1;
  StringGrid1.RowCount := i;
  Vx := V * cos(angle * 3.141592 / 180);
  Vy := V * sin(angle * 3.141592 / 180);
  t := 0;
  StringGrid1.Cells[0,i] := FloatToStr(t/1000);
  StringGrid1.Cells[3,i] := FloatToStr(Vx);
  StringGrid1.Cells[4,i] := FloatToStr(Vy);
  StringGrid1.Cells[5,i] := FloatToStr(x1);
  StringGrid1.Cells[6,i] := FloatToStr(y1);

  k := unlike / (4 * Pi * E0); 
  
  repeat
    i := i + 1;
    StringGrid1.RowCount := i;

    distance := sqrt(sqr(x1-x2) + sqr(y1-y2));
    Ax := k * ( (q2 * q1) / m) * ( (x1-x2) / power(distance,3) ) ;
    Ay := k * ( (q2 * q1) / m) * ( (y1-y2) / power(distance,3) ) ;
    Vx := Vx + Ax*deltaT;
    Vy := Vy + Ay*deltaT;
    x1 := x1 + Vx*deltaT;
    y1 := y1 + Vy*deltaT;
    t := t + 1;

    StringGrid1.Cells[0,i] := FloatToStr(t/1000);
    StringGrid1.Cells[1,i] := FloatToStr(Ax);
    StringGrid1.Cells[2,i] := FloatToStr(Ay);
    StringGrid1.Cells[3,i] := FloatToStr(Vx/1000);
    StringGrid1.Cells[4,i] := FloatToStr(Vy/1000);
    StringGrid1.Cells[5,i] := FloatToStr(x1);
    StringGrid1.Cells[6,i] := FloatToStr(y1);
  until limit(x1,y1);
end;

end.
