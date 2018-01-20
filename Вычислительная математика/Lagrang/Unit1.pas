unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XPMan, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    XPManifest1: TXPManifest;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function LagKoef(x: real; i, n: integer):real;
    procedure BitBtn3Click(Sender: TObject);
    function LagMnog(x: real; n: integer):real;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n: integer;
  dataX: array[1..6] of real;
  dataY: array[1..6] of real;
  x:real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  n:=6;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i:integer;
begin
  with StringGrid1 do
    begin
      Cells[1,0]:='X(i)';
      Cells[2,0]:='Y(i)';
      Cells[1,1]:='0,68';
      Cells[2,1]:='0,80866';
      Cells[1,2]:='0,73';
      Cells[2,2]:='0,89492';
      Cells[1,3]:='0,80';
      Cells[2,3]:='1,02964';
      Cells[1,4]:='0,88';
      Cells[2,4]:='1,20966';
      Cells[1,5]:='0,93';
      Cells[2,5]:='1,34087';
      Cells[1,6]:='0,99';
      Cells[2,6]:='1,52368';
      for i:=1 to n do
        Cells[0,i]:=IntToStr(i);
      edit1.Text:='0,812';
    end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  with StringGrid1 do
    begin
      Cells[1,0]:='X(i)';
      Cells[2,0]:='Y(i)';
      Cells[1,1]:='0,210';
      Cells[2,1]:='4,83170';
      Cells[1,2]:='0,215';
      Cells[2,2]:='4,72261';
      Cells[1,3]:='0,220';
      Cells[2,3]:='4,61855';
      Cells[1,4]:='0,225';
      Cells[2,4]:='4,51919';
      Cells[1,5]:='0,230';
      Cells[2,5]:='4,42422';
      Cells[1,6]:='0,235';
      Cells[2,6]:='4,33337';
      for i:=1 to n do
        Cells[0,i]:=IntToStr(i);
      edit1.Text:='0,2165';
    end;
end;

function TForm1.LagKoef(x: real; i, n: integer):real;
var k: integer;
    res: real;
begin
  res:=1;
  for k:=1 to n do
    if k<>i then
      res:=res*((x-dataX[k])/(dataX[i]-dataX[k]));
  result:=res;
end;

function TForm1.LagMnog(x: real; n: integer):real;
var i: integer;
    res: real;
begin
  res:=0;
  for i:=1 to n do
    res:=res+LagKoef(x,i,n)*dataY[i];
  result:=res;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var i:integer;
begin
  for i:=1 to n do
    begin
      dataX[i]:=StrToFloat(StringGrid1.Cells[1,i]);
      dataY[i]:=StrToFloat(StringGrid1.Cells[2,i]);
    end;
  x:=strtofloat(edit1.text);
  Edit2.Text:=FloatToStr(LagMnog(x,n));
end;

end.
