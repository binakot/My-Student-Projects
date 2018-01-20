unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    Chart3: TChart;
    LineSeries2: TLineSeries;
    Chart4: TChart;
    LineSeries3: TLineSeries;
    Chart5: TChart;
    LineSeries4: TLineSeries;
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
begin
  Randomize;
  StringGrid1.Cells[0,0] := '№';
  StringGrid1.Cells[1,0] := 'Карта';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var Nher, Ntref, Npik, Nbub, Njok, N, i : integer;
    curP : real;
begin
  Chart1.Series[0].Clear;
  Chart2.Series[0].Clear;
  Chart3.Series[0].Clear;
  Chart4.Series[0].Clear;
  Chart5.Series[0].Clear;

  N := 54;
  Nher := 13;
  Ntref := 13;
  Npik := 13;
  Nbub := 13;
  Njok := 2;
  i := 1;

  repeat

    StringGrid1.Cells[0,i] := IntToStr(i);
    curP := random;
    if (curP < Nher / N) then
      begin
        Chart1.Series[0].AddXY(i,Nher/N);
        StringGrid1.Cells[1,i] := 'Карта червей';
        Nher := Nher - 1;
      end
    else
    if (curP >= Nher / N)and(curP < Ntref / N + Nher / N) then
      begin
        Chart4.Series[0].AddXY(i,Ntref/N);
        StringGrid1.Cells[1,i] := 'Карта треф';
        Ntref := Ntref - 1;
      end
    else
    if (curP >= Ntref / N + Nher / N)and(curP < Npik / N + Ntref / N + Nher / N) then
      begin
        Chart2.Series[0].AddXY(i,Npik/N);
        StringGrid1.Cells[1,i] := 'Карта пик';
        Npik := Npik - 1;
      end
    else
    if (curP >= Npik / N + Ntref / N + Nher / N)and(curP < Nbub / N + Npik / N + Ntref / N + Nher / N) then
      begin
        Chart3.Series[0].AddXY(i,Nbub/N);
        StringGrid1.Cells[1,i] := 'Карта буби';
        Nbub := Nbub - 1;
      end
    else
    if (curP >= Nbub / N + Npik / N + Ntref / N + Nher / N) then
      begin
        Chart5.Series[0].AddXY(i,Njok/N);
        StringGrid1.Cells[1,i] := 'Джокер';
        Njok := Njok - 1;
      end;

    i := i + 1;
    StringGrid1.RowCount := i;
    N := N - 1
  until N = 0;
end;

end.
