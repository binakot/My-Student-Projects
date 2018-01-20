unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Buttons, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Fact(cur : integer): integer;
begin
  if cur = 0 then
    result := 1
  else
    result := Fact(cur - 1);
end;

function GetLambda(t : real): real;
begin
  result := 0.1 + sqr(t-50)/4000;
end;

function GetPm(m : integer; t, t0 : real): real;
var a : real;
begin
  a := GetLambda(t) * t;
  result := (Power(a,m) / Fact(m)) * exp(-a);
end;

Procedure TForm1.SpeedButton1Click(Sender: TObject);
var i : integer;
begin
  Series1.Clear;
  for i := 0 to 100 do
    begin
      Series1.Add(GetPm(StrToInt(Edit1.Text),i,1))
    end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i : integer;
    check : boolean;
begin
  check := false;
  repeat
    Edit1.Text := IntToStr(StrToInt(Edit1.Text)+1);
    Series1.Clear;
    for i := 0 to 100 do
      begin
        Series1.Add(GetPm(StrToInt(Edit1.Text),i,1));
        if StrToInt(Edit1.Text) = 100 then
          check := true;
      end;
    Form1.Refresh;
    sleep(100);
  until check = true;
end;

end.
 