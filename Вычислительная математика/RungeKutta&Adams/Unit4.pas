unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Grids, Buttons, StdCtrls, data, Adams, PrKr, math;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    XPManifest1: TXPManifest;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject); 
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject); 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
    begin
      Cells[0,0]:= 'i';
      Cells[1,0]:= 'X';
      Cells[2,0]:= 'Прогноз Y0';
      Cells[3,0]:= 'Коррекция Y';
      Cells[4,0]:= 'Y''';
    end;
end;
//АвтоШаг
procedure TForm4.RadioButton3Click(Sender: TObject);
begin
  edit1.visible:= false;
  label1.Visible:= false;
end;
//Постоянный шаг
procedure TForm4.RadioButton4Click(Sender: TObject);
begin
  edit1.Text:= '0,001';      //Шаг по умолчанию
  edit1.visible:= true;
  label1.Visible:= true;
end;
//Решаем
procedure TForm4.BitBtn1Click(Sender: TObject);
var k1,k2,k3,k4,x,y: extended;
    going: boolean;
    i: integer;
begin
  i:= 0;        //шаг = 0
  x:= x0;       //переменная x из начального условия
  y:= y0;       //переменная y из начального условия
  //получаем шаг
  if radiobutton3.Checked then
    h:= 0.001
  else
    h:= strtofloat(edit1.text);
  going:= true;          //продолжаем процесс

  if (RadioButton1.Checked) then        //если 3 порядок
  begin
    if (RadioButton4.Checked) then          //если постоянный шаг
    begin
      ClearGrid(StringGrid1);
      StringGrid1.RowCount:= 3;
      StringGrid1.Cells[0,1]:= FloatToStr(0);
      StringGrid1.Cells[1,1]:= FloatToStr(x);
      StringGrid1.Cells[2,1]:= FloatToStr(y);
      StringGrid1.Cells[4,1]:= FloatToStr(GetF(x,y));
      Adams3Help(x, y);
      StringGrid1.Cells[0,2]:= FloatToStr(1);
      StringGrid1.Cells[1,2]:= FloatToStr(x);
      StringGrid1.Cells[2,2]:= FloatToStr(y);
      StringGrid1.Cells[4,2]:= FloatToStr(GetF(x,y));
      Adams3Help(x, y);
      StringGrid1.Cells[0,3]:= FloatToStr(2);
      StringGrid1.Cells[1,3]:= FloatToStr(x);
      StringGrid1.Cells[2,3]:= FloatToStr(y);
      StringGrid1.Cells[4,3]:= FloatToStr(GetF(x,y));
      i:= 3;
      while (going) do     //начинаем процесс
        begin
          going:= PrKr3ConstStep(x, y);
          StringGrid1.Cells[0,i+1]:= IntToStr(i);
          StringGrid1.Cells[1,i+1]:= FloatToStr(x);
          StringGrid1.Cells[2,i+1]:= FloatToStr(pr);
          StringGrid1.Cells[3,i+1]:= FloatToStr(kr);
          StringGrid1.Cells[4,i+1]:= FloatToStr(GetF(x,kr));
          inc(i);
          StringGrid1.RowCount:= i + 1
        end;
      StringGrid1.RowCount := StringGrid1.RowCount + 2;
      StringGrid1.Cells[1,i+1]:= 'Проверка:';
      StringGrid1.Cells[2,i+1]:= 'Yn = ';
      StringGrid1.Cells[3,i+1]:= FloatToStr(res);
      StringGrid1.Cells[2,i+2]:= 'Yn - Y = ';
      StringGrid1.Cells[3,i+2]:= FloatToStr(RoundTo(abs(res-kr),-18))
    end
    else
    if (RadioButton3.Checked) then          //если автоматический шаг
      begin
        ClearGrid(StringGrid1);
        StringGrid1.RowCount:= 3;
        //используем метод Рунге-Кутта для получения первых 3 приближений
        StringGrid1.Cells[0,1]:= FloatToStr(0);
        StringGrid1.Cells[1,1]:= FloatToStr(x);
        StringGrid1.Cells[2,1]:= FloatToStr(y);
        StringGrid1.Cells[4,1]:= FloatToStr(GetF(x,y));
        Adams3Help(x, y);
        StringGrid1.Cells[0,2]:= FloatToStr(1);
        StringGrid1.Cells[1,2]:= FloatToStr(x);
        StringGrid1.Cells[2,2]:= FloatToStr(y);
        StringGrid1.Cells[4,2]:= FloatToStr(GetF(x,y));
        Adams3Help(x, y);
        StringGrid1.Cells[0,3]:= FloatToStr(2);
        StringGrid1.Cells[1,3]:= FloatToStr(x);
        StringGrid1.Cells[2,3]:= FloatToStr(y);
        StringGrid1.Cells[4,3]:= FloatToStr(GetF(x,y));
        i:= 3;
        while (going) do     //начинаем процесс
          begin
            going:= PrKr3AutoStep(x, y);
            StringGrid1.Cells[0,i+1]:= IntToStr(i);
            StringGrid1.Cells[1,i+1]:= FloatToStr(x);
            StringGrid1.Cells[2,i+1]:= FloatToStr(pr);
            StringGrid1.Cells[3,i+1]:= FloatToStr(kr);
            StringGrid1.Cells[4,i+1]:= FloatToStr(GetF(x,kr));
            inc(i);
            StringGrid1.RowCount:= i + 1
          end;
        StringGrid1.RowCount := StringGrid1.RowCount + 2;
        StringGrid1.Cells[1,i+1]:= 'Проверка:';
        StringGrid1.Cells[2,i+1]:= 'Yn = ';
        StringGrid1.Cells[3,i+1]:= FloatToStr(res);
        StringGrid1.Cells[2,i+2]:= 'Yn - Y = ';
        StringGrid1.Cells[3,i+2]:= FloatToStr(RoundTo(abs(res-kr),-18))
      end
  end
  else
  if (RadioButton2.Checked) then        //если 4 порядок
  begin
    if (RadioButton4.Checked) then          //если постоянный шаг
    begin
      ClearGrid(StringGrid1);
      StringGrid1.RowCount:= 3;
      //используем метод Рунге-Кутта для получения первых 3 приближений
      StringGrid1.Cells[0,1]:= FloatToStr(0);
      StringGrid1.Cells[1,1]:= FloatToStr(x);
      StringGrid1.Cells[2,1]:= FloatToStr(y);
      StringGrid1.Cells[4,1]:= FloatToStr(GetF(x,y));
      Adams4Help(x, y);
      StringGrid1.Cells[0,2]:= FloatToStr(1);
      StringGrid1.Cells[1,2]:= FloatToStr(x);
      StringGrid1.Cells[2,2]:= FloatToStr(y);
      StringGrid1.Cells[4,2]:= FloatToStr(GetF(x,y));
      Adams4Help(x, y);
      StringGrid1.Cells[0,3]:= FloatToStr(2);
      StringGrid1.Cells[1,3]:= FloatToStr(x);
      StringGrid1.Cells[2,3]:= FloatToStr(y);
      StringGrid1.Cells[4,3]:= FloatToStr(GetF(x,y));
      i:= 3;
      while (going) do        //начинаем процесс
        begin
          going:= PrKr4ConstStep(x, y);
          StringGrid1.Cells[0,i+1]:= IntToStr(i);
          StringGrid1.Cells[1,i+1]:= FloatToStr(x);
          StringGrid1.Cells[2,i+1]:= FloatToStr(pr);
          StringGrid1.Cells[3,i+1]:= FloatToStr(kr);
          StringGrid1.Cells[4,i+1]:= FloatToStr(GetF(x,kr));
          inc(i);
          StringGrid1.RowCount:= i + 1
        end;
      StringGrid1.RowCount := StringGrid1.RowCount + 2;
      StringGrid1.Cells[1,i+1]:= 'Проверка:';
      StringGrid1.Cells[2,i+1]:= 'Yn = ';
      StringGrid1.Cells[3,i+1]:= FloatToStr(res);
      StringGrid1.Cells[2,i+2]:= 'Yn - Y = ';
      StringGrid1.Cells[3,i+2]:= FloatToStr(RoundTo(abs(res-kr),-18))
    end
    else
    if (RadioButton3.Checked) then          //если автоматический шаг
      begin
        ClearGrid(StringGrid1);
        StringGrid1.RowCount:= 3;
        //используем метод Рунге-Кутта для получения первых 3 приближений
        StringGrid1.Cells[0,1]:= FloatToStr(0);
        StringGrid1.Cells[1,1]:= FloatToStr(x);
        StringGrid1.Cells[2,1]:= FloatToStr(y);
        StringGrid1.Cells[4,1]:= FloatToStr(GetF(x,y));
        Adams4Help(x, y);
        StringGrid1.Cells[0,2]:= FloatToStr(1);
        StringGrid1.Cells[1,2]:= FloatToStr(x);
        StringGrid1.Cells[2,2]:= FloatToStr(y);
        StringGrid1.Cells[4,2]:= FloatToStr(GetF(x,y));
        Adams4Help(x, y);
        StringGrid1.Cells[0,3]:= FloatToStr(2);
        StringGrid1.Cells[1,3]:= FloatToStr(x);
        StringGrid1.Cells[2,3]:= FloatToStr(y);
        StringGrid1.Cells[4,3]:= FloatToStr(GetF(x,y));
        i:= 3;
        while (going) do      //начинаем процесс
          begin
            going:= PrKr4AutoStep(x, y);
            StringGrid1.Cells[0,i+1]:= IntToStr(i);
            StringGrid1.Cells[1,i+1]:= FloatToStr(x);
            StringGrid1.Cells[2,i+1]:= FloatToStr(pr);
            StringGrid1.Cells[3,i+1]:= FloatToStr(kr);
            StringGrid1.Cells[4,i+1]:= FloatToStr(GetF(x,kr));
            inc(i);
            StringGrid1.RowCount:= i + 1
          end;
        StringGrid1.RowCount := StringGrid1.RowCount + 2;
        StringGrid1.Cells[1,i+1]:= 'Проверка:';
        StringGrid1.Cells[2,i+1]:= 'Yn = ';
        StringGrid1.Cells[3,i+1]:= FloatToStr(res);
        StringGrid1.Cells[2,i+2]:= 'Yn - Y = ';
        StringGrid1.Cells[3,i+2]:= FloatToStr(RoundTo(abs(res-kr),-18))
      end
  end
end;

end.
