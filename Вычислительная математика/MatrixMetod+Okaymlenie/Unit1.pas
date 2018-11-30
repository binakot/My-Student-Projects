unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, XPMan;

type
Tfile = text;
matrix = array [0..9,0..9] of real;
  TForm1 = class(TForm)
    UpDown1: TUpDown;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    XPManifest1: TXPManifest;
    Button2: TButton;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    StringGrid4: TStringGrid;
    GroupBox4: TGroupBox;
    Button5: TButton;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Button4: TButton;
    StringGrid5: TStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    StringGrid6: TStringGrid;
    StringGrid7: TStringGrid;
    StringGrid8: TStringGrid;
    StringGrid9: TStringGrid;
    StringGrid10: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Button2Click(Sender: TObject);
    Function det(a : matrix;  n: integer): real;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure inverse_v;
    procedure inverse_n;
    procedure ymnojenie(var c:matrix; a,b:matrix; d:integer);
    procedure Okaim (a: matrix; var b: matrix; n: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n,i,j:integer;
  Matr,DOP,Kor,OBR,POV:matrix;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
StringGrid1.ColCount:=2;
StringGrid1.RowCount:=2;
StringGrid2.ColCount:=2;
StringGrid2.RowCount:=2;
StringGrid4.ColCount:=2;
StringGrid4.RowCount:=2;
UpDown1.Position:=StringGrid1.ColCount;
StringGrid1.Height:=round(3.3*UpDown1.Position*10);
StringGrid1.Width:=round(3.3*UpDown1.Position*10);
StringGrid2.Height:=round(3.3*UpDown1.Position*10);
StringGrid2.Width:=round(3.3*UpDown1.Position*10);
StringGrid4.Height:=round(3.3*UpDown1.Position*10);
StringGrid4.Width:=round(3.3*UpDown1.Position*10);
n:=UpDown1.Position;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
n:=UpDown1.Position;
if UpDown1.Position <2 then UpDown1.Position:=2;
if UpDown1.Position >5 then upDown1.Position:=5;
StringGrid1.ColCount:=UpDown1.Position;
StringGrid1.RowCount:=UpDown1.Position;
StringGrid1.Height:=round(3.3*UpDown1.Position*10);
StringGrid1.Width:=round(3.3*UpDown1.Position*10);
StringGrid2.ColCount:=UpDown1.Position;
StringGrid2.RowCount:=UpDown1.Position;
StringGrid2.Height:=round(3.3*UpDown1.Position*10);
StringGrid2.Width:=round(3.3*UpDown1.Position*10);
StringGrid4.ColCount:=UpDown1.Position;
StringGrid4.RowCount:=UpDown1.Position;
StringGrid4.Height:=round(3.3*UpDown1.Position*10);
StringGrid4.Width:=round(3.3*UpDown1.Position*10);
end;

Function TForm1.det(a : matrix; n: integer): real;
  Var
    i, j, k, Cont, Cont1, Int : integer;
    d, c : real;
  Begin
   Cont1:=0;
    For i := 0 To n-1 Do
      Begin
       Cont:=0;
       For k := i To n-1 Do
        begin
         If a[k,i]<>0 Then
                       begin
                        Int:=k;
                        Cont1:=1;
                        Break;
                       end
        end;
  If Cont1=0 Then begin Result:=0; Exit; end;
        If a[i, i] = 0 Then
          Begin
           For k:=i To n-1 do
            begin
              c:=a[i,k];
              a[i,k]:=a[Int,k];
              a[Int,k]:=c;

            end;
           cont:=Cont1+1;
          End;

        For j := i+1 To n-1 Do
          Begin
           d := a[j, i] / a[i, i];
            For k := i To n-1 Do
              a[j, k] := a[j, k] - (d * a[i, k]);
          End;
      End;

    d := 1.0;
    For i := 0 To n-1 Do d := d * a[i, i];
    If Cont mod 2 <> 0 Then d:=d*(-1);
    Result:=d;
  End;


procedure TForm1.Button2Click(Sender: TObject);
begin
    for i:=0 to n-1 do
    for j:=0 to n-1 do
        begin
          Matr[i,j]:=StrToFloat (StringGrid1.Cells[j,i]);
          DOP[i,j]:=StrToFloat(StringGrid2.Cells[j,i]);
        end;
  Edit2.Text:=FloatToStr(det(matr,n));
end;

procedure TForm1.Button4Click(Sender: TObject);
var OutFile : TextFile;
begin
  okaim(matr,obr,n);
  ymnojenie(kor,obr,dop,n-1);
  For i:=0 to n-1 do
  For j:=0 to n-1 do
    StringGrid3.cells[i,j]:=FloatToStr(kor[j,i]);
  ymnojenie (Pov,matr,kor,n-1);
  For i:=0 to n-1 do
  For j:=0 to n-1 do
    StringGrid5.cells[i,j]:=FloatToStr(round(pov[j,i]));
//Вывод в файл
  AssignFile(OutFile,'out.XLS');
  Rewrite(OutFile);
  for i:=1 to n do
    begin
      For j:=1 To N Do
        begin
          Write(OutFile,StringGrid3.Cells[j-1,i-1]);
          Write(OutFile,Chr(9));
        end;
       Writeln(outfile);
    end;
  CloseFile(OutFile);
end;

procedure TForm1.inverse_v;
var i,j,l,m:integer; k:matrix;
begin
 for i:=0 to n-1 do
 for j:=0 to n-1 do
    k[i,j]:=0;
end;

procedure TForm1.inverse_n;
var i,j,l:integer; k:matrix;
begin
  for i:=0 to n-1 do
  for j:=0 to n-1 do
    k[i,j]:=0;
  for i:=0 to n-1 do
  for j:=0 to i-1 do
    if(i<>j)and(i>j) then
      begin
        for l:=0 to i-1 do
            k[i,j]:=k[i,j]+(k[l,j]);
        k[i,j]:=-1*k[i,j];
      end;
end;

procedure TForm1.ymnojenie(var c:matrix; a,b:matrix; d:integer);
var i,j,l:integer; s:real;
begin
    for i:=0 to d do
    for l:=0 to d do
       begin
        s:=0;
        for j:=0 to d do
          s:=a[i,j]*b[j,l]+s;
        c[i,l]:=s;
       end
end;

procedure Tform1.Okaim (a: matrix; var b: matrix; n: integer);
 var k,z,q,c,per1,per2: integer;
     ch,sum,p: real;
     mobr1,mobr2,a1,a2,u,v,vob,uob: matrix;
begin
  per1:=0;
  per2:=0;
  if a[0,0]=0 then       //если первый элемент 0, то поменяем столбцы
    begin
      for q:=0 to n-1 do
        begin
          if a[q,0]<>0 then
            begin
              for c:=0 to n-1 do
                begin
                  p:=a[0,c];
                  a[0,c]:=a[q,c];
                  a[q,c]:=p;
                end;
              per1:=q;
            end;
          if a[0,0]<>0 then break
        end;
      if a[0,0]=0 then        //если все равно 0, то поменяем строки
        for q:=0 to n-1 do
          begin
            if a[0,q]<>0 then
              begin
                for c:=0 to n-1 do
                  begin
                    p:=a[c,0];
                    a[c,0]:=a[c,q];
                    a[c,q]:=p
                  end;
                per2:=q
              end;
            if a[0,0]<>0 then break
          end;
    end;

  mobr1[0,0]:=1/a[0,0];  //выносим первый элемент
  z:=0;                  //порядок клеточной матрицы
  for i:=0 to n do
  for j:=0 to n do
    a2[i,j]:=0;       //обнуляем доп матрицу

  StringGrid9.cells[0,0]:=FloatToStr(mobr1[0,0]);

repeat
    inc(z);         //увеличиваем счетчик
    for i:=0 to z do
    for j:=0 to z do
        a2[i,j]:=a[i,j];     //записываем всю матрицу а в доп.матрицу

    for i:=0 to z-1 do
      u[i,0]:=a2[i,z];       //всю строку запишем в одну матрицу

    for i:=0 to z-1 do
      v[0,i]:=a2[z,i];       //весь столбец в другую

    ymnojenie (uob,mobr1,u,z-1);   //умножим матрицы
    ymnojenie (vob,v,mobr1,z-1);   //и получим окаймленную матрицу


    sum:=0;
    for i:=0 to z-1 do
      sum:=a2[z,i]*uob[i,0]+sum;    //находим сумму для вычисления альфа

    ch:=a2[z,z]-sum;         //альфа


    for i:=0 to z-1 do                                    {p}
    for j:=0 to z-1 do
        mobr2[i,j]:=mobr1[i,j]+((uob[i,0]*vob[0,j])/ch);

    for i:=0 to z-1 do                                    {r}
      mobr2[i,z]:=uob[i,0]/(-ch);

    for k:=0 to z-1 do
      mobr2[z,k]:=vob[0,k]/(-ch);                         {q}

    mobr2[z,z]:=1/ch;  //последний элемент 1/альфа


   for i:=0 to n-1 do
   for j:=0 to n-1 do
     if z=1 then StringGrid6.cells[i,j]:=FloatToStr(mobr2[j,i])
     else if z=2 then StringGrid7.cells[i,j]:=FloatToStr(mobr2[j,i])
     else if z=3 then StringGrid8.cells[i,j]:=FloatToStr(mobr2[j,i])
     else if z=4 then StringGrid10.cells[i,j]:=FloatToStr(mobr2[j,i]);


  for i:=0 to z do
  for j:=0 to z do
      mobr1[i,j]:=mobr2[i,j]  //записываем полученный результат в матрицу

until z=(n-1);   //проводим цикл для всей матрицы


  for i:=0 to n-1 do
  for j:=0 to n-1 do
      b[i,j]:=mobr1[i,j]; //записываем обратную матрицу в исходную

  if per2<>0 then  //если переставляли строки надо это учесть
  for c:=0 to n-1 do
      begin
        p:=b[0,c];
        b[0,c]:=b[per2,c];
        b[per2,c]:=p;
      end
  else
    if per1<>0 then     //если пересталяли столбцы тоже учтем
      for c:=0 to n-1 do
        begin
          p:=b[c,0];
          b[c,0]:=b[c,per1];
          b[c,per1]:=p
        end;
end;

procedure TForm1.Button5Click(Sender: TObject);

begin
     okaim(matr,obr,n);

     for i:=0 to n-1 do
     for j:=0 to n-1 do
     StringGrid4.cells[i,j]:=FloatToStr(Obr[j,i]);

end;




end.
