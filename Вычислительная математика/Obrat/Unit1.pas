unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Buttons, detA, treugol, Data, obratmatrix,
  XPMan;

type
  TForm1 = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    StaticText1: TStaticText;
    XPManifest1: TXPManifest;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Edit1: TEdit;
    StringGrid7: TStringGrid;
    StringGrid8: TStringGrid;
    StringGrid9: TStringGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
              
procedure TForm1.BitBtn2Click(Sender: TObject);   //Закрытие приложения
begin
  close
end;

procedure TForm1.FormCreate(Sender: TObject);  //обработка интерфейса
begin
  StringGrid1.Cells[0,0]:='a[i,j]';
  StringGrid1.Cells[0,1]:='j=1';
  StringGrid1.Cells[0,2]:='j=2';
  StringGrid1.Cells[0,3]:='j=3';
  StringGrid1.Cells[0,4]:='j=4';
  StringGrid1.Cells[0,5]:='j=5';
  StringGrid1.Cells[1,0]:='i=1';
  StringGrid1.Cells[2,0]:='i=2';
  StringGrid1.Cells[3,0]:='i=3';
  StringGrid1.Cells[4,0]:='i=4';
  StringGrid1.Cells[5,0]:='i=5';
  StringGrid8.Cells[0,0]:='a(-1)[i,j]';
  StringGrid8.Cells[0,1]:='j=1';
  StringGrid8.Cells[0,2]:='j=2';
  StringGrid8.Cells[0,3]:='j=3';
  StringGrid8.Cells[0,4]:='j=4';
  StringGrid8.Cells[0,5]:='j=5';
  StringGrid8.Cells[1,0]:='i=1';
  StringGrid8.Cells[2,0]:='i=2';
  StringGrid8.Cells[3,0]:='i=3';
  StringGrid8.Cells[4,0]:='i=4';
  StringGrid8.Cells[5,0]:='i=5';
  stringgrid2.Cells[0,0]:='Своб.члены';
  StringGrid7.Cells[0,0]:='Решения';
  StringGrid7.Cells[1,0]:='X';
  StringGrid7.Cells[0,1]:='1';
  StringGrid7.Cells[0,2]:='2';
  StringGrid7.Cells[0,3]:='3';
  StringGrid7.Cells[0,4]:='4';
  StringGrid7.Cells[0,5]:='5';
  stringgrid1.ColCount:=2; stringgrid1.RowCount:=2;
  stringgrid8.ColCount:=2; stringgrid8.RowCount:=2;
  stringgrid2.ColCount:=0; stringgrid2.RowCount:=2;
  stringgrid7.ColCount:=2; stringgrid7.RowCount:=2
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);  //Применение размерности
begin
if edit1.text<>'' then
  begin
    n:=strtoint(edit1.Text);
    if (n>=1)and(n<=5) then
      begin
        stringgrid1.ColCount:=n+1; stringgrid1.RowCount:=n+1;
        stringgrid8.ColCount:=n+1; stringgrid8.RowCount:=n+1;
        stringgrid2.RowCount:=n+1;
        stringgrid7.RowCount:=n+1;
      end
    else edit1.text:='';
  end
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i,j,g,k,kk,st:integer; sum,Cur:real;
    curT, curR, cm:matrix;
    OutFile : TextFile;
begin

//Считываем матрицу А

  for i:=1 to n do
  for j:=1 to n do
      begin
        a[i,j]:=strtofloat(stringgrid1.Cells[j,i]);
        b[i]:=strtofloat(stringgrid2.Cells[0,i])
      end;
//Избавляемся от нулей на диагонали
  for i:=1 to n do
    begin
      if a[i,i]=0 then
        begin
          for j:=1 to n do
            begin
              if a[j,i]<>0 then
                begin
                  changeSTR(a,i,j);
                end;
            end;
        end;
    end;
//вычисление определителя

  if n=1 then edit2.text:=stringgrid1.cells[1,1]
    else edit2.text:=floattostr(detn(a,n));

//Вычисление треугольных матриц

  maketreugol(a,n,t,r);

//Выведем значение на экран T1 и T2

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid3.Cells[i-1,j-1]:=floattostr(t[j,i]);
       stringgrid4.Cells[i-1,j-1]:=floattostr(r[j,i])
     end;

//Находим обратные матрицы к T1 и T2

   for i:=1 to n do
   for j:=1 to n do
     begin
       Curt[j,i]:=strtofloat(stringgrid3.Cells[i-1,j-1]);
       Curr[i,j]:=strtofloat(stringgrid4.Cells[i-1,j-1])
     end;

  obrM(curt,n);
  obrM(curr,n);

  for i:=1 to n do
  for j:=1 to n do
    begin
      t1[i,j]:=curt[j,i];
      r1[i,j]:=curr[i,j]
    end;

//Выводим обратные к треугольным матрицы

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid5.Cells[i-1,j-1]:=floattostr(t1[j,i]);
       stringgrid6.Cells[i-1,j-1]:=floattostr(r1[j,i])
     end;

//Найдем обратную исходной матрицу A(-1)=T2(-1)*T1(-1)

    for i:=1 to n do
    for j:=1 to n do
      begin
        sum:=0;
        for g:=1 to n do
          sum:=sum+r1[i,g]*t1[g,j];
        a1[i,j]:=sum
      end;

//Выведем обратную матрицу на экран

   for i:=1 to n do
   for j:=1 to n do
     stringgrid8.Cells[i,j]:=floattostr(a1[j,i]);

//Находим неизвестные
   for i:=1 to n do
     begin
       sum:=0;
       for j:=1 to n do
         sum:=sum+a1[i,j]*b[j];
       x[i]:=sum;
     end;


//Выведем неизвестные
   for i:=1 to n do
     stringgrid7.Cells[1,i]:=floattostr(x[i]);

//Округления

  for i:=1 to n do
      stringgrid7.Cells[1,i]:=floattostr(Round(strtofloat(stringgrid7.Cells[1,i])*100)/100);

  
//Выполним проверку
   for i:=1 to n do
     begin
       sum:=0;
       for j:=1 to n do
         sum:=sum+a[i,j]*x[j];
       b1[i]:=sum;
     end;
   for i:=1 to n do
     stringgrid9.Cells[0,i]:=floattostr(b1[i]);

//Вывод в файл
  AssignFile(OutFile,'out.XLS');
  Rewrite(OutFile);

  For i:=1 To N Do
   begin
      Write(OutFile,StringGrid7.Cells[1,I]);
      Writeln(outfile);
   end;

  Write(OutFile,Chr(9));

  CloseFile(OutFile);


end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Not (Key in ['0'..'9','-', #8])then Key:=#0
end;



end.
