unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    Image1: TImage;
    function GetF(x,y: real): real;
    function GetdFdX(x,y:real):real;
    function GetdFdY(x,y:real):real;
    function GetH(x,y,h:real):real;
    function GoldSelect(x,y:real; a,b:real):real;
    procedure BitBtn1Click(Sender: TObject);
    function GlobalMin(x,y:real; a,b: real):real;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  eps,a,b,x0,y0: real;
  MinMas: array[1..100000] of real;

implementation

{$R *.dfm}

function TForm1.GetF(x,y: real): real;
var value: real;
begin
  Value:=sqr(x)/4+sqr(y)/36; 
  result:=value;
end;

function TForm1.GetdFdX(x,y:real):real;
var value, dx: real;
begin
  dx:=eps/10;
  value:=(GetF(x+dx,y)-GetF(x,y))/dx;
  result:=value;
end;

function TForm1.GetdFdY(x,y:real):real;
var value, dy: real;
begin
  dy:=eps/10;
  value:=(GetF(x,y+dy)-GetF(x,y))/dy;
  result:=value;
end;

function TForm1.GetH(x,y,h:real):real;
var value: real;
begin
  Value:=GetF(x-h*GetdFdX(x,y),y-h*GetdFdY(x,y));
  result:=value;
end;

function TForm1.GoldSelect(x,y:real; a,b:real):real;
var value,x1,x2,y1,y2,t,a1,b1:real;
begin
  a1:=a;
  b1:=b;
  t:=(-1+sqrt(5))/2;  //находим t для золотого сечения
  x1:=b1-t*(b1-a1);   //находим х1, х2
  x2:=a1+t*(b1-a1);   //по формулам
  y1:=GetH(x,y,x1);   //находим значение функции Н
  y2:=GetH(x,y,x2);   //в этих точках
    repeat
      if y1>y2 then
        begin
          a1:=x1;      //для дальнейшего деления
          x1:=x2;     //оставляем (х1,b)
          y1:=y2;
          x2:=a1+t*(b1-a1);   //находим новый x2
          y2:=GetH(x,y,x2);
        end
      else
        begin
          b1:=x2;      //иначе оставляем
          x2:=x1;     //(a,x2)
          y2:=y1;
          x1:=b1-t*(b1-a1);   //находим новый x1
          y1:=GetH(x,y,x1);
        end;
    until (b1-a1)<eps;    //продолжаем пока длина интервала не будет меньше точности

  value:=(a1+b1)/2;    //результатом берем середину последнего промежутка
  result:=value;
end;

function TForm1.GlobalMin(x,y:real; a,b:real):real;
var h1,min1,min2,minH,
    a1,
    y1,y2,y3,
    value:real;
    i,n:integer;
begin
  h1:=10*eps;  //шаг берем равный 10*точность
  a1:=a;       //начинаем с левой границе
  i:=0;
  repeat                 //помещаем все ямы в массив
     y1:= GetH(x,y,a1);
     y2:= GetH(x,y,a1+h1);
     y3:= GetH(x,y,a1+2*h1);
     if (y1>y2)and(y2<y3) then
       begin
         i:=i+1;
         MinMas[i]:=a1+h1
       end;
     a1:=a1+h1;
  until a1>=b;
  n:=i;   //кол-во найденных ям

  minH:=a1+h1;
  min1:=GoldSelect(x,y,minH-h1,minH+h1);

  for i:=1 to n do
    begin
      min2:=GoldSelect(x,y,MinMas[i]-h1,MinMas[i]+h1);
      if min2<min1 then min1:=min2;
    end;

  value:=min1;
  Result:=value;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i:integer;
    h,x,y: real;
begin
  RichEdit1.Clear;
  a:=StrToFloat(Edit2.Text);
  b:=StrToFloat(Edit3.Text);
  eps:=strtofloat(edit1.Text)/10;
  x0:=strtofloat(edit4.Text);
  y0:=strtofloat(edit5.Text);
  RichEdit1.Lines.Add('Начальное приближение: x0 = '+floattostr(x0)+', y0 = '+floattostr(y0));
  RichEdit1.Lines.Add('eps = '+floattostr(eps));
  i:=0;
  repeat
    inc(i);
    RichEdit1.Lines.Add('________________'+inttostr(i)+'-й спуск _________________');

    h:=GlobalMin(x0,y0,a,b);
    RichEdit1.Lines.Add('   h = '+floattostr(h));

    x:=x0-h*GetdFdX(x0,y0);
    y:=y0-h*GetdFdY(x0,y0);

    if GetF(x,y)<GetF(x0,y0) then
      begin
        x0:=x;
        y0:=y;
      end;

    RichEdit1.Lines.Add('   x = '+floattostr(x0));
    RichEdit1.Lines.Add('   y = '+floattostr(y0));
    RichEdit1.Lines.Add('   F(x,y) = '+floattostr(GetF(x0,y0)))
  until sqrt(sqr(GetdFdX(x0,y0))+sqr(GetdFdY(x0,y0)))<eps;

  RichEdit1.Lines.Add('________________'+inttostr(i+1)+'-й спуск _________________');
  h:=GlobalMin(x0,y0,a,b);
  RichEdit1.Lines.Add('   h = '+floattostr(h));
  x:=x0-h*GetdFdX(x0,y0);
  y:=y0-h*GetdFdY(x0,y0);
  if GetF(x,y)<GetF(x0,y0) then
    begin
      x0:=x;
      y0:=y;
    end;
  RichEdit1.Lines.Add('   x = '+floattostr(x0));
  RichEdit1.Lines.Add('   y = '+floattostr(y0));
  RichEdit1.Lines.Add('   F(x,y) = '+floattostr(GetF(x0,y0)));

  x:=(x+x0)/2;
  y:=(y+y0)/2; 
    
  RichEdit1.Lines.Add('_____________ Минимум Функции ____________');
  RichEdit1.Lines.Add('   x = '+floattostr(x));
  RichEdit1.Lines.Add('   y = '+floattostr(y));
  RichEdit1.Lines.Add('   F(x,y) = '+floattostr(GetF(x,y)));
  RichEdit1.Lines.SaveToFile('out.txt')
end;

end.
