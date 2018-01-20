unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Math, dglOpenGL;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    BitBtn1: TBitBtn;
    GroupBox5: TGroupBox;
    Edit13: TEdit;
    Label17: TLabel;
    Edit14: TEdit;
    Label18: TLabel;
    Edit15: TEdit;
    Label19: TLabel;
    Edit16: TEdit;
    Label20: TLabel;
    Edit17: TEdit;
    Label21: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const Pi = 3.14159265;
      E0 = 8.85;
      hx = 1;
      hy = 1;
      hz = 1;
      n = 50;
      m = 50;
      p = 50;

var
  Form1: TForm1;
  DC, RC : HDC;
  q1, q2, q3, q4 : real;
  x1, y1, x2, y2, x3, y3, x4, y4, z1, z2, z3, z4 : integer;
  x, y, z : real;
  massF : array[-m..m,-n..n,-p..p] of real;
  curF : real;
  h : real;
  i, k, q : integer;
  r, g, b : real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  DC := GetDC(Handle);
  RC := CreateRenderingContext(DC,[opDoubleBuffered],32,24,0,0,0,0);
  ActivateRenderingContext(DC, RC);
end;

function GetOneF(curq : real; x, y, z, i, k, q : integer) : real;
begin
 if sqrt(sqr(x - k * hx) + sqr(y - i * hy) + sqr(z - q * hz)) = 0 then
   result := 0
 else
   Result := curq / sqrt(sqr(x - k * hx) + sqr(y - i * hy) + sqr(z - q * hz))
end;

function GetAllF(i,k,q : integer) : real;
begin
  Result := - (GetOneF(q1,x1,y1,z1,i,k,q) + GetOneF(q2,x2,y2,z2,i,k,q) + GetOneF(q3,x3,y3,z3,i,k,q) + GetOneF(q4,x4,y4,z4,i,k,q))
end;

procedure Draw(r,g,b : real; x,y,z : real);
begin
  glBegin(GL_POINTS);
  glColor3f(r,g,b);
  glVertex3f(x/m,y/n,z/p);
  glEnd;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  glClearColor(1,1,1,1);
  glClear(GL_COLOR_buffer_bit);

  q1 := StrToFloat(Edit1.Text);
  q2 := StrToFloat(Edit4.Text);
  q3 := StrToFloat(Edit7.Text);
  q4 := StrToFloat(Edit10.Text);

  x1 := StrToInt(Edit2.Text);
  x2 := StrToInt(Edit5.Text);
  x3 := StrToInt(Edit8.Text);
  x4 := StrToInt(Edit11.Text);

  y1 := StrToInt(Edit3.Text);
  y2 := StrToInt(Edit6.Text);
  y3 := StrToInt(Edit9.Text);
  y4 := StrToInt(Edit12.Text);

  z1 := StrToInt(Edit14.Text);
  z2 := StrToInt(Edit15.Text);
  z3 := StrToInt(Edit16.Text);
  z4 := StrToInt(Edit17.Text);

  h := StrToFloat(Edit13.Text);

  for i := -n to n do
  for k := -m to m do
  for q := -p to p do
    massF[i,k,q] := GetAllF(i,k,q);

  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  SwapBuffers(DC);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glRotatef(6,1,0,0);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  glRotatef(6,1,0,0);
  SwapBuffers(DC);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glRotatef(6,0,1,0);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  glRotatef(6,0,1,0);
  SwapBuffers(DC);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glRotatef(6,0,0,1);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  SwapBuffers(DC);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glScalef(1.1, 1.1, 1.1);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  SwapBuffers(DC);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glScalef(0.9, 0.9, 0.9);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  SwapBuffers(DC);
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glTranslatef(0.1, 0, 0);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  SwapBuffers(DC);
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glTranslatef(0, 0.1, 0);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  SwapBuffers(DC);
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  glClear(GL_COLOR_buffer_bit);
  glTranslatef(0, 0, 0.1);
  curF := - 1;
  repeat
    r := random;
    g := random;
    b := random;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hx;
          y := i * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hy;
          z := q * hz;
          Draw(r,g,b,x,y,z);
        end;
    for i := -n to n do
    for k := -m to m do
    for q := -p to p do
      if (massF[i,k,q]-curF)*(massF[i,k+1,q]-curF)<0 then
        begin
          x := k * hx;
          y := i * hy;
          z := q * hz + (curF - massF[i,k,q]) / (massF[i,k+1,q] - massF[i,k,q]) * hz;
          Draw(r,g,b,x,y,z);
        end;
    curF := curF + h
  until curF>=0;

  SwapBuffers(DC);
end;

end.
