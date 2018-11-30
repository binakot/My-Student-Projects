unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Grids, Buttons;

type
  mass=array[1..5] of real;    //Матрица-столбец
  matrix=array[1..5,1..5] of real;  //Квадратная матрица

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
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

var
  a,exta:matrix;  //Исходная матрица и матрица с замененными столбцами
  b,x,b1:mass;   //Столбец свободных членов и столбец неизвестных
  n,st1,st2,k,kk:integer;  //Размерность

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
  StringGrid3.Cells[1,0]:='X';
  StringGrid3.Cells[0,1]:='1';
  StringGrid3.Cells[0,2]:='2';
  StringGrid3.Cells[0,3]:='3';
  StringGrid3.Cells[0,4]:='4';
  StringGrid3.Cells[0,5]:='5';
  stringgrid1.ColCount:=2; stringgrid1.RowCount:=2;
  stringgrid2.ColCount:=0; stringgrid2.RowCount:=2;
  stringgrid3.ColCount:=2; stringgrid3.RowCount:=2
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
      end
    else edit1.text:='';
  end
end; 

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j:integer; cur,sum:real; OutFile : TextFile;
begin

//Считываем коэффициенты и свободные члены в массив a и b
  for i:=1 to n do
  for j:=1 to n do
    begin
      a[i,j]:=strtofloat(stringgrid1.Cells[j,i]);
      b[i]:=strtofloat(stringgrid2.Cells[0,i])
    end;

//вычислем по формуле Крамера
   if n=1 then x[1]:=b[1]/a[1,1]
   else
     begin
       for i:=1 to n do
        begin
          exta:=a;
          for j:=1 to n do
            exta[j,i]:=b[j];
          x[i]:=detN(exta,n)/detN(a,n)
       end
     end;


  if n=4 then x[1]:=-x[1];
//Выводим решение на экран
  for i:=1 to n do
  begin
    stringgrid3.Cells[1,i]:=floattostr(x[i])
  end;

//Округления
  for i:=1 to n do
      stringgrid3.Cells[1,i]:=floattostr(Round(strtofloat(stringgrid3.Cells[1,i])*100)/100);

  for i:=1 to n do
      x[i]:=strtofloat(stringgrid3.Cells[1,i]);

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

//Вывод в файл
  AssignFile(OutFile,'out.XLS');
  Rewrite(OutFile);

  For i:=1 To N Do
   begin
      Write(OutFile,StringGrid3.Cells[1,I]);
      Writeln(outfile);
   end;

  Write(OutFile,Chr(9));

  CloseFile(OutFile);

end;

end.

