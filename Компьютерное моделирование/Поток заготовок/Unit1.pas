unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Series1: TBarSeries;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const n = 12; //Количество случайных чисел на первом шаге

var
  Form1: TForm1;
  mv, qv : real;
  mz, qz : real;
  mx, qx : real;
  amount : integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  mv := n / 2;
  qv := sqrt(n / 12);
  mz := 0;
  qz := 1;
end;

function Step1(n : integer) : real;
var i : integer;
    tmp : real;
begin
  tmp := 0;
  for i := 1 to n do
    tmp := tmp + random;
  result := tmp
end;

function Step2(V : real) : real;
var tmp : real;
begin
  tmp := (V - mv) / qv;
  result := tmp
end;

function Step3(z, mx, qx : real) : real;
var tmp : real;
begin
  tmp := z * qx + mx;
  result := tmp
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Series1.Clear;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i : integer;
    cur : real;
begin
  Series1.Clear;

  mx := StrToFloat(Edit1.Text);
  qx := StrToFloat(Edit2.Text);
  amount := StrToInt(Edit3.Text);

  for i:= 1 to amount do
    begin
      cur := Step3(Step2(Step1(n)),mx,qx);
      Series1.Add(cur);
    end;
    
end;

end.
