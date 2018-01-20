unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Buttons, detA, treugol, Data, obratmatrix,
  XPMan;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    StringGrid3: TStringGrid;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    StaticText1: TStaticText;
    StringGrid7: TStringGrid;
    Label11: TLabel;
    StringGrid8: TStringGrid;
    StringGrid9: TStringGrid;
    Label12: TLabel;
    Label13: TLabel;
    StringGrid10: TStringGrid;
    Label14: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    XPManifest1: TXPManifest;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  close
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin
   CheckBox1.Checked:=false;
   CheckBox2.Checked:=false;
   CheckBox3.Checked:=false;
   CheckBox4.Checked:=false;
   CheckBox5.Checked:=false;
   CheckBox6.Checked:=false;
   CheckBox7.Checked:=false;

   edit1.text:='';
   edit2.text:='';

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid1.Cells[i-1,j-1]:='';
       stringgrid2.Cells[i-1,j-1]:='';
       stringgrid3.Cells[i-1,j-1]:='';
       stringgrid4.Cells[i-1,j-1]:='';
       stringgrid5.Cells[i-1,j-1]:='';
       stringgrid6.Cells[i-1,j-1]:='';
       stringgrid7.Cells[i-1,j-1]:='';
       stringgrid8.Cells[i-1,j-1]:='';
       stringgrid9.Cells[i-1,j-1]:='';
       stringgrid10.Cells[i-1,j-1]:=''
     end;

   stringgrid1.ColCount:=1; stringgrid1.RowCount:=1;
   stringgrid2.ColCount:=1; stringgrid2.RowCount:=1;
   stringgrid3.ColCount:=1; stringgrid3.RowCount:=1;
   stringgrid4.ColCount:=1; stringgrid4.RowCount:=1;
   stringgrid5.ColCount:=1; stringgrid5.RowCount:=1;
   stringgrid6.ColCount:=1; stringgrid6.RowCount:=1;
   stringgrid7.ColCount:=1; stringgrid7.RowCount:=1;
   stringgrid8.ColCount:=1; stringgrid8.RowCount:=1;
   stringgrid9.ColCount:=1; stringgrid9.RowCount:=1;
   stringgrid10.ColCount:=1; stringgrid10.RowCount:=1
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edit1.text<>'' then
  begin
    n:=strtoint(edit1.Text);
    if (n>=1)and(n<=5) then
      begin
        statictext1.Caption:='';
        stringgrid1.ColCount:=n; stringgrid1.RowCount:=n;   //применение
        stringgrid2.ColCount:=n; stringgrid2.RowCount:=n;   //размерности
        stringgrid3.ColCount:=n; stringgrid3.RowCount:=n;   //для
        stringgrid4.ColCount:=n; stringgrid4.RowCount:=n;   //матриц
        stringgrid5.ColCount:=n; stringgrid5.RowCount:=n;   //
        stringgrid6.ColCount:=n; stringgrid6.RowCount:=n;   //
        stringgrid7.ColCount:=n; stringgrid7.RowCount:=n;   //
        stringgrid8.ColCount:=n; stringgrid8.RowCount:=n;   //
        stringgrid9.ColCount:=n; stringgrid9.RowCount:=n;   //
        stringgrid10.ColCount:=n; stringgrid10.RowCount:=n; //
        CheckBox1.Checked:=true                             //Проверка размерности +
      end
    else
      begin
        CheckBox1.Checked:=false;  //Проверка размерности -
        edit1.Text:='';
        statictext1.Caption:='Размерность не меньше 1 и не больше 5!'
      end
  end
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i,j,g,k,kk:integer; sum:real;
    curT, curR:matrix;
begin

//Считываем матрицу А

  checkbox2.Checked:=true; //Проверка значений матрицы +
  for i:=1 to n do
  for j:=1 to n do
    if stringgrid1.Cells[i-1,j-1]='' then
      begin
        checkbox2.Checked:=false; //Проверка значений матрицы -
        statictext1.Caption:='Введите все значения матрицы!'
      end
    else
      a[j,i]:=strtofloat(stringgrid1.Cells[i-1,j-1]);

//вычисление определителя

  edit2.text:=floattostr(detn(a,n));
  if edit2.text<>'0' then checkbox3.Checked:=true  //Проверка определителя
  else checkbox3.Checked:=false;

//Вычисление треугольных матриц

  maketreugol(a,n,t,r);

//Выведем значение на экран T1 и T2

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid3.Cells[i-1,j-1]:=floattostr(t[j,i]);
       stringgrid4.Cells[i-1,j-1]:=floattostr(r[j,i])
     end;

//Проверка A=T1*T2

    for i:=1 to n do
    for j:=1 to n do
      begin
        sum:=0;
        for g:=1 to n do
          sum:=sum+t[i,g]*r[g,j];
        aa[i,j]:=sum
      end;

  //Выведем T1*T2 на экран

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid7.Cells[i-1,j-1]:=floattostr(aa[j,i])
     end;

    checkbox4.Checked:=true;              //Проверка равенства A=T1*T2 +
    for i:=1 to n do
    for j:=1 to n do
      if a[i,j]<>aa[i,j] then checkbox4.Checked:=false;   //Проверка равенства A=T1*T2 -

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

//Выполним проверку T1*T1(-1)=E, T2*T2(-1)=E

  //Проверка T1*T1(-1)=E

    for i:=1 to n do
    for j:=1 to n do
      begin
        sum:=0;
        for g:=1 to n do
          sum:=sum+t[i,g]*t1[g,j];
        aa[j,i]:=sum
      end;

  //Выведем T1*T1(-1) на экран

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid8.Cells[i-1,j-1]:=floattostr(aa[j,i])
     end;

    checkbox5.Checked:=true;              //Проверка равенства T1*T1(-1)=E +
    for i:=1 to n do
    for j:=1 to n do
      begin
        if i=j then
          if aa[i,j]<>1 then checkbox5.Checked:=false;   //Проверка равенства T1*T1(-1)=E -
        if i<>j then
          if aa[i,j]<>0 then checkbox5.Checked:=false    //Проверка равенства T1*T1(-1)=E -
      end;

  //Проверка T2*T2(-1)=E

    for i:=1 to n do
    for j:=1 to n do
      begin
        sum:=0;
        for g:=1 to n do
          sum:=sum+r[i,g]*r1[g,j];
        aa[i,j]:=sum
      end;

  //Выведем T1*T1(-1) на экран

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid9.Cells[i-1,j-1]:=floattostr(aa[j,i])
     end;

    checkbox6.Checked:=true;              //Проверка равенства T2*T2(-1)=E +
    for i:=1 to n do
    for j:=1 to n do
      begin
        if i=j then
          if aa[i,j]<>1 then checkbox6.Checked:=false;   //Проверка равенства T2*T2(-1)=E -
        if i<>j then
          if aa[i,j]<>0 then checkbox6.Checked:=false    //Проверка равенства T2*T2(-1)=E -
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
     stringgrid2.Cells[i-1,j-1]:=floattostr(a1[j,i]);

//Выполним проверку A*A(-1)=E

    for i:=1 to n do
    for j:=1 to n do
      begin
        sum:=0;
        for g:=1 to n do
          sum:=sum+a[i,g]*a1[g,j];
        aa[i,j]:=sum
      end;

    //Выведем A1*A1(-1) на экран

   for i:=1 to n do
   for j:=1 to n do
     begin
       stringgrid10.Cells[i-1,j-1]:=floattostr(aa[j,i])
     end;

   //Теперь сравним эту матрицу с единичной

    checkbox7.Checked:=true;
    for i:=1 to n do
    for j:=1 to n do
      begin
        if i=j then
          if aa[i,j]<>1 then checkbox7.Checked:=false;   //Проверка равенства T2*T2(-1)=E -
        if i<>j then
          if aa[i,j]<>0 then checkbox7.Checked:=false    //Проверка равенства T2*T2(-1)=E -
      end;

//Округления

  for i:=1 to n do
  for j:=1 to n do
    begin
      stringgrid2.Cells[i-1,j-1]:=floattostr(Round(strtofloat(stringgrid2.Cells[i-1,j-1])*100)/100);
      stringgrid8.Cells[i-1,j-1]:=floattostr(Round(strtofloat(stringgrid8.Cells[i-1,j-1])*1)/1);
      stringgrid9.Cells[i-1,j-1]:=floattostr(Round(strtofloat(stringgrid9.Cells[i-1,j-1])*1)/1);
      stringgrid10.Cells[i-1,j-1]:=floattostr(Round(strtofloat(stringgrid10.Cells[i-1,j-1])*1)/1)
    end;


end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Not (Key in ['0'..'9','-', #8])then Key:=#0
end;

end.
