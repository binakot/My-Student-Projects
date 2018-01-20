unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMan, StdCtrls, Buttons, data;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    XPManifest1: TXPManifest;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    BitBtn4: TBitBtn;
    procedure paintcube;
    procedure FormCreate(Sender: TObject);
    procedure ImageClear;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  coordinates = record
    x,y,z: integer;
  end;
var
  Form1: TForm1;
  cube: array [1..8] of coordinates;

implementation

{$R *.dfm}

procedure tform1.paintcube;
begin
 with image1.Canvas do
  begin
   ImageClear;
   with image1.Canvas do
     begin
       pen.Style:=psdash;
       moveto(200,250);
       lineto(200,50);
       moveto(200,250);
       lineto(400,250);
       moveto(200,250);
       lineto(80,370);
       pen.Style:=pssolid;
       textout(70,370,'X');
       textout(410,250,'Y');
       textout(190,50,'Z');
     end;
   pen.Color:=clred;
   moveto(cube[1].x+170,-cube[1].y+250);
   lineto(cube[2].x+170,-cube[2].y+250);
   lineto(cube[3].x+170,-cube[3].y+250);
   lineto(cube[4].x+170,-cube[4].y+250);
   lineto(cube[1].x+170,-cube[1].y+250);
   moveto(cube[5].x+170,-cube[5].y+250);
   lineto(cube[6].x+170,-cube[6].y+250);
   lineto(cube[7].x+170,-cube[7].y+250);
   lineto(cube[8].x+170,-cube[8].y+250);
   lineto(cube[5].x+170,-cube[5].y+250);
   moveto(cube[1].x+170,-cube[1].y+250);
   lineto(cube[5].x+170,-cube[5].y+250);
   moveto(cube[2].x+170,-cube[2].y+250);
   lineto(cube[6].x+170,-cube[6].y+250);
   moveto(cube[3].x+170,-cube[3].y+250);
   lineto(cube[7].x+170,-cube[7].y+250);
   moveto(cube[4].x+170,-cube[4].y+250);
   lineto(cube[8].x+170,-cube[8].y+250);
   pen.Color:=clblack;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  image1.Canvas.Create;
  cube[1].x:=10;
  cube[1].y:=-20;
  cube[1].z:=20;
  cube[2].x:=10;
  cube[2].y:=20;
  cube[2].z:=20;
  cube[3].x:=50;
  cube[3].y:=20;
  cube[3].z:=20;
  cube[4].x:=50;
  cube[4].y:=-20;
  cube[4].z:=20;
  cube[5].x:=30;
  cube[5].y:=0;
  cube[5].z:=0;
  cube[6].x:=30;
  cube[6].y:=40;
  cube[6].z:=0;
  cube[7].x:=70;
  cube[7].y:=40;
  cube[7].z:=0;
  cube[8].x:=70;
  cube[8].y:=0;
  cube[8].z:=0;
  paintcube;
end;

procedure Tform1.ImageClear;
var
 p,b: tcolor;
begin
 with image1.Canvas do
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

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 c,s: array [1..4] of real;
 matrix: array [1..4,1..4] of real;
 fi: real;
 i,j,k: integer;
begin
  ImageClear;
  if strtofloat(edit1.text)<>0 then
    begin
      fi:=strtofloat(edit1.Text);
      fi:=fi*pi/180;
      madeRx(fi);
      for k := 1 to 8 do
        begin
          c[1]:=cube[k].x;
          c[2]:=cube[k].y;
          c[3]:=cube[k].z;
          c[4]:=1;
          for i := 1 to 4 do
            begin
              s[i]:=0;
              for j := 1 to 4 do
                s[i]:=s[i]+c[j]*Rx[j,i];
            end;
          cube[k].x:=round(s[1]);
          cube[k].y:=round(s[2]);
          cube[k].z:=round(s[3]);
        end;
    end;

  if strtofloat(edit2.text)<>0 then
    begin
      fi:=strtofloat(edit2.Text);
      fi:=fi*pi/180;
      madeRy(fi);
      for k := 1 to 8 do
        begin
          c[1]:=cube[k].x;
          c[2]:=cube[k].y;
          c[3]:=cube[k].z;
          c[4]:=1;
          for i := 1 to 4 do
            begin
              s[i]:=0;
              for j := 1 to 4 do
                s[i]:=s[i]+c[j]*Ry[j,i];
            end;
          cube[k].x:=round(s[1]);
          cube[k].y:=round(s[2]);
          cube[k].z:=round(s[3]);
        end;
    end;

  if strtofloat(edit3.text)<>0 then
    begin
      fi:=strtofloat(edit3.Text);
      fi:=fi*pi/180;
      madeRz(fi);
      for k := 1 to 8 do
        begin
          c[1]:=cube[k].x;
          c[2]:=cube[k].y;
          c[3]:=cube[k].z;
          c[4]:=1;
          for i := 1 to 4 do
            begin
              s[i]:=0;
              for j := 1 to 4 do
                s[i]:=s[i]+c[j]*Rz[j,i];
            end;
          cube[k].x:=round(s[1]);
          cube[k].y:=round(s[2]);
          cube[k].z:=round(s[3]);
        end;
    end;

 paintCube;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  c,s: array [1..4] of real;
  mat: array [1..4,1..4] of real;
  i,j,k: integer;
begin
  imageclear;
  mat[1,1]:=strtofloat(edit4.Text);
  mat[1,2]:=0;
  mat[1,3]:=0;
  mat[1,4]:=0;
  mat[2,1]:=0;
  mat[2,2]:=strtofloat(edit5.Text);
  mat[2,3]:=0;
  mat[2,4]:=0;
  mat[3,1]:=0;
  mat[3,2]:=0;
  mat[3,3]:=strtofloat(edit6.Text);
  mat[3,4]:=0;
  mat[4,1]:=0;
  mat[4,2]:=0;
  mat[4,3]:=0;
  mat[4,4]:=1;
  for k := 1 to 8 do
    begin
      c[1]:=cube[k].x;
      c[2]:=cube[k].y;
      c[3]:=cube[k].z;
      c[4]:=1;
      for i := 1 to 4 do
        begin
          s[i]:=0;
          for j := 1 to 4 do
            s[i]:=s[i]+c[j]*mat[j,i];
        end;
      cube[k].x:=round(s[1]);
      cube[k].y:=round(s[2]);
      cube[k].z:=round(s[3]);
    end;
  paintcube;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 c,s: array [1..4] of real;
 mat: array [1..4,1..4] of real;
 i,j,k: integer;
begin
  imageclear;
  mat[1,1]:=strtofloat(edit7.Text);
  mat[1,2]:=0;
  mat[1,3]:=0;
  mat[1,4]:=0;
  mat[2,1]:=0;
  mat[2,2]:=strtofloat(edit8.Text);
  mat[2,3]:=0;
  mat[2,4]:=0;
  mat[3,1]:=0;
  mat[3,2]:=0;
  mat[3,3]:=strtofloat(edit9.Text);
  mat[3,4]:=0;
  mat[4,1]:=0;
  mat[4,2]:=0;
  mat[4,3]:=0;
  mat[4,4]:=1;
  for k := 1 to 8 do
    begin
      c[1]:=cube[k].x;
      c[2]:=cube[k].y;
      c[3]:=cube[k].z;
      c[4]:=1;
      for i := 1 to 4 do
        begin
          s[i]:=0;
          for j := 1 to 4 do
            s[i]:=s[i]+c[j]*mat[j,i];
        end;
      cube[k].x:=round(s[1]);
      cube[k].y:=round(s[2]);
      cube[k].z:=round(s[3]);
    end;
  paintcube;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 c,s: array [1..4] of real;
 mat: array [1..4,1..4] of real;
 i,j,k: integer;
begin
  imageclear;
  mat[1,1]:=1;
  mat[1,2]:=0;
  mat[1,3]:=0;
  mat[1,4]:=0;
  mat[2,1]:=0;
  mat[2,2]:=1;
  mat[2,3]:=0;
  mat[2,4]:=0;
  mat[3,1]:=0;
  mat[3,2]:=0;
  mat[3,3]:=1;
  mat[3,4]:=0;
  mat[4,1]:=strtofloat(edit10.Text);
  mat[4,2]:=strtofloat(edit11.Text);
  mat[4,3]:=strtofloat(edit12.Text);
  mat[4,4]:=1;
  for k := 1 to 8 do
    begin
      c[1]:=cube[k].x;
      c[2]:=cube[k].y;
      c[3]:=cube[k].z;
      c[4]:=1;
      for i := 1 to 4 do
        begin
          s[i]:=0;
          for j := 1 to 4 do
            s[i]:=s[i]+c[j]*mat[j,i];
        end;
      cube[k].x:=round(s[1]);
      cube[k].y:=round(s[2]);
      cube[k].z:=round(s[3]);
    end;
  paintcube;
end;

end.
