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
    Series2: TLineSeries;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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

function Fact(cur : integer): integer;
begin
  if cur = 0 then
    result := 1
  else
    result := Fact(cur - 1);
end;

//Интенсивность входящего потока
function GetLa(t : real): real;
begin
  result := 0.1 + sqr(t-50)/4000;
end;

//Интенсивность выходящего потока
function GetMu(t : real): real;
begin
  result := 0.003 * (100 - t);
end;

//Вероятность того, что во время t в очереди k заявок
function GetPk(k : integer; t : real): real;
var a : real;
begin
  a := GetLa(t);
  result := (Power(a,k) / Fact(k)) * exp(-a);
end;

//Диф.уравнения для СМО с отказами и ожиданием
function PkDt(k : integer; t : real): real;
begin
  if k = 0 then
    result := - GetLa(t)*GetPk(0,t) + GetMu(t)*GetPk(1,t)
  else if k = 100 then
    result := GetLa(t)*GetPk(k-1,t) - k*GetMu(t)*GetPk(k,t)
  else
    result := GetLa(t)*GetPk(k-1,t) - (GetLa(t) + k*GetMu(t))*GetPk(k,t) + (k+1)*GetMu(t)*GetPk(k+1,t);
end;

Procedure TForm1.SpeedButton1Click(Sender: TObject);
var i : integer;
    c1, c2 : boolean;
begin
  c1 := false;
  c2 := false;
  Chart1.Series[0].Clear;
  for i := 0 to 100 do
    begin
      if c1 = false then
        begin
          Chart1.Series[0].Add(PkDt(StrToInt(Edit1.Text),i));
          c1 := true;
          c2 := false;
        end
      else
        begin
          Chart1.Series[1].Add(PkDt(StrToInt(Edit1.Text),i));
          c2 := true;
          c1 := false;
        end;
    end;  
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i : integer;
    check, c1, c2 : boolean;
begin
  check := false;
  c1 := false;
  c2 := false;
  repeat
    Edit1.Text := IntToStr(StrToInt(Edit1.Text)+1);
    Chart1.Series[0].Clear;
    Chart1.Series[1].Clear;
    for i := 0 to 100 * 2 do
      begin
        if c1 = false then
          Chart1.Series[0].Add(PkDt(StrToInt(Edit1.Text),i))
        else
          Chart1.Series[1].Add(PkDt(StrToInt(Edit1.Text),i)); 
        if c1 = true then
          begin
            c1 := false;
            c2 := true;
          end
        else
          begin
            c1 := true;
            c2 := false;
          end;
        if StrToInt(Edit1.Text) = 100 then
          check := true;
      end;
    Form1.Refresh;
    sleep(100);
  until check = true; 
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Chart1.Series[0].Clear; 
end;

end.
 