unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, XPMan, Menus, StdCtrls, ExtDlgs, Grids, Buttons;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    XPManifest1: TXPManifest;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ColorDialog1: TColorDialog;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure filtration;
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  x0,y0,x1,y1: integer;
  buf: tbitmap;
  m: boolean;
  a: real;
  filter: array [1..3,1..3] of real;
  pixels: array [1..3,1..3] of tcolor;
implementation

{$R *.dfm}

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form6.Free;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
 buf:=tbitmap.Create;
 buf.Height:=image1.Height;
 buf.Width:=image1.Width;
 m:=false;
 image1.Canvas.Pen.Color:=clblack;
 a:=1/9;
end;

procedure TForm6.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm6.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 m:=true;
 x0:=x;
 y0:=y;
 buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
end;

procedure TForm6.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TForm6.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if m=true then
  begin
   m:=false;
  end;
end;

procedure TForm6.N2Click(Sender: TObject);
begin
 openpicturedialog1.Filter:='bmp|*.bmp|';
 if openpicturedialog1.Execute then
  begin
   image1.Picture.LoadFromFile(openpicturedialog1.FileName);
  end;
end;

procedure TForm6.N4Click(Sender: TObject);
begin
 if colordialog1.Execute then
  begin
   image1.Canvas.Pen.Color:=colordialog1.Color;
  end;
end;

procedure TForm6.N6Click(Sender: TObject);
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

procedure TForm6.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm6.filtration;
var
 i,j,k,l: integer;
 r,g,b: array [1..3,1..3] of byte;
 r1,g1,b1: byte;
begin
 buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     pixels[1,1]:=buf.Canvas.Pixels[i-1,j-1];
     pixels[1,2]:=buf.Canvas.Pixels[i-1,j];
     pixels[1,3]:=buf.Canvas.Pixels[i-1,j+1];
     pixels[2,1]:=buf.Canvas.Pixels[i,j-1];
     pixels[2,2]:=buf.Canvas.Pixels[i,j];
     pixels[2,3]:=buf.Canvas.Pixels[i,j+1];
     pixels[3,1]:=buf.Canvas.Pixels[i+1,j-1];
     pixels[3,2]:=buf.Canvas.Pixels[i+1,j];
     pixels[3,3]:=buf.Canvas.Pixels[i+1,j+1];
     if (i=0) and (j=0) then
      begin
       pixels[2,1]:=pixels[2,3];
       pixels[3,1]:=pixels[3,3];
       pixels[1,1]:=pixels[3,1];
       pixels[1,2]:=pixels[3,2];
       pixels[1,3]:=pixels[3,3];
      end
     else
      begin
       if i=0 then
        begin
         pixels[1,1]:=pixels[3,1];
         pixels[1,2]:=pixels[3,2];
         pixels[1,3]:=pixels[3,3];
        end;
       if j=0 then
        begin
         pixels[1,1]:=pixels[1,3];
         pixels[2,1]:=pixels[2,3];
         pixels[3,1]:=pixels[3,3];
        end;
      end;
     if (i=299) and (j=299) then
      begin
       pixels[1,3]:=pixels[1,1];
       pixels[2,3]:=pixels[2,1];
       pixels[3,1]:=pixels[1,1];
       pixels[3,2]:=pixels[1,2];
       pixels[3,3]:=pixels[1,3];
      end
     else
      begin
       if i=299 then
        begin
         pixels[3,1]:=pixels[1,1];
         pixels[3,2]:=pixels[1,2];
         pixels[3,3]:=pixels[1,3];
        end;
       if j=299 then
        begin
         pixels[1,3]:=pixels[1,1];
         pixels[2,3]:=pixels[2,1];
         pixels[3,3]:=pixels[3,1];
        end;
      end;
     for k := 1 to 3 do
      begin
       for l := 1 to 3 do
        begin
         r[k,l]:=getrvalue(pixels[k,l]);
         g[k,l]:=getgvalue(pixels[k,l]);
         b[k,l]:=getbvalue(pixels[k,l]);
        end;
      end;
     r1:=round((filter[1,1]*r[1,1]+filter[1,2]*r[2,1]+filter[1,3]*r[3,1]+
          filter[2,1]*r[1,2]+filter[2,2]*r[2,2]+filter[2,3]*r[3,2]+
          filter[3,1]*r[1,3]+filter[3,2]*r[2,3]+filter[3,3]*r[3,3])/
         (filter[1,1]+filter[1,2]+filter[1,3]+
          filter[2,1]+filter[2,2]+filter[2,3]+
          filter[3,1]+filter[3,2]+filter[3,3]));
     g1:=round((filter[1,1]*g[1,1]+filter[1,2]*g[2,1]+filter[1,3]*g[3,1]+
          filter[2,1]*g[1,2]+filter[2,2]*g[2,2]+filter[2,3]*g[3,2]+
          filter[3,1]*g[1,3]+filter[3,2]*g[2,3]+filter[3,3]*g[3,3])/
         (filter[1,1]+filter[1,2]+filter[1,3]+
          filter[2,1]+filter[2,2]+filter[2,3]+
          filter[3,1]+filter[3,2]+filter[3,3]));
     b1:=round((filter[1,1]*b[1,1]+filter[1,2]*b[2,1]+filter[1,3]*b[3,1]+
          filter[2,1]*b[1,2]+filter[2,2]*b[2,2]+filter[2,3]*b[3,2]+
          filter[3,1]*b[1,3]+filter[3,2]*b[2,3]+filter[3,3]*b[3,3])/
         (filter[1,1]+filter[1,2]+filter[1,3]+
          filter[2,1]+filter[2,2]+filter[2,3]+
          filter[3,1]+filter[3,2]+filter[3,3]));
     image1.Canvas.Pixels[i,j]:=rgb(r1,g1,b1);
    end;
  end;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
var
 i,j: integer;
begin
 try
  for i := 1 to 3 do
   begin
    for j := 1 to 3 do
     begin
      filter[i,j]:=strtofloat(stringgrid1.Cells[j-1,i-1]);
     end;
   end;
  except
   on econverterror do
    begin
     showmessage('Ошибка! Некоректный ввод.');
     exit;
    end;
 end;
 filtration;
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='0';
 stringgrid1.Cells[1,0]:='-1';
 stringgrid1.Cells[2,0]:='0';
 stringgrid1.Cells[0,1]:='-1';
 stringgrid1.Cells[1,1]:='5';
 stringgrid1.Cells[2,1]:='-1';
 stringgrid1.Cells[0,2]:='0';
 stringgrid1.Cells[1,2]:='-1';
 stringgrid1.Cells[2,2]:='0';
end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[1,0]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[2,0]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[0,1]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[1,1]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[2,1]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[0,2]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[1,2]:=floattostr(round(a*1000)/1000);
 stringgrid1.Cells[2,2]:=floattostr(round(a*1000)/1000);
end;

end.
