unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ComCtrls, XPMan;

type
  mat = array [1..6,1..6]of real;
  mas = array [1..5] of real;
  Frob = record
    ma,s,si:mat;
  end;

  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    StringGrid2: TStringGrid;
    Button1: TButton;
    RichEdit1: TRichEdit;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    Label10: TLabel;
    StringGrid7: TStringGrid;
    Label11: TLabel;
    Edit2: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GetA;
    procedure Button1Click(Sender: TObject);
    procedure GetEigenValues;
    procedure GetEigenVectors;
    procedure GetM(r:integer;x:mat);
    procedure GetInvM(r:integer;x:mat);
    procedure Mul(x,y:mat;var z:mat);
    procedure ControlSum1(r:integer;var x:mat);
    procedure ControlSum2(r:integer;var x:mat);
    procedure DisplayMat(x:mat;rs,re:integer);
    procedure DisplayM(x:mat; r,rm:integer);
    procedure DisplayIM(x:mat; rs,re,rm:integer);
    procedure round(var x:mat);
    procedure truncM(var x:mat);
    procedure zero(var x:mat);
    procedure Separat;
    function GetValue(x:Real):Real;
    procedure Finder(LBorder,RBorder:real);
    function GetFirstDer(x:Real):Real;
    function GetSecondDer(x:Real):Real;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n,count:integer;
  acur,a,b,c,sp,sa,M,iM,y,s,sm,a1,x:mat;
  p:Frob;
  Step,sen:real;
  lm:mas;

implementation

uses Math;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i,j:integer;
begin
  n:=strtoint(edit1.Text);
  stringgrid1.ColCount:=n; stringgrid1.RowCount:=n;
  stringgrid2.ColCount:=8; stringgrid2.RowCount:=23;
  stringgrid3.ColCount:=n; stringgrid3.RowCount:=1;
  stringgrid4.ColCount:=n; stringgrid4.RowCount:=n;
  stringgrid5.ColCount:=n; stringgrid5.RowCount:=n;
  stringgrid6.ColCount:=n; stringgrid6.RowCount:=1;
  stringgrid7.ColCount:=n; stringgrid7.RowCount:=1;
  with StringGrid1 do
    begin
      Cells[0,0]:='1';Cells[1,0]:='2';Cells[2,0]:='3';Cells[3,0]:='4';
      Cells[0,1]:='2';Cells[1,1]:='1';Cells[2,1]:='2';Cells[3,1]:='3';
      Cells[0,2]:='3';Cells[1,2]:='2';Cells[2,2]:='1';Cells[3,2]:='2';
      Cells[0,3]:='4';Cells[1,3]:='3';Cells[2,3]:='2';Cells[3,3]:='1';
    end;
  stringgrid2.Cells[0,10]:=' 7" ';
  stringgrid2.Cells[0,16]:=' 10" ';
  stringgrid2.Cells[0,22]:=' 13" ';
  for i:=1 to n do
    stringgrid2.Cells[0,i-1]:=floattostr(i);
  stringgrid2.Cells[0,5]:='  I  ';
  stringgrid2.Cells[1,5]:=' iM3  M3 ';
  for i:=5 to 8 do
    stringgrid2.Cells[0,i+1]:=floattostr(i);
  stringgrid2.Cells[0,11]:='  II  ';
  stringgrid2.Cells[1,11]:=' iM2  M2 ';
  for i:=9 to 12 do
    stringgrid2.Cells[0,i+3]:=floattostr(i);
  for i:=13 to 16 do
    stringgrid2.Cells[0,i+5]:=floattostr(i);
  stringgrid2.Cells[0,17]:='  III  ';
  stringgrid2.Cells[1,17]:=' iM1  M1 ';
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j,k,rs,re:integer;
begin
  rs:=0;
  re:=3;
  GetA;    //считваем матрицу A
  zero(a1);     
  ControlSum1(1,a);      //считаем сигма1
  DisplayMat(a,rs,re);   //Выводим
  zero(s);
  zero(sm);
  a1:=a;        //сохраняем полученную матрицу
  acur:=a;
  for i:=n downto 2 do
    begin
      zero(M);          //обнуляем M
      GetM(i,a);        //вычисляем M из А
      Mul(a,M,b);       //B = A * M
      round(m);         //округляем M
      for j:=1 to n do
        sm[i-1,j]:=m[i-1,j];   //сохрняем M в Ms
      DisplayM(m,rs+5,i-1);    //выведем на экран
      ControlSum1(1,b);        //считаем сигма1
      ControlSum2(i,b);        //считаем сигма2
      rs:=rs+6;
      re:=re+6;
      zero(iM);                //обнуляем iM
      GetInvM(i,a);            //получаем обратную M из А
      Mul(iM,b,c);             //C = iM * B
      round(im);               //округляем iM
      DisplayIM(im,rs,re,i-1); //выведем на экран
      round(b);                //округляем B
      DisplayMat(b,rs,re);     //выведем на экран
      zero(a);                 //обнуляем А
      a1:=b;
      a:=c;
      zero(b);                 //обнуляем B
      zero(c);                 //обнуляем C
    end;
  round(a);                    //округляем A
  ControlSum1(1,a);            //считаем сигма1
  for i:=2 to 6 do
    stringgrid2.Cells[i,22]:=floattostr(a[1,i-1]);
  GetEigenValues;              //Собственные значения
  edit2.Text:=floattostr(lm[1]+lm[2]+lm[3]+lm[4]);
  zero(x);
  GetEigenVectors;             //Собственный вектор
  for j:=1 to n do
  for k:=1 to n do
    x[j,1]:=x[j,1]+acur[j,k]*sa[1,k];
  for i:=1 to n do
    stringgrid6.Cells[i-1,0]:=floattostr(x[i,1]);
  zero(x);
  for i:=1 to n do
    begin
      x[i,1]:=lm[1]*sa[1,i];
      stringgrid7.Cells[i-1,0]:=floattostr(x[i,1]);
    end;
end;
//Считываем матрицу A
procedure TForm1.GetA;
var i,j:byte;
begin
  for i:=1 to n do
  for j:=1 to n do
    if stringgrid1.Cells[i-1,j-1]<>'' then
      a[j,i]:=strtofloat(stringgrid1.Cells[i-1,j-1])
    else
      a[j,i]:=0
end;
//Собственные значения
procedure TForm1.GetEigenValues;
var i:integer;
begin
  Separat;
  for i:=1 to n do
    stringgrid3.Cells[i-1,0]:=floattostr(roundto(lm[i],-3))
end;
//Собственный вектор
procedure TForm1.GetEigenVectors;
var i,j,k:integer;
    t:real;
    sp1:mat;
begin
   for i:=1 to n do
   for j:=1 to n do
     sp[j,i]:=power(lm[j],n-i);

   for i:=1 to n do
   for j:=1 to n do
     stringgrid4.Cells[i-1,j-1]:=floattostr(roundto(sp[i,j],-3));
   sp1:=sp;
   for i:=1 to n do
   for j:=1 to n-1 do
     begin
       t:=0;
       for k:=1 to n do
         t:=t+(sm[j,k]*sp[i,k]);
        sp[i,j]:=t
     end;
   sa:=sp;
   for i:=1 to n do
   for j:=1 to n do
     stringgrid5.Cells[i-1,j-1]:=floattostr(roundto(sp[i,j],-3));
   stringgrid2.Cells[7,14]:='0';stringgrid2.Cells[7,19]:='0'
end;
//Получаем матрицу M
procedure TForm1.GetM(r:integer;x:mat);
var i:integer;
    s:real;
begin
  for i:=1 to n do
    M[i,i]:=1;
  for i:=1 to n do
    M[r-1,i]:=-x[r,i]/x[r,r-1];
  M[r-1,r-1]:=1/x[r,r-1];
  M[1,n+1]:=-x[n,n+1]/x[r,r-1];
  s:=0;
  for i:=1 to n do
    s:=s+m[r-1,i];
  m[r-1,n+1]:=s-m[r-1,r-1]-1
end;
//Получаем обратную матрицу M
procedure TForm1.GetInvM(r:integer;x:mat);
var i:integer;
    s:real;
begin
  for i:=1 to n do
    iM[i,i]:=1;
  for i:=1 to n do
    iM[r-1,i]:=x[r,i];
  s:=0;
  for i:=1 to n do
    s:=s+im[r-1,i];
  im[r-1,n+1]:=s
end;
//перемножение матриц
procedure TForm1.Mul(x,y:mat;var z:mat);
var i,j,k:integer;
begin
  for i:=1 to n do
  for j:=1 to n do
  for k:=1 to n do
    z[i,j]:=z[i,j]+x[i,k]*y[k,j]
end;
//Сигма 1
procedure TForm1.ControlSum1(r:integer;var x:mat);
var i,j:integer;
s:real;
begin
  s:=0;
  for i:=1 to n do
    begin
      for j:=1 to n do
        s:=x[i,j]+s;
      x[i,n+r]:=s;
      s:=0
    end
end;
//Сигма 2
procedure TForm1.ControlSum2(r:integer;var x:mat);
var i:integer;
begin
  for i:=1 to n do
    x[i,6]:=a1[i,5]+a1[i,r-1]*m[r-1,5]
end;
//Вывод на экран матрицы
procedure TForm1.DisplayMat(x:mat;rs,re:integer);
var i,j,p,q:integer;
begin
  p:=1;
  q:=1;
  for i:=rs to re do
    begin
      for j:=2 to 7 do
        begin
          stringgrid2.Cells[j,i]:=floattostr(roundto(x[p,q],-3));
          inc(q)
        end;
      q:=1;
      inc(p)
    end;
end;
//Вывод на экран матрицы
procedure TForm1.DisplayM(x:mat; r,rm:integer);
var i:integer;
begin
  for i:=2 to 6 do
    stringgrid2.Cells[i,r]:=floattostr(roundto(x[rm,i-1],-3));
  stringgrid2.Cells[rm+1,r]:=stringgrid2.Cells[rm+1,r]+'   - 1'
end;
//Вывод на экран матрицы
procedure TForm1.DisplayIM(x:mat; rs,re,rm:integer);
var i,j:integer;
begin
      j:=0;
      for i:=rs to re do
      begin
            inc(j);
            stringgrid2.Cells[1,i]:=floattostr(roundto(x[rm,j],-3));
      end;
      for i:=2 to 6 do
      stringgrid2.Cells[i,rs-2]:=floattostr(roundto(x[rm,i-1],-3));
end;
//округление матрицы
procedure TForm1.round(var x:mat);
var i,j:integer;
begin
  for i:=1 to n do
  for j:=1 to n+1 do
    x[i,j]:=RoundTo(x[i,j],-6)
end;
//отбрасывание дробной части у элементов матрицы
procedure TForm1.truncM(var x:mat);
var i,j:integer;
begin
  for i:=1 to n do
  for j:=1 to n do
    x[i,j]:=RoundTo(x[i,j],-1)
end;
//обнуление матрицы
procedure TForm1.zero(var x:mat);
var i,j:integer;
begin
  for i:=1 to n do
  for j:=1 to n do
    x[i,j]:=0
end;

//Метод хорд и касательных
procedure TForm1.Separat;
var a,b,Value1,Value2:real;
f:boolean;
begin
  RichEdit1.Lines.Clear;
  count:=0;
  a:=-100; b:=100; f:=true;
  sen:=0.001;
  step:=sen*10;
  while a<b do
    begin
      Value1:=GetValue(a);
      Value2:=GetValue(a+Step);
      if Value1*Value2<0 then
        begin
          inc(count);
          RichEdit1.Lines.Add('***********************************************************');
          RichEdit1.Lines.Add('Поиск приближенного значения корня:');
          Finder(a,a+Step);
          f:=false
        end;
      a:=a+Step
    end;
  if f then  RichEdit1.Lines.Add('На заданном промежутке корней не найдено');
end;

function TForm1.GetValue(x:Real):Real;
var Value,n:real;
begin
  Value:=power(x,4)-power(x,3)*a[1,1]-power(x,2)*a[1,2]-a[1,3]*x-a[1,4];
  GetValue:=Value
end;

procedure TForm1.Finder(LBorder,RBorder:real);
var
   a1,a2,b1,b2,FirstDer,SecondDer,Value,Nev: Real;
   Step:Integer;
begin
   a1:=LBorder; b1:=RBorder;
   Step:=0;
   RichEdit1.Lines.Add(' Номер итерации -> '+IntToStr(Step));
   RichEdit1.Lines.Add('       Левая граница = '+FloatToStr(a1));
   RichEdit1.Lines.Add('       Правая граница = '+FloatToStr(b1));

   FirstDer:=GetFirstDer((a1+b1)/2);
   SecondDer:=GetSecondDer((a1+b1)/2);

   if FirstDer*SecondDer>=0 then
     while Abs(b1-a1)>sen do
       begin
         a2:=a1-GetValue(a1)*(b1-a1)/(GetValue(b1)-GetValue(a1));
         b2:=b1-GetValue(b1)/GetFirstDer(b1);
         a1:=a2;
         b1:=b2;
         Inc(Step);
         RichEdit1.Lines.Add(' Номер итерации -> '+IntToStr(Step));
         RichEdit1.Lines.Add('       Левая граница = '+FloatToStr(a1));
         RichEdit1.Lines.Add('       Правая граница = '+FloatToStr(b1));
       end
   else
     while Abs(b1-a1)>sen do
       begin
         a2:=a1-GetValue(a1)/GetFirstDer(a1);
         b2:=b1-GetValue(b1)*(b1-a1)/(GetValue(b1)-GetValue(a1));
         a1:=a2;
         b1:=b2;
         Inc(Step);
         RichEdit1.Lines.Add(' Номер итерации -> '+IntToStr(Step));
         RichEdit1.Lines.Add('       Левая граница = '+FloatToStr(a1));
         RichEdit1.Lines.Add('       Правая граница = '+FloatToStr(b1));
      end;
   Value:=(a1+b1)/2;
   lm[count]:=Value;
   RichEdit1.Lines.Add('   --->Приближенное значение корня = '+FloatToStr(value));
   Nev:=GetValue(value);
   RichEdit1.Lines.Add('   --->Невязка = '+FloatToStr(Nev))
end;

function TForm1.GetFirstDer(x:Real):Real;
var
   Dx,Value:Real;
begin
  Dx:=sen/10;
  Value:=(GetValue(x+Dx)-GetValue(x))/Dx;
  GetFirstDer:=Value
end;

function TForm1.GetSecondDer(x:Real):Real;
var
   Dx,Value:Real;
begin
      Dx:=sen/10;
      Value:=(GetFirstDer(x+Dx)-GetFirstDer(x))/Dx;
      GetSecondDer:=Value;
end;


end.
