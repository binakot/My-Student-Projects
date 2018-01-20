unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, BubbleCh;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TBubbleSeries;
    Label1: TLabel;
    Edit1: TEdit;
    StringGrid2: TStringGrid;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Series3: TLineSeries;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  masX, masY : array[1..7] of real;
  a1, a2 : real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'x';
  StringGrid1.Cells[0,1] := 'y';
  StringGrid1.Cells[1,0] := '1,0';
  StringGrid1.Cells[2,0] := '1,5';
  StringGrid1.Cells[3,0] := '2,5';
  StringGrid1.Cells[4,0] := '3,0';
  StringGrid1.Cells[5,0] := '4,5';
  StringGrid1.Cells[6,0] := '5,0';
  StringGrid1.Cells[7,0] := '6,0';
  StringGrid1.Cells[1,1] := '67,0';
  StringGrid1.Cells[2,1] := '101,0';
  StringGrid1.Cells[3,1] := '168,0';
  StringGrid1.Cells[4,1] := '202,2';
  StringGrid1.Cells[5,1] := '301,1';
  StringGrid1.Cells[6,1] := '334,0';
  StringGrid1.Cells[7,1] := '404,0';   
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i, j : integer;
    Sum : real;
begin
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Series[2].Clear;

  series1.AddXY(0,0);

  for i := 1 to 7 do
    begin
      masX[i] := StrToFloat(StringGrid1.Cells[i,0]);
      masY[i] := StrToFloat(StringGrid1.Cells[i,1])
    end;

  for i := 1 to 7 do
    begin
      Chart1.Series[0].AddXY(masX[i],masY[i]);
      Series2.AddBubble(masX[i],masY[i],5,'',clBlack);
    end;

  StringGrid2.Cells[0,0] := 'i';
  StringGrid2.Cells[1,0] := 'Xi';
  StringGrid2.Cells[2,0] := 'Yi''';
  StringGrid2.Cells[3,0] := 'Xi^2';
  StringGrid2.Cells[4,0] := 'Xi*Yi''';
  StringGrid2.Cells[5,0] := 'Yi=a1+a2*Xi';
  StringGrid2.Cells[6,0] := 'Di=Yi'' - Yi';
  StringGrid2.Cells[7,0] := 'Di^2';
  StringGrid2.Cells[8,0] := 'Delta';

  StringGrid2.Cells[0,1] := '1';
  StringGrid2.Cells[0,2] := '2';
  StringGrid2.Cells[0,3] := '3';
  StringGrid2.Cells[0,4] := '4';
  StringGrid2.Cells[0,5] := '5';
  StringGrid2.Cells[0,6] := '6';
  StringGrid2.Cells[0,7] := '7';
  StringGrid2.Cells[0,8] := 'E';

  Sum := 0;
  for i := 1 to 7 do
    begin
      StringGrid2.Cells[1,i] := FloatToStr(masX[i]);
      Sum := Sum + masX[i];
    end;
  StringGrid2.Cells[1,8] := FloatToStr(Sum);

  Sum := 0;
  for i := 1 to 7 do
    begin
      StringGrid2.Cells[2,i] := FloatToStr(masY[i]);
      Sum := Sum + masY[i];
    end;
  StringGrid2.Cells[2,8] := FloatToStr(Sum);

  Sum := 0;
  for i := 1 to 7 do
    begin
      StringGrid2.Cells[3,i] := FloatToStr(masX[i]*masX[i]);
      Sum := Sum + masX[i]*masX[i];
    end;
  StringGrid2.Cells[3,8] := FloatToStr(Sum);

  Sum := 0;
  for i := 1 to 7 do
    begin
      StringGrid2.Cells[4,i] := FloatToStr(masX[i]*masY[i]);
      Sum := Sum + masX[i]*masY[i];
    end;
  StringGrid2.Cells[4,8] := FloatToStr(Sum);

  a2 := StrToFloat(StringGrid2.Cells[2,8]) / StrToFloat(StringGrid2.Cells[1,8]);
  a1 := (StrToFloat(StringGrid2.Cells[2,8]) - a2 * StrToFloat(StringGrid2.Cells[1,8])) / 7;
  Edit2.Text := FloatToStr(a1);
  Edit3.Text := FloatToStr(a2);

  for i := 1 to 7 do
    begin
      StringGrid2.Cells[5,i] := FloatToStr(a1 + a2 * masX[i]); 
    end;

  for i := 1 to 7 do
    begin
      StringGrid2.Cells[6,i] := FloatToStr(abs(masY[i] - StrToFloat(StringGrid2.Cells[5,i])));
    end;

  Sum := 0;
  for i := 1 to 7 do
    begin
      StringGrid2.Cells[7,i] := FloatToStr(StrToFloat(StringGrid2.Cells[6,i])*StrToFloat(StringGrid2.Cells[6,i]));
      Sum := Sum + StrToFloat(StringGrid2.Cells[7,i]);
    end;
  StringGrid2.Cells[7,8] := FloatToStr(Sum);

  StringGrid2.Cells[8,8] := FloatToStr(sqrt(Sum/6));

  Edit4.Text := StringGrid2.Cells[8,8];
  
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Series3.AddXY(0, a1 + a2*0);
  Series3.AddXY(6, a1 + a2*6);
end;

end.
