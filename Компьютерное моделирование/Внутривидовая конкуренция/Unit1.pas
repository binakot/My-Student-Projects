unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Series1: TLineSeries;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  R, K, N0 : real;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var i : integer;
    Ni, a, res: real;
begin
  R := StrToFloat(Edit1.Text);
  K := StrToFloat(Edit2.Text);
  N0 := StrToFloat(Edit3.Text);
  Ni := N0;
  a := (R - 1) / K;
  Series1.Clear;
  Series1.AddXY(1,N0);
  for i := 2 to StrToInt(Edit4.Text) do
    begin
      res := (Ni * R) / (1 + a * Ni);
      Series1.AddXY(i,res);
      Ni := res;
    end;
end;

end.
