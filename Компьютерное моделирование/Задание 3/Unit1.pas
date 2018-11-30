unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Math;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Memo1: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  g = 9.8;
  x0 = 300;
  y0 = 0;

var
  Form1 : TForm1;
  deltaT : real;
  l, m : real;   //длина нити и масса груза
  n : real; //коэффициент трения
  x, y : real; //координаты груза
  w : real; //частота собственных малых колебаний маятника
  Q, dQ : real; //отклонение маятника
  f, lambda : real; //амплитуда вынуждающей силы и частота вынуждающей силы
  V : real; //угловая скорость
  t : real; //время
  a : real; //ускорение

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Create;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  m := StrToFloat(Edit8.Text);
  l := StrToFloat(Edit7.Text);
  deltaT := StrToFloat(Edit9.Text);
  n := StrToFloat(Edit4.Text);
  w := StrToFloat(Edit1.Text);
  Q := StrToFloat(Edit2.Text) / 180 * 3.14;
  f := StrToFloat(Edit5.Text);
  lambda := StrToFloat(Edit6.Text);
  V := StrToFloat(Edit3.Text);   

  t := 0;

  repeat 
     a :=  2 * n * V - sqr(w) * sin(Q) + f * cos(lambda*t);
     V := V + a * deltaT;
     dQ := V * deltaT;
     Q := Q + dQ;
     x := - Sin(Q) * l;
     y := Cos(Q) * l;

     Image1.Canvas.Pen.Color := clWhite;
     Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
     Image1.Canvas.Pen.Color := clBlack;
     Image1.Canvas.MoveTo(x0,y0);
     Image1.Canvas.LineTo(Round(x+x0),Round(y+y0));
     Image1.Canvas.Ellipse(Round(x+x0)-10,Round(y+y0)-10,Round(x+x0)+10,Round(y+y0)+10);
     Image1.Refresh;

     t := t + deltaT
  until t>1000;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
end;

end.
