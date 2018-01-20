unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    Image1: TImage;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  point = record
    x,y:integer;
  end;
  rect = record
    x_min,y_min,x_max,y_max:integer;
  end;

const left = 0001;
const right = 0010;
const bot = 0100;
const top = 1000;
const topleft = 1001;
const topright = 1010;
const botleft = 0101;
const botright = 0110;
var
  Form1: TForm1;
  a,b:point;
  r:rect;
  x1,x2,y1,y2:integer;
  r1,r2,r3,r4:integer;
  buf: tbitmap;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  radiobutton1.Checked:=true;
  image1.Canvas.Create;
  refresh;
  buf:=tbitmap.Create;
  buf.Height:=image1.Height;
  buf.Width:=image1.Width;
end;

function pcode(p: point; r: rect):integer;
var temp:integer;
begin
  temp:=0000;
  if p.x<r.x_min then temp:=temp+0001;
  if p.x>r.x_max then temp:=temp+0010;
  if p.y<r.y_min then temp:=temp+1000;
  if p.y>r.y_max then temp:=temp+0100;
  result:=temp;
end;

function otsech(r: rect;var a,b: point):boolean;
var code_a, code_b, code: integer; k:char;
    cur: point;
begin
  code_a:=pcode(a,r);
  code_b:=pcode(b,r);
  if (code_a=0)and(code_b=0) then result:=false;
// пока одна из точек отрезка вне прямоугольника
  while (code_a>0)or(code_b>0) do
    begin
      // выбираем точку c с ненулевым кодом
      if code_a>0 then
        begin
          code:=code_a;
          cur:=a;
          k:='a';
        end
      else
        begin
          code:=code_b;
          cur:=b;
          k:='b';
        end;
      //если cur левее r, то передвигаем cur на прямую x = r.x_min
      //если cur правее r, то передвигаем cur на прямую x = r.x_max
     if (code=LEFT)or(code=topleft)or(code=botleft) then
        begin
          cur.y:=round(cur.y+(a.y - b.y)*(r.x_min - cur.x)/(a.x - b.x));
          cur.x:=r.x_min;
        end
      else
        if (code=RIGHT)or(code=topright)or(code=topright) then
          begin
            cur.y:=round(cur.y+(a.y - b.y)*(r.x_max - cur.x)/(a.x - b.x));
            cur.x:=r.x_max;
          end; 
      //если cur ниже r, то передвигаем cur на прямую y = r.y_min
      //если cur выше r, то передвигаем cur на прямую y = r.y_max
       if (code=BOT)or(code=botleft)or(code=botright) then
         begin
           cur.x:=round(cur.x+(a.x - b.x)*(r.y_min - cur.y)/(a.y - b.y));
           cur.y:=r.y_min;
         end
       else
         if (code=TOP)or(code=topleft)or(code=topright) then
           begin
             cur.x:=round(cur.x+(a.x - b.x)*(r.y_max - cur.y)/(a.y - b.y));
             cur.y:=r.y_max;
           end;
       //обновляем код
       if k='a' then a:=cur
       else
         b:=cur;
       code_a:=pcode(a,r);
       code_b:=pcode(b,r);
    end;
  //оба кода равны 0, следовательно обе точки в прямоугольнике
  result:=true;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  x1:=x;
  y1:=y;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  x2:=x;
  y2:=y;
  if radiobutton1.Checked then
    begin
      image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
      Image1.Canvas.Rectangle(x1,y1,x2,y2);
      r1:=x1; r2:=y1; r3:=x2; r4:=y2;

      if x1>x2 then
        begin
          r.x_max:=x1;
          r.x_min:=x2;
        end
      else
        begin
          r.x_max:=x2;
          r.x_min:=x1;
        end;

      if y1>y2 then
        begin
          r.y_max:=y1;
          r.y_min:=y2;
        end
      else
        begin
          r.y_max:=y2;
          r.y_min:=y1;
        end;
    end
  else
    begin
      Image1.Canvas.moveto(x1,y1);
      a.x:=x1;
      a.y:=y1;
      Image1.Canvas.lineto(x2,y2);
      b.x:=x2;
      b.y:=y2;
    end;
end;



procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if otsech(r,a,b) then
    begin
      Image1.Canvas.pen.Color:=clwhite;
      image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
      image1.Canvas.refresh;
      Image1.Canvas.pen.Color:=clblack;
      Image1.Canvas.Rectangle(r1,r2,r3,r4);
      image1.Canvas.refresh;
      Image1.Canvas.moveto(a.x,a.y);
      Image1.Canvas.lineto(b.x,b.y);
    end;
end;

end.
