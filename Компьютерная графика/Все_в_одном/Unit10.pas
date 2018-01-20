unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtDlgs, ExtCtrls, XPMan, ComCtrls, Buttons;

type
  TForm9 = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    XPManifest1: TXPManifest;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    N1: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure superposition;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  k: real;
implementation

{$R *.dfm}

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form9.Free;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 image2.Canvas.Create;
 image3.Canvas.Create;
 k:=0;
end;

procedure TForm9.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm9.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm9.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm9.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm9.N11Click(Sender: TObject);
begin
 openpicturedialog1.Filter:='bmp|*.bmp|';
 if openpicturedialog1.Execute then
  begin
   image1.Picture.LoadFromFile(openpicturedialog1.FileName);
  end;
end;

procedure TForm9.N21Click(Sender: TObject);
begin
 openpicturedialog1.Filter:='bmp|*.bmp|';
 if openpicturedialog1.Execute then
  begin
   image2.Picture.LoadFromFile(openpicturedialog1.FileName);
  end;
end;

procedure TForm9.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
 superposition;
end;

procedure TForm9.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
 if button=btprev then k:=k-0.1;
 if button=btnext then k:=k+0.1;
 edit1.Text:=floattostr(round(k*1000)/1000);
end;

procedure TForm9.superposition;
var
 i,j: integer;
 r1,g1,b1,r2,g2,b2,r3,g3,b3: byte;
begin
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r1:=getrvalue(image1.Canvas.Pixels[i,j]);
     g1:=getgvalue(image1.Canvas.Pixels[i,j]);
     b1:=getbvalue(image1.Canvas.Pixels[i,j]);
     r2:=getrvalue(image2.Canvas.Pixels[i,j]);
     g2:=getgvalue(image2.Canvas.Pixels[i,j]);
     b2:=getbvalue(image2.Canvas.Pixels[i,j]);
     r3:=round(r1*(1-k)+k*r2);
     if r3>255 then r3:=255;
     g3:=round(g1*(1-k)+k*g2);
     if g3>255 then g3:=255;
     b3:=round(b1*(1-k)+k*b2);
     if b3>255 then b3:=255;
     image3.Canvas.Pixels[i,j]:=rgb(r3,g3,b3);
    end;
  end;
end;


end.
