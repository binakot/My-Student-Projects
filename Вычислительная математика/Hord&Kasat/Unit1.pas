unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMan, ComCtrls, Math, jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button1: TButton;
    XPManifest1: TXPManifest;
    RichEdit1: TRichEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Go(Left,Right:real);
    function FirstProiz(x:real): real;
    function SecondProiz(x:real): real;
    function GetFunc(x:Real): extended;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  NumFun, Itter: byte;
  eps, a0, b0, h, deltaX: real;
  Prov: boolean;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  NumFun:=1;
  eps:=StrToFloat(edit4.text);
  RichEdit1.Clear;
  prov:=false;
  Itter:=0;
  Image1.Visible:=true;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  NumFun:=1;
  Image1.Visible:=true;
  Image2.Visible:=false;
  Image3.Visible:=false;
  Image4.Visible:=false;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  NumFun:=2;
  Image1.Visible:=false;
  Image2.Visible:=true;
  Image3.Visible:=false;
  Image4.Visible:=false;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  NumFun:=3;
  Image1.Visible:=false;
  Image2.Visible:=false;
  Image3.Visible:=true;
  Image4.Visible:=false;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  NumFun:=4;
  Image1.Visible:=false;
  Image2.Visible:=false;
  Image3.Visible:=false;
  Image4.Visible:=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
var  Value1, Value2, a, b: real;
begin
  RichEdit1.Clear;
  Itter:=0;
  prov:=false;
  a0:=StrToFloat(edit1.text);   //Получаем левый край
  b0:=StrToFloat(edit2.text);   //Получаем правый край
  h:=10*eps;   //шаг
  deltaX:=eps/10;  //Приращение
  a:=a0;
  b:=b0;
  while a<b do
    begin
      Value1:=GetFunc(a);
      Value2:=GetFunc(a+h);
      if Value1*Value2<0 then
        begin
          RichEdit1.Lines.Add('Поиск приближенного значения корня:');
          RichEdit1.Lines.Add('_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _');
          Go(a,a+h);
          Prov:=true;
        end;
      a:=a+h;
      Itter:=0;
    end;
  if prov=false then RichEdit1.Lines.Add('На данном промежутке корней нет!');
end;

procedure TForm1.Go(Left,Right:real);
var
   a1,a2,b1,b2,Proiz1,Proiz2,Value,Nev: Real;
begin
      a1:=Left; b1:=Right;
      RichEdit1.Lines.Add('   Итерация № '+IntToStr(Itter));
      RichEdit1.Lines.Add('       Левая граница = '+FloatToStr(a1));
      RichEdit1.Lines.Add('       Правая граница = '+FloatToStr(b1));

      Proiz1:=FirstProiz((a1+b1)/2);        //Первая производная
      Proiz2:=SecondProiz((a1+b1)/2);       //Вторая производная

      if Proiz1*Proiz2>=0 then
        while Abs(b1-a1)>=eps do
          begin
            a2:=a1-GetFunc(a1)*(b1-a1)/(GetFunc(b1)-GetFunc(a1));
            b2:=b1-GetFunc(b1)/FirstProiz(b1);
            a1:=a2;
            b1:=b2;
            Inc(Itter);
            RichEdit1.Lines.Add('   Итерация № '+IntToStr(Itter));
            RichEdit1.Lines.Add('       Левая граница = '+FloatToStr(a1));
            RichEdit1.Lines.Add('       Правая граница = '+FloatToStr(b1));
          end
      else
        while Abs(b1-a1)>=eps do
          begin
            a2:=a1-GetFunc(a1)/FirstProiz(a1);
            b2:=b1-GetFunc(b1)*(b1-a1)/(GetFunc(b1)-GetFunc(a1));
            a1:=a2;
            b1:=b2;
            Inc(Itter);
            RichEdit1.Lines.Add('   Итерация № '+IntToStr(Itter));
            RichEdit1.Lines.Add('       Левая граница = '+FloatToStr(a1));
            RichEdit1.Lines.Add('       Правая граница = '+FloatToStr(b1));
          end;
      RichEdit1.Lines.Add('_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _');
      Value:=(a1+b1)/2;
      RichEdit1.Lines.Add('Приближенное значение корня = '+FloatToStr(value));
      Nev:=GetFunc(value);
      RichEdit1.Lines.Add('Невязка = '+FloatToStr(Nev));
      RichEdit1.Lines.Add('___________________________________');
      RichEdit1.Lines.Add(' ');
      if Nev>1 then
        begin
          RichEdit1.Clear;
          RichEdit1.Lines.Add('На данном промежутке корней нет!');
        end;
end;

function TForm1.FirstProiz(x:real):real;
var temp: real;
begin
  temp:=(GetFunc(x+DeltaX)-GetFunc(x))/DeltaX;
  FirstProiz:=temp;
end;

function TForm1.SecondProiz(x:real):real;
var temp: real;
begin
  temp:=(FirstProiz(x+DeltaX)-FirstProiz(x))/DeltaX;
  SecondProiz:=temp;
end;

function TForm1.GetFunc(x:Real): extended;
var Func: extended;
begin
  if NumFun=1 then Func:=ArcTan(x)+1/(3*power(x,3));
  if NumFun=2 then Func:=2*power(x,3)-9*sqr(x)-60*x+1;
  if NumFun=3 then Func:=x*x-20*sin(x);
  if NumFun=4 then Func:=sin(x+Pi/3)-0.5*x;
  GetFunc:=Func;
end;

end.
