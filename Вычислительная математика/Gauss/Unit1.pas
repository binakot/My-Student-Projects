unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ExtDlgs, XPMan, Buttons;

type
    mat=array[1..5,1..5] of real;
    mas=array[1..5] of real;

  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Edit1: TEdit;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label8: TLabel;
    Label17: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label16: TLabel;
    SavePictureDialog1: TSavePictureDialog;
    XPManifest1: TXPManifest;
    StringGrid3: TStringGrid;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    BitBtn1: TBitBtn;
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetMat;
    procedure firststep(y:mat);
    procedure secondstep;
    function changestr(var y:mat):boolean;
    procedure ContSum;
    procedure zero(var x:mat);
    procedure display(x:mat; p,q,m,l,r:byte);
    procedure Button2Click(Sender: TObject);
    procedure Mul(p:mat;q:mas;var c:mas; m:integer);
    Procedure Nev;
    procedure GetE1;
    procedure GetE2;
    procedure pop;
    procedure withpop;
    procedure save(m:mat);
    procedure restore(m:mat);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
     a,g,s2,s1:mat;
     x,nv,b,xn:mas;
     e,n,w,v:byte;
     num:string;
     f,round,revers,show,p:boolean;
  end;

var
  Form1: TForm1;

implementation

uses Math;

{$R *.dfm}

//-----------------------------------------------------------------
//Подготовка интерфейса
procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    n:=strtoint(edit1.Text);
    stringgrid1.ColCount:=n+1; stringgrid1.RowCount:=n; //применение размерности
    edit1.SetFocus;
    with StringGrid1 do
    begin
      Cells[0,0]:='3';Cells[1,0]:='1';Cells[2,0]:='-1';Cells[3,0]:='2';Cells[4,0]:='6';
      Cells[0,1]:='5';Cells[1,1]:='1';Cells[2,1]:='3';Cells[3,1]:='-4';Cells[4,1]:='-12';
      Cells[0,2]:='2';Cells[1,2]:='0';Cells[2,2]:='1';Cells[3,2]:='-1';Cells[4,2]:='1';
      Cells[0,3]:='1';Cells[1,3]:='-5';Cells[2,3]:='3';Cells[3,3]:='-3';Cells[4,3]:='3';
    end;
    Button1.Enabled:=true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    edit1.SetFocus;
    e:=1; w:=4; v:=4;
    num:='2';
    f:=false; round:=false; revers:=false; p:=false;

    Button1.Enabled:=false;
    Button2.Enabled:=false;
    Button3.Enabled:=false;
    Button4.Enabled:=false;
    Button5.Enabled:=false;

    stringgrid1.ColCount:=4; stringgrid1.RowCount:=4;
    stringgrid2.ColCount:=9; stringgrid2.RowCount:=18;
end;
//-------------------------------------------------------------------------
//Ход работы программы

//Вычисление приближенных корней
procedure TForm1.Button1Click(Sender: TObject);
begin
      GetMat;    //Считывем матрицу
      zero(g);     //Обнуляем доп матрицу
      show:=true;
      round:=true;
      firststep(a);   //прямой ход
      secondstep;    //обратный
      xn:=x;
      Button2.Enabled:=true;
end;
//Нахождение невязок
procedure TForm1.Button2Click(Sender: TObject);
begin
      Nev;  //Считаем невязки
      Button3.Enabled:=true;
end;
//Нахождение поправок
procedure TForm1.Button3Click(Sender: TObject);
begin
      round:=false;
      Pop;  //находим поправки
      Button4.Enabled:=true;
end;
//добавление поправок и подсчет невязок
procedure TForm1.Button4Click(Sender: TObject);
begin
      withpop;  //Добавляем поправки
      Nev;     //находим невязки
      Button5.Enabled:=true;
end;
//подсчет поправок
procedure TForm1.Button5Click(Sender: TObject);
begin
      revers:=true;
      round:=false;
      GetE2;   //подсчет 1 суммы
      GetE1;   //подсчет 2 суммы
end;
//-----------------------------------------------------------
//Процедуры и функции алгоритма программы

//Прямой ход
procedure TForm1.firstStep(y:mat);
var i,j:byte;
begin
      if y[e,e]=0 then  //если первый элемент 0, то переставляем
      if changestr(y) then exit;

      g[1,e]:=1;
      for i:=e+1 to n+1 do
      begin
        if round then
          g[1,i]:=RoundTo((y[e,i]/y[e,e]),-2)
        else g[1,i]:=(y[e,i]/y[e,e]);  //округляю
        if (i=n+1)and(p) then
          g[1,i]:=(y[e,i]/y[e,e]);
        y[n+1,i]:=(g[1,i]);
      end;
      g[1,e]:=1; y[n+1,e]:=1;

      round:=false;

      display(y,w-5+e,e-1,w,n,0); //выводим на экран
      form1.Refresh;

      for i:=e to n+1 do
      for j:=e to n+1 do
        s1[i,e]:=s1[i,e]+y[i,j];     // первая контрольеая сумма

      display(s1,w-5+e,n+1,w,n+1,1);  //выводим на экран

      form1.Refresh;

      s2:=s1;
      s2[n+1,e]:=s1[e,e]/y[e,e];

      display(s2,w-5+e,n+2,w,n+2,1);

      //иттерация
      for i:=e+1 to n do
      for j:=e+1 to n+1 do
        y[i,j]:=y[i,j]-(y[i,e]*g[1,j]);
      w:=w+v; v:=v-1;
      x[n]:=y[n+1,n+1];
      if e=n then
        exit
      else
        begin
          e:=e+1;
          firststep(y);
        end;
end;

//обратный ход
procedure TForm1.secondStep;
var i,j:byte;
s:real;
begin
      w:=11; v:=3;
      s:=0;
      for i:=3 downto 1 do
      begin
        for j:=i+1 to n do
            x[i]:=strtofloat(stringgrid2.Cells[j-1,w])-s;
            s:=s+x[j]*strtofloat((Self.FindComponent('stringGrid'+num) as TStringGrid).Cells[j-1,w]);
            x[i]:=strtofloat((Self.FindComponent('stringGrid'+num) as TStringGrid).Cells[j-1,w])-s;
            w:=w-v;
            v:=v+1;
            s:=0;
      end;

      if revers then num:='2';
      for i:=1 to n do
      if f then (Self.FindComponent('stringGrid'+num) as TStringGrid).Cells[n+1,14+i-1]:=floattostr(x[n-i+1])
      else (Self.FindComponent('stringGrid'+num) as TStringGrid).Cells[n,14+i-1]:=floattostr(x[n-i+1]);
end;

//Считываем исходную матрицу и столбец свободных членов
procedure TForm1.GetMat;
var i,j:byte;
begin
      for i:=1 to n+1 do
      for j:=1 to n do
        if stringgrid1.Cells[i-1,j-1]<>''then
        a[j,i]:=strtofloat(stringgrid1.Cells[i-1,j-1])
        else a[j,i]:=0;
      for i:=1 to n do
        b[i]:=a[i,n+1];
end;

//нахождение невязок
Procedure TForm1.Nev;
var i:byte; r:mas;
begin
      mul(a,xn,r,n);  //перемножаем a*xn=r c порядком n
      for i:=1 to n do
        nv[i]:=(b[i]-r[i]); //находим разницу
      for i:=1 to n do
        stringgrid2.Cells[7,13+i]:=floattostr(roundto(nv[i],-8));//выводим
end;

//Находим поправки
procedure TForm1.Pop;
var i,j:byte;
begin
      for i:=1 to n do
        a[i,n+1]:=nv[i];   //Вместо столбца свободных членов записываем невязки
      zero(g);
      f:=false;
      e:=1; w:=4;v:=4; num:='3';
      p:=true;
      firststep(a);    //проводим обратный ход уже с поправками
      secondstep;
      p:=false;
      for i:=1 to n do
        stringgrid2.Cells[8,13+n-i+1]:=floattostr(roundto(x[i],-8));
end;

//Контроль обратного хода  (вместо столбца св членов контрольные суммы)
procedure TForm1.GetE1;
var i,j:byte;
begin
      e:=1;w:=4;v:=4;
      for i:=1 to n do
        a[i,n+1]:=strtofloat(stringgrid2.Cells[n+1,i-1]);
      f:=true;  num:='3';
      firststep(a); //прямой ход
      num:='3';
      secondstep; //обратный
end;

//Контроль обратного хода 2 (к решениям + 1)
procedure TForm1.GetE2;
var i:byte;
begin
     for i:=1 to n do
       stringgrid2.Cells[n+2,14+i-1]:=floattostr(x[n-i+1]+1);
END;

//Прибовляем поправки
procedure TForm1.withPop;
var i:byte;
begin
      for i:=1 to n do
        xn[i]:=xn[i]+x[i]; x:=xn;//добавили поправки
      for i:=1 to n do
        stringgrid2.Cells[n,14+i-1]:=floattostr(x[n-i+1]);
      for i:=1 to n do
        a[i,n+1]:=b[i];  //с поправками
end;

//перестановка строк
function TForm1.changeStr(var y:mat):boolean;
var s:real;
k,v,j,i:byte;
begin
          v:=0;
          for k:=e to n do
          if y[e,k]<>0 then break
          else v:=v+1;

          if v=n then
          begin
               x[e]:=0;
               e:=e+1;
               changestr(y);
               changestr:=true;
               exit;
          end;
          for i:=e to e do
          for j:=e to n+1 do
          begin
                s:=y[e,j];
                y[e,j]:=y[k,j];
                y[k,j]:=s;
          end;
          s:=b[e];
          b[e]:=b[k];
          b[k]:=s;
          changestr:=false;
          if e=1 then a:=y;
end;

//считаем контрольные суммы
procedure TForm1.ContSum;
var i,j:byte;
begin
      for i:=1 to n do
      for j:=1 to n+1 do
        s1[i,j]:=s1[i,j]+a[i,j];
end;

//обнуляем матрицу
procedure TForm1.zero(var x:mat);
var i,j:byte;
begin
      for i:=1 to n do
      for j:=1 to n+1 do
        x[i,j]:=0;
end;

//Выводим на экран
procedure TForm1.display(x:mat; p,q,m,l,r:byte);
var i,j,i1,j1,h:byte;
s:string;
begin
      if not(show) then exit;
      i1:=e; j1:=e;
      for i:=p to m do
      begin
          for j:=q to l do
          begin
                if x[i1,j1]<0 then h:=9 else h:=8;
                s:=floattostr(x[i1,j1]);
                delete(s,h,length(s));
                x[i1,j1]:=strtofloat(s);

                if r=1 then (Self.FindComponent('stringGrid'+num) as TStringGrid).Cells[j,i]:=floattostr(x[i1,e])
                else (Self.FindComponent('stringGrid'+num) as TStringGrid).Cells[j,i]:=floattostr(x[i1,j1]);

                j1:=j1+1;
          end;
          i1:=i1+1; j1:=e;
      end;
end;

//перемножение матриц
procedure TForm1.Mul(p:mat;q:mas;var c:mas; m:integer);
var k:byte;  i,j:integer;
begin
      for i:=1 to n do
      c[i]:=0;
      for i:=1 to m do
      for k:=1 to m do
      c[i]:=c[i]+p[i,k]*q[k];
end;

//считываем матрицу
procedure TForm1.save(m:mat);
var i,j:byte;
begin
      for i:=0 to 7 do
      for j:=0 to 17 do
      m[i,j]:=strtofloat(stringgrid1.Cells[i,j])
end;

//выводим матрицу
procedure TForm1.restore(m:mat);
var i,j:byte;
begin
      for i:=0 to 7 do
      for j:=0 to 17 do
      stringgrid1.Cells[i,j]:=floattostr(m[i,j]);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if stringgrid2.Visible=true then
    begin
      stringgrid2.Visible:=false;
      stringgrid3.Visible:=true
    end
  else
    begin
      stringgrid3.Visible:=false;
      stringgrid2.Visible:=true
    end;
end;

end.
