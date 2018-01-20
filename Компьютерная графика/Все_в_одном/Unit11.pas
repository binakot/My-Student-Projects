unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Menus, ExtCtrls, ComCtrls, Buttons, StdCtrls;

type
  TForm10 = class(TForm)
    XPManifest1: TXPManifest;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    UpDown1: TUpDown;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure drawpoints(color: tcolor);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Delay(Value: Cardinal);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 coordinate = record
  x,y: integer;
 end;

var
  Form10: TForm10;
  points,points_,points__: array [1..12] of coordinate;
  v,ip: integer;
  a,b: boolean;
  buf: tbitmap;
implementation

{$R *.dfm}

procedure Tform10.Delay(Value: Cardinal);
var
  F, N: Cardinal;
begin
  N := 0;
  while N <= (Value div 10) do
  begin
    SleepEx(1, True);
    Application.ProcessMessages;
    Inc(N);
  end;
  F := GetTickCount;
  repeat
    Application.ProcessMessages;
    N := GetTickCount;
  until (N - F >= (Value mod 10)) or (N < F);
end;

procedure Tform10.drawpoints(color: tcolor);
 var
  i: integer;
 begin
  image1.Canvas.Pen.Color:=color;
  image1.Canvas.Brush.Color:=color;
  image1.Canvas.MoveTo(points[1].x,points[1].y);
  for i := 2 to 6 do
   begin
    image1.Canvas.LineTo(points[i].x,points[i].y);
   end;
  image1.Canvas.MoveTo(points[7].x,points[7].y);
  for i := 8 to 12 do
   begin
    image1.Canvas.LineTo(points[i].x,points[i].y);
   end;
  for i := 1 to 12 do
   begin
    image1.Canvas.MoveTo(points[i].x,points[i].y);
    image1.Canvas.Ellipse(points[i].x-3,points[i].y-3,points[i].x+3,points[i].y+3);
   end;
 end;
procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form10.Free;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 image2.Canvas.Create;
 buf:=tbitmap.Create;
 buf.Height:=image1.Height;
 buf.Width:=image1.Width;
 buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
 v:=15;
 points[1].x:=60;
 points[1].y:=50;
 points[2].x:=130;
 points[2].y:=50;
 points[3].x:=130;
 points[3].y:=110;
 points[4].x:=60;
 points[4].y:=110;
 points[5].x:=60;
 points[5].y:=180;
 points[6].x:=130;
 points[6].y:=180;
 points[7].x:=170;
 points[7].y:=50;
 points[8].x:=240;
 points[8].y:=50;
 points[9].x:=240;
 points[9].y:=110;
 points[10].x:=170;
 points[10].y:=110;
 points[11].x:=170;
 points[11].y:=180;
 points[12].x:=240;
 points[12].y:=180;
 points__[1].x:=130;
 points__[1].y:=50;
 points__[2].x:=60;
 points__[2].y:=50;
 points__[3].x:=60;
 points__[3].y:=110;
 points__[4].x:=130;
 points__[4].y:=110;
 points__[5].x:=130;
 points__[5].y:=180;
 points__[6].x:=60;
 points__[6].y:=180;
 points__[7].x:=240;
 points__[7].y:=50;
 points__[8].x:=170;
 points__[8].y:=50;
 points__[9].x:=170;
 points__[9].y:=110;
 points__[10].x:=240;
 points__[10].y:=110;
 points__[11].x:=240;
 points__[11].y:=180;
 points__[12].x:=170;
 points__[12].y:=180;
 drawpoints(clblack);
 a:=false;
 b:=false;
end;

procedure TForm10.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm10.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if a=true then
  begin
   points[ip].x:=x;
   points[ip].y:=y;
   b:=true;
  end;
end;

procedure TForm10.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  i: integer;
begin
 if a=true then a:=false;
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
 image1.Cursor:=crCross;
 for i := 1 to 12 do
  begin
   if (x<points[i].x+3) and (x>points[i].x-3) and
      (y<points[i].y+3) and (y>points[i].y-3) then
    begin
     image1.Cursor:=crHandPoint;
     a:=true;
     ip:=i;
     if b=true then
      begin
       image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
       points[ip].x:=x;
       points[ip].y:=y;
       drawpoints(clblack);
      end;
    end;
  end;
end;

procedure TForm10.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if b=true then b:=false;
end;

procedure TForm10.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm10.SpeedButton1Click(Sender: TObject);
var
 i,xn,yn,t1,t2,t,x1,x2,y1,y2,k: integer;
begin
 image2.Canvas.Pen.Color:=clwhite;
 image2.Canvas.Brush.Color:=clwhite;
 image2.Canvas.Rectangle(0,0,image1.Height,image1.Width);
 image2.Canvas.Pen.Color:=clblue;
 image2.Canvas.Brush.Color:=clred;
 image2.Canvas.MoveTo(points[1].x,points[1].y);
 for i := 2 to 6 do
  begin
   image2.Canvas.LineTo(points[i].x,points[i].y);
  end;
 image2.Canvas.MoveTo(points[7].x,points[7].y);
 for i := 8 to 12 do
  begin
   image2.Canvas.LineTo(points[i].x,points[i].y);
  end;
 for i := 1 to 12 do
  begin
   image2.Canvas.MoveTo(points[i].x,points[i].y);
   image2.Canvas.Ellipse(points[i].x-3,points[i].y-3,points[i].x+3,points[i].y+3);
  end;
 points_:=points;
 for k := 1 to 12 do
  begin
   x1:=points[k].x;
   y1:=points[k].y;
   x2:=points__[k].x;
   y2:=points__[k].y;
   t1:=0;
   t2:=v;
   for t := 1 to v do
    begin
     delay(1);
     image2.Canvas.Pen.Color:=clwhite;
     image2.Canvas.Brush.Color:=clwhite;
     image2.Canvas.MoveTo(points_[1].x,points_[1].y);
     for i := 2 to 6 do
      begin
       image2.Canvas.LineTo(points_[i].x,points_[i].y);
      end;
     image2.Canvas.MoveTo(points_[7].x,points_[7].y);
     for i := 8 to 12 do
      begin
       image2.Canvas.LineTo(points_[i].x,points_[i].y);
      end;
     for i := 1 to 12 do
      begin
       image2.Canvas.MoveTo(points_[i].x,points_[i].y);
       image2.Canvas.Ellipse(points_[i].x-3,points_[i].y-3,points_[i].x+3,points_[i].y+3);
      end;
     points_[k].x:=round(x1+(x2-x1)*(t-t1)/(t2-t1));
     points_[k].y:=round(y1+(y2-y1)*(t-t1)/(t2-t1));
     image2.Canvas.Pen.Color:=clblue;
     image2.Canvas.Brush.Color:=clred;
     image2.Canvas.MoveTo(points_[1].x,points_[1].y);
     for i := 2 to 6 do
      begin
       image2.Canvas.LineTo(points_[i].x,points_[i].y);
      end;
     image2.Canvas.MoveTo(points_[7].x,points_[7].y);
     for i := 8 to 12 do
      begin
       image2.Canvas.LineTo(points_[i].x,points_[i].y);
      end;
     for i := 1 to 12 do
      begin
       image2.Canvas.MoveTo(points_[i].x,points_[i].y);
       image2.Canvas.Ellipse(points_[i].x-3,points_[i].y-3,points_[i].x+3,points_[i].y+3);
      end;
    end;
  end;
end;

procedure TForm10.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
 if button=btprev then dec(v);
 if button=btnext then inc(v);
 edit1.Text:=inttostr(v);
end;

end.
