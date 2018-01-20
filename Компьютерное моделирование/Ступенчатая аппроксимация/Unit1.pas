unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Math, Buttons, ExtCtrls, TeeProcs, TeEngine,
  Chart, Series, GanttCh;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    Chart3: TChart;
    Series2: TBarSeries;
    Series3: TGanttSeries;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  masH : array[1..100] of real;
  N : integer;
  sumH : real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  StringGrid1.Cells[1,0] := 'x';
  StringGrid1.Cells[2,0] := 'f(x)';
  StringGrid1.Cells[0,1] := '1';

end;

procedure TForm1.Button1Click(Sender: TObject);
var i : integer;
begin
  N := StrToInt(Edit1.Text);
  StringGrid1.RowCount := N + 1;
  for i := 1 to N + 1 do
    begin
      StringGrid1.Cells[0,i] := IntToStr(i);
      masH[i] := RoundTo(random,-3);
      if i = 1 then
        StringGrid1.Cells[1,i] := '[0;' + 'x' + IntToStr(i) + ']'
      else
        StringGrid1.Cells[1,i] := '[x' + IntToStr(i-1) + '; x' + IntToStr(i) + ']';
      StringGrid1.Cells[2,i] := FloatToStr(masH[i]);
    end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i : integer;
    Xstart, Xend : real;
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;

  sumH := 0;
  for i := 1 to N do
    sumH := sumH + masH[i];

  for i := 1 to N do
    begin
      Series1.AddXY(i,masH[i]);
      Series2.AddXY(i,masH[i])
    end;

  Xstart := 0;
  Xend := masH[1]/sumH;
  for i := 1 to N do
    begin
      Series3.AddGantt(Xstart,Xend,i);
      Xstart := Xend;
      Xend := Xend + masH[i+1]/sumH;
    end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i : integer;
    R, P : real;
begin 
  R := random;
  Edit3.Text := FloatToStr(RoundTo(R,-3));
  For i := 1 to N do
    begin
      P := masH[i]/sumH;
      if R <= P then break;
      R := R - P;
    end;
  Edit2.Text := IntToStr(i);
end;

end.
