unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Unit1;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  i : integer;
  v1, v2, v3, v4, h1, h2, h3, h4 : real;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var lasttime : real;
begin
  i := 0;

  StringGrid1.Cells[0,0] := 'h(c)';
  StringGrid1.Cells[1,0] := 'Шар';
  StringGrid1.Cells[2,0] := 'Полусфера';
  StringGrid1.Cells[3,0] := 'Диск';
  StringGrid1.Cells[4,0] := 'Каплевидная';

  timer := StrToFloat(Form1.Edit1.Text);
  m := StrToFloat(Form1.Edit2.Text);
  S := StrToFloat(Form1.Edit3.Text);
  deltaT := StrToFloat(Form1.Edit4.Text);

  repeat
    i := i + 1;
    StringGrid1.RowCount := i;

    ResultF := m * g - 0.5 * cHar * S * pWater * V1 * V1;
    V1 := V1 + ResultF / m * deltaT;
    h1 := h1 + V1 * deltaT;
    StringGrid1.Cells[1,i] := FloatToStr(h1);

    ResultF := m * g - 0.5 * cPoluSfera * S * pWater * V2 * V2;
    V2 := V2 + ResultF / m * deltaT;
    h2 := h2 + V2 * deltaT;
    StringGrid1.Cells[2,i] := FloatToStr(h2);

    ResultF := m * g - 0.5 * cDisk * S * pWater * V3 * V3;
    V3 := V3 + ResultF / m * deltaT;
    h3 := h3 + V3 * deltaT;
    StringGrid1.Cells[3,i] := FloatToStr(h3);

    ResultF := m * g - 0.5 * cKapel * S * pWater * V4 * V4;
    V4 := V4 + ResultF / m * deltaT;
    h4 := h4 + V4 * deltaT;
    StringGrid1.Cells[4,i] := FloatToStr(h4);

    t := t + deltaT;
    StringGrid1.Cells[0,i] := 't = ' + FloatToStr(t); 
  until (t >= timer) or (h + y >= 345);

end;

end.
