unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Grids, StdCtrls, Buttons, data, math, Eiler;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    XPManifest2: TXPManifest;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
    begin
      Cells[0,0]:= 'i';
      Cells[1,0]:= 'X';
      Cells[2,0]:= 'Y';
      Cells[3,0]:= 'Y''';
    end;
end;
//Решаем
procedure TForm5.BitBtn1Click(Sender: TObject);
var x,y: extended;
    going: boolean;
    i: integer;
begin
  i:= 0;        //шаг = 0
  x:= x0;       //переменная x из начального условия
  y:= y0;       //переменная y из начального условия
  //получаем шаг
  h:= strtofloat(edit1.text);
  going:= true;          //продолжаем процесс

  if (RadioButton1.Checked) then        //если 3 порядок
  begin
    ClearGrid(StringGrid1);
    StringGrid1.RowCount:= 2;
    StringGrid1.Cells[0,1]:= FloatToStr(0);
    StringGrid1.Cells[1,1]:= FloatToStr(x);
    StringGrid1.Cells[2,1]:= FloatToStr(y);
    StringGrid1.Cells[3,1]:= FloatToStr(GetF(x,y));
    i:= 1;
    while (going) do     //начинаем процесс
      begin
        going:= EilerConstStep(x, y, 3);
        StringGrid1.Cells[0,i+1]:= IntToStr(i);
        StringGrid1.Cells[1,i+1]:= FloatToStr(x);
        StringGrid1.Cells[2,i+1]:= FloatToStr(y);
        StringGrid1.Cells[3,i+1]:= FloatToStr(GetF(x,y));
        inc(i);
        StringGrid1.RowCount:= i + 1
      end;
    StringGrid1.RowCount := StringGrid1.RowCount + 2;
    StringGrid1.Cells[1,i+1]:= 'Проверка:';
    StringGrid1.Cells[2,i+1]:= 'Yn = ';
    StringGrid1.Cells[3,i+1]:= FloatToStr(res);
    StringGrid1.Cells[2,i+2]:= 'Yn - Y = ';
    StringGrid1.Cells[3,i+2]:= FloatToStr(RoundTo(abs(res-y),-18))
  end
  else
  if (RadioButton2.Checked) then        //если 4 порядок
  begin
    ClearGrid(StringGrid1);
    StringGrid1.RowCount:= 2;
    StringGrid1.Cells[0,1]:= FloatToStr(0);
    StringGrid1.Cells[1,1]:= FloatToStr(x);
    StringGrid1.Cells[2,1]:= FloatToStr(y);
    StringGrid1.Cells[3,1]:= FloatToStr(GetF(x,y));
    i:= 1;
    while (going) do     //начинаем процесс
      begin
        going:= EilerConstStep(x, y, 4);
        StringGrid1.Cells[0,i+1]:= IntToStr(i);
        StringGrid1.Cells[1,i+1]:= FloatToStr(x);
        StringGrid1.Cells[2,i+1]:= FloatToStr(y);
        StringGrid1.Cells[3,i+1]:= FloatToStr(GetF(x,y));
        inc(i);
        StringGrid1.RowCount:= i + 1
      end;
    StringGrid1.RowCount := StringGrid1.RowCount + 2;
    StringGrid1.Cells[1,i+1]:= 'Проверка:';
    StringGrid1.Cells[2,i+1]:= 'Yn = ';
    StringGrid1.Cells[3,i+1]:= FloatToStr(res);
    StringGrid1.Cells[2,i+2]:= 'Yn - Y = ';
    StringGrid1.Cells[3,i+2]:= FloatToStr(RoundTo(abs(res-y),-18))
  end
end;

end.
