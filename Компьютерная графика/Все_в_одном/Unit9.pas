unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtDlgs, ExtCtrls, XPMan, StdCtrls, Buttons, Spin;

type
  TForm8 = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    XPManifest1: TXPManifest;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    N2: TMenuItem;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    Bevel2: TBevel;
    GroupBox3: TGroupBox;
    Bevel3: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    Edit3: TEdit;
    UpDown3: TUpDown;
    Edit4: TEdit;
    UpDown4: TUpDown;
    Edit5: TEdit;
    UpDown5: TUpDown;
    Edit6: TEdit;
    UpDown6: TUpDown;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure gethistograms;
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure boxclear;
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown6Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  xrr,xrl,xgr,xgl,xbr,xbl: integer;
implementation

{$R *.dfm}

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form8.Free;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 image2.Canvas.Pen.Color:=clred;
 image3.Canvas.Pen.Color:=clgreen;
 image4.Canvas.Pen.Color:=clblue;
 gethistograms;
 xrr:=255;
 xrl:=0;
 xgr:=255;
 xgl:=0;
 xbr:=255;
 xbl:=0;
end;

procedure TForm8.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm8.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm8.N2Click(Sender: TObject);
begin
 openpicturedialog1.Filter:='bmp|*.bmp|';
 if openpicturedialog1.Execute then
  begin
   image1.Picture.LoadFromFile(openpicturedialog1.FileName);
   boxclear;
   gethistograms;
   edit1.Text:='0';
   edit2.Text:='255';
   edit3.Text:='0';
   edit4.Text:='255';
   edit5.Text:='255';
   edit6.Text:='0';
   xrr:=255;
   xrl:=0;
   xgr:=255;
   xgl:=0;
   xbr:=255;
   xbl:=0;
   updown1.Position:=0;
   updown2.Position:=0;
   updown3.Position:=0;
   updown4.Position:=0;
   updown5.Position:=0;
   updown6.Position:=0;
  end;
end;

procedure TForm8.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(abs(y-150)*2);
end;

procedure TForm8.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(abs(y-150)*2);
end;

procedure TForm8.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(abs(y-150)*2);
end;

procedure TForm8.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
var
 i,j,xr,xl: integer;
 k: real;
 r,g,b,rn: byte;
begin
 xr:=strtoint(edit2.Text);
 xl:=strtoint(edit1.Text);
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r:=getrvalue(image1.Canvas.Pixels[i,j]);
     g:=getgvalue(image1.Canvas.Pixels[i,j]);
     b:=getbvalue(image1.Canvas.Pixels[i,j]);
     rn:=round(r*k-256+xr-xl);
     if rn>255 then rn:=255;
     image1.Canvas.Pixels[i,j]:=rgb(rn,g,b);
    end;
  end;
 gethistograms;
end;

procedure TForm8.SpeedButton2Click(Sender: TObject);
var
 i,j,xr,xl: integer;
 k: real;
 r,g,b,rn: byte;
begin
 xr:=strtoint(edit2.Text);
 xl:=strtoint(edit1.Text);
 k:=256/(xr-xl);
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r:=getrvalue(image1.Canvas.Pixels[i,j]);
     g:=getgvalue(image1.Canvas.Pixels[i,j]);
     b:=getbvalue(image1.Canvas.Pixels[i,j]);
     rn:=round(r/k+xl);
     if rn>255 then rn:=255;
     image1.Canvas.Pixels[i,j]:=rgb(rn,g,b);
    end;
  end;
 gethistograms;
end;

procedure TForm8.SpeedButton3Click(Sender: TObject);
var
 i,j,xr,xl: integer;
 k: real;
 r,g,b,gn: byte;
begin
 xr:=strtoint(edit5.Text);
 xl:=strtoint(edit6.Text);
 k:=256/(xr-xl);
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r:=getrvalue(image1.Canvas.Pixels[i,j]);
     g:=getgvalue(image1.Canvas.Pixels[i,j]);
     b:=getbvalue(image1.Canvas.Pixels[i,j]);
     gn:=round(g/k+xl);
     if gn>255 then gn:=255;
     image1.Canvas.Pixels[i,j]:=rgb(r,gn,b);
    end;
  end;
 gethistograms;
end;

procedure TForm8.SpeedButton4Click(Sender: TObject);
var
 i,j,xr,xl: integer;
 k: real;
 r,g,b,bn: byte;
begin
 xr:=strtoint(edit5.Text);
 xl:=strtoint(edit6.Text);
 k:=256/(xr-xl);
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r:=getrvalue(image1.Canvas.Pixels[i,j]);
     g:=getgvalue(image1.Canvas.Pixels[i,j]);
     b:=getbvalue(image1.Canvas.Pixels[i,j]);
     bn:=round(b/k+xl);
     if bn>255 then bn:=255;
     image1.Canvas.Pixels[i,j]:=rgb(r,g,bn);
    end;
  end;
 gethistograms;
end;

procedure TForm8.SpeedButton5Click(Sender: TObject);
var
 i,j,xr,xl: integer;
 k: real;
 r,g,b,gn: byte;
begin
 xr:=strtoint(edit5.Text);
 xl:=strtoint(edit6.Text);
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r:=getrvalue(image1.Canvas.Pixels[i,j]);
     g:=getgvalue(image1.Canvas.Pixels[i,j]);
     b:=getbvalue(image1.Canvas.Pixels[i,j]);
     gn:=round(g*k-256+xr-xl);
     if gn>255 then gn:=255;
     image1.Canvas.Pixels[i,j]:=rgb(r,gn,b);
    end;
  end;
 gethistograms;
end;

procedure TForm8.SpeedButton6Click(Sender: TObject);
var
 i,j,xr,xl: integer;
 k: real;
 r,g,b,bn: byte;
begin
 xr:=strtoint(edit5.Text);
 xl:=strtoint(edit6.Text);
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r:=getrvalue(image1.Canvas.Pixels[i,j]);
     g:=getgvalue(image1.Canvas.Pixels[i,j]);
     b:=getbvalue(image1.Canvas.Pixels[i,j]);
     bn:=round(b*k-256+xr-xl);
     if bn>255 then bn:=255;
     image1.Canvas.Pixels[i,j]:=rgb(r,g,bn);
    end;
  end;
 gethistograms;
end;

procedure TForm8.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit1.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit2.Text);
 if abs(a-b)=0 then dec(a);
 edit1.Text:=inttostr(a);
end;

procedure TForm8.UpDown2Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit2.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit1.Text);
 if abs(a-b)=0 then inc(a);
 edit2.Text:=inttostr(a);
end;

procedure TForm8.UpDown3Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit3.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit4.Text);
 if abs(a-b)=0 then dec(a);
 edit3.Text:=inttostr(a);
end;

procedure TForm8.UpDown4Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit4.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit3.Text);
 if abs(a-b)=0 then inc(a);
 edit4.Text:=inttostr(a);
end;

procedure TForm8.UpDown5Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit5.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit6.Text);
 if abs(a-b)=0 then inc(a);
 edit5.Text:=inttostr(a);
end;

procedure TForm8.UpDown6Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit6.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit5.Text);
 if abs(a-b)=0 then dec(a);
 edit6.Text:=inttostr(a);
end;

procedure TForm8.gethistograms;
var
 i,j: integer;
 r,g,b: array [0..255] of byte;
 r1,g1,b1: byte;
begin
 for i := 0 to 255 do
  begin
   r[i]:=0;
   g[i]:=0;
   b[i]:=0;
  end;
 for i := 0 to 299 do
  begin
   for j := 0 to 299 do
    begin
     r1:=getrvalue(Image1.Canvas.Pixels[i,j]);
     inc(r[r1]);
     g1:=getgvalue(Image1.Canvas.Pixels[i,j]);
     inc(g[g1]);
     b1:=getbvalue(Image1.Canvas.Pixels[i,j]);
     inc(b[b1]);
    end;
  end;
 boxclear;
 image2.Canvas.MoveTo(0,abs(round(r[0]/2)-150));
 image3.Canvas.MoveTo(0,abs(round(g[0]/2)-150));
 image4.Canvas.MoveTo(0,abs(round(b[0]/2)-150));
 for i := 1 to 255 do
  begin
   image2.Canvas.LineTo(i-1,abs(round(r[i]/2)-150));
   image2.Canvas.LineTo(i,abs(round(r[i]/2)-150));
   image3.Canvas.LineTo(i-1,abs(round(g[i]/2)-150));
   image3.Canvas.LineTo(i,abs(round(g[i]/2)-150));
   image4.Canvas.LineTo(i-1,abs(round(b[i]/2)-150));
   image4.Canvas.LineTo(i,abs(round(b[i]/2)-150));
  end;
 for i := 0 to 255 do
  begin
   for j := 0 to 150 do
    begin
     if image2.Canvas.Pixels[i,abs(j-150)]<>clwhite then
      begin
       image2.Canvas.MoveTo(i,150);
       image2.Canvas.LineTo(i,abs(j-150));
      end;
     if image3.Canvas.Pixels[i,abs(j-150)]<>clwhite then
      begin
       image3.Canvas.MoveTo(i,150);
       image3.Canvas.LineTo(i,abs(j-150));
      end;
     if image4.Canvas.Pixels[i,abs(j-150)]<>clwhite then
      begin
       image4.Canvas.MoveTo(i,150);
       image4.Canvas.LineTo(i,abs(j-150));
      end;
    end;
  end;
end;

procedure TForm8.boxclear;
var
 p,b: tcolor;
begin
 with image2.Canvas do
  begin
   p:=Pen.Color;
   b:=Brush.Color;
   Pen.Color:=clwhite;
   Brush.Color:=clwhite;
   Rectangle(0,0,image1.Height,image1.Width);
   Pen.Color:=p;
   Brush.Color:=b;
  end;
 with image3.Canvas do
  begin
   p:=Pen.Color;
   b:=Brush.Color;
   Pen.Color:=clwhite;
   Brush.Color:=clwhite;
   Rectangle(0,0,image1.Height,image1.Width);
   Pen.Color:=p;
   Brush.Color:=b;
  end;
 with image4.Canvas do
  begin
   p:=Pen.Color;
   b:=Brush.Color;
   Pen.Color:=clwhite;
   Brush.Color:=clwhite;
   Rectangle(0,0,image1.Height,image1.Width);
   Pen.Color:=p;
   Brush.Color:=b;
  end;
end;

end.
