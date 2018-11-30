unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, XPMan, ComCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    XPManifest1: TXPManifest;
    StatusBar1: TStatusBar;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GroupBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GroupBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure putpixel(x,y: integer);
    procedure bresenham_circle;
    procedure bresenham_ellipse;
    procedure symmetry_circle(x,y: integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  xc,yc,rc,xe,ye,ae,be: integer;
  buf: tbitmap;
  mc,me: boolean;
implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form2.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 buf:=tbitmap.Create;
 buf.Height:=image1.Height;
 buf.Width:=image1.Width;
 mc:=false;
 me:=false;
end;

procedure TForm2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm2.GroupBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm2.GroupBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm2.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if button=mbleft then
  begin
   mc:=true;
   xc:=x;
   yc:=y;
  end;
 if button=mbright then
  begin
   me:=true;
   xe:=x;
   ye:=y;
  end;
 if button<>mbmiddle then buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
end;

procedure TForm2.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if mc=true then
  begin
   image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
   rc:=x-xc;
   if rc<0 then rc:=0;
   if ((xc+rc)>300) or ((xc-rc)<0) or ((yc+rc)>300) or ((yc-rc)<0) then exit;
   bresenham_circle;
  end;
 if me=true then
  begin
   image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
   ae:=x-xe;
   be:=y-ye;
   if ae<0 then ae:=0;
   if be<0 then be:=0;
   if ((xe+ae)>300) or ((xe-ae)<0) or ((ye+be)>300) or ((ye-be)<0) then exit;
   bresenham_ellipse;
  end;
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm2.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 mc:=false;
 me:=false;
end;

procedure TForm2.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure tform2.putpixel(x: Integer; y: Integer);
begin
 image1.Canvas.Pixels[x,y]:=clblack;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
 try
  xc:=strtoint(edit1.Text);
  yc:=strtoint(edit2.Text);
  rc:=strtoint(edit3.Text);
 except
  on EConvertError do
   begin
    showmessage('Введены неверные данные!');
    exit;
   end;
 end;
 if (xc>299) or (xc<0) or (yc>299) or (yc<0) or (rc<1) then
  begin
   showmessage('Выход за пределы допустимых значений!');
   exit;
  end;
 if ((xc+rc)>299) or ((yc+rc)>299) or ((xc-rc)<0) or ((yc-rc)<0) then
  begin
   showmessage('Окружность выходит за пределы рисунка!');
   exit;
  end;
 bresenham_circle;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
 try
  xe:=strtoint(edit4.Text);
  ye:=strtoint(edit5.Text);
  ae:=strtoint(edit6.Text);
  be:=strtoint(edit7.Text);
 except
  on EConvertError do
   begin
    showmessage('Введены неверные данные!');
    exit;
   end;
 end;
 if (xe>299) or (xe<0) or (ye>299) or (ye<0) or (ae<1) or (be<1) then
  begin
   showmessage('Выход за пределы допустимых значений!');
   exit;
  end;
 if ((xe+ae)>299) or ((ye+be)>299) or ((xe-ae)<0) or ((ye-be)<0) then
  begin
   showmessage('Эллипс выходит за пределы рисунка!');
   exit;
  end;
 bresenham_ellipse;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
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

procedure tform2.symmetry_circle(x: Integer; y: Integer);
begin
 putpixel(x+xc,y+yc);
 putpixel(x+xc,-y+yc);
 putpixel(-x+xc,-y+yc);
 putpixel(-x+xc,y+yc);
 putpixel(y+xc,x+yc);
 putpixel(y+xc,-x+yc);
 putpixel(-y+xc,-x+yc);
 putpixel(-y+xc,x+yc);
end;

procedure tform2.bresenham_circle;
var
 x,y,d: integer;
begin
 d:=3-2*rc;
 x:=0;
 y:=rc;
 while x<=y do
  begin
   symmetry_circle(x,y);
   if d<0 then d:=d+4*x+6
   else
    begin
     d:=d+4*(x-y)+10;
     dec(y);
    end;
   inc(x);
  end;
end;

procedure tform2.bresenham_ellipse;
var
 col,i,row,bnew,a_square,b_square,
 two_a_square,two_b_square,
 four_a_square,four_b_square,d: integer;
begin
 b_square:=be*be;
 a_square:=ae*ae;
 row:=be;
 col:=0;
 two_a_square:=a_square*2;
 four_a_square:=a_square*4;
 four_b_square:=b_square*4;
 two_b_square:=b_square*2;
 d:=two_a_square*((row-1)*(row))+a_square+two_b_square*(1-a_square);
 while a_square*(row)>b_square*(col) do
  begin
   putpixel(col+xe,row+ye);
   putpixel(col+xe,ye-row);
   putpixel(xe-col,row+ye);
   putpixel(xe-col,ye-row);
   if d>=0 then
    begin
     dec(row);
     d:=d-four_a_square*(row);
    end;
   d:=d+two_b_square*(3+(col*2));
   inc(col);
  end;
 d:=two_b_square*(col+1)*col+two_a_square*(row*(row-2)+1)+(1-two_a_square)*b_square;
 while row>=0 do
  begin
   putpixel(col+xe,row+ye);
   putpixel(col+xe,ye-row);
   putpixel(xe-col,row+ye);
   putpixel(xe-col,ye-row);
   if d<=0 then
    begin
     inc(col);
     d:=d+four_b_square*col;
    end;
   dec(row);
   d:=d+two_a_square*(3-(row*2));
  end;
end;
end.
