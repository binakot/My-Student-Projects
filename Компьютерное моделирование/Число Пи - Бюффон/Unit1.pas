unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Math;

type
  TForm1 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  Distance = 100.0;
  Length = 50.0;
  Line1 = 0;
  Line2 = 100;
  Line3 = 200;
  Line4 = 300;
  Line5 = 400;
  Line6 = 500;

var
  Form1: TForm1;
  N1, N : integer;
  p, Pi : extended;

implementation

{$R *.dfm}

procedure DrawLines();
begin
  Form1.Image1.Canvas.Brush.Color := clWhite;
  Form1.Image1.Canvas.Pen.Color := clWhite;
  Form1.Image1.Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  Form1.Image1.Canvas.Pen.Color := clBlue;
  Form1.Image1.Canvas.MoveTo(100,0);
  Form1.Image1.Canvas.LineTo(100,400);
  Form1.Image1.Canvas.MoveTo(200,0);
  Form1.Image1.Canvas.LineTo(200,400);
  Form1.Image1.Canvas.MoveTo(300,0);
  Form1.Image1.Canvas.LineTo(300,400);
  Form1.Image1.Canvas.MoveTo(400,0);
  Form1.Image1.Canvas.LineTo(400,400);
  Form1.Image1.Canvas.Refresh;
end;

procedure DrawLine(x0, y0 : integer; lenght : real; angle : real);
var x1, x2, y1, y2 : integer;
begin
  x1 := Round (x0 + 0.5 * lenght * cos(angle * 3.141592 / 180));
  y1 := Round (y0 + 0.5 * lenght * sin(angle * 3.141592 / 180));
  x2 := Round (x0 - 0.5 * lenght * cos(angle * 3.141592 / 180));
  y2 := Round (y0 - 0.5 * lenght * sin(angle * 3.141592 / 180));
  Form1.Image1.Canvas.Pen.Color := clRed;
  Form1.Image1.Canvas.MoveTo(x0, y0);
  Form1.Image1.Canvas.LineTo(x1, y1);
  Form1.Image1.Canvas.MoveTo(x0, y0);
  Form1.Image1.Canvas.LineTo(x2, y2);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Image1.Canvas.Create;
  DrawLines;
  N := 0;
  N1 := 0;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  DrawLines;
  N := 0;
  N1 := 0;
  Edit1.Text := '0';
  Edit2.Text := '0';
  Edit3.Text := '100';
  Edit4.Text := '0';
  Edit5.Text := '0';
  Edit6.Text := '';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  DrawLines;
  N := N + 1;
  Edit1.Text := IntToStr(N);
  DrawLine(Random(412) + 38 + 1, Random(312) + 36 + 1, Length, Random(360) + 1);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if N1 < N then
  begin
    N1 := N1 + 1;
    Edit2.Text := IntToStr(N1);
    p := N1 / N;
    Pi := 1 / p;
    Edit6.Text := FloatToStr(Pi);
  end;
end;

function check(x0, y0, x1, y1, x2, y2 : integer) : boolean;
begin
  if (x0 = Line1)or(x1 = Line1)or(x2 = Line1) then
    begin
      Result := true;
      exit
    end;
  if (x0 = Line6)or(x1 = Line6)or(x2 = Line6) then
    begin
      Result := true;
      exit
    end;
  if ((x1 <= Line2)and(x2 >= Line2))or((x2 <= Line2)and(x1 >= Line2)) then
    Begin
      Result := true;
      exit
    end;
  if ((x1 <= Line3)and(x2 >= Line3))or((x2 <= Line3)and(x1 >= Line3)) then
    Begin
      Result := true;
      exit
    end;
  if ((x1 <= Line4)and(x2 >= Line4))or((x2 <= Line4)and(x1 >= Line4)) then
    Begin
      Result := true;
      exit
    end;
  if ((x1 <= Line5)and(x2 >= Line5))or((x2 <= Line5)and(x1 >= Line5)) then
    Begin
      Result := true;
      exit
    end;
  Result := false;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var Number, i : integer;
    x0, x1, x2, y0, y1, y2 : integer;
    angle : real;
begin
  DrawLines;
  N := 0;
  N1 := 0;
  Number := StrToInt(Edit3.Text);
  Image1.Canvas.Pen.Color := clRed;
  if Number <= 10000 then
    begin
      for i:=1 to Number do
        begin
          N := N + 1;
          Edit4.Text := IntToStr(N);
          x0 := Random(412) + 38 + 1;
          y0 := Random(312) + 36 + 1;
          angle := Random(360) + 1;
          x1 := Round (x0 + 0.5 * Length * cos(angle * 3.141592 / 180));
          y1 := Round (y0 + 0.5 * Length * sin(angle * 3.141592 / 180));
          x2 := Round (x0 - 0.5 * Length * cos(angle * 3.141592 / 180));
          y2 := Round (y0 - 0.5 * Length * sin(angle * 3.141592 / 180));
          Image1.Canvas.MoveTo(x1,y1);
          Image1.Canvas.LineTo(x2,y2);
          if check(x0, y0, x1, y1, x2, y2) then
            begin
              N1 := N1 + 1;
              Edit5.Text := IntToStr(N1);
              Pi := N / N1;
              Edit6.Text := FloatToStr(Pi)
            end
        end
      end
    else
      begin
        for i:=1 to Number do
          begin
            N := N + 1;
            x0 := Random(412) + 38 + 1;
            y0 := Random(312) + 36 + 1;
            angle := Random(360) + 1;
            x1 := Round (x0 + 0.5 * Length * cos(angle * 3.141592 / 180));
            y1 := Round (y0 + 0.5 * Length * sin(angle * 3.141592 / 180));
            x2 := Round (x0 - 0.5 * Length * cos(angle * 3.141592 / 180));
            y2 := Round (y0 - 0.5 * Length * sin(angle * 3.141592 / 180));
            if check(x0, y0, x1, y1, x2, y2) then
              begin
                N1 := N1 + 1;
                Pi := N / N1
              end
          end;
        Edit4.Text := IntToStr(N);
        Edit5.Text := IntToStr(N1);
        Edit6.Text := FloatToStr(Pi)
      end
  end;
end.


