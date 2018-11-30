unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  tpoint = record
   x,y: integer;
   code_1,code_2,code_3,code_4: boolean;
  end;
  TForm5 = class(TForm)
    XPManifest1: TXPManifest;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure canvas_clear;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure getpointcode(var point: tpoint; x,y: integer);
    procedure drawline;
    procedure getcrossing(var x,y: integer; x1,y1,x2,y2,x3,y3,x4,y4: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  range,a,b: boolean;
  buf,buf_begin: tbitmap;
  x0,y0,x1,y1: integer;
  x2,y2,x3,y3: integer;
  point_begin,point_end: tpoint;
implementation

{$R *.dfm}

procedure tform5.getcrossing(var x,y: integer; x1,y1,x2,y2,x3,y3,x4,y4: integer);
 var
  a1,b1,c1,a2,b2,c2: real;
 begin
  a1:=y2-y1;
  b1:=x1-x2;
  c1:=y1*(x2-x1)-x1*(y2-y1);
  a2:=y4-y3;
  b2:=x3-x4;
  c2:=y3*(x4-x3)-x3*(y4-y3);
  if (a1=0) and (b1<>0) then
   begin
    x:=round((b2*c1/b1-c2)/a2);
    y:=round(-c1/b1);
   end;
  if (a1<>0) and (b1=0) then
   begin
    x:=round(-c1/a1);
    y:=round((a2*c1/a1-c2)/b2);
   end;
 end;

procedure tform5.drawline;
var
 exit: boolean;
 vs: tpoint;
 x,y: integer;
begin
 getpointcode(point_begin,x2,y2);
 getpointcode(point_end,x3,y3);
 exit:=false;
 repeat
  if (point_begin.code_1=false) and (point_begin.code_2=false) and
     (point_begin.code_3=false) and (point_begin.code_4=false) and
     (point_end.code_1=false) and (point_end.code_2=false) and
     (point_end.code_3=false) and (point_end.code_4=false) then
   begin
    image1.Canvas.MoveTo(point_begin.x,point_begin.y);
    image1.Canvas.LineTo(point_end.x,point_end.y);
    exit:=true;
   end;
  if ((point_begin.code_1=true) and (point_end.code_1=true)) or
     ((point_begin.code_2=true) and (point_end.code_2=true)) or
     ((point_begin.code_3=true) and (point_end.code_3=true)) or
     ((point_begin.code_4=true) and (point_end.code_4=true)) then
   begin
    exit:=true;
   end;
  if exit<>true then
   begin
    if (point_begin.code_1=false) and (point_begin.code_2=false) and
       (point_begin.code_3=false) and (point_begin.code_4=false) then
     begin
      vs:=point_begin;
      point_begin:=point_end;
      point_end:=vs;
     end;
    if point_begin.code_4=true then
     begin
      getcrossing(x,y,x0,y0,x1,y0,point_begin.x,point_begin.y,point_end.x,point_end.y);
     end
    else
     begin
      if point_begin.code_3=true then
       begin
        getcrossing(x,y,x0,y1,x1,y1,point_begin.x,point_begin.y,point_end.x,point_end.y);
       end
      else
       begin
        if point_begin.code_2=true then
         begin
          getcrossing(x,y,x1,y0,x1,y1,point_begin.x,point_begin.y,point_end.x,point_end.y);
         end
        else
         begin
          getcrossing(x,y,x0,y0,x0,y1,point_begin.x,point_begin.y,point_end.x,point_end.y);
         end;
       end;
     end;
    if (x+1=x0) or (x-1=x0) then x:=x0;
    if (x+1=x1) or (x-1=x1) then x:=x1;
    if (y+1=y0) or (y-1=y0) then y:=y0;
    if (y+1=y1) or (y-1=y1) then y:=y1;
    getpointcode(point_begin,x,y);
   end;
 until exit=true;

end;

procedure tform5.getpointcode(var point: tpoint; x,y: integer);
begin
 if (x>=x0) then point.code_1:=false
 else point.code_1:=true;
 if (x<=x1) then point.code_2:=false
 else point.code_2:=true;
 if (y>y1) then point.code_3:=true
 else point.code_3:=false;
 if (y<y0) then point.code_4:=true
 else point.code_4:=false;
 point.x:=x;
 point.y:=y;
end;

procedure tform5.canvas_clear;
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

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form5.Free;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 range:=false;
 buf:=tbitmap.Create;
 buf.Height:=image1.Height;
 buf.Width:=image1.Width;
 buf_begin:=tbitmap.Create;
 buf_begin.Height:=image1.Height;
 buf_begin.Width:=image1.Width;
 a:=false;
 b:=false;
end;

procedure TForm5.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm5.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if button=mbleft then
  begin
   if range=true then canvas_clear;
   buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
   x0:=x;
   y0:=y;
   a:=true;
  end;
 if button=mbright then
  begin
   if range=true then
    begin
     b:=true;
     buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
     buf_begin.Canvas.CopyRect(bounds(0,0,buf_begin.Width,buf_begin.Height),image1.Canvas,bounds(0,0,buf_begin.Width,buf_begin.Height));
     x2:=x;
     y2:=y;
     image1.Canvas.MoveTo(x,y);
    end;
  end;
end;

procedure TForm5.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if a=true then
  begin
   image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
   x1:=x;
   y1:=y;
   image1.Canvas.Rectangle(x0,y0,x1,y1);
  end;
 if b=true then
  begin
   image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
   x3:=x;
   y3:=y;
   image1.Canvas.MoveTo(x2,y2);
   image1.Canvas.LineTo(x3,y3);
  end;
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm5.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if a=true then
  begin
   image1.Canvas.Rectangle(x0,y0,x1,y1);
   a:=false;
   range:=true;
  end;
 if b=true then
  begin
   image1.Canvas.MoveTo(x2,y2);
   image1.Canvas.LineTo(x3,y3);
   image1.Canvas.CopyRect(bounds(0,0,image1.Width,image1.Height),buf_begin.Canvas,bounds(0,0,buf_begin.Width,buf_begin.Height));
   b:=false;
   drawline;
  end;
end;

procedure TForm5.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
 try
  x0:=strtoint(edit1.Text);
  y0:=strtoint(edit2.Text);
  x1:=strtoint(edit3.Text);
  y1:=strtoint(edit4.Text);
  except
   on econverterror do
    begin
     showmessage('Ошибка! Некоректный ввод.');
     exit;
    end;
 end;
 if range=true then canvas_clear;
 image1.Canvas.Rectangle(x0,y0,x1,y1);
 range:=true;
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
 canvas_clear;
 if range=true then range:=false;
end;

procedure TForm5.SpeedButton3Click(Sender: TObject);
begin
 if range=false then
  begin
   showmessage('Ошибка! Сначало постройте прямоугольную область.');
   exit;
  end;
 try
  x2:=strtoint(edit5.Text);
  y2:=strtoint(edit6.Text);
  x3:=strtoint(edit7.Text);
  y3:=strtoint(edit8.Text);
  except
   on econverterror do
    begin
     showmessage('Ошибка! Некоректный ввод.');
     exit;
    end;
 end;
 drawline;
end;

end.
