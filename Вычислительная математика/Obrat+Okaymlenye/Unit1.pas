unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Grids, StdCtrls, Buttons;

type Matrix = array[1..5,1..5] of extended;
     mass = array[1..5] of extended;

type
  TForm1 = class(TForm)
    Label15: TLabel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Edit1: TEdit;
    StringGrid7: TStringGrid;
    StringGrid8: TStringGrid;
    XPManifest1: TXPManifest;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Mul(x,y:matrix;var c:matrix; i1,j1,k1:integer);   //Перемножение матриц
    procedure mulch(x:matrix;y:real;var c:matrix; m:integer);
    procedure sub(y:real;x:matrix;var c:matrix; m:integer);
    procedure add(x,y:matrix;var c:matrix; m:integer);
    procedure zero(var x:matrix; m:integer);  //Обнуление блока
    procedure Okaim(a: matrix; var b: matrix; n: integer);
    procedure ymnojenie(var c:matrix; a,b:matrix; d:integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var
  n:byte;
  d,sum:real;
  b,x:mass;
  a,oa,a1,p,q,v,u,r,e:matrix;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  close
end;

procedure TForm1.FormCreate(Sender: TObject);
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
  Shift: TShiftState);
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

procedure TForm1.zero(var x:matrix; m:integer);  //Обнуление блока
var i,j:integer;
begin
          for i:=1 to m do
          for j:=1 to m do
          x[i,j]:=0;
end;

procedure TForm1.Mul(x,y:matrix;var c:matrix; i1,j1,k1:integer); //перемножение матриц
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

procedure TForm1.sub(y:real;x:matrix;var c:matrix; m:integer); //Вычитаем
var i,j:byte;
begin
      for i:=1 to m do
      for j:=1 to m do
      c[i,j]:=y-x[i,j];
end;

procedure TForm1.mulch(x:matrix;y:real;var c:matrix; m:integer); //умножаем
var i,j:byte;
begin
      for i:=1 to m do
      for j:=1 to m do
      c[i,j]:=y*x[i,j];
end;

procedure TForm1.add(x,y:matrix;var c:matrix; m:integer); //Прибовляем
var i,j:byte;
begin
      for i:=1 to m do
      for j:=1 to m do
      c[i,j]:=x[i,j]+y[i,j];
end;

procedure TForm1.ymnojenie(var c:matrix; a,b:matrix; d:integer);
var i,j,l:integer; s:real;
begin
    for i:=1 to d do
    for l:=1 to d do
       begin
        s:=0;
        for j:=1 to d do
          s:=a[i,j]*b[j,l]+s;
        c[i,l]:=s;
       end
end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Not (Key in ['0'..'9','-', #8])then Key:=#0
end;

procedure Tform1.Okaim(a: matrix; var b: matrix; n: integer);
 var k,z,q,c,per1,per2,i,j: integer;
     ch,sum,p: real;
     mobr1,mobr2,a1,a2,u,v,vob,uob: matrix;
begin
  per1:=1;
  per2:=1;
  if a[1,1]=0 then
    begin
      for q:=1 to n do
        begin
          if a[q,1]<>0 then
            begin
              for c:=1 to n do
                begin
                  p:=a[1,c];
                  a[1,c]:=a[q,c];
                  a[q,c]:=p;
                end;
              per1:=q;
            end;
          if a[1,1]<>0 then break
        end;
      if a[1,1]=0 then
        for q:=1 to n do
          begin
            if a[1,q]<>0 then
              begin
                for c:=1 to n do
                  begin
                    p:=a[c,1];
                    a[c,1]:=a[c,q];
                    a[c,q]:=p
                  end;
                per2:=q
              end;
            if a[1,1]<>0 then break
          end;
    end;

  mobr1[1,1]:=1/a[1,1];
  z:=1;
  for i:=1 to n do
    for j:=1 to n do
      a2[i,j]:=0;

   repeat
    inc(z);
    for i:=1 to z do
      for j:=1 to z do
        a2[i,j]:=a[i,j];

    for i:=1 to z do
      u[i,1]:=a2[i,z];

    for i:=1 to z do
      v[1,i]:=a2[z,i];

    ymnojenie (uob,mobr1,u,z);
    ymnojenie (vob,v,mobr1,z);

    sum:=0;
    for i:=1 to z do
      sum:=a2[z,i]*uob[i,1]+sum;

    ch:=a2[z,z]-sum;


    for i:=1 to z do                                    {p}
      for j:=1 to z do
        mobr2[i,j]:=mobr1[i,j]+((uob[i,1]*vob[1,j])/ch);

    for i:=1 to z do                                    {r}
      mobr2[i,z]:=uob[i,1]/(-ch);

    for k:=1 to z do
      mobr2[z,k]:=vob[1,k]/(-ch);                         {q}

    mobr2[z,z]:=1/ch;

    for i:=1 to z do
      for j:=1 to z do
        mobr1[i,j]:=mobr2[i,j]
   until z=n;

  for i:=1 to n do
    for j:=1 to n do
      b[i,j]:=mobr1[i,j];

  if per2<>0 then
    for c:=1 to n do
      begin
        p:=b[1,c];
        b[1,c]:=b[per2,c];
        b[per2,c]:=p;
      end
  else
    if per1<>0 then
      for c:=1 to n do
        begin
          p:=b[c,1];
          b[c,1]:=b[c,per1];
          b[c,per1]:=p
        end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var x:matrix; i,j,k,int:byte; cont,cont1,c:real;
begin
  //Считываем матрицу А

  for i:=1 to n do
  for j:=1 to n do
      begin
        a[i,j]:=strtofloat(stringgrid1.Cells[j,i]);
        b[i]:=strtofloat(stringgrid2.Cells[0,i])
      end;
//Находим обратную методом окаймления
  okaim(a,oa,n);

      for i:=1 to n do
      for j:=1 to n do
         stringgrid8.Cells[i,j]:=floattostr(oa[j,i]); //выводим матрицу 

//Находим неизвестные
   for i:=1 to n do
     begin
       sum:=0;
       for j:=1 to n do
         sum:=sum+oa[i,j]*b[j];
       stringgrid7.Cells[1,i]:=floattostr(sum);
     end;

end;

end.
