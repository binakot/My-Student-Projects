unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Grids, Buttons, math, ExtCtrls, data;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Edit1: TEdit;
    StringGrid3: TStringGrid;
    XPManifest1: TXPManifest;
    StringGrid4: TStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Panel1: TPanel;
    StringGrid7: TStringGrid;
    Label10: TLabel;
    Label11: TLabel;
    StringGrid8: TStringGrid;
    StringGrid9: TStringGrid;
    Label12: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Okaim (a: matrix; var b: matrix; n: integer);
    procedure ymnojenie(var c:matrix; a,b:matrix; n:integer);
    procedure MulMatrix(var c:matrix; a,b:matrix; n:integer);
    procedure MulMatrix2(var c:mass; a:matrix; b:mass; n:integer);
    procedure GetData;
    procedure Zero;
    procedure ChangeMat;
    Function Check:boolean;
    procedure MatToIter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function DetN(const a:Matrix; n:integer):real;
  Var
    i, j, k, Cont, Cont1, Int : integer;
    d, c : real;
    aa : matrix;
  Begin
  aa:=a;
   Cont1:=0;
    For i := 1 To n Do
      Begin
       Cont:=0;
       For k := i To n Do
        begin
         If aa[k,i]<>0 Then
                       begin
                        Int:=k;
                        Cont1:=1;
                        Break;
                       end
        end;
  If Cont1=0 Then begin Result:=0; Exit; end;
        If aa[i, i] = 0 Then
          Begin
           For k:=i To n do
            begin
              c:=aa[i,k];
              aa[i,k]:=aa[Int,k];
              aa[Int,k]:=c;

            end;
           cont:=Cont1+1;
          End;

        For j := i+1 To n Do
          Begin
           d := aa[j, i] / aa[i, i];
            For k := i To n Do
              aa[j, k] := aa[j, k] - (d * aa[i, k]);
          End;
      End;

    d := 1.0;
    For i := 1 To n Do d := d * aa[i, i];
    If Cont mod 2 <> 0 Then d:=d*(-1);
    Result:=d;
  End;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:='a[i,j]';
  StringGrid1.Cells[0,1]:='i=1';
  StringGrid1.Cells[0,2]:='i=2';
  StringGrid1.Cells[0,3]:='i=3';
  StringGrid1.Cells[0,4]:='i=4';
  StringGrid1.Cells[0,5]:='i=5';
  StringGrid1.Cells[1,0]:='j=1';
  StringGrid1.Cells[2,0]:='j=2';
  StringGrid1.Cells[3,0]:='j=3';
  StringGrid1.Cells[4,0]:='j=4';
  StringGrid1.Cells[5,0]:='j=5';
  stringgrid2.Cells[0,0]:='Своб.члены';
  StringGrid3.Cells[0,0]:='Решения';
  StringGrid4.Cells[0,0]:='Проверка';
  StringGrid3.Cells[1,0]:='X';
  StringGrid3.Cells[0,1]:='1';
  StringGrid3.Cells[0,2]:='2';
  StringGrid3.Cells[0,3]:='3';
  StringGrid3.Cells[0,4]:='4';
  StringGrid3.Cells[0,5]:='5';
  stringgrid1.ColCount:=4; stringgrid1.RowCount:=4;
  stringgrid2.ColCount:=0; stringgrid2.RowCount:=4;
  stringgrid3.ColCount:=4; stringgrid3.RowCount:=4;
  stringgrid4.ColCount:=0; stringgrid4.RowCount:=4;
  edit1.Text:='3';
  edit2.Text:='0,0001';
  StringGrid1.Cells[1,1]:='4';
  StringGrid1.Cells[2,1]:='0,24';
  StringGrid1.Cells[3,1]:='-0,08';
  StringGrid1.Cells[1,2]:='0,09';
  StringGrid1.Cells[2,2]:='3';
  StringGrid1.Cells[3,2]:='-0,15';
  StringGrid1.Cells[1,3]:='0,04';
  StringGrid1.Cells[2,3]:='-0,08';
  StringGrid1.Cells[3,3]:='4';
  StringGrid2.Cells[0,1]:='8';
  StringGrid2.Cells[0,2]:='9';
  StringGrid2.Cells[0,3]:='20';
  n:=strtoint(edit1.Text);
  StringGrid7.Cells[0,0]:='a(-1)[i,j]';
  StringGrid7.Cells[0,1]:='i=1';
  StringGrid7.Cells[0,2]:='i=2';
  StringGrid7.Cells[0,3]:='i=3';
  StringGrid7.Cells[0,4]:='i=4';
  StringGrid7.Cells[0,5]:='i=5';
  StringGrid7.Cells[1,0]:='j=1';
  StringGrid7.Cells[2,0]:='j=2';
  StringGrid7.Cells[3,0]:='j=3';
  StringGrid7.Cells[4,0]:='j=4';
  StringGrid7.Cells[5,0]:='j=5';
  StringGrid8.Cells[0,0]:='k';
  StringGrid8.Cells[0,1]:='0';
  StringGrid8.Cells[0,2]:='1';
  StringGrid8.Cells[0,3]:='2';
  StringGrid8.Cells[0,4]:='3';
  StringGrid8.Cells[0,5]:='4';
  StringGrid8.Cells[0,6]:='5';
  StringGrid8.Cells[0,7]:='6';
  StringGrid8.Cells[0,8]:='7';
  StringGrid8.Cells[0,9]:='8';
  StringGrid8.Cells[0,10]:='9';
  StringGrid8.Cells[0,11]:='10';
  StringGrid8.Cells[0,12]:='11';
  StringGrid8.Cells[0,13]:='12';
  StringGrid8.Cells[0,14]:='13';
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;  //Применяем размерность
  Shift: TShiftState);
begin
  if edit1.text<>'' then
  begin
    n:=strtoint(edit1.Text);
    if (n>=1)and(n<=5) then
      begin
        stringgrid1.ColCount:=n+1; stringgrid1.RowCount:=n+1;
        stringgrid2.RowCount:=n+1;
        stringgrid3.RowCount:=n+1;
        stringgrid4.RowCount:=n+1;
      end
    else edit1.text:='';
  end
end;

procedure TForm1.ymnojenie(var c:matrix; a,b:matrix; n:integer);
var i,j,l:integer; sum:real;
begin
    for i:=0 to n do
    for l:=0 to n do
       begin
        sum:=0;
        for j:=0 to n do
          sum:=a[i,j]*b[j,l]+sum;
        c[i,l]:=sum;
       end
end;

procedure TForm1.MulMatrix(var c:matrix; a,b:matrix; n:integer);
var i,j,l:integer; s:real;
begin
    for i:=1 to n do
    for l:=1 to n do
       begin
        s:=0;
        for j:=1 to n do
          s:=a[i,j]*b[j,l]+s;
        c[i,l]:=s;
       end
end;

procedure TForm1.MulMatrix2(var c:mass; a:matrix; b:mass; n:integer);
var i,j:integer; sum:real;
begin
   for i:=1 to n do
     begin
       sum:=0;
       for j:=1 to n do
         sum:=sum+a[i,j]*b[j];
       c[i]:=sum;
     end;
end;

procedure Tform1.Okaim (a: matrix; var b: matrix; n: integer);
 var k,z,q,c,per1,per2,i,j: integer;
     ch,sum,p: real;
     mobr1,mobr2,a1,a2,u,v,vob,uob,aa,bb: matrix;
begin
  per1:=0;
  per2:=0;
  for i:=0 to n-1 do
  for j:=0 to n-1 do
    aa[i,j]:=a[i+1,j+1];
  if aa[0,0]=0 then       //если первый элемент 0, то поменяем столбцы
    begin
      for q:=0 to n-1 do
        begin
          if aa[q,0]<>0 then
            begin
              for c:=0 to n-1 do
                begin
                  p:=aa[0,c];
                  aa[0,c]:=aa[q,c];
                  aa[q,c]:=p;
                end;
              per1:=q;
            end;
          if aa[0,0]<>0 then break
        end;
      if aa[0,0]=0 then        //если все равно 0, то поменяем строки
        for q:=0 to n-1 do
          begin
            if aa[0,q]<>0 then
              begin
                for c:=0 to n-1 do
                  begin
                    p:=aa[c,0];
                    aa[c,0]:=aa[c,q];
                    aa[c,q]:=p
                  end;
                per2:=q
              end;
            if aa[0,0]<>0 then break
          end;
    end;

  mobr1[0,0]:=1/aa[0,0];  //выносим первый элемент
  z:=0;                  //порядок клеточной матрицы
  for i:=0 to n do
  for j:=0 to n do
    a2[i,j]:=0;       //обнуляем доп матрицу

repeat
    inc(z);         //увеличиваем счетчик
    for i:=0 to z do
    for j:=0 to z do
        a2[i,j]:=aa[i,j];     //записываем всю матрицу а в доп матрицу

    for i:=0 to z-1 do
      u[i,0]:=a2[i,z];       //всю строку запишем в одну матрицу

    for i:=0 to z-1 do
      v[0,i]:=a2[z,i];       //весь столбец в другую

    ymnojenie (uob,mobr1,u,z-1);   //умножим матрицы
    ymnojenie (vob,v,mobr1,z-1);   //и получим все окаймленные матрицы

    sum:=0;
    for i:=0 to z-1 do
      sum:=a2[z,i]*uob[i,0]+sum;    //находим сумму

    ch:=a2[z,z]-sum;         //что выносим из следующей матрицы


    for i:=0 to z-1 do                                    {p}
    for j:=0 to z-1 do
        mobr2[i,j]:=mobr1[i,j]+((uob[i,0]*vob[0,j])/ch);

    for i:=0 to z-1 do                                    {r}
      mobr2[i,z]:=uob[i,0]/(-ch);

    for k:=0 to z-1 do
      mobr2[z,k]:=vob[0,k]/(-ch);                         {q}

    mobr2[z,z]:=1/ch;

  for i:=0 to z do
  for j:=0 to z do
      mobr1[i,j]:=mobr2[i,j]  //записываем полученный результат в матрицу
until z=(n-1);   //проводим цикл для всей матрицы

  for i:=0 to n-1 do
  for j:=0 to n-1 do
      bb[i,j]:=mobr1[i,j]; //записываем обратную матрицу в исходную

  if per2<>0 then  //если переставляли строки надо это учесть
  for c:=0 to n-1 do
      begin
        p:=bb[0,c];
        bb[0,c]:=bb[per2,c];
        bb[per2,c]:=p;
      end
  else
    if per1<>0 then     //если пересталяли столбцы тоже учтем
      for c:=0 to n-1 do
        begin
          p:=bb[c,0];
          bb[c,0]:=bb[c,per1];
          bb[c,per1]:=p
        end;
  for i:=1 to n do
  for j:=1 to n do
    b[i,j]:=bb[i-1,j-1];
end;

procedure TForm1.GetData;
var i,j:byte;
begin
  for i:=1 to n do
  for j:=1 to n do
    begin
      a[i,j]:=strtofloat(stringgrid1.Cells[j,i]);
      b[i]:=strtofloat(stringgrid2.Cells[0,i]);
    end;
  Eps:=strtofloat(edit2.text);
end;

procedure TForm1.Zero;
var I,j,k,l:integer;  s:real;
begin
      for i:=1 to n do
      if a[i,i]=0 then
      begin
          for j:=i to n do
          if a[j,i]<>0 then break;

          s:=b[i];
          b[i]:=b[j];
          b[j]:=s;

          for l:=i to i do
          for k:=1 to n do
          begin
                s:=a[i,k];
                a[i,k]:=a[j,k];
                a[j,k]:=s;
          end;
      end;
end;

procedure TForm1.ChangeMat;
var i,j:byte;
begin
  for i:=1 to n do
    begin
      for j:=1 to n do
        if i=j then alfa[i,j]:=0
        else alfa[i,j]:=-a[i,j]/a[i,i];
      beta[i]:=b[i]/a[i,i];
    end;
end;

procedure TForm1.MatToIter;
var i,j:byte; sum:real;
begin
        Okaim(a,a1,n); //считаем обратную матрицу
        for i:=1 to n do
        for j:=1 to n do
          stringgrid7.Cells[i,j]:=floattostr(a1[j,i]);

        normAlfa2:=0;
        for i:=1 to n do
          begin
            sum:=0;
            for j:=1 to n do
              sum:=sum+abs(a[i,j]);
            if sum>normAlfa2 then normAlfa2:=sum;
          end;

        for i:=1 to n do
        for j:=1 to n do
          q[i,j]:=1/(n*normAlfa2*i*j);    //матрица Q с достаточно малыми элементами

        for i:=1 to n do
        for j:=1 to n do
          d[i,j]:=q[i,j]-a1[i,j];   //матрица D

        MulMatrix(alfa,q,a,n);      //Alfa=Q*A

        MulMatrix2(beta,d,b,n);     //Beta=D*B
        for i:=1 to n do
          beta[i]:=-beta[i];
end;

Function TForm1.Check:boolean;
var i,j:integer;
    s:real;
  begin
    for i:=1 to n do
      begin
        s:=0;
        for j:=1 to n do
          s:=s+abs(a[i,j]);
        if s-a[i,i]>abs(a[i,i]) then
          begin
            Check:=false;
            exit;
          end
        else check:=true;
      end;
  end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j,str:integer; sum,cur:real; OutFile:TextFile;
begin
//Считываем данные
  GetData;
//Если на диагонали 0, то меняем строки
  Zero;
//Считаем определитель матрицы А
  if detN(a,n)<>0 then checkbox1.Checked:=true else checkbox1.Checked:=false;
//Проверяем условия сходимости и взависимости от результата приводим матрицу или сразу переходим к итерационному процессу
  if Check then ChangeMat
  else MatToIter;
//Выведем alfa и beta
  for i:=1 to n do
  for j:=1 to n do
    stringgrid5.Cells[j,i]:=floattostr(alfa[i,j]);
  for i:=1 to n do
    stringgrid6.Cells[0,i]:=floattostr(beta[i]);
//NormAlfa
  normAlfa:=0;
  for i:=1 to n do
    begin
      sum:=0;
      for j:=1 to n do
        sum:=sum+abs(alfa[i,j]);
      if sum>normAlfa then normAlfa:=sum;
    end;

//normBeta
  normBeta:=0;
  for i:=1 to n do
    if beta[i]>normBeta then
      normBeta:=beta[i];
//Итерационный процесс
  x0:=beta;
  k:=0;
  repeat
    for i:=1 to n do
      begin
        Stringgrid8.Cells[i,k+1]:=floattostr(x0[i])
      end;
    for i:=1 to n do
      begin
        sum:=0;
        for j:=1 to n do
          sum:=sum+alfa[i,j]*x0[j];
        sum:=sum+beta[i];
        x[i]:=sum;
      end;

    x0:=x;

    k:=k+1;
    norma:=(power(normAlfa,k)/(1-normAlfa))*normBeta;
  until norma<Eps;

  edit3.text:=inttostr(k);

  for i:=1 to n do
    begin
      Stringgrid8.Cells[i,k+1]:=floattostr(x0[i])
    end;

//Выводим решение на экран
  for i:=1 to n do
  begin
    stringgrid3.Cells[1,i]:=floattostr(x[i])
  end;
//Выполним проверку
   for i:=1 to n do
     begin
       sum:=0;
       for j:=1 to n do
         sum:=sum+a[i,j]*x[j];
       b1[i]:=sum;
     end;
   for i:=1 to n do
     stringgrid4.Cells[0,i]:=floattostr(b1[i]);
//Невязки
   for i:=1 to n do
     begin
       stringgrid9.Cells[0,i]:=floattostr(roundto(abs(b1[i]-b[i]),-8));
     end;

//Вывод в файл
  AssignFile(OutFile,'out.XLS');
  Rewrite(OutFile);

  For i:=1 To N Do
   begin
      Write(OutFile,StringGrid3.Cells[1,i]);
      Writeln(outfile);
   end;

  Write(OutFile,Chr(9));

  CloseFile(OutFile);

end;

end.

