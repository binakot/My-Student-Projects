unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtDlgs, ExtCtrls, XPMan, Buttons, StdCtrls;

type
  TForm7 = class(TForm)
    XPManifest1: TXPManifest;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    ColorDialog1: TColorDialog;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure filtration;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  x0,y0,x1,y1: integer;
  buf: tbitmap;
  m: boolean;
  pixels: array [1..5,1..5] of tcolor;
implementation

{$R *.dfm}

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form7.Free;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
 buf:=tbitmap.Create;
 buf.Height:=image1.Height;
 buf.Width:=image1.Width;
 m:=false;
 image1.Canvas.Pen.Color:=clblack;
end;

procedure TForm7.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm7.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 m:=true;
 x0:=x;
 y0:=y;
 buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
end;

procedure TForm7.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if m=true then
  begin
   image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
   x1:=x;
   y1:=y;
   image1.Canvas.MoveTo(x0,y0);
   image1.Canvas.LineTo(x1,y1);
  end;
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm7.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if m=true then
  begin
   m:=false;
  end;
end;

procedure TForm7.N4Click(Sender: TObject);
begin
 openpicturedialog1.Filter:='bmp|*.bmp|';
 if openpicturedialog1.Execute then
  begin
   image1.Picture.LoadFromFile(openpicturedialog1.FileName);
  end;
end;

procedure TForm7.N5Click(Sender: TObject);
var
 p,b: tcolor;
begin
 p:=image1.Canvas.Pen.Color;
 b:=image1.Canvas.Brush.Color;
 image1.Canvas.Pen.Color:=clwhite;
 image1.Canvas.Brush.Color:=clwhite;
 image1.Canvas.Rectangle(0,0,image1.Height,image1.Width);
 image1.Canvas.Pen.Color:=p;
 image1.Canvas.Brush.Color:=b;
end;

procedure TForm7.N6Click(Sender: TObject);
begin
 if colordialog1.Execute then
  begin
   image1.Canvas.Pen.Color:=colordialog1.Color;
  end;
end;

procedure TForm7.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
 filtration;
end;

procedure TForm7.filtration;
var
 i,j,k,l,w: integer;
 color: array [1..25] of tcolor;
 median,vs: tcolor;
begin
 buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     pixels[1,1]:=buf.Canvas.Pixels[i-2,j-2];
     pixels[1,2]:=buf.Canvas.Pixels[i-2,j-1];
     pixels[1,3]:=buf.Canvas.Pixels[i-2,j];
     pixels[1,4]:=buf.Canvas.Pixels[i-2,j+1];
     pixels[1,5]:=buf.Canvas.Pixels[i-2,j+2];
     pixels[2,1]:=buf.Canvas.Pixels[i-1,j-2];
     pixels[2,2]:=buf.Canvas.Pixels[i-1,j-1];
     pixels[2,3]:=buf.Canvas.Pixels[i-1,j];
     pixels[2,4]:=buf.Canvas.Pixels[i-1,j+1];
     pixels[2,5]:=buf.Canvas.Pixels[i-1,j+2];
     pixels[3,1]:=buf.Canvas.Pixels[i,j-2];
     pixels[3,2]:=buf.Canvas.Pixels[i,j-1];
     pixels[3,3]:=buf.Canvas.Pixels[i,j];
     pixels[3,4]:=buf.Canvas.Pixels[i,j+1];
     pixels[3,5]:=buf.Canvas.Pixels[i,j+2];
     pixels[4,1]:=buf.Canvas.Pixels[i+1,j-2];
     pixels[4,2]:=buf.Canvas.Pixels[i+1,j-1];
     pixels[4,3]:=buf.Canvas.Pixels[i+1,j];
     pixels[4,4]:=buf.Canvas.Pixels[i+1,j+1];
     pixels[4,5]:=buf.Canvas.Pixels[i+1,j+2];
     pixels[5,1]:=buf.Canvas.Pixels[i+2,j-2];
     pixels[5,2]:=buf.Canvas.Pixels[i+2,j-1];
     pixels[5,3]:=buf.Canvas.Pixels[i+2,j];
     pixels[5,4]:=buf.Canvas.Pixels[i+2,j+1];
     pixels[5,5]:=buf.Canvas.Pixels[i+2,j+2];
     if (i=0) and (j=0) then
      begin
       pixels[3,2]:=pixels[3,4];
       pixels[3,1]:=pixels[3,5];
       pixels[4,2]:=pixels[4,4];
       pixels[4,1]:=pixels[4,5];
       pixels[5,2]:=pixels[5,4];
       pixels[5,1]:=pixels[5,5];
       pixels[1,1]:=pixels[5,1];
       pixels[1,2]:=pixels[5,2];
       pixels[1,3]:=pixels[5,3];
       pixels[1,4]:=pixels[5,4];
       pixels[1,5]:=pixels[5,5];
       pixels[2,1]:=pixels[4,1];
       pixels[2,2]:=pixels[4,2];
       pixels[2,3]:=pixels[4,3];
       pixels[2,4]:=pixels[4,4];
       pixels[2,5]:=pixels[4,5];
      end
     else
      begin
       if i=0 then
        begin
         pixels[1,1]:=pixels[5,1];
         pixels[1,2]:=pixels[5,2];
         pixels[1,3]:=pixels[5,3];
         pixels[1,4]:=pixels[5,4];
         pixels[1,5]:=pixels[5,5];
         pixels[2,1]:=pixels[4,1];
         pixels[2,2]:=pixels[4,2];
         pixels[2,3]:=pixels[4,3];
         pixels[2,4]:=pixels[4,4];
         pixels[2,5]:=pixels[4,5];
        end;
       if j=0 then
        begin
         pixels[1,1]:=pixels[1,5];
         pixels[2,1]:=pixels[2,5];
         pixels[3,1]:=pixels[3,5];
         pixels[4,1]:=pixels[4,5];
         pixels[5,1]:=pixels[5,5];
         pixels[1,2]:=pixels[1,4];
         pixels[2,2]:=pixels[2,4];
         pixels[3,2]:=pixels[3,4];
         pixels[4,2]:=pixels[4,4];
         pixels[5,2]:=pixels[5,4];
        end;
      end;
     if (i=1) and (j=1) then
      begin
       pixels[2,1]:=pixels[2,5];
       pixels[3,1]:=pixels[3,5];
       pixels[4,1]:=pixels[4,5];
       pixels[5,1]:=pixels[5,5];
       pixels[1,1]:=pixels[5,1];
       pixels[1,2]:=pixels[5,2];
       pixels[1,3]:=pixels[5,3];
       pixels[1,4]:=pixels[5,4];
       pixels[1,5]:=pixels[5,5];
      end
     else
      begin
       if i=1 then
        begin
         pixels[1,1]:=pixels[5,1];
         pixels[1,2]:=pixels[5,2];
         pixels[1,3]:=pixels[5,3];
         pixels[1,4]:=pixels[5,4];
         pixels[1,5]:=pixels[5,5];
        end;
       if j=1 then
        begin
         pixels[1,1]:=pixels[1,5];
         pixels[2,1]:=pixels[2,5];
         pixels[3,1]:=pixels[3,5];
         pixels[4,1]:=pixels[4,5];
         pixels[5,1]:=pixels[5,5];
        end;
      end;
     if (i=298) and (j=298) then
      begin
       pixels[1,5]:=pixels[1,1];
       pixels[2,5]:=pixels[2,1];
       pixels[3,5]:=pixels[3,1];
       pixels[4,5]:=pixels[4,1];
       pixels[5,5]:=pixels[1,5];
       pixels[5,4]:=pixels[1,4];
       pixels[5,3]:=pixels[1,3];
       pixels[5,2]:=pixels[1,2];
       pixels[5,1]:=pixels[1,1];
      end
     else
      begin
       if i=298 then
        begin
         pixels[5,1]:=pixels[1,1];
         pixels[5,2]:=pixels[1,2];
         pixels[5,3]:=pixels[1,3];
         pixels[5,4]:=pixels[1,4];
         pixels[5,5]:=pixels[1,5];
        end;
       if j=298 then
        begin
         pixels[1,5]:=pixels[1,1];
         pixels[2,5]:=pixels[2,1];
         pixels[3,5]:=pixels[3,1];
         pixels[4,5]:=pixels[4,1];
         pixels[5,5]:=pixels[5,1];
        end;
      end;
     if (i=299) and (j=299) then
      begin
       pixels[1,4]:=pixels[1,2];
       pixels[1,5]:=pixels[1,1];
       pixels[2,4]:=pixels[2,1];
       pixels[2,5]:=pixels[2,2];
       pixels[3,4]:=pixels[3,1];
       pixels[3,5]:=pixels[3,2];
       pixels[4,4]:=pixels[2,4];
       pixels[4,5]:=pixels[2,5];
       pixels[5,4]:=pixels[1,4];
       pixels[5,5]:=pixels[1,5];
       pixels[4,3]:=pixels[2,3];
       pixels[5,3]:=pixels[1,3];
       pixels[4,2]:=pixels[2,2];
       pixels[5,2]:=pixels[1,2];
       pixels[4,1]:=pixels[2,1];
       pixels[5,1]:=pixels[1,1];
      end
     else
      begin
       if i=299 then
        begin
         pixels[4,1]:=pixels[2,1];
         pixels[4,2]:=pixels[2,2];
         pixels[4,3]:=pixels[2,3];
         pixels[4,4]:=pixels[2,4];
         pixels[4,5]:=pixels[2,5];
         pixels[5,1]:=pixels[1,1];
         pixels[5,2]:=pixels[1,2];
         pixels[5,3]:=pixels[1,3];
         pixels[5,4]:=pixels[1,4];
         pixels[5,5]:=pixels[1,5];
        end;
       if j=299 then
        begin
         pixels[1,4]:=pixels[1,2];
         pixels[2,4]:=pixels[2,2];
         pixels[3,4]:=pixels[3,2];
         pixels[4,4]:=pixels[4,2];
         pixels[5,4]:=pixels[5,2];
         pixels[1,5]:=pixels[1,1];
         pixels[2,5]:=pixels[2,1];
         pixels[3,5]:=pixels[3,1];
         pixels[4,5]:=pixels[4,1];
         pixels[5,5]:=pixels[5,1];
        end;
      end;
     w:=0;
     for k := 1 to 5 do
      begin
       for l := 1 to 5 do
        begin
         inc(w);
         color[w]:=pixels[k,l];
        end;
      end;
     for k := 1 to 25 do
      begin
       for l := k + 1 to 25-1 do
        begin
         if color[l]<color[k] then
          begin
           vs:=color[l];
           color[l]:=color[k];
           color[k]:=vs;
          end;
        end;
      end;
     median:=color[13];
     image1.Canvas.Pixels[i,j]:=median;
    end;
  end;
end;
end.
