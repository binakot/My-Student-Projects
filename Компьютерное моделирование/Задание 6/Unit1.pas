unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Buttons,
  Grids, Math;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Chart1: TChart;
    Series1: TLineSeries;
    Image1: TImage;
    BitBtn1: TBitBtn;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var x : real;
begin
  x := 0;
  repeat
    Series1.AddXY(x,(2*x+3)*sin(x));
    x := x + 1;
  until x > 100;
  Image1.Canvas.Create;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.MoveTo(10,10);
  Image1.Canvas.LineTo(10,240);
  Image1.Canvas.TextOut(20,10,'y');
  Image1.Canvas.MoveTo(10,125);
  Image1.Canvas.LineTo(240,125);
  Image1.Canvas.TextOut(230,100,'x');
  Image1.Canvas.Pen.Color := clYellow;
  Image1.Canvas.MoveTo(40,120);
  Image1.Canvas.LineTo(120,120);
  Image1.Canvas.MoveTo(40,100);
  Image1.Canvas.LineTo(120,100);
  Image1.Canvas.Pen.Color := clRed;
  Image1.Canvas.MoveTo(40,100);
  Image1.Canvas.LineTo(40,120);
  Image1.Canvas.MoveTo(120,100);
  Image1.Canvas.LineTo(120,120);
  Image1.Canvas.Pen.Color := clBlack;
  x := 0.4;
  Image1.Canvas.MoveTo(Round(x*100),125-Round((2*x+3)*sin(x))*5);
  repeat
    x := x + 0.1;
    Image1.Canvas.LineTo(Round(x*100),125-Round((2*x+3)*sin(x))*5)
  until x >= 1.1;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var xr, yr, S, Res : real;
    i, j :integer;
    All, Ok: integer;
begin
  All := 0;
  Ok := 0;
  S := (1.2-0.4)*(0.6-0.5);
  for i := 1 to 100 do
  begin
    for j := 1 to 20 do
    begin
      xr := (random(80)+40+1)/10;
      yr := (random(10)+50+1)/10;
      All := All + 1;
      if yr <= (2*xr+3)*sin(xr) then
        Ok := Ok + 1;
    end;
    Res := RoundTo(S * (Ok/All),-3);
    Memo2.Lines.Add(FloatToStr(Res));
  end;
end;

end.
