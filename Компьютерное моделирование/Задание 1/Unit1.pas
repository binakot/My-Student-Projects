unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit4: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  g = 9.822;
  cDisk = 1.11;
  cPoluSfera = 0.55;
  cHar = 0.4;
  cKapel = 0.045;
  pWater = 1.002;

var
  Form1: TForm1;
  t, deltaT : real;
  x, y : integer;
  m, c, S, h, timer, V : real;
  ResultF : real; 

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := RGB(0, 255, 255);
  Image1.Canvas.MoveTo(180, 60);
  Image1.Canvas.LineTo(180, 345);

  timer := StrToFloat(Edit1.Text);
  m := StrToFloat(Edit2.Text);
  S := StrToFloat(Edit3.Text);
  deltaT := StrToFloat(Edit4.Text);
  t := 0;
  V := 0;
  h := 0;

  if (RadioButton1.Checked) then
    c := cHar
  else if (RadioButton2.Checked) then
    c := cPoluSfera
  else if (RadioButton3.Checked) then
    c := cDisk
  else
    c := cKapel;

  repeat
    t := t + deltaT;

    ResultF := m * g - 0.5 * c * S * pWater * V * V;
    V := V + ResultF / m * deltaT;
    h := h + V * deltaT;

    Image1.Canvas.Pixels[x , Round(h) + y] := clRed;
    Image1.Canvas.Refresh;

  until (t >= timer) and (h + y >= 345);

    t := t + deltaT;

    ResultF := m * g - 0.5 * c * S * pWater * V * V;
    V := V + ResultF / m * deltaT;
    h := h + V * deltaT;

    Image1.Canvas.Pixels[x , Round(h) + y] := clRed;
    Image1.Canvas.Refresh;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Create;
  Image1.Canvas.Refresh;
  x := 180;
  y := 60;
end;

end.



