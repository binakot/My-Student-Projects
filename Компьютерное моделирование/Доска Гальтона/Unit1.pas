unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, TeEngine, Series, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    BitBtn2: TBitBtn;
    Chart1: TChart;
    Series1: TBarSeries;
    Label4: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject); 
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Coordinates = Record
    x : integer;
    y : integer;
  end;

var
  Form1: TForm1;
  n : integer; //количество рядом стержней
  D, r : real; //расстояние между стержнями и их радиус  
  Xbegin, Xend, Ybegin, Yend : integer;
  curX, curY : real;
  massXY : array[1..100,1..100] of Coordinates;
  massVal : array[1..100] of integer;
  massPower : array[1..100] of integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Image1.Canvas.Create;
end;

function FindSection(y : integer) : integer;
var i, tmp : integer;
begin
  for i := 1 to n-1 do
    if (y > massVal[i]) and (y < massVal[i+1]) then
      begin
        tmp := i;
        break
      end;
  result := i
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i, j : integer;
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Brush.Color := clWhite; 
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Series1.Clear;

  n := StrToInt(Edit1.Text);
  D := StrToFloat(Edit2.Text);
  r := StrToFloat(Edit3.Text);
  Xbegin := Round(Image1.Width / 2);
  Xend := Round(Image1.Width / 2);
  Ybegin := 50;
  Yend := Round(D * n) + 50;

  //Рисуем стержни
  curX := Xbegin;
  curY := Ybegin;
  Image1.Canvas.Pen.Color := clRed;
  Image1.Canvas.Brush.Color := clRed;
  for i := 1 to n do     //пробег по рядам
  for j := 1 to i do     //проход по стержням ряда
    begin
      Image1.Canvas.Ellipse(Round(curX - r), Round(curY - r), Round(curX + r), Round(curY + r));
      massXY[i,j].x := Round(CurX);
      massXY[i,j].y := Round(CurY);
      if i <> j then
        curX := curX + D
      else
        begin
          curX := Xbegin - i * D / 2;
          curY := curY + D
        end
    end;

  //Рисуем секции
  Image1.Canvas.Pen.Color := clBlack;
  curX := 0;
  curY := Image1.Height;
  for i := 1 to n do
    begin
      Image1.Canvas.MoveTo(Round(curX), Round(curY));
      Image1.Canvas.LineTo(massXY[n,i].x,massXY[n,i].y);
      curX := CurX + Image1.Width / (n - 1)
    end;

  //Рисуем график наполненности секций
  for i := 1 to n do
    Series1.Add(0);

  //Заполняем массив интервалов значений координат для секций
  for i := 1 to n do
    massVal[i] := massXY[n,i].x;  

  //обнуляем массив мощности секций
  for i := 1 to n do
    massPower[i] := 0;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i, NumCol : integer;
    rand : real;
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Brush.Color := clWhite;

  curX := Image1.Width / 2;
  curY := 0;
  NumCol := 1;
  repeat
    Image1.Canvas.Pen.Color := clWhite;
    Image1.Canvas.Brush.Color := clWhite;
    Image1.Canvas.Ellipse(Round(curX - r), Round(curY - r), Round(curX + r), Round(curY + r));

    curY := curY + 1;
    if curY + r = massXY[NumCol,1].y - r then
      begin
        rand := random;
        if rand < 0.5 then
          curX := curX - D/2
        else
          curX := curX + D/2; 
        NumCol := NumCol + 1
      end;

    Image1.Canvas.Pen.Color := clGreen;
    Image1.Canvas.Brush.Color := clGreen;
    Image1.Canvas.Ellipse(Round(curX - r), Round(curY - r), Round(curX + r), Round(curY + r));
    Image1.Refresh;
    Sleep(5);

    if curY > Yend then
      massPower[FindSection(Round(curX))] := massPower[FindSection(Round(curX))] + 1;
    Series1.Clear;
    for i := 1 to n - 1 do
      Series1.Add(massPower[i]);

  until curY > Yend;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var i, j, NumCol : integer;
    rand : real;
begin

  //обнуляем массив мощности секций
  for i := 1 to n do
    massPower[i] := 0;

  for i := 1 to StrToInt(Edit4.Text) do
    begin

      curX := Image1.Width / 2;
      curY := 0;
      NumCol := 1;

      repeat
        curY := curY + 1;
        
        if curY + r = massXY[NumCol,1].y - r then
          begin
            rand := random;
            if rand < 0.5 then
              curX := curX - D/2
            else
              curX := curX + D/2;
            NumCol := NumCol + 1
          end;

        if curY > Yend then
          massPower[FindSection(Round(curX))] := massPower[FindSection(Round(curX))] + 1;
      until curY > Yend;

    end;

    Series1.Clear;
    for j := 1 to n - 1 do
      Series1.Add(massPower[j]);
    Series1.RefreshSeries
end;

end.
