unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    Chart3: TChart;
    LineSeries2: TLineSeries;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var N, No, Nr, i : integer;
    curP, Po, Pr : real;
begin
  Chart1.Series[0].Clear;
  Chart2.Series[0].Clear;
  Chart3.Series[0].Clear;

  N := StrToInt(Edit1.Text);
  i := 0;
  No := 0;
  Nr := 0;

  repeat
    i := i + 1;
    curP := random;
    if curP<0.5 then
      begin
        No := No + 1;
        Po := No / N;
        Chart1.Series[0].AddXY(i,Po);
      end
    else
      begin
        Nr := Nr + 1;
        Pr := Nr / N;
        Chart2.Series[0].AddXY(i,Pr);
      end;
    Chart3.Series[0].AddXY(i,Po / Pr - 0.5)
  until i = N;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
end;

end.
