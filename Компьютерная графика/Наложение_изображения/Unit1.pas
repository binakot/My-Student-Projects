unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, math;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    function action(var c1,c2: byte; var k: real): byte;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pixel: tcolor;
  r,g,b: byte;
  k: real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  image1.Canvas.Create;
  image2.Canvas.Create;
  image3.Canvas.Create;
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edit2.Text:=floattostr(1-strtofloat(edit1.text));
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j: integer; r1,r2: byte;
begin
  k:=1-strtofloat(edit1.text);
  if (k>=0)and(k<=1) then
    begin
      for i:=0 to 300 do
      for j:=0 to 300 do
        begin
          r1:=getrvalue(image1.Canvas.pixels[i,j]);
          r2:=getrvalue(image2.Canvas.pixels[i,j]);
          r:=action(r1,r2,k);

          r1:=getgvalue(image1.Canvas.pixels[i,j]);
          r2:=getgvalue(image2.Canvas.pixels[i,j]);
          g:=action(r1,r2,k);

          r1:=getbvalue(image1.Canvas.pixels[i,j]);
          r2:=getbvalue(image2.Canvas.pixels[i,j]);
          b:=action(r1,r2,k);

          Image3.Canvas.Pixels[i,j]:=rgb(r,g,b);
        end;
    end;
  if round(10*k)/10=0.0 then label5.Caption:='Полдень';
  if round(10*k)/10=0.1 then label5.Caption:='Обеденное время';
  if round(10*k)/10=0.2 then label5.Caption:='День';
  if round(10*k)/10=0.3 then label5.Caption:='День';
  if round(10*k)/10=0.4 then label5.Caption:='Вечереет';
  if round(10*k)/10=0.5 then label5.Caption:='Вечер';
  if round(10*k)/10=0.6 then label5.Caption:='Поздний вечер';
  if round(10*k)/10=0.7 then label5.Caption:='Сумерки';
  if round(10*k)/10=0.8 then label5.Caption:='Ночь';
  if round(10*k)/10=0.9 then label5.Caption:='ночь';
  if round(10*k)/10=1.0 then label5.Caption:='Полночь';
end;

function TForm1.action(var c1,c2: byte; var k: real): byte;
var c3:byte;
begin
  c3:=round(c1*(1-k)+k*c2);
  if c3>255 then result:=255 else result:=c3;
end;

end.
