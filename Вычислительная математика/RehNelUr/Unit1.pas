unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,math;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    RichEdit1: TRichEdit;
    Function IntFun1(x,y:real):real;
    Function IntFun2(x,y:real):real;
    Function CurFun1(x,y:real):real;
    Function CurFun2(x,y:real):real;
    Function ConFun1(x,y:real):real;
    Function ConFun2(x,y:real):real;
    procedure GetIntersection;
    procedure Button1Click(Sender: TObject);
    Function ChackQ:boolean;
    function PartDer1(x,y,e:real;fun,item:string):real;
    function PartDer2(x,y,e:real;fun,item:string):real;
    procedure GetQ(fun:string);
    procedure ConvertSystem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  e,x0,y0,a,b,c,d,q1,q2,M:real;


implementation

{$R *.dfm}
//*******************************************************

Function TForm1.IntFun1(x,y:real):real;
begin
      IntFun1:=sin(2*x-y)-1.2*x-0.4;//cos(x)+y-1.5;
end;

Function TForm1.IntFun2(x,y:real):real;
begin
      IntFun2:=0.8*sqr(x)+1.5*sqr(y)-1;//2*x-sin(y-0.5)-1;
end;

Function TForm1.CurFun1(x,y:real):real;
begin
      CurFun1:=IntFun1(x,y)+x;
end;

Function TForm1.CurFun2(x,y:real):real;
begin
      CurFun2:=IntFun2(x,y)+y;
end;

Function TForm1.ConFun1(x,y:real):real;
begin
      ConFun1:=x+a*IntFun1(x,y)+b*IntFun2(x,y);
end;

Function TForm1.ConFun2(x,y:real):real;
begin
      ConFun2:=y+c*IntFun1(x,y)+d*IntFun2(x,y);
end;

//*******************************************************

procedure TForm1.GetIntersection;
begin
      x0:=strtofloat(edit1.text);
      y0:=strtofloat(edit2.text);
      e:=strtofloat(edit3.text);
end;

procedure TForm1.Button1Click(Sender: TObject);
var CurX,x,y,CurY:real;
i:integer;
begin
      GetIntersection;
      GetQ('IntFun');
      if ChackQ then
      begin
            X:=x0; Y:=y0; i:=0;
            repeat
                  inc(i);
                  CurX:=x; CurY:=y;
                  x:=CurFun1(CurX,CurY);
                  y:=CurFun2(CurX,CurY);
                  RichEdit1.Lines.Add('**** Итерация '+inttostr(i)+' : x = '+floattostr(x)+', y = '+floattostr(y));
            until (abs(CurX-x)+abs(CurY-y))/(m/(1-M))<e;
            RichEdit1.Lines.Add('----Проверка-----');
            RichEdit1.Lines.Add('F(x,y) = '+floattostr(IntFun1(x,y,))+', g(x,y) = '+floattostr(IntFun2(x,y,)));

      end else
      begin
            RichEdit1.Lines.Add('!!!! переход к новой системе');
            ConvertSystem;
            GetQ('ConFun');
            X:=x0; Y:=y0; i:=0;

            RichEdit1.Lines.Add('q1 = '+floattostr(q1)+', q2 = '+floattostr(q2));
            if q1>q2 then M:=q1 else M:=q2;

            repeat
                  inc(i);
                  CurX:=x; CurY:=y;
                  x:=ConFun1(CurX,CurY);
                  y:=ConFun2(CurX,CurY);
                  RichEdit1.Lines.Add('**** Итерация '+inttostr(i)+' : x = '+floattostr(x)+', y = '+floattostr(y));
            until (abs(CurX-x)+abs(CurY-y))/(m/(1-m))<e;
            RichEdit1.Lines.Add('----Проверка-----');
            RichEdit1.Lines.Add('F(x,y) = '+floattostr(IntFun1(x,y,))+', g(x,y) = '+floattostr(IntFun2(x,y,)));
      end;
end;

Function TForm1.ChackQ:boolean;
begin
      if q1>q2 then M:=q1 else M:=q2;
      RichEdit1.Lines.Add('q1 = '+floattostr(q1)+', q2 = '+floattostr(q2));

      if (abs(PartDer1(x0,y0,e,'CurFun1','x'))+abs(PartDer1(x0,y0,e,'CurFun1','y'))>q1)
       or (abs(PartDer2(x0,y0,e,'CurFun2','x'))+abs(PartDer2(x0,y0,e,'CurFun2','y'))>q2)
      then ChackQ:=false else ChackQ:=true;
end;

procedure TForm1.GetQ(fun:string);
begin
      if fun='IntFun'then
      begin
        q1:=abs(PartDer1(x0,y0,e,'CurFun1','x'))+abs(PartDer2(x0,y0,e,'CurFun2','x'));
        q2:=abs(PartDer1(x0,y0,e,'CurFun1','y'))+abs(PartDer2(x0,y0,e,'CurFun2','y'));
      end
      else begin
        q1:=abs(PartDer1(x0,y0,e,'ConFun1','x'))+abs(PartDer2(x0,y0,e,'ConFun2','x'));
        q2:=abs(PartDer1(x0,y0,e,'ConFun1','y'))+abs(PartDer2(x0,y0,e,'ConFun2','y'));
      end;
end;

Function TForm1.PartDer1(x,y,e:real;fun,item:string):real;
var h:real;
begin
      h:=e/10;
      if (fun='IntFun1') and (item='x') then PartDer1:=(IntFun1(x+h,y)-IntFun1(x,y))/h;
      if (fun='IntFun1') and (item='y') then PartDer1:=(IntFun1(x,y+h)-IntFun1(x,y))/h;
      if (fun='CurFun1') and (item='x') then PartDer1:=(CurFun1(x+h,y)-CurFun1(x,y))/h;
      if (fun='CurFun1') and (item='y') then PartDer1:=(CurFun1(x,y+h)-CurFun1(x,y))/h;
      if (fun='ConFun1') and (item='x') then PartDer1:=(ConFun1(x+h,y)-ConFun1(x,y))/h;
      if (fun='ConFun1') and (item='y') then PartDer1:=(ConFun1(x,y+h)-ConFun1(x,y))/h;
end;

Function TForm1.PartDer2(x,y,e:real;fun,item:string):real;
var h:real;
begin
      h:=e/10;
      if (fun='IntFun2') and (item='x') then PartDer2:=(IntFun2(x+h,y)-IntFun2(x,y))/h;
      if (fun='IntFun2') and (item='y') then PartDer2:=(IntFun2(x,y+h)-IntFun2(x,y))/h;
      if (fun='CurFun2') and (item='x') then PartDer2:=(CurFun2(x+h,y)-CurFun2(x,y))/h;
      if (fun='CurFun2') and (item='y') then PartDer2:=(CurFun2(x,y+h)-CurFun2(x,y))/h;
      if (fun='ConFun2') and (item='x') then PartDer2:=(ConFun2(x+h,y)-ConFun2(x,y))/h;
      if (fun='ConFun2') and (item='y') then PartDer2:=(ConFun2(x,y+h)-ConFun2(x,y))/h;
end;

procedure TForm1.ConvertSystem;
var df:array[1..4] of real;
Begin
      df[1]:=PartDer1(x0,y0,e,'IntFun1','x');
      df[2]:=PartDer1(x0,y0,e,'IntFun1','y');
      df[3]:=PartDer2(x0,y0,e,'IntFun2','x');
      df[4]:=PartDer2(x0,y0,e,'IntFun2','y');

      b:=df[2]/(df[4]*df[1]-df[3]*df[2]);
      a:=(-1-b*df[3])/df[1];
      d:=df[1]/(df[3]*df[2]-df[4]*df[1]);
      c:=(-d*df[3])/df[1];

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      RichEdit1.Clear;
end;

end.
