unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer); 
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
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
  Form1: TForm1;
  buf: TBitMap;
  points : array[1..10] of coordinate;
  defpoints : array[1..10] of coordinate;
  pr : array[1..10,1..10] of boolean;
  x1,y1,x2,y2: integer;
  p,r,ready1,makeRebr,moveP: boolean;
  count, ip, v, t1, t2: integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  image1.Canvas.Create;
  image2.Canvas.Create;
  buf:=tbitmap.Create;
  buf.Height:=image1.Height;
  buf.Width:=image1.Width;
  buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
  count:=0;
  p:=false;
  r:=false;
  ready1:=false;
  makeRebr:=false;
  moveP:=false; 
end;

//Image1

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i: integer;
begin
  if p then
    begin
      count:=count+1;
      points[count].x:=x;
      points[count].y:=y;
      image1.Canvas.Ellipse(points[count].x-3,points[count].y-3,points[count].x+3,points[count].y+3);
    end;
  if r then
    for i := 1 to count do
      if (x<points[i].x+3) and (x>points[i].x-3) and
         (y<points[i].y+3) and (y>points[i].y-3) then
        begin
          x2:=points[i].x;
          y2:=points[i].y;
          if makeRebr then
            begin
              image1.Canvas.MoveTo(x1,y1);
              image1.Canvas.LineTo(x2,y2);
              pr[ip,i]:=true;
              pr[i,ip]:=true;
            end;
        end;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
begin
  if r then
    for i := 1 to count do
      if (x<points[i].x+3) and (x>points[i].x-3) and
         (y<points[i].y+3) and (y>points[i].y-3) then
        begin
          ip:=i;
          x1:=points[i].x;
          y1:=points[i].y;
          makeRebr:=true;
        end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var i:integer;
begin

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  p:=true;
  r:=false;
  ready1:=false;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  r:=true;
  p:=false;
  ready1:=false;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i: integer;
begin
  ready1:=true;
  p:=false;
  r:=false;
  image2.picture:=image1.picture;
  for i:=1 to count do
    defpoints[i]:=points[i];
end;

//Image2

procedure TForm1.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i,j: integer;
begin
  for i := 1 to count do
      if (x<points[i].x+3) and (x>points[i].x-3) and
         (y<points[i].y+3) and (y>points[i].y-3) then
        begin
          ip:=i;
          moveP:=true;
          for j:=1 to count do
            if pr[ip,j]=true then
              begin
                image2.canvas.Pen.Color:=clwhite;
                image2.Canvas.MoveTo(points[ip].x,points[ip].y);
                image2.Canvas.LineTo(points[j].x,points[j].y);
              end;
          image2.canvas.Pen.Color:=clWhite;
          image2.Canvas.Ellipse(points[ip].x-3,points[ip].y-3,points[ip].x+3,points[ip].y+3);
          image2.canvas.Pen.Color:=clBlack;
        end;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if moveP then
    begin
      x1:=x;
      y1:=y;
    end;
end;

procedure TForm1.Image2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i: integer;
begin
  if moveP then
    begin
      points[ip].x:=x;
      points[ip].y:=y;
      image2.Canvas.Ellipse(points[ip].x-3,points[ip].y-3,points[ip].x+3,points[ip].y+3);
      for i:=1 to count do
        begin
          if pr[ip,i]=true then
            begin
              image2.canvas.Pen.Color:=clBlack;
              image2.Canvas.MoveTo(points[ip].x,points[ip].y);
              image2.Canvas.LineTo(points[i].x,points[i].y);
            end;
        end;
      moveP:=false;
    end;
end;

function Calc(c1,c2,t1,t2,t:integer):integer;
var value: real;
begin
  value:=c1+(c2-c1)*(t-t1)/(t2-t1);
  calc:=round(value);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j,x,y,t:integer;
begin
  v:=strtoint(edit1.Text);
  t1:=0;
  t2:=v;
  for i:=1 to count do
    begin
      t:=0;
      x:=0;
      y:=0;

      while (t<=t2) do
        begin

          if t>0 then
            begin
              image2.canvas.Pen.Color:=clwhite;
              image2.Canvas.Ellipse(x-3,y-3,x+3,y+3);
              for j:=1 to count do
              if pr[i,j]=true then
                begin
                  image2.canvas.Pen.Color:=clwhite;
                  image2.Canvas.MoveTo(x,y);
                  image2.Canvas.Ellipse(x-3,y-3,x+3,y+3);
                  image2.Canvas.LineTo(points[j].x,points[j].y);
                  image2.Canvas.Ellipse(points[j].x-3,points[j].y-3,points[j].x+3,points[j].y+3);
                end;
              end;

          x:=calc(defpoints[i].x,points[i].x,t2,t1,t);
          y:=calc(defpoints[i].y,points[i].y,t2,t1,t);
          t:=t+5;

          image2.canvas.Pen.Color:=clBlack;
          image2.Canvas.Ellipse(x-3,y-3,x+3,y+3);

          for j:=1 to count do
            if pr[i,j]=true then
              begin
                image2.canvas.Pen.Color:=clBlack;
                image2.Canvas.MoveTo(points[j].x,points[j].y);
                image2.Canvas.Ellipse(x-3,y-3,x+3,y+3);
                image2.Canvas.LineTo(x,y);
                image2.Canvas.Ellipse(points[j].x-3,points[j].y-3,points[j].x+3,points[j].y+3);
                image2.Canvas.MoveTo(points[j].x,points[j].y);
              end;

          if t=t2 then
            begin
              points[i].x:=defpoints[i].x;
              points[i].y:=defpoints[i].y;
            end;

          delay(5);
        end;
    end;
end;

procedure TForm1.Delay(Value: Cardinal);
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

end.
