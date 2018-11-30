unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    StringGrid1: TStringGrid;
    Label14: TLabel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Label15: TLabel;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;

  StringGrid1.Cells[0,1] := 'Из S0';
  StringGrid1.Cells[0,2] := 'Из S1';
  StringGrid1.Cells[0,3] := 'Из S2';
  StringGrid1.Cells[0,4] := 'Из S3';
  StringGrid1.Cells[1,0] := 'В S0';
  StringGrid1.Cells[2,0] := 'В S1';
  StringGrid1.Cells[3,0] := 'В S2';
  StringGrid1.Cells[4,0] := 'В S3';
  StringGrid1.Cells[5,0] := 'Проверка';
  //Из всех в S0
  StringGrid1.Cells[1,1] := '0,25';   //Станок простаивает
  StringGrid1.Cells[1,2] := '0,3';    //Обрабокта завершена, станок освобождается
  StringGrid1.Cells[1,3] := '0';      //Заменив инструмент станок освободился
  StringGrid1.Cells[1,4] := '0,8';    //Станок отремонтирован, готов к работе
  //Из всех в S1
  StringGrid1.Cells[2,1] := '0';      //Начало работы на станке без инструмента
  StringGrid1.Cells[2,2] := '0,5';    //Процесс работы на стонке, занят
  StringGrid1.Cells[2,3] := '0,8';    //Замена иструмента, станок занят
  StringGrid1.Cells[2,4] := '0';      //Станок отремонтирован и выполняет работу
  //Из всех в S2
  StringGrid1.Cells[3,1] := '0,75';   //Станок был свободен, замена инструмента
  StringGrid1.Cells[3,2] := '0';      //Замена инструмента при обработке другого
  StringGrid1.Cells[3,3] := '0,2';    //Процесс замены иструмента
  StringGrid1.Cells[3,4] := '0';      //Не исправен, идет замена инструмента
  //Из всех в S3
  StringGrid1.Cells[4,1] := '0';      //Поломка станка без причин
  StringGrid1.Cells[4,2] := '0,2';    //Процесс работы на стонке, поломка
  StringGrid1.Cells[4,3] := '0';      //Замена иструмента при поломке
  StringGrid1.Cells[4,4] := '0,2';    //Процесс ремонта
  //Проверка
  StringGrid1.Cells[5,1] := FloatToStr(StrToFloat(StringGrid1.Cells[1,1]) + StrToFloat(StringGrid1.Cells[2,1]) + StrToFloat(StringGrid1.Cells[3,1]) + StrToFloat(StringGrid1.Cells[4,1]));
  StringGrid1.Cells[5,2] := FloatToStr(StrToFloat(StringGrid1.Cells[1,2]) + StrToFloat(StringGrid1.Cells[2,2]) + StrToFloat(StringGrid1.Cells[3,2]) + StrToFloat(StringGrid1.Cells[4,2]));
  StringGrid1.Cells[5,3] := FloatToStr(StrToFloat(StringGrid1.Cells[1,3]) + StrToFloat(StringGrid1.Cells[2,3]) + StrToFloat(StringGrid1.Cells[3,3]) + StrToFloat(StringGrid1.Cells[4,3]));
  StringGrid1.Cells[5,4] := FloatToStr(StrToFloat(StringGrid1.Cells[1,4]) + StrToFloat(StringGrid1.Cells[2,4]) + StrToFloat(StringGrid1.Cells[3,4]) + StrToFloat(StringGrid1.Cells[4,4]));
end;

function NextStatus(CurStatus : integer; S0, S1, S2, S3 : real) : integer;
var cur : real;
begin
  cur := Random;
  if cur < S0 then
    result := 0
  else if cur < s1 + s0 then
    result := 1
  else if cur < s2 + s1 + s0 then
    result := 2
  else
    result := 3;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var s0, s1, s2, s3 : real;
    i, curStatus, prevStatus : integer;
begin
  Memo1.Clear;

  curStatus := 0;
  s0 := StrToFloat(Edit1.Text);
  s1 := StrToFloat(Edit2.Text);
  s2 := StrToFloat(Edit3.Text);
  s3 := StrToFloat(Edit4.Text);
  prevStatus := curStatus;
  curStatus := NextStatus(curStatus, s0, s1, s2, s3);
  Memo1.Lines.Add('Предыдущее состояние: ' + IntToStr(prevStatus));
  Memo1.Lines.Add('Текущее состояние: ' + IntToStr(curStatus));
  Memo1.Lines.Add('------------------------------');

  for i := 1 to StrToInt(Edit5.Text) do
    begin
      prevStatus := curStatus;
      if curStatus = 0 then
        begin
          s0 := StrToFloat(StringGrid1.Cells[1,1]);
          s1 := StrToFloat(StringGrid1.Cells[2,1]);
          s2 := StrToFloat(StringGrid1.Cells[3,1]);
          s3 := StrToFloat(StringGrid1.Cells[4,1])
        end
      else if curStatus = 1 then
        begin
          s0 := StrToFloat(StringGrid1.Cells[1,2]);
          s1 := StrToFloat(StringGrid1.Cells[2,2]);
          s2 := StrToFloat(StringGrid1.Cells[3,2]);
          s3 := StrToFloat(StringGrid1.Cells[4,2])
        end
      else if CurStatus = 2 then
        begin
          s0 := StrToFloat(StringGrid1.Cells[1,3]);
          s1 := StrToFloat(StringGrid1.Cells[2,3]);
          s2 := StrToFloat(StringGrid1.Cells[3,3]);
          s3 := StrToFloat(StringGrid1.Cells[4,3])
        end
      else
        begin
          s0 := StrToFloat(StringGrid1.Cells[1,4]);
          s1 := StrToFloat(StringGrid1.Cells[2,4]);
          s2 := StrToFloat(StringGrid1.Cells[3,4]);
          s3 := StrToFloat(StringGrid1.Cells[4,4])
        end;
      curStatus := NextStatus(curStatus, s0, s1, s2, s3);
      Memo1.Lines.Add('Предыдущее состояние: ' + IntToStr(prevStatus));
      Memo1.Lines.Add('Текущее состояние: ' + IntToStr(curStatus));
      Memo1.Lines.Add('------------------------------');
    end;
    
end;

end.
