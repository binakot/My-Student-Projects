unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Math, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Label11: TLabel;
    Image1: TImage;
    Edit9: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Edit10: TEdit;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject); 
  private
    { Private declarations }
  public
    { Public declarations }
  end;
   
var
  Form1: TForm1;
  q1, q2 : extended; //заряды частиц движ. и фикс.
  m : extended; //масса движ. частицы
  x1, y1, x2, y2 : extended;  //нач. координаты частиц
  V : extended; //нач. скорость движ. частицы
  Vx, Vy : extended; //
  Ax, Ay : extended; //
  h : extended; //
  distance : extended; //расстояние между зарядами
  angle : extended; //угол скорости относительно оси, соед. заряды
  deltaT : extended; //
  unlike : integer; //разноименные или одноименные
  k, E0 : extended; //
  dVx, dVy, dx, dy : extended;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Create;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.MoveTo(350,445);
  Image1.Canvas.LineTo(350,455);
  Image1.Canvas.MoveTo(450,445);
  Image1.Canvas.LineTo(450,455);
  Image1.Canvas.MoveTo(350,450);
  Image1.Canvas.LineTo(450,450);
  Image1.Canvas.TextOut(390,460,'1 м');
  E0 := 0.85 * power(10,-12);
end;

procedure draw(x1,y1,x2,y2 : real);
begin
  Form1.Image1.Canvas.Pen.Color := clRed;
  Form1.Image1.Canvas.Rectangle(round(x1)-2,round(y1)-2,round(x1)+2,round(y1)+2);
  Form1.Image1.Canvas.Pen.Color := clBlue;
  Form1.Image1.Canvas.Rectangle(round(x2)-2,round(y2)-2,round(x2)+2,round(y2)+2);
end;

procedure clining(x1,y1 : real);
begin
  Form1.Image1.Canvas.Pen.Color := clWhite;
  Form1.Image1.Canvas.Rectangle(round(x1)-2,round(y1)-2,round(x1)+2,round(y1)+2);
end;

function limit(x,y : real) : boolean;
begin
  result := false;
  if (x<0)or(x>Form1.Image1.Height)or(y<0)or(y>Form1.Image1.Width) then
    begin
      result := true;
      exit
    end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  q1 := StrToFloat(Edit1.Text);
  m := StrToFloat(Edit2.Text);
  x1 := StrToFloat(Edit3.Text);
  y1 := StrToFloat(Edit4.Text);
  V := StrToFloat(Edit7.Text)*1000;
  angle := StrToFloat(Edit9.Text);
  q2 := StrToFloat(Edit8.Text);
  x2 := StrToFloat(Edit6.Text);
  y2 := StrToFloat(Edit5.Text);
  if RadioButton1.Checked then unlike := 1
  else unlike := -1;
  deltaT := StrToFloat(Edit10.Text);

  draw(x1,y1,x2,y2);

  Vx := V * cos(angle * 3.141592 / 180);
  Vy := V * sin(angle * 3.141592 / 180);
  k := unlike / (4 * Pi * E0);

  repeat
    if (round(x1) = round(x2))and(round(y1) = round(y2)) then break;

    clining(x1,y1);

    distance := sqrt(sqr(x1-x2) + sqr(y1-y2));
    Ax := k * ( (q2 * q1) / m) * ( (x1-x2) / power(distance,3) ) * deltaT;
    Ay := k * ( (q2 * q1) / m) * ( (y1-y2) / power(distance,3) ) * deltaT;
    dVx := Ax * deltaT;
    dVy := Ay * deltaT;
    Vx := Vx + dVx;
    Vy := Vy + dVy;
    dx := Vx * deltaT;
    dy := Vy * deltaT;
    x1 := x1 + dx;
    y1 := y1 + dy;

    draw(x1,y1,x2,y2);
    Image1.Refresh;
  until limit(x1,y1);  
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Height,Image1.Width);
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.MoveTo(350,445);
  Image1.Canvas.LineTo(350,455);
  Image1.Canvas.MoveTo(450,445);
  Image1.Canvas.LineTo(450,455);
  Image1.Canvas.MoveTo(350,450);
  Image1.Canvas.LineTo(450,450);
  Image1.Canvas.TextOut(390,460,'1 м');
  q1 := StrToFloat(Edit1.Text);
  m := StrToFloat(Edit2.Text);
  x1 := StrToFloat(Edit3.Text);
  y1 := StrToFloat(Edit4.Text);
  V := StrToFloat(Edit7.Text);
  angle := StrToFloat(Edit9.Text);
  q2 := StrToFloat(Edit8.Text);
  x2 := StrToFloat(Edit6.Text);
  y2 := StrToFloat(Edit5.Text);
  if RadioButton1.Checked then unlike := 1
  else unlike := -1;
  deltaT := StrToFloat(Edit10.Text);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

end.
 