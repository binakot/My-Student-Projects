unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, XPMan, Buttons, ComCtrls, Math, ExtCtrls,
  TeeProcs, TeEngine, Chart, Series, BubbleCh;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    XPManifest1: TXPManifest;
    BitBtn1: TBitBtn;
    StringGrid2: TStringGrid;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Edit4: TEdit;
    Memo1: TMemo;
    Chart1: TChart;
    Series1: TBubbleSeries;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    Series2: TBubbleSeries;
    Chart2: TChart;
    Series3: TBubbleSeries;
    Series4: TBubbleSeries;
    Series5: TBubbleSeries;
    Memo2: TMemo;
    GroupBox4: TGroupBox;
    Chart3: TChart;
    Series6: TBubbleSeries;
    Series7: TBubbleSeries;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }  
  end;

const
  N = 20;

var
  Form1: TForm1;
  mas1, mas2, TmpMas : array[1..N] of real;
  dq1, q1, q2 : real;  

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i : integer;
begin
  for i := 1 to N do
    begin
      StringGrid1.Cells[i,0] := IntToStr(i);;
    end;
  StringGrid1.Cells[0,0] := 'i';  
  StringGrid1.Cells[0,1] := 'q1(xi)';
  StringGrid1.Cells[0,2] := 'q2(xi)';

  StringGrid1.Cells[1,1] := '10,4';
  StringGrid1.Cells[2,1] := '2,2';
  StringGrid1.Cells[3,1] := '3,1';
  StringGrid1.Cells[4,1] := '10';
  StringGrid1.Cells[5,1] := '5';
  StringGrid1.Cells[6,1] := '3,2';
  StringGrid1.Cells[7,1] := '2,7';
  StringGrid1.Cells[8,1] := '4';
  StringGrid1.Cells[9,1] := '5,2';
  StringGrid1.Cells[10,1] := '9,1';
  StringGrid1.Cells[11,1] := '3,3';
  StringGrid1.Cells[12,1] := '7,1';
  StringGrid1.Cells[13,1] := '7,4';
  StringGrid1.Cells[14,1] := '8';
  StringGrid1.Cells[15,1] := '10,3';
  StringGrid1.Cells[16,1] := '4,2';
  StringGrid1.Cells[17,1] := '3,8';
  StringGrid1.Cells[18,1] := '1,9';
  StringGrid1.Cells[19,1] := '9';
  StringGrid1.Cells[20,1] := '2';

  StringGrid1.Cells[1,2] := '1,5';
  StringGrid1.Cells[2,2] := '5';
  StringGrid1.Cells[3,2] := '4,4';
  StringGrid1.Cells[4,2] := '9,3';
  StringGrid1.Cells[5,2] := '4';
  StringGrid1.Cells[6,2] := '2,1';
  StringGrid1.Cells[7,2] := '3,3';
  StringGrid1.Cells[8,2] := '6';
  StringGrid1.Cells[9,2] := '1,9';
  StringGrid1.Cells[10,2] := '10';
  StringGrid1.Cells[11,2] := '2,1';
  StringGrid1.Cells[12,2] := '5';
  StringGrid1.Cells[13,2] := '1,1';
  StringGrid1.Cells[14,2] := '2';
  StringGrid1.Cells[15,2] := '4,4';
  StringGrid1.Cells[16,2] := '5,9';
  StringGrid1.Cells[17,2] := '7';
  StringGrid1.Cells[18,2] := '2,2';
  StringGrid1.Cells[19,2] := '6';
  StringGrid1.Cells[20,2] := '3';
end;
//Сортировка пузырьком
procedure BubbleSort;
var i, j : integer;
    c : real;
begin
  for i := 1 to N do
  for j := i+1 to N do
    if TmpMas[i] < TmpMas[j] then
      begin
        c := TmpMas[i];
        TmpMas[i] := TmpMas[j];
        TmpMas[j] := c;
      end;
end;
//Проверка
function Check(j : integer) : bool;
var i : integer;
begin
  result := false;
  for i := 1 to N do
    if TmpMas[j] = StrToFloat(Form1.StringGrid2.Cells[i,2]) then
      result := true;
end;

function GetPq1(j : integer) : real;
begin
  result := abs(StrToFloat(Form1.StringGrid1.Cells[j,1]) - q1)
end;

function GetPq2(j : integer) : real;
begin
  result := abs(StrToFloat(Form1.StringGrid1.Cells[j,2]) - q2)
end;

function GetMax(i : integer) : real;
var j : integer;
    max : real;
begin
  if i = 1 then
    begin
      max := StrToFloat(Form1.StringGrid2.Cells[1,i]);
      for j := 2 to N do
        begin
          if StrToFloat(Form1.StringGrid2.Cells[j,i]) > max then
            max := StrToFloat(Form1.StringGrid2.Cells[j,i])
        end
    end
  else if i = 2 then
    begin
      max := 0;
      for j := 1 to N do
        begin
          if (TmpMas[j] > max) AND (Check(j)) then
            max := TmpMas[j]
        end
    end;
  result := max;
end;

procedure FindSetOfX(i : integer);
var j : integer;
begin
  for j := 1 to N do
    TmpMas[j] := 0;
  for j := 1 to N do
    if (StrToFloat(Form1.StringGrid2.Cells[j,i]) >= RoundTo(GetMax(1) - dq1,-3)) then
      begin
        Form1.Memo1.Lines.Add(Form1.StringGrid2.Cells[j,i]);
        TmpMas[j] := StrToFloat(Form1.StringGrid2.Cells[j,i]);
      end
end;

function FindMinPq1 : integer;
var min : real;
    i, res : integer;
begin
  min := GetPq1(1);
  res := 1;
  for i := 2 to N do
    if GetPq1(i) < min then
      begin
        min := GetPq1(i);
        res := i
      end;
  result := res;
end;

function FindMinPq2 : integer;
var min : real;
    i, res : integer;
begin
  min := GetPq2(1);
  res := 1;
  for i := 2 to N do
    if GetPq2(i) < min then
      begin
        min := GetPq2(i);
        res := i
      end;
  result := res;
end;

procedure Pareto;
var i, j : integer;
    mas11, mas22 : array[1..N] of real;
begin
  for i := 1 to N do
    begin
      mas11[i] := StrToFloat(Form1.StringGrid1.Cells[i,1]);
      mas22[i] := StrToFloat(Form1.StringGrid1.Cells[i,2]);
    end;
    
  for i := 1 to N do
  for j := 1 to N do
    begin
      if i = j then continue;
      if ((mas11[i] < mas11[j]) AND (mas22[i] <= mas22[j])) OR ((mas11[i] <= mas11[j]) AND (mas22[i] < mas22[j])) then
        begin
          mas11[i] := -1;
          mas22[i] := -1;
          break;
        end; 
    end;
  for i := 1 to N do
    if (mas11[i] <> -1) AND (mas22[i] <> -1) then
      Form1.Series7.AddBubble(StrToFloat(Form1.StringGrid1.Cells[i,1]),StrToFloat(Form1.StringGrid1.Cells[i,2]), 0.2);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i : integer;
    Max : real;    
begin
//Очистка
Memo1.Clear;
Memo2.Clear;
Series1.Clear;
Series2.Clear;
Series3.Clear;
Series4.Clear;
Series5.Clear;
Series6.Clear;
Series7.Clear;
//Считываем данные
  for i := 1 to N do
    begin
      mas1[i] := StrToFloat(StringGrid1.Cells[i,1]);
      mas2[i] := StrToFloat(StringGrid1.Cells[i,2]);
    end;
  dq1 := StrToFloat(Edit1.Text);
  q1 := StrToFloat(Edit2.Text);
  q2 := StrToFloat(Edit3.Text);
//Метод уступок
  //Фильтруем по важности
  for i := 1 to N do
    begin
      StringGrid2.Cells[i,0] := IntToStr(i);;
    end;
  StringGrid2.Cells[0,0] := 'i';
  StringGrid2.Cells[0,1] := 'q1(xi)';
  StringGrid2.Cells[0,2] := 'q2(xi)';

  for i := 1 to N do
    TmpMas[i] := Mas1[i]; 
  BubbleSort;
  for i := 1 to n do
    StringGrid2.Cells[i,1] := FloatToStr(TmpMas[i]);

  for i := 1 to N do
    TmpMas[i] := Mas2[i];
  BubbleSort;
  for i := 1 to n do
    StringGrid2.Cells[i,2] := FloatToStr(TmpMas[i]);

  Edit4.Text := Edit1.Text;
  //Выполняем алгоритм метода уступок
  Memo1.Lines.Add('Находим x1:');
  Memo1.Lines.Add('q1(x1) = max[q1(x), X э x] = ' + FloatToStr(GetMax(1)));
  Memo1.Lines.Add('Определяем множество альтернатив X1:');
  FindSetOfX(1);
  Memo1.Lines.Add('_________________________');
  Memo1.Lines.Add('Находим x2:');
  Memo1.Lines.Add('q2(x2) = max[q2(x), X1 э x] = ' + FloatToStr(GetMax(2)));
  //Отображаем результат графически
  for i := 1 to N do
    Series1.AddBubble(StrToFloat(StringGrid1.Cells[i,1]),StrToFloat(StringGrid1.Cells[i,2]), 0.2);
  Series2.AddBubble(10,10, 0.2);
//Решение по уровням притязаний
  Edit5.Text := FloatToStr(q1);
  Edit6.Text := FloatToStr(q2);
  for i := 1 to N do
    Series3.AddBubble(StrToFloat(StringGrid1.Cells[i,1]),StrToFloat(StringGrid1.Cells[i,2]), 0.2);
  Memo2.Lines.Add('Черные точки - все мн-во альтернатив');
  Series4.AddBubble(q1,q2, 0.2);
  Memo2.Lines.Add('Красная точка - желательный выбор');
  Series5.AddBubble(StrToFloat(StringGrid1.Cells[FindMinPq1,1]),StrToFloat(StringGrid1.Cells[FindMinPq2,2]),0.2);
  Memo2.Lines.Add('Зеленая точка - оптимальное решение');
//Множество Парето
  for i := 1 to N do
    Series6.AddBubble(StrToFloat(StringGrid1.Cells[i,1]),StrToFloat(StringGrid1.Cells[i,2]), 0.2);
  Pareto;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  GroupBox2.Visible := true;
  GroupBox3.Visible := false;
  GroupBox4.Visible := false;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  GroupBox2.Visible := false;
  GroupBox3.Visible := true;
  GroupBox4.Visible := false;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  GroupBox2.Visible := false;
  GroupBox3.Visible := false;
  GroupBox4.Visible := true;
end;

end.
