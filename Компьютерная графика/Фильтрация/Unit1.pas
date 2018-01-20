unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, XPMan, math;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure LineFilt;
    procedure MedFilt;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  buf: tbitmap;
  x0,y0,x1,y1: integer;
  flag: boolean;
  filter: array [1..3,1..3] of real;
  pixels: array [1..5,1..5] of tcolor;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  buf:=tbitmap.Create;
  buf.Height:=image1.Height;
  buf.Width:=image1.Width;
  Image1.Canvas.Create;
  image1.Canvas.Pen.Color:=clblue;
  flag:=False;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  flag:=True;
  x0:=x;
  y0:=y;
  buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if flag=true then
    begin
      image1.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),buf.Canvas,bounds(0,0,buf.Width,buf.Height));
      x1:=x;
      y1:=y;
      image1.Canvas.MoveTo(x0,y0);
      image1.Canvas.LineTo(x1,y1);
    end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  flag:=False;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='-1';
  stringgrid1.Cells[1,0]:='-1';
  stringgrid1.Cells[2,0]:='-1';
  stringgrid1.Cells[0,1]:='-1';
  stringgrid1.Cells[1,1]:='9';
  stringgrid1.Cells[2,1]:='-1';
  stringgrid1.Cells[0,2]:='-1';
  stringgrid1.Cells[1,2]:='-1';
  stringgrid1.Cells[2,2]:='-1';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[1,0]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[2,0]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[0,1]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[1,1]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[2,1]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[0,2]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[1,2]:=floatToStr(roundto((1/9),-4));
  stringgrid1.Cells[2,2]:=floatToStr(roundto((1/9),-4));
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i,j: Integer;
begin
  for i := 1 to 3 do
  for j := 1 to 3 do
    filter[i,j]:=strtofloat(stringgrid1.Cells[j-1,i-1]);
  LineFilt;
end;

procedure Tform1.LineFilt;
var
 i,j,k,l: integer;
 r,g,b: array [1..3,1..3] of byte;
 r1,g1,b1: byte;
begin
  buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),Image1.Canvas,bounds(0,0,buf.Width,buf.Height));
  for i := 0 to 400 do
  for j := 0 to 300 do
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
      if (i=399) and (j=299) then
        begin
          pixels[1,3]:=pixels[1,1];
          pixels[2,3]:=pixels[2,1];
          pixels[3,1]:=pixels[1,1];
          pixels[3,2]:=pixels[1,2];
          pixels[3,3]:=pixels[1,3];
        end
      else
        begin
          if i=399 then
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
      for l := 1 to 3 do
        begin
          r[k,l]:=getrvalue(pixels[k,l]);
          g[k,l]:=getgvalue(pixels[k,l]);
          b[k,l]:=getbvalue(pixels[k,l]);
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

      Image1.Canvas.Pixels[i,j]:=rgb(r1,g1,b1);
    end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  MedFilt;
end;

procedure TForm1.MedFilt;
var
 i,j,k,l,w: integer;
 color: array [1..25] of tcolor;
 median,vs: tcolor;
begin
 buf.Canvas.CopyRect(bounds(0,0,buf.Width,buf.Height),image1.Canvas,bounds(0,0,buf.Width,buf.Height));
 for i := 0 to 399 do
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
     if (i=398) and (j=298) then
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
       if i=398 then
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
     if (i=399) and (j=299) then
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
       if i=399 then
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
