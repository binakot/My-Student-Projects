unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMan, ComCtrls, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    XPManifest1: TXPManifest;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    SpeedButton1: TSpeedButton;
    GroupBox4: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Edit4: TEdit;
    UpDown4: TUpDown;
    Label4: TLabel;
    Edit5: TEdit;
    UpDown5: TUpDown;
    SpeedButton3: TSpeedButton;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    SpeedButton4: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    GroupBox7: TGroupBox;
    Edit8: TEdit;
    UpDown8: TUpDown;
    SpeedButton5: TSpeedButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox8: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    UpDown9: TUpDown;
    UpDown10: TUpDown;
    Label9: TLabel;
    Edit11: TEdit;
    UpDown11: TUpDown;
    SpeedButton6: TSpeedButton;
    GroupBox9: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    UpDown12: TUpDown;
    UpDown13: TUpDown;
    Label12: TLabel;
    Edit14: TEdit;
    UpDown14: TUpDown;
    SpeedButton7: TSpeedButton;
    GroupBox10: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Edit15: TEdit;
    UpDown15: TUpDown;
    Edit16: TEdit;
    UpDown16: TUpDown;
    Label15: TLabel;
    Edit17: TEdit;
    UpDown17: TUpDown;
    SpeedButton8: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CanvasClear;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure squaredraw(color: tcolor);
    procedure SpeedButton1Click(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton2Click(Sender: TObject);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton3Click(Sender: TObject);
    procedure UpDown6Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown7Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure cubedraw(color: tcolor);
    procedure UpDown8Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton5Click(Sender: TObject);
    procedure UpDown9Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown10Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown11Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton6Click(Sender: TObject);
    procedure UpDown12Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown13Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown14Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton7Click(Sender: TObject);
    procedure UpDown15Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown16Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown17Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  coordinates_two = record
   x,y: integer;
  end;
  coordinates_three = record
   x,y,z: integer;
  end;
var
  Form4: TForm4;
  square: array [1..4] of coordinates_two;
  cube: array [1..8] of coordinates_three;
implementation

{$R *.dfm}

procedure tform4.cubedraw(color: tcolor);
begin
 with image1.Canvas do
  begin
   pen.Color:=color;
   moveto(cube[1].x+129,-cube[1].y+159);
   lineto(cube[2].x+129,-cube[2].y+159);
   lineto(cube[3].x+129,-cube[3].y+159);
   lineto(cube[4].x+129,-cube[4].y+159);
   lineto(cube[1].x+129,-cube[1].y+159);
   moveto(cube[5].x+129,-cube[5].y+159);
   lineto(cube[6].x+129,-cube[6].y+159);
   lineto(cube[7].x+129,-cube[7].y+159);
   lineto(cube[8].x+129,-cube[8].y+159);
   lineto(cube[5].x+129,-cube[5].y+159);
   moveto(cube[1].x+129,-cube[1].y+159);
   lineto(cube[5].x+129,-cube[5].y+159);
   moveto(cube[2].x+129,-cube[2].y+159);
   lineto(cube[6].x+129,-cube[6].y+159);
   moveto(cube[3].x+129,-cube[3].y+159);
   lineto(cube[7].x+129,-cube[7].y+159);
   moveto(cube[4].x+129,-cube[4].y+159);
   lineto(cube[8].x+129,-cube[8].y+159);
   pen.Color:=clblack;
  end;
end;

procedure tform4.squaredraw(color: tcolor);
begin
 with image1.canvas do
  begin
   pen.Color:=color;
   moveto(square[1].x+149,square[1].y+149);
   lineto(square[2].x+149,square[2].y+149);
   lineto(square[3].x+149,square[3].y+149);
   lineto(square[4].x+149,square[4].y+149);
   lineto(square[1].x+149,square[1].y+149);
   pen.Color:=clblack;
  end;
end;

procedure Tform4.CanvasClear;
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

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form4.Free;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 radiobutton1.Checked:=true;
 radiobutton4.Checked:=true;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(000,149);
   lineto(300,149);
   moveto(149,000);
   lineto(149,300);
   pen.Style:=pssolid;
   pen.Color:=clred;
   textout(290,151,'X');
   textout(155,000,'Y');
  end;
 square[1].x:=000;
 square[1].y:=000;
 square[2].x:=050;
 square[2].y:=000;
 square[3].x:=050;
 square[3].y:=-050;
 square[4].x:=000;
 square[4].y:=-050;
 squaredraw(clred);
end;

procedure TForm4.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm4.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
 xn,yn: integer;
begin
 if radiobutton1.Checked=true then
  begin
   xn:=abs(x-149);
   yn:=abs(y-149);
   if x<149 then xn:=-xn;
   if y>149 then yn:=-yn;
   statusbar1.Panels[0].Text:='x->'+inttostr(xn)+',y->'+inttostr(yn);
  end;
 if radiobutton2.Checked=true then
  begin
   statusbar1.Panels[0].Text:='';
  end;
end;

procedure TForm4.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm4.RadioButton1Click(Sender: TObject);
begin
 canvasclear;
 pagecontrol1.Visible:=true;
 pagecontrol2.Visible:=false;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(000,149);
   lineto(300,149);
   moveto(149,000);
   lineto(149,300);
   pen.Style:=pssolid;
   textout(290,151,'X');
   textout(155,000,'Y');
  end;
 square[1].x:=000;
 square[1].y:=000;
 square[2].x:=050;
 square[2].y:=000;
 square[3].x:=050;
 square[3].y:=-050;
 square[4].x:=000;
 square[4].y:=-050;
 squaredraw(clred);
end;

procedure TForm4.RadioButton2Click(Sender: TObject);
begin
 canvasclear;
 pagecontrol1.Visible:=false;
 pagecontrol2.Visible:=true;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(129,159);
   lineto(300,159);
   moveto(129,159);
   lineto(129,000);
   moveto(129,159);
   lineto(000,250);
   pen.Style:=pssolid;
   textout(290,163,'X');
   textout(135,000,'Y');
   textout(005,250,'Z');
  end;
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
 cubedraw(clred);
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
var
 c,s: array [1..3] of real;
 mr: array [1..3,1..3] of real;
 fi: real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(000,149);
   lineto(300,149);
   moveto(149,000);
   lineto(149,300);
   pen.Style:=pssolid;
   textout(290,151,'X');
   textout(155,000,'Y');
  end;
 fi:=strtofloat(edit1.Text);
 fi:=fi*pi/180;
 mr[1,1]:=cos(fi);
 mr[1,2]:=sin(fi);
 mr[1,3]:=0;
 mr[2,1]:=-sin(fi);
 mr[2,2]:=cos(fi);
 mr[2,3]:=0;
 mr[3,1]:=0;
 mr[3,2]:=0;
 mr[3,3]:=1;
 for k := 1 to 4 do
  begin
   c[1]:=square[k].x;
   c[2]:=square[k].y;
   c[3]:=1;
   for i := 1 to 3 do
    begin
     s[i]:=0;
     for j := 1 to 3 do
      begin
       s[i]:=s[i]+c[j]*mr[j,i]
      end;
    end;
   square[k].x:=round(s[1]);
   square[k].y:=round(s[2]);
  end;
 squaredraw(clred);
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
var
 c,s: array [1..3] of real;
 ms: array [1..3,1..3] of real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(000,149);
   lineto(300,149);
   moveto(149,000);
   lineto(149,300);
   pen.Style:=pssolid;
   textout(290,151,'X');
   textout(155,000,'Y');
  end;
 ms[1,1]:=strtofloat(edit2.Text);
 ms[1,2]:=0;
 ms[1,3]:=0;
 ms[2,1]:=0;
 ms[2,2]:=strtofloat(edit3.Text);
 ms[2,3]:=0;
 ms[3,1]:=0;
 ms[3,2]:=0;
 ms[3,3]:=1;
 for k := 1 to 4 do
  begin
   c[1]:=square[k].x;
   c[2]:=square[k].y;
   c[3]:=1;
   for i := 1 to 3 do
    begin
     s[i]:=0;
     for j := 1 to 3 do
      begin
       s[i]:=s[i]+c[j]*ms[j,i]
      end;
    end;
   square[k].x:=round(s[1]);
   square[k].y:=round(s[2]);
  end;
 squaredraw(clred);
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
var
 c,s: array [1..3] of real;
 mc: array [1..3,1..3] of real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(000,149);
   lineto(300,149);
   moveto(149,000);
   lineto(149,300);
   pen.Style:=pssolid;
   textout(290,151,'X');
   textout(155,000,'Y');
  end;
 mc[1,1]:=1;
 mc[1,2]:=0;
 mc[1,3]:=0;
 mc[2,1]:=0;
 mc[2,2]:=1;
 mc[2,3]:=0;
 mc[3,1]:=strtofloat(edit4.Text);
 mc[3,2]:=strtofloat(edit5.Text);
 mc[3,3]:=1;
 for k := 1 to 4 do
  begin
   c[1]:=square[k].x;
   c[2]:=square[k].y;
   c[3]:=1;
   for i := 1 to 3 do
    begin
     s[i]:=0;
     for j := 1 to 3 do
      begin
       s[i]:=s[i]+c[j]*mc[j,i]
      end;
    end;
   square[k].x:=round(s[1]);
   square[k].y:=round(s[2]);
  end;
 squaredraw(clred);
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
var
 c,s: array [1..3] of real;
 mc: array [1..3,1..3] of real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(000,149);
   lineto(300,149);
   moveto(149,000);
   lineto(149,300);
   pen.Style:=pssolid;
   textout(290,151,'X');
   textout(155,000,'Y');
  end;
 mc[1,1]:=strtofloat(edit6.Text);;
 mc[1,2]:=0;
 mc[1,3]:=0;
 mc[2,1]:=0;
 mc[2,2]:=strtofloat(edit7.Text);;
 mc[2,3]:=0;
 mc[3,1]:=0;
 mc[3,2]:=0;
 mc[3,3]:=1;
 for k := 1 to 4 do
  begin
   c[1]:=square[k].x;
   c[2]:=square[k].y;
   c[3]:=1;
   for i := 1 to 3 do
    begin
     s[i]:=0;
     for j := 1 to 3 do
      begin
       s[i]:=s[i]+c[j]*mc[j,i]
      end;
    end;
   square[k].x:=round(s[1]);
   square[k].y:=round(s[2]);
  end;
 squaredraw(clred);
end;

procedure TForm4.SpeedButton5Click(Sender: TObject);
var
 c,s: array [1..4] of real;
 mr: array [1..4,1..4] of real;
 fi: real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(129,159);
   lineto(300,159);
   moveto(129,159);
   lineto(129,000);
   moveto(129,159);
   lineto(000,250);
   pen.Style:=pssolid;
   textout(290,163,'X');
   textout(135,000,'Y');
   textout(005,250,'Z');
  end;
 fi:=strtofloat(edit8.Text);
 fi:=fi*pi/180;
 if radiobutton4.Checked=true then
  begin
   mr[1,1]:=1;
   mr[1,2]:=0;
   mr[1,3]:=0;
   mr[1,4]:=0;
   mr[2,1]:=0;
   mr[2,2]:=cos(fi);
   mr[2,3]:=sin(fi);
   mr[2,4]:=0;
   mr[3,1]:=0;
   mr[3,2]:=-sin(fi);
   mr[3,3]:=cos(fi);
   mr[3,4]:=0;
   mr[4,1]:=0;
   mr[4,2]:=0;
   mr[4,3]:=0;
   mr[4,4]:=1;
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
        begin
         s[i]:=s[i]+c[j]*mr[j,i]
        end;
      end;
     cube[k].x:=round(s[1]);
     cube[k].y:=round(s[2]);
     cube[k].z:=round(s[3]);
    end;
  end;
 if radiobutton5.Checked=true then
  begin
   mr[1,1]:=cos(fi);
   mr[1,2]:=0;
   mr[1,3]:=-sin(fi);
   mr[1,4]:=0;
   mr[2,1]:=0;
   mr[2,2]:=1;
   mr[2,3]:=0;
   mr[2,4]:=0;
   mr[3,1]:=sin(fi);
   mr[3,2]:=0;
   mr[3,3]:=cos(fi);
   mr[3,4]:=0;
   mr[4,1]:=0;
   mr[4,2]:=0;
   mr[4,3]:=0;
   mr[4,4]:=1;
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
        begin
         s[i]:=s[i]+c[j]*mr[j,i]
        end;
      end;
     cube[k].x:=round(s[1]);
     cube[k].y:=round(s[2]);
     cube[k].z:=round(s[3]);
    end;
  end;
 if radiobutton3.Checked=true then
  begin
   mr[1,1]:=cos(fi);
   mr[1,2]:=sin(fi);
   mr[1,3]:=0;
   mr[1,4]:=0;
   mr[2,1]:=-sin(fi);
   mr[2,2]:=cos(fi);
   mr[2,3]:=0;
   mr[2,4]:=0;
   mr[3,1]:=0;
   mr[3,2]:=0;
   mr[3,3]:=1;
   mr[3,4]:=0;
   mr[4,1]:=0;
   mr[4,2]:=0;
   mr[4,3]:=0;
   mr[4,4]:=1;
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
        begin
         s[i]:=s[i]+c[j]*mr[j,i]
        end;
      end;
     cube[k].x:=round(s[1]);
     cube[k].y:=round(s[2]);
     cube[k].z:=round(s[3]);
    end;
  end;
 cubedraw(clred);
end;

procedure TForm4.SpeedButton6Click(Sender: TObject);
var
 c,s: array [1..4] of real;
 mr: array [1..4,1..4] of real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(129,159);
   lineto(300,159);
   moveto(129,159);
   lineto(129,000);
   moveto(129,159);
   lineto(000,250);
   pen.Style:=pssolid;
   textout(290,163,'X');
   textout(135,000,'Y');
   textout(005,250,'Z');
  end;
 mr[1,1]:=strtofloat(edit9.Text);
 mr[1,2]:=0;
 mr[1,3]:=0;
 mr[1,4]:=0;
 mr[2,1]:=0;
 mr[2,2]:=strtofloat(edit10.Text);
 mr[2,3]:=0;
 mr[2,4]:=0;
 mr[3,1]:=0;
 mr[3,2]:=0;
 mr[3,3]:=strtofloat(edit11.Text);
 mr[3,4]:=0;
 mr[4,1]:=0;
 mr[4,2]:=0;
 mr[4,3]:=0;
 mr[4,4]:=1;
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
      begin
       s[i]:=s[i]+c[j]*mr[j,i]
      end;
    end;
   cube[k].x:=round(s[1]);
   cube[k].y:=round(s[2]);
   cube[k].z:=round(s[3]);
  end;
 cubedraw(clred);
end;

procedure TForm4.SpeedButton7Click(Sender: TObject);
var
 c,s: array [1..4] of real;
 mr: array [1..4,1..4] of real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(129,159);
   lineto(300,159);
   moveto(129,159);
   lineto(129,000);
   moveto(129,159);
   lineto(000,250);
   pen.Style:=pssolid;
   textout(290,163,'X');
   textout(135,000,'Y');
   textout(005,250,'Z');
  end;
 mr[1,1]:=strtofloat(edit12.Text);
 mr[1,2]:=0;
 mr[1,3]:=0;
 mr[1,4]:=0;
 mr[2,1]:=0;
 mr[2,2]:=strtofloat(edit13.Text);
 mr[2,3]:=0;
 mr[2,4]:=0;
 mr[3,1]:=0;
 mr[3,2]:=0;
 mr[3,3]:=strtofloat(edit14.Text);
 mr[3,4]:=0;
 mr[4,1]:=0;
 mr[4,2]:=0;
 mr[4,3]:=0;
 mr[4,4]:=1;
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
      begin
       s[i]:=s[i]+c[j]*mr[j,i]
      end;
    end;
   cube[k].x:=round(s[1]);
   cube[k].y:=round(s[2]);
   cube[k].z:=round(s[3]);
  end;
 cubedraw(clred);
end;

procedure TForm4.SpeedButton8Click(Sender: TObject);
var
 c,s: array [1..4] of real;
 mr: array [1..4,1..4] of real;
 i,j,k: integer;
begin
 canvasclear;
 with image1.Canvas do
  begin
   pen.Style:=psdash;
   moveto(129,159);
   lineto(300,159);
   moveto(129,159);
   lineto(129,000);
   moveto(129,159);
   lineto(000,250);
   pen.Style:=pssolid;
   textout(290,163,'X');
   textout(135,000,'Y');
   textout(005,250,'Z');
  end;
 mr[1,1]:=1;
 mr[1,2]:=0;
 mr[1,3]:=0;
 mr[1,4]:=0;
 mr[2,1]:=0;
 mr[2,2]:=1;
 mr[2,3]:=0;
 mr[2,4]:=0;
 mr[3,1]:=0;
 mr[3,2]:=0;
 mr[3,3]:=1;
 mr[3,4]:=0;
 mr[4,1]:=strtofloat(edit15.Text);
 mr[4,2]:=strtofloat(edit16.Text);
 mr[4,3]:=strtofloat(edit17.Text);
 mr[4,4]:=1;
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
      begin
       s[i]:=s[i]+c[j]*mr[j,i]
      end;
    end;
   cube[k].x:=round(s[1]);
   cube[k].y:=round(s[2]);
   cube[k].z:=round(s[3]);
  end;
 cubedraw(clred);
end;

procedure TForm4.UpDown10Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit10.Text);
 if button=btnext then i:=i+0.1;
 if button=btprev then i:=i-0.1;
 edit10.Text:=floattostr(round(i*100)/100);
end;

procedure TForm4.UpDown11Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit11.Text);
 if button=btnext then i:=i+0.1;
 if button=btprev then i:=i-0.1;
 edit11.Text:=floattostr(round(i*100)/100);
end;

procedure TForm4.UpDown12Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit12.Text);
 if button=btnext then i:=-1;
 if button=btprev then i:=1;
 edit12.Text:=floattostr(i);
end;

procedure TForm4.UpDown13Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit13.Text);
 if button=btnext then i:=-1;
 if button=btprev then i:=1;
 edit13.Text:=floattostr(i);
end;

procedure TForm4.UpDown14Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit14.Text);
 if button=btnext then i:=-1;
 if button=btprev then i:=1;
 edit14.Text:=floattostr(i);
end;

procedure TForm4.UpDown15Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=strtoint(edit15.Text);
 if button=btnext then inc(i);
 if button=btprev then dec(i);
 edit15.Text:=inttostr(i);
end;

procedure TForm4.UpDown16Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=strtoint(edit16.Text);
 if button=btnext then inc(i);
 if button=btprev then dec(i);
 edit16.Text:=inttostr(i);
end;

procedure TForm4.UpDown17Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=strtoint(edit17.Text);
 if button=btnext then inc(i);
 if button=btprev then dec(i);
 edit17.Text:=inttostr(i);
end;

procedure TForm4.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=strtoint(edit1.Text);
 if button=btnext then inc(i);
 if button=btprev then dec(i);
 edit1.Text:=inttostr(i);
end;

procedure TForm4.UpDown2Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit2.Text);
 if button=btnext then i:=i+0.1;
 if button=btprev then i:=i-0.1;
 edit2.Text:=floattostr(round(i*100)/100);
end;

procedure TForm4.UpDown3Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit3.Text);
 if button=btnext then i:=i+0.1;
 if button=btprev then i:=i-0.1;
 edit3.Text:=floattostr(round(i*100)/100);
end;

procedure TForm4.UpDown4Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=strtoint(edit4.Text);
 if button=btnext then inc(i);
 if button=btprev then dec(i);
 edit4.Text:=inttostr(i);
end;

procedure TForm4.UpDown5Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=strtoint(edit5.Text);
 if button=btnext then inc(i);
 if button=btprev then dec(i);
 edit5.Text:=inttostr(i);
end;

procedure TForm4.UpDown6Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit6.Text);
 if button=btnext then i:=-1;
 if button=btprev then i:=1;
 edit6.Text:=floattostr(i);
end;

procedure TForm4.UpDown7Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit7.Text);
 if button=btnext then i:=-1;
 if button=btprev then i:=1;
 edit7.Text:=floattostr(i);
end;

procedure TForm4.UpDown8Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=strtoint(edit8.Text);
 if button=btnext then inc(i);
 if button=btprev then dec(i);
 edit8.Text:=inttostr(i);
end;

procedure TForm4.UpDown9Click(Sender: TObject; Button: TUDBtnType);
var
 i: real;
begin
 i:=strtofloat(edit9.Text);
 if button=btnext then i:=i+0.1;
 if button=btprev then i:=i-0.1;
 edit9.Text:=floattostr(round(i*100)/100);
end;

end.
