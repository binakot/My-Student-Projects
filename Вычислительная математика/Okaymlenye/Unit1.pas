unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,math, XPMan;

type
    mat=array[1..5,1..5]of real;  //Матрица
    mas=array[1..5]of real;    //Столбец

  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Button1: TButton;
    StringGrid2: TStringGrid;
    Label1: TLabel;
    StringGrid3: TStringGrid;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure Mul(x,y:mat;var c:mat; i1,j1,k1:integer);   //Перемножение матриц
    procedure mulch(x:mat;y:real;var c:mat; m:integer);
    procedure sub(y:real;x:mat;var c:mat; m:integer);
    procedure add(x,y:mat;var c:mat; m:integer);
    procedure Ocaimleniya(k,l:byte);  //Окаймление
    procedure zero(var x:mat; m:integer);  //Обнуление блока
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Round(var x:mat; m,l:integer);  //Округление

  private
    { Private declarations }
  public

    n:byte;
    d:real;
    a,oa,a1,p,q,v,u,r,e:mat;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);  //Ограничение ввода
begin
      if Not (Key in ['0'..'9',',','-', #8])then Key:=#0;
end;

procedure TForm1.zero(var x:mat; m:integer);  //Обнуление блока
var i,j:integer;
begin
          for i:=1 to m do
          for j:=1 to m do
          x[i,j]:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var x:mat; i,j,k,int:byte; cont,cont1,c:real;
begin
      for i:=1 to n do
      for j:=1 to n do
      begin
          if stringgrid1.Cells[i-1,j-1]<>''then
          a[j,i]:=strtofloat(stringgrid1.Cells[i-1,j-1])
          else a[j,i]:=0;   //Если не введен элемент заменим его на 0
      end;

      zero(a1,n); zero(v,n); zero(q,n); zero(u,n); zero(r,n); //Обнуление доп матриц
      a1[1,1]:=1/a[1,1]; //берем обратный первому элементу
      oa[1,1]:=1/a[1,1];
      for i:=2 to n do  //Считываем блоки
      begin
            for j:=1 to i-1 do
            begin
                  v[1,j]:=a[i,j];
                  u[j,1]:=a[j,i];
            end;
            Ocaimleniya(i,j); //Выполняем окаймление
      end;
      oa[n,n]:=1/d;

      for i:=1 to n do
      for j:=1 to n do
         stringgrid2.Cells[i-1,j-1]:=floattostr(oa[j,i]); //выводим матрицу

      mul(a,oa,e,n,n,n); //перемножаем матрицы для проверки

      for i:=1 to n do  //Округление
      for j:=1 to n do
      begin
            e[j,i]:=roundto(e[j,i],-2);
            stringgrid3.Cells[i-1,j-1]:=floattostr(e[j,i]);
      end;


end;

procedure TForm1.Ocaimleniya(k,l:byte); //Метод окаймления
var x,y:mat;
i,j:byte;
begin
      //d
      mul(v,a1,x,l-1,l,l);
      mul(x,u,y,l-2,l-2,l-1);
      sub(a[k,k],y,x,1);
      d:=x[1,1];
      //round(p,1,1);
      //r
      mul(a1,u,y,l,l-1,l-1);
      mulch(y,(-1/d),r,l);
      //round(r,k,k);
      //q
      mul(v,a1,y,l-1,l,l);
      mulch(y,(-1/d),q,l);
      //round(q,k,k);
      //p
      mul(oa,u,x,l,l-1,l-1);
      mul(x,y,p,l-1,l-1,l-2);
      mulch(p,1/d,p,l);
      add(a1,p,p,l);
      //round(p,k,k);

      for i:=1 to l do
      for j:=1 to l do
      oa[i,j]:=p[i,j];
      for i:=1 to l do
      begin
            oa[k,i]:=q[1,i];
            oa[i,k]:=r[i,1];
      end;
      oa[k,k]:=1/d;
      a1:=oa;
end;

procedure TForm1.Mul(x,y:mat;var c:mat; i1,j1,k1:integer); //перемножение матриц
var k,i,j:byte;
begin
      zero(c,n);
      if i1<=0 then i1:=1;
      if j1<=0 then j1:=1;
      if k1<=0 then k1:=1;
      
      for i:=1 to i1 do
      for j:=1 to j1 do
      for k:=1 to k1 do
      begin
            c[i,j]:=c[i,j]+x[i,k]*y[k,j];
      end;
end;

procedure TForm1.sub(y:real;x:mat;var c:mat; m:integer); //Вычитаем
var i,j:byte;
begin
      for i:=1 to m do
      for j:=1 to m do
      c[i,j]:=y-x[i,j];
end;

procedure TForm1.mulch(x:mat;y:real;var c:mat; m:integer); //умножаем
var i,j:byte;
begin
      for i:=1 to m do
      for j:=1 to m do
      c[i,j]:=y*x[i,j];
end;

procedure TForm1.add(x,y:mat;var c:mat; m:integer); //Прибовляем
var i,j:byte;
begin
      for i:=1 to m do
      for j:=1 to m do
      c[i,j]:=x[i,j]+y[i,j];
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    n:=strtoint(edit1.Text);
    stringgrid1.ColCount:=n; stringgrid1.RowCount:=n;
    stringgrid2.ColCount:=n; stringgrid2.RowCount:=n;
    stringgrid3.ColCount:=n; stringgrid3.RowCount:=n;
    edit1.SetFocus;
end;

procedure TForm1.Round(var x:mat; m,l:integer); //Округление
var i,j,h:integer;
s:string;
begin
      for i:=1 to l do
      for j:=1 to m do
      begin
            if x[i,j]<0 then h:=6 else h:=5;
            s:=floattostr(x[i,j]);
            delete(s,h,length(s));
            x[i,j]:=strtofloat(s);
            x[i,j]:=roundto(x[i,j],-3);

      end;
end;
         
end.
