unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, BubbleCh, Math;

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
    Edit5: TEdit;
    Label5: TLabel;
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
  masX, masY : array[1..19] of real;
  a0, a1, a2 : real;
  MainMat, Mat1, Mat2, Mat3 : array[1..3,1..3] of real;
  DetMainMat, DetMat1, DetMat2, DetMat3 : real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'x';
  StringGrid1.Cells[0,1] := 'y';
  StringGrid1.Cells[1,0] := '1,0';
  StringGrid1.Cells[2,0] := '1,5';
  StringGrid1.Cells[3,0] := '2,0';
  StringGrid1.Cells[4,0] := '2,5';
  StringGrid1.Cells[5,0] := '3,0';
  StringGrid1.Cells[6,0] := '3,5';
  StringGrid1.Cells[7,0] := '4,0';
  StringGrid1.Cells[8,0] := '4,5';
  StringGrid1.Cells[9,0] := '5,0';
  StringGrid1.Cells[10,0] := '5,5';
  StringGrid1.Cells[11,0] := '6,0';
  StringGrid1.Cells[12,0] := '6,5';
  StringGrid1.Cells[13,0] := '7,0';
  StringGrid1.Cells[14,0] := '7,5';
  StringGrid1.Cells[15,0] := '8,0';
  StringGrid1.Cells[16,0] := '8,5';
  StringGrid1.Cells[17,0] := '9,0';
  StringGrid1.Cells[18,0] := '9,5';
  StringGrid1.Cells[19,0] := '10,0';
  StringGrid1.Cells[1,1] := '0,22';
  StringGrid1.Cells[2,1] := '0,23';
  StringGrid1.Cells[3,1] := '0,31';
  StringGrid1.Cells[4,1] := '0,43';
  StringGrid1.Cells[5,1] := '0,56';
  StringGrid1.Cells[6,1] := '0,82';
  StringGrid1.Cells[7,1] := '1,06';
  StringGrid1.Cells[8,1] := '1,25';
  StringGrid1.Cells[9,1] := '1,72';
  StringGrid1.Cells[10,1] := '2,28';
  StringGrid1.Cells[11,1] := '2,67';
  StringGrid1.Cells[12,1] := '3,26';
  StringGrid1.Cells[13,1] := '3,72';
  StringGrid1.Cells[14,1] := '4,32';
  StringGrid1.Cells[15,1] := '5,11';
  StringGrid1.Cells[16,1] := '5,98';
  StringGrid1.Cells[17,1] := '6,64';
  StringGrid1.Cells[18,1] := '7,02';
  StringGrid1.Cells[19,1] := '8,32';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i, j : integer;
    Sum : real;
begin
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Series[2].Clear;
  
  for i := 1 to 19 do
    begin
      masX[i] := StrToFloat(StringGrid1.Cells[i,0]);
      masY[i] := StrToFloat(StringGrid1.Cells[i,1])
    end;

  for i := 1 to 19 do
    begin
      Chart1.Series[0].AddXY(masX[i],masY[i]);
      Series2.AddBubble(masX[i],masY[i],0.1,'',clBlack);
    end;

  StringGrid2.Cells[0,0] := 'i';
  StringGrid2.Cells[1,0] := 'Xi';
  StringGrid2.Cells[2,0] := 'Yi''';
  StringGrid2.Cells[3,0] := 'Xi^2';
  StringGrid2.Cells[4,0] := 'Xi^3';
  StringGrid2.Cells[5,0] := 'Xi^4';
  StringGrid2.Cells[6,0] := 'Xi*Yi''';
  StringGrid2.Cells[7,0] := 'Xi^2*Yi''';
  StringGrid2.Cells[8,0] := 'Yi=a0+a1*Xi+a2*Xi^2';
  StringGrid2.Cells[9,0] := 'Di=Yi'' - Yi';
  StringGrid2.Cells[10,0] := 'Di^2';
  StringGrid2.Cells[11,0] := 'Delta';
  //Номер строки
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[0,i] := IntToStr(i);
    end;
  StringGrid2.Cells[0,20] := 'E';
  //Выводим Хi
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[1,i] := FloatToStr(masX[i]);
      Sum := Sum + masX[i];
    end;
  StringGrid2.Cells[1,20] := FloatToStr(Sum);
  //Выводим Уi'
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[2,i] := FloatToStr(masY[i]);
      Sum := Sum + masY[i];
    end;
  StringGrid2.Cells[2,20] := FloatToStr(Sum);
  //Выводим Хi^2
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[3,i] := FloatToStr(masX[i]*masX[i]);
      Sum := Sum + masX[i]*masX[i];
    end;
  StringGrid2.Cells[3,20] := FloatToStr(Sum);
  //Выводим Xi^3
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[4,i] := FloatToStr(Power(masX[i],3));
      Sum := Sum + Power(masX[i],3);
    end;
  StringGrid2.Cells[4,20] := FloatToStr(Sum);
  //Выводим Xi^4
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[5,i] := FloatToStr(Power(masX[i],4));
      Sum := Sum + Power(masX[i],4);
    end;
  StringGrid2.Cells[5,20] := FloatToStr(Sum);
  //Выводим Xi*Yi'
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[6,i] := FloatToStr(masX[i]*masY[i]);
      Sum := Sum + masX[i]*masY[i];
    end;
  StringGrid2.Cells[6,20] := FloatToStr(Sum);
  //Выводим Xi^2*Yi'
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[7,i] := FloatToStr(masX[i]*masX[i]*masY[i]);
      Sum := Sum + masX[i]*masX[i]*masY[i];
    end;
  StringGrid2.Cells[7,20] := FloatToStr(Sum);
  // Находим по Крамеру a0, a1, a2
  // Заполняем главную матрицу
  MainMat[1,1] := 19;
  MainMat[1,2] := StrToFloat(StringGrid2.Cells[1,20]);
  MainMat[1,3] := StrToFloat(StringGrid2.Cells[3,20]);
  MainMat[2,1] := StrToFloat(StringGrid2.Cells[1,20]);
  MainMat[2,2] := StrToFloat(StringGrid2.Cells[3,20]);
  MainMat[2,3] := StrToFloat(StringGrid2.Cells[4,20]);
  MainMat[3,1] := StrToFloat(StringGrid2.Cells[3,20]);
  MainMat[3,2] := StrToFloat(StringGrid2.Cells[4,20]);
  MainMat[3,3] := StrToFloat(StringGrid2.Cells[5,20]);
  // Заполняем 1 матрицу
  Mat1[1,1] := StrToFloat(StringGrid2.Cells[2,20]);
  Mat1[1,2] := StrToFloat(StringGrid2.Cells[1,20]);
  Mat1[1,3] := StrToFloat(StringGrid2.Cells[3,20]);
  Mat1[2,1] := StrToFloat(StringGrid2.Cells[6,20]);
  Mat1[2,2] := StrToFloat(StringGrid2.Cells[3,20]);
  Mat1[2,3] := StrToFloat(StringGrid2.Cells[4,20]);
  Mat1[3,1] := StrToFloat(StringGrid2.Cells[7,20]);
  Mat1[3,2] := StrToFloat(StringGrid2.Cells[4,20]);
  Mat1[3,3] := StrToFloat(StringGrid2.Cells[5,20]);
  // Заполняем 2 матрицу
  Mat2[1,1] := 19;
  Mat2[1,2] := StrToFloat(StringGrid2.Cells[2,20]);
  Mat2[1,3] := StrToFloat(StringGrid2.Cells[3,20]);
  Mat2[2,1] := StrToFloat(StringGrid2.Cells[1,20]);
  Mat2[2,2] := StrToFloat(StringGrid2.Cells[6,20]);
  Mat2[2,3] := StrToFloat(StringGrid2.Cells[4,20]);
  Mat2[3,1] := StrToFloat(StringGrid2.Cells[3,20]);
  Mat2[3,2] := StrToFloat(StringGrid2.Cells[7,20]);
  Mat2[3,3] := StrToFloat(StringGrid2.Cells[5,20]);
  // Заполняем 3 матрицу
  Mat3[1,1] := 19;
  Mat3[1,2] := StrToFloat(StringGrid2.Cells[1,20]);
  Mat3[1,3] := StrToFloat(StringGrid2.Cells[2,20]);
  Mat3[2,1] := StrToFloat(StringGrid2.Cells[1,20]);
  Mat3[2,2] := StrToFloat(StringGrid2.Cells[3,20]);
  Mat3[2,3] := StrToFloat(StringGrid2.Cells[6,20]);
  Mat3[3,1] := StrToFloat(StringGrid2.Cells[3,20]);
  Mat3[3,2] := StrToFloat(StringGrid2.Cells[4,20]);
  Mat3[3,3] := StrToFloat(StringGrid2.Cells[7,20]);
  // Вычисляем определители
  // det А = а11а22а33 + а12а23а31 + а13а21а32 - а31а22а13 - а21а12а33 - а11а32а23
  DetMainMat := MainMat[1,1]*MainMat[2,2]*MainMat[3,3] + MainMat[1,2]*MainMat[2,3]*MainMat[3,1] + MainMat[1,3]*MainMat[2,1]*MainMat[3,2] - MainMat[3,1]*MainMat[2,2]*MainMat[1,3] - MainMat[2,1]*MainMat[1,2]*MainMat[3,3] - MainMat[1,1]*MainMat[3,2]*MainMat[2,3];
  DetMat1 := Mat1[1,1]*Mat1[2,2]*Mat1[3,3] + Mat1[1,2]*Mat1[2,3]*Mat1[3,1] + Mat1[1,3]*Mat1[2,1]*Mat1[3,2] - Mat1[3,1]*Mat1[2,2]*Mat1[1,3] - Mat1[2,1]*Mat1[1,2]*Mat1[3,3] - Mat1[1,1]*Mat1[3,2]*Mat1[2,3];
  DetMat2 := Mat2[1,1]*Mat2[2,2]*Mat2[3,3] + Mat2[1,2]*Mat2[2,3]*Mat2[3,1] + Mat2[1,3]*Mat2[2,1]*Mat2[3,2] - Mat2[3,1]*Mat2[2,2]*Mat2[1,3] - Mat2[2,1]*Mat2[1,2]*Mat2[3,3] - Mat2[1,1]*Mat2[3,2]*Mat2[2,3];
  DetMat3 := Mat3[1,1]*Mat3[2,2]*Mat3[3,3] + Mat3[1,2]*Mat3[2,3]*Mat3[3,1] + Mat3[1,3]*Mat3[2,1]*Mat3[3,2] - Mat3[3,1]*Mat3[2,2]*Mat3[1,3] - Mat3[2,1]*Mat3[1,2]*Mat3[3,3] - Mat3[1,1]*Mat3[3,2]*Mat3[2,3];
  // Находим неизвестные
  a0 := DetMat1 / DetMainMat;
  a1 := DetMat2 / DetMainMat;
  a2 := DetMat3 / DetMainMat;
  //Выводим коэффициенты
  Edit2.Text := FloatToStr(a0);
  Edit3.Text := FloatToStr(a1);
  Edit5.Text := FloatToStr(a2);
  //Выводим y = a0 + a1*x + a2*x^2
  for i := 1 to 19 do
    StringGrid2.Cells[8,i] := FloatToStr(a0 + a1*masX[i] + a2*masX[i]*masX[i]);
  //Выводим Di = Yi' - Yi
  for i := 1 to 19 do
    StringGrid2.Cells[9,i] := FloatToStr(masY[i] - StrToFloat(StringGrid2.Cells[8,i]));
  //Выводим Di^2
  Sum := 0;
  for i := 1 to 19 do
    begin
      StringGrid2.Cells[10,i] := FloatToStr(StrToFloat(StringGrid2.Cells[9,i])*StrToFloat(StringGrid2.Cells[9,i]));
      Sum := Sum + StrToFloat(StringGrid2.Cells[9,i])*StrToFloat(StringGrid2.Cells[9,i]);
    end;
  StringGrid2.Cells[10,20] := FloatToStr(Sum);
  // Находим Delta
  StringGrid2.Cells[11,20] := FloatToStr(sqrt(Sum/18));
  Edit4.Text := StringGrid2.Cells[11,20];
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i : integer;
begin
  for i := 0 to 10 do
    Chart1.Series[2].AddXY(i,a0 + a1*i + a2*i*i);
end;

end.
