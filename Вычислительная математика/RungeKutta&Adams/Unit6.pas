unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Grids, data, RungeKutta, PrKr, Eiler, Adams, math,
  StdCtrls, Buttons;

type
  TForm6 = class(TForm)
    XPManifest1: TXPManifest;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox; 
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1;

var curH: extended;

{$R *.dfm}

procedure TForm6.BitBtn1Click(Sender: TObject);
var i: integer;
    time1, time2: longint;
    x,y,
    k1,k2,k3,k4: extended;
    going: boolean;
begin
  with StringGrid1 do
    begin
      RowCount:=1;
      Cells[0,0]:= 'Метод';
      Cells[1,0]:= 'Порядок';
      Cells[2,0]:= 'Шаг';
      Cells[3,0]:= 'Погрешность';
      Cells[4,0]:= 'Итерация';
      Cells[5,0]:= 'Время'
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  while going do
    begin
      going:= RungeKutta3ConstStep(k1, k2, k3, x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,1]:= 'Рунге-Кутты';
      Cells[1,1]:= '3';
      Cells[2,1]:= FloatToStr(curH);
      Cells[3,1]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,1]:= FloatToStr(i);
      Cells[5,1]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  while going do
    begin
      going:= RungeKutta3AutoStep(k1, k2, k3, x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,2]:= 'Рунге-Кутты';
      Cells[1,2]:= '3';
      Cells[2,2]:= 'Авто';
      Cells[3,2]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,2]:= FloatToStr(i);
      Cells[5,2]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  while going do
    begin
      going:= RungeKutta4ConstStep(k1, k2, k3, k4, x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,3]:= 'Рунге-Кутты';
      Cells[1,3]:= '4';
      Cells[2,3]:= FloatToStr(curH);
      Cells[3,3]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,3]:= FloatToStr(i);
      Cells[5,3]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  while going do
    begin
      going:= RungeKutta4AutoStep(k1, k2, k3, k4, x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,4]:= 'Рунге-Кутты';
      Cells[1,4]:= '4';
      Cells[2,4]:= 'Авто';
      Cells[3,4]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,4]:= FloatToStr(i);
      Cells[5,4]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  going:=true;
  Adams3Help(x, y);
  Adams3Help(x, y);
  i:=4;
  while going do
    begin
      going:= Adams3ConstStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,5]:= 'Адамса';
      Cells[1,5]:= '3';
      Cells[2,5]:= FloatToStr(curH);
      Cells[3,5]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,5]:= FloatToStr(i);
      Cells[5,5]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  Adams3Help(x, y);
  Adams3Help(x, y);
  while going do
    begin
      going:= Adams3AutoStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,6]:= 'Адамса';
      Cells[1,6]:= '3';
      Cells[2,6]:= 'Авто';
      Cells[3,6]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,6]:= FloatToStr(i);
      Cells[5,6]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  going:=true;
  Adams4Help(x, y);
  Adams4Help(x, y);
  i:=6;
  while going do
    begin
      going:= Adams4ConstStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,7]:= 'Адамса';
      Cells[1,7]:= '4';
      Cells[2,7]:= FloatToStr(curH);
      Cells[3,7]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,7]:= FloatToStr(i);
      Cells[5,7]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  Adams4Help(x, y);
  Adams4Help(x, y);
  while going do
    begin
      going:= Adams4AutoStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,8]:= 'Адамса';
      Cells[1,8]:= '4';
      Cells[2,8]:= 'Авто';
      Cells[3,8]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,8]:= FloatToStr(i);
      Cells[5,8]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  going:=true;
  Adams3Help(x, y);
  Adams3Help(x, y);
  i:=4;
  while going do
    begin
      going:= PrKr3ConstStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,9]:= 'Прог. и кор.';
      Cells[1,9]:= '3';
      Cells[2,9]:= FloatToStr(curH);
      Cells[3,9]:= FloatToStr(RoundTo(abs(res-kr),-18));
      Cells[4,9]:= FloatToStr(i);
      Cells[5,9]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  Adams3Help(x, y);
  Adams3Help(x, y);
  while going do
    begin
      going:= PrKr3AutoStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,10]:= 'Прог. и кор.';
      Cells[1,10]:= '3';
      Cells[2,10]:= 'Авто';
      Cells[3,10]:= FloatToStr(RoundTo(abs(res-kr),-18));
      Cells[4,10]:= FloatToStr(i);
      Cells[5,10]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  going:=true;
  Adams4Help(x, y);
  Adams4Help(x, y);
  i:=6;
  while going do
    begin
      going:= PrKr4ConstStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,11]:= 'Прог. и кор.';
      Cells[1,11]:= '4';
      Cells[2,11]:= FloatToStr(curH);
      Cells[3,11]:= FloatToStr(RoundTo(abs(res-kr),-18));
      Cells[4,11]:= FloatToStr(i);
      Cells[5,11]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  Adams4Help(x, y);
  Adams4Help(x, y);
  while going do
    begin
      going:= PrKr4AutoStep(x, y);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,12]:= 'Прог. и кор.';
      Cells[1,12]:= '4';
      Cells[2,12]:= 'Авто';
      Cells[3,12]:= FloatToStr(RoundTo(abs(res-kr),-18));
      Cells[4,12]:= FloatToStr(i);
      Cells[5,12]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  while going do
    begin
      going:= EilerConstStep(x, y, 3);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,13]:= 'Мод. Эйлера';
      Cells[1,13]:= '3';
      Cells[2,13]:= FloatToStr(curH);
      Cells[3,13]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,13]:= FloatToStr(i);
      Cells[5,13]:= IntToStr(time2-time1);
    end;
//------------------------------------------------------------------
  StringGrid1.RowCount:= StringGrid1.RowCount + 1;
  time1:= GetTickCount;
  x:= x0;
  y:= y0;
  h:= curH;
  i:= 0;
  going:=true;
  while going do
    begin
      going:= EilerConstStep(x, y, 4);
      inc(i)
    end;
  time2:= GetTickCount;

  with StringGrid1 do
    begin
      Cells[0,14]:= 'Мод. Эйлера';
      Cells[1,14]:= '4';
      Cells[2,14]:= FloatToStr(curH);
      Cells[3,14]:= FloatToStr(RoundTo(abs(res-y),-18));
      Cells[4,14]:= FloatToStr(i);
      Cells[5,14]:= IntToStr(time2-time1);
    end;
end;
//------------------------------------------------------------------
procedure TForm6.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  eps:= StrToFloat(Edit1.Text);
end;
//------------------------------------------------------------------
procedure TForm6.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  curH:= StrToFloat(Edit2.Text);
end;
//------------------------------------------------------------------
procedure TForm6.FormCreate(Sender: TObject);
begin
  eps:= StrToFloat(Edit1.Text);
  curH:= StrToFloat(Edit2.Text);
end;

end.
