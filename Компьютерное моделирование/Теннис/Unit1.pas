unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Math;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Label9: TLabel;
    Edit5: TEdit;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    Edit6: TEdit;
    Label11: TLabel;
    Edit9: TEdit;
    Label14: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Image1: TImage;
    BitBtn3: TBitBtn;
    Edit8: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const c = 0.4; //Коэффициент лобового сопротивления для шара
      p = 1.292; //Плотность воздуха
      dyn = 17.2; //Динамическая вязкость воздуха
      g = 9.81; //Ускорения свободного падения
      deltaY = 500; //Смещение по Оу

var
  Form1: TForm1;
  Angle1, Angle2 : real;
  V1, V2 : real;
  CurV, CurAngle : real;
  m, d, S : real;
  NumOfExp : integer;
  deltaT : real;
  k1, k2 : real;
  x, y, dx, dy : real;
  Vx, Vy, dVx, dVy : real;
  Ax, Ay : real;
  cl : TColor;
  AllH, resH : real;    

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Create;
  Randomize
end;

procedure draw(x,y : real);
begin
  Form1.Image1.Canvas.Pen.Color := cl;
  Form1.Image1.Canvas.Ellipse(Round(x-2),Round(DeltaY-y-2),Round(x+2),Round(DeltaY-y+2))
end;

function limit(x,y : real) : boolean;
begin
  if (deltaY - y < 0)or(x > Form1.Image1.Width) then
    result := true
  else
    result := false
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  cl := rgb(Random(256),Random(256),Random(256));
//Параметры модели
  Angle1 := StrToFloat(Edit1.Text);
  Angle2 := StrToFloat(Edit2.Text);
  V1 := StrToFloat(Edit3.Text);
  V2 := StrToFloat(Edit4.Text);
  m := StrToFloat(Edit6.Text);
  d := StrToFloat(Edit7.Text);
  NumOfExp := StrToInt(Edit5.Text);
  deltaT := StrToFloat(Edit9.Text);
  k1 := 6 * Pi * dyn * (d / 2);
  S := Pi * sqr(d / 2);
  k2 := 0.5 * c * S * p;
//Входные параметры
  CurV := Random(Round(V2 - V1)) + V1;
  CurAngle := Random(Round(Angle2 - Angle1)) + Angle1;
  x := 0;
  y := 0;
  Vx := CurV * cos(CurAngle * 3.141592 / 180);
  Vy := CurV * sin(CurAngle * 3.141592 / 180);
//Расчетные формулы
  repeat
    Ax := 0 - (k2 * sqr(Vx))*deltaT;
    Ay := -g - (k2 * sqr(Vy))*deltaT;
    dVx := Ax * deltaT;
    dVy := Ay * deltaT;
    Vx := Vx + dVx;
    Vy := Vy + dVy;
    dx := Vx * deltaT + (Ax * sqr(deltaT) ) / 2;
    dy := Vy * deltaT + (Ay * sqr(deltaT) ) / 2;
    x := x + dx;
    y := y + dy;

    draw(x*10, y*10);
    Form1.Image1.Refresh
  until limit(x,y)or(Round(y) = 0)
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Image1.Refresh;
  Edit8.Text := '0'
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var i : integer;
    curX, curY : real;
    check : boolean;
begin
  AllH := 0;
//Параметры модели
  Angle1 := StrToFloat(Edit1.Text);
  Angle2 := StrToFloat(Edit2.Text);
  V1 := StrToFloat(Edit3.Text);
  V2 := StrToFloat(Edit4.Text);
  m := StrToFloat(Edit6.Text);
  d := StrToFloat(Edit7.Text);
  NumOfExp := StrToInt(Edit5.Text);
  deltaT := StrToFloat(Edit9.Text);
  k1 := 6 * Pi * dyn * (d / 2);
  S := Pi * sqr(d / 2);
  k2 := 0.5 * c * S * p;
//Расчетные формулы
  for i := 1 to NumOfExp do
    begin
      //Входные параметры
      CurV := Random(Round(V2 - V1)) + V1;
      CurAngle := Random(Round(Angle2 - Angle1)) + Angle1;
      x := 0;
      y := 0;
      Vx := CurV * cos(CurAngle * 3.141592 / 180);
      Vy := CurV * sin(CurAngle * 3.141592 / 180);
      cl := rgb(Random(256),Random(256),Random(256));
      check := true;
        repeat
          curX := x;
          curY := y;

          Ax := 0 - (k2 * sqr(Vx))*deltaT;
          Ay := -g - (k2 * sqr(Vy))*deltaT;
          dVx := Ax * deltaT;
          dVy := Ay * deltaT;
          Vx := Vx + dVx;
          Vy := Vy + dVy;
          dx := Vx * deltaT + (Ax * sqr(deltaT) ) / 2;
          dy := Vy * deltaT + (Ay * sqr(deltaT) ) / 2;
          x := x + dx;
          y := y + dy;

          if Form1.CheckBox1.Checked then
            begin
              draw(x*10, y*10);
              Form1.Image1.Refresh
            end;

          if (y<curY)and(check) then
            begin
              check := false;
              AllH := AllH + x;
            end
        until limit(x,y)or(Round(y) = 0);
    end;
  Edit8.Text := FloatToStr(roundTo(AllH/NumOfExp,-1))
end;

end.
