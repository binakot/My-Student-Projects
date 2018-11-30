unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls, Grids;

type
  TForm1 = class(TForm)
    SG1: TStringGrid;
    SG2: TStringGrid;
    grp1: TGroupBox;
    EditOfCount: TEdit;
    xpmnfst1: TXPManifest;
    EditOfX: TEdit;
    lbl1: TLabel;
    EditOfAccuracy: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure EditOfCountKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n:integer;
  Xn,E:Real;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  n:=5;
  with SG1 do
    begin
      Cells[1,0]:='X(i)';
      Cells[2,0]:='Y(i)';
      Cells[1,1]:='0';
      Cells[2,1]:='0';
      Cells[1,2]:='3';
      Cells[2,2]:='9';
      Cells[1,3]:='6';
      Cells[2,3]:='36';
      Cells[1,4]:='7';
      Cells[2,4]:='49';
      Cells[1,5]:='10';
      Cells[2,5]:='100';
      Cells[1,6]:='11';
      Cells[2,6]:='121';
      for i:=1 to n do
        Cells[0,i]:=IntToStr(i);
    end;
  with SG2 do
    begin
      Cells[1,0]:='x(i)';
      Cells[2,0]:='y(i)';
      Cells[3,0]:='x(i)-x';
      Cells[4,0]:='L(i-1,i)';
    end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var x,y,
    LPrev,LCur,Dl,
    buf: array [0..100] of Real;
    Result: real;
    i,j:integer;
    Str: string;
begin
  n:=StrToInt(EditOfCount.Text);      //кол-во узлов
  Xn:=strtofloat(EditOfX.Text);       //в какой точке искать значение функции
  E:=strtofloat(EditOfAccuracy.Text); //точность

  for i:=0 to n-1 do      //считываем таблично заданную функцию
    begin
      x[i]:=strtofloat(SG1.Cells[1,i+1]);
      y[i]:=strtofloat(SG1.Cells[2,i+1]);
    end;

  for i:=0 to n-1 do     //получаем столбец x0-Xn
    begin
      Dl[i]:=x[i]-Xn;
    end;

  for i:=0 to n-1 do      //L(i,i+1)[Xn]
    begin
      LCur[i]:=(Y[i]*Dl[i+1]-Y[i+1]*Dl[i])/(x[i+1]-x[i]);
    end;

  with SG2 do
    begin
      Cells[0,0]:='i';
      Cells[0,1]:='0';
      Cells[0,2]:='1';
      Cells[1,1]:=FloatToStr(x[0]);
      Cells[1,2]:=FloatToStr(x[1]);
      Cells[2,1]:=FloatToStr(y[0]);
      Cells[2,2]:=FloatToStr(y[1]);
      Cells[3,1]:=FloatToStr(Dl[0]);
      Cells[3,2]:=FloatToStr(Dl[1]);
      Cells[4,2]:=FloatToStr(LCur[0]);
    end;

  i:=1;
  repeat
    inc(i);     //увеличеваем шаг
    LPrev:=LCur;
    LCur:=buf;
    x[i]:=StrToFloat(SG1.Cells[1,i+1]);
    y[i]:=StrToFloat(SG1.Cells[2,i+1]);
    Dl[i]:=x[i]-Xn;   //получаем столбец x0-Xn

    LCur[0]:=(y[i-1]*Dl[i]-y[i]*Dl[i-1])/(x[i]-x[i-1]);  //L(i,i+1)[Xn]

    for j:=1 to i-1 do
      LCur[j]:=(LPrev[j-1]*Dl[i]-LCur[j-1]*Dl[i-(j+1)])/(x[i]-x[i-(j+1)]);   //Ln[Xn]

    SG2.RowCount:=SG2.RowCount+1;
    SG2.ColCount:=SG2.ColCount+1;
    str:='L(';
    for j:=i downto 1 do
      str:=str+'i-'+inttostr(j)+',';
    str:=str+'i)';
    SG2.Cells[i+3,0]:=str;

    with SG2 do
      begin
        Cells[0,i+1]:=FloatToStr(i);
        Cells[1,i+1]:=FloatToStr(x[i]);
        Cells[2,i+1]:=FloatToStr(y[i]);
        Cells[3,i+1]:=FloatToStr(Dl[i]);
      end;

    for j:=0 to i-1 do
      SG2.Cells[j+4,i+1]:=FloatToStr(LCur[j]);
  until ((abs(LPrev[i-2]-LCur[i-1])<=E) or (i+1<n));
  result:=LCur[i-1];
end;

procedure TForm1.EditOfCountKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i: integer;
begin
  SG1.RowCount:=strtoint(EditOfCount.Text) + 1;
  for i:=1 to (strtoint(EditOfCount.Text) + 1) do
    SG1.Cells[0,i]:=inttostr(i);
end;

end.
