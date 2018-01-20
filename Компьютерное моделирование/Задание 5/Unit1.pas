unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Chart1: TChart;
    BitBtn1: TBitBtn;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Label7: TLabel;
    Edit7: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  deltaT = 0.001;

var
  Form1: TForm1;
  C, N : integer;
  dNdt, dCdt : real;
  a, q, f, r : real;
  Steps : integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i : integer;
begin
  C := StrToInt(Edit1.Text);
  a := StrToFloat(Edit3.Text);
  q := StrToFloat(Edit5.Text);
  f := StrToFloat(Edit6.Text);
  N := StrToInt(Edit2.Text);
  r := StrToFloat(Edit4.Text);
  Steps := StrToInt(Edit7.Text);

  Series1.Clear;
  Series2.Clear;

  Series1.Add(C);
  Series2.Add(N);

  for i := 1 to Steps do
    begin
      dNdt := r * N - a * C * N;
      dCdt := f * a * C * N - q * C;
      C := Round(C + dCdt * deltaT);
      N := Round(N + dNdt * deltaT);
      Series1.Add(C);
      Series2.Add(N)
    end;
end;

end.
