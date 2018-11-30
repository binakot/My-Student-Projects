unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    GroupBox3: TGroupBox;
    SpeedButton4: TSpeedButton;
    Image2: TImage;
    SpeedButton6: TSpeedButton;
    Edit3: TEdit;
    UpDown3: TUpDown;
    Edit4: TEdit;
    UpDown4: TUpDown;
    Image1: TImage;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Image3: TImage;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    GroupBox2: TGroupBox;
    SpeedButton3: TSpeedButton;
    Image4: TImage;
    SpeedButton5: TSpeedButton;
    Edit5: TEdit;
    UpDown5: TUpDown;
    Edit6: TEdit;
    UpDown6: TUpDown;
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown6Click(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure GetHist;
    procedure HistClear;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Rr,Rl,Gr,Gl,Br,Bl: byte;

implementation

{$R *.dfm}

procedure TForm1.UpDown3Click(Sender: TObject; Button: TUDBtnType);
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

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
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

procedure TForm1.UpDown5Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit5.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit6.Text);
 if abs(a-b)=0 then dec(a);
 edit5.Text:=inttostr(a);
end;

procedure TForm1.UpDown4Click(Sender: TObject; Button: TUDBtnType);
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

procedure TForm1.UpDown2Click(Sender: TObject; Button: TUDBtnType);
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

procedure TForm1.UpDown6Click(Sender: TObject; Button: TUDBtnType);
var
 a,b: integer;
begin
 a:=strtoint(edit6.Text);
 if button=btnext then inc(a);
 if button=btprev then dec(a);
 b:=strtoint(edit5.Text);
 if abs(a-b)=0 then inc(a);
 edit6.Text:=inttostr(a);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Rl:=0;
  Gl:=0;
  Bl:=0;
  Rr:=255;
  Gr:=255;
  Br:=255;
  image1.Canvas.Create;
  image2.Canvas.Pen.Color:=clred;
  image3.Canvas.Pen.Color:=clgreen;
  image4.Canvas.Pen.Color:=clblue;
  GetHist;
end;

procedure TForm1.GetHist;
var
  i,j,p: integer;
  r,g,b: array [0..255] of integer;
  r1,g1,b1: byte;
  max: real;
begin
  for i := 0 to 255 do
    begin
      r[i]:=0;
      g[i]:=0;
      b[i]:=0;
    end;

  for i := 0 to 299 do
  for j := 0 to 299 do
    begin
      r1:=getrvalue(Image1.Canvas.Pixels[i,j]);
      g1:=getgvalue(Image1.Canvas.Pixels[i,j]);
      b1:=getbvalue(Image1.Canvas.Pixels[i,j]);
      inc(r[r1]);
      inc(g[g1]);
      inc(b[b1]);
    end;

  HistClear;

//red
  max:=0;
  for i:=0 to 255 do
    if r[i]>max then max:=r[i];
  max:=max/176;

  for i:=0 to 255 do
    begin
      p:=round(r[i]/max);
      image2.Canvas.MoveTo(i,176);
      image2.Canvas.LineTo(i,176-p);
    end;
//green
  max:=0;
  for i:=0 to 255 do
    if g[i]>max then max:=g[i];
  max:=max/176;

  for i:=0 to 255 do
    begin
      p:=round(g[i]/max);
      image3.Canvas.MoveTo(i,176);
      image3.Canvas.LineTo(i,176-p);
    end;
//blue
  max:=0;
  for i:=0 to 255 do
    if b[i]>max then max:=b[i];
  max:=max/176;

  for i:=0 to 255 do
    begin
      p:=round(b[i]/max);
      image4.Canvas.MoveTo(i,176);
      image4.Canvas.LineTo(i,176-p);
    end;

end;

procedure TForm1.HistClear;
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

procedure TForm1.SpeedButton4Click(Sender: TObject);   //Сжатие красный
var
  i,j,xr,xl: integer;
  r,g,b,rn: byte;
begin
  xr:=strtoint(edit4.Text);
  xl:=strtoint(edit3.Text);
  for i := 0 to 299 do
  for j := 0 to 299 do
    begin
      r:=getrvalue(image1.Canvas.Pixels[i,j]);
      g:=getgvalue(image1.Canvas.Pixels[i,j]);
      b:=getbvalue(image1.Canvas.Pixels[i,j]);
      rn:=round(r*(xr-xl)/256+xl);
      if rn>255 then rn:=255;
      image1.Canvas.Pixels[i,j]:=rgb(rn,g,b);
   end;
  gethist;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);  //сжатие зеленый
var
  i,j,xr,xl: integer;
  r,g,b,gn: byte;
begin
  xr:=strtoint(edit2.Text);
  xl:=strtoint(edit1.Text);
  for i := 0 to 299 do
  for j := 0 to 299 do
    begin
      r:=getrvalue(image1.Canvas.Pixels[i,j]);
      g:=getgvalue(image1.Canvas.Pixels[i,j]);
      b:=getbvalue(image1.Canvas.Pixels[i,j]);
      gn:=round(g*(xr-xl)/256+xl);
      if gn>255 then gn:=255;
      image1.Canvas.Pixels[i,j]:=rgb(r,gn,b);
   end;
  gethist;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);  //сжатие синий
var
  i,j,xr,xl: integer;
  r,g,b,bn: byte;
begin
  xr:=strtoint(edit6.Text);
  xl:=strtoint(edit5.Text);
  for i := 0 to 299 do
  for j := 0 to 299 do
    begin
      r:=getrvalue(image1.Canvas.Pixels[i,j]);
      g:=getgvalue(image1.Canvas.Pixels[i,j]);
      b:=getbvalue(image1.Canvas.Pixels[i,j]);
      bn:=round(b*(xr-xl)/256+xl);
      if bn>255 then bn:=255;
      image1.Canvas.Pixels[i,j]:=rgb(r,g,bn);
   end;
  gethist;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);   //расширение красный
var
  i,j,xr,xl: integer;
  r,g,b,rn: byte;
begin
  xr:=strtoint(edit4.Text);
  xl:=strtoint(edit3.Text);
  for i := 0 to 299 do
  for j := 0 to 299 do
    begin
      r:=getrvalue(image1.Canvas.Pixels[i,j]);
      g:=getgvalue(image1.Canvas.Pixels[i,j]);
      b:=getbvalue(image1.Canvas.Pixels[i,j]);
      rn:=round(r*(256/(xr-xl))-256+xr-xl);
      if rn>255 then rn:=255;
      image1.Canvas.Pixels[i,j]:=rgb(rn,g,b);
    end;
  gethist;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);   //растяжение зеленый
var
  i,j,xr,xl: integer;
  r,g,b,gn: byte;
begin
  xr:=strtoint(edit2.Text);
  xl:=strtoint(edit1.Text);
  for i := 0 to 299 do
  for j := 0 to 299 do
    begin
      r:=getrvalue(image1.Canvas.Pixels[i,j]);
      g:=getgvalue(image1.Canvas.Pixels[i,j]);
      b:=getbvalue(image1.Canvas.Pixels[i,j]);
      gn:=round(g*(256/(xr-xl))-256+xr-xl);
      if gn>255 then gn:=255;
      image1.Canvas.Pixels[i,j]:=rgb(r,gn,b);
    end;
  gethist;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);  //растяжение синий
var
  i,j,xr,xl: integer;

  r,g,b,bn: byte;
begin
  xr:=strtoint(edit6.Text);
  xl:=strtoint(edit5.Text);
  for i := 0 to 299 do
  for j := 0 to 299 do
    begin
      r:=getrvalue(image1.Canvas.Pixels[i,j]);
      g:=getgvalue(image1.Canvas.Pixels[i,j]);
      b:=getbvalue(image1.Canvas.Pixels[i,j]);
      bn:=round(b*(256/(xr-xl))-256+xr-xl);
      if bn>255 then bn:=255;
      image1.Canvas.Pixels[i,j]:=rgb(r,g,bn);
    end;
  gethist;
end;

end.
