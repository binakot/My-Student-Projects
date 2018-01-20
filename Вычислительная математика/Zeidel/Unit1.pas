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
    StringGrid8: TStringGrid;
    Label8: TLabel;
    StringGrid9: TStringGrid;
    Label12: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MulMatrix(var c:matrix; a,b:matrix; n:integer);
    procedure MulMatrix2(var c:mass; a:matrix; b:mass; n:integer);
    function Norm1(x:matrix):real;
    function Norm2(x:matrix):real;
    procedure GetData;
    procedure Zero;
    procedure ChangeMat;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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
//перемножение матрицы на матрицу
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
//перемножение матрицы на столбец
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

function TForm1.Norm2(x:matrix):real;
var i,j:integer;
    s,max:real;
begin
     max:=0;
     for i:=1 to n do
     begin
            s:=0;
            for j:=1 to n do
            s:=s+abs(x[j,i]);
            if s>max then max:=s;
     end;
     Norm2:=max;
end;

function TForm1.Norm1(x:matrix):real;
var i,j:integer;
    s,max:real;
begin
     max:=0;
     for i:=1 to n do
     begin
            s:=0;
            for j:=1 to n do
            s:=s+abs(x[i,j]);
            if s>max then max:=s;
     end;
     Norm1:=max;
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
  E:=strtofloat(edit2.text);
  olda:=a;
  oldb:=b;
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

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j,str:integer; sum,sum1,sum2,cur:real; OutFile:TextFile;
begin
//Считываем коэффициенты и свободные члены в массив a и b
  getdata;
//проверяем нули на диагонали
  Zero;
//Получаем транспорированную матрицу
  for i:=1 to n do
  for j:=1 to n do
    begin
      at[i,j]:=a[j,i];
      stringgrid7.Cells[j,i]:=floattostr(at[i,j]);
    end;
//Считаем определитель матрицы А
  if detN(a,n)<>0 then checkbox1.Checked:=true else checkbox1.Checked:=false;
//Приводим к нормальному виду
  MulMatrix(alfa,at,a,n);    //At*A=A
  MulMatrix2(beta,at,b,n);   //At*b=B

  a:=alfa;
  b:=beta;

  for i:=1 to n do
  for j:=1 to n do
    begin
      alfa[i,j]:=0;
      beta[i]:=0;
    end;

  ChangeMat;

  for i:=1 to n do
  for j:=1 to n do
    stringgrid5.Cells[j,i]:=floattostr(alfa[i,j]); //выведем альфа
  for i:=1 to n do
    stringgrid6.Cells[0,i]:=floattostr(beta[i]); //выведем бета
//Считаем нормы
  n1:=norm1(alfa);
  n2:=norm2(alfa);
  if (n1<1)or(n2<1) then label9.Caption:='Процесс сходится';
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
//Считаем методом Зейделя
  x0:=beta;
  for i:=1 to n do
    x[i]:=0;
  k:=0;

      repeat

        for i:=1 to n do
          begin
            Stringgrid8.Cells[i,k+1]:=floattostr(x0[i])
          end;

        for i:=1 to n do
          begin
            sum1:=0;
            sum2:=0;
            for j:=1 to i-1 do
              sum1:=sum1+alfa[i,j]*x[j];
            for j:=i to n do
              sum2:=sum2+alfa[i,j]*x0[j];
            x[i]:=beta[i]+sum1+sum2;
          end;

        norma:=(power(normAlfa,k)/(1-normAlfa))*normBeta;

        k:=k+1;
        x0:=x;

      until norma<E;

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
         sum:=sum+olda[i,j]*x[j];
       b1[i]:=sum;
     end;
   for i:=1 to n do
     stringgrid4.Cells[0,i]:=floattostr(b1[i]);
//Невязки
   for i:=1 to n do
     begin
       stringgrid9.Cells[0,i]:=floattostr(roundto(abs(oldb[i]-b1[i]),-6));
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

