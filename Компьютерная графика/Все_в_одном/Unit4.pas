unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, XPMan, StdCtrls, Buttons, Grids;

type
  TForm3 = class(TForm)
    XPManifest1: TXPManifest;
    Image1: TImage;
    StatusBar1: TStatusBar;
    ColorDialog1: TColorDialog;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    Edit5: TEdit;
    Label5: TLabel;
    UpDown1: TUpDown;
    SpeedButton4: TSpeedButton;
    GroupBox5: TGroupBox;
    StringGrid1: TStringGrid;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure zatravka(x,y: integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure putpixel(x,y: integer; cl: tcolor);
    procedure push(x,y: integer; var i: integer);
    procedure pop(var x,y,i: integer);
    function pixelcolor(x,y: integer): tcolor;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure rowwise(x,y: integer);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure potting_poly;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form3: TForm3;
  colcur,colpot: tcolor;
  s: array [1..180000] of integer;
  x,y: array [1..30] of integer;
  col_rib: integer;
implementation

{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form3.Free;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 image1.Canvas.Create;
 image1.Canvas.Rectangle(10,10,130,130);
 image1.Canvas.Rectangle(30,30,110,110);
 image1.Canvas.Ellipse(10,140,140,280);
 image1.Canvas.Ellipse(30,160,120,260);
 image1.Canvas.MoveTo(230,10);
 image1.Canvas.LineTo(290,130);
 image1.Canvas.MoveTo(230,10);
 image1.Canvas.LineTo(170,130);
 image1.Canvas.LineTo(290,130);
 image1.Canvas.MoveTo(230,30);
 image1.Canvas.LineTo(270,120);
 image1.Canvas.MoveTo(230,30);
 image1.Canvas.LineTo(190,120);
 image1.Canvas.LineTo(270,120);
 stringgrid1.Cells[0,0]:='170';
 stringgrid1.Cells[0,1]:='145';
 stringgrid1.Cells[1,0]:='180';
 stringgrid1.Cells[1,1]:='270';
 stringgrid1.Cells[2,0]:='280';
 stringgrid1.Cells[2,1]:='150';
end;

procedure TForm3.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:='';
end;

procedure TForm3.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if button=mbleft then
  begin
   colcur:=pixelcolor(x,y);
   colpot:=panel2.Color;
   zatravka(x,y);
  end;
 if button=mbright then
  begin
   colcur:=pixelcolor(x,y);
   colpot:=panel2.Color;
   rowwise(x,y);
  end;
end;

procedure TForm3.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 statusbar1.Panels[0].Text:=inttostr(x)+','+inttostr(y);
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
var
 x,y: integer;
begin
 try
  x:=strtoint(edit1.Text);
  y:=strtoint(edit2.Text);
 except
  on EConvertError do
   begin
    showmessage('Введены неверные данные!');
    exit;
   end;
 end;
 if (x>299) or (x<0) or (y>299) or (y<0) then
  begin
   showmessage('Выход за пределы допустимых значений!');
   exit;
  end;
 colcur:=pixelcolor(x,y);
 colpot:=panel2.Color;
 zatravka(x,y);
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
 if colordialog1.Execute then
  begin
   panel2.Color:=colordialog1.Color;
  end
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
var
 x,y: integer;
begin
 try
  x:=strtoint(edit3.Text);
  y:=strtoint(edit4.Text);
 except
  on EConvertError do
   begin
    showmessage('Введены неверные данные!');
    exit;
   end;
 end;
 if (x>299) or (x<0) or (y>299) or (y<0) then
  begin
   showmessage('Выход за пределы допустимых значений!');
   exit;
  end;
 colcur:=pixelcolor(x,y);
 colpot:=panel2.Color;
 rowwise(x,y);
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
var
 p,b: tcolor;
begin
 p:=image1.Canvas.Pen.Color;
 b:=image1.Canvas.Brush.Color;
 image1.Canvas.Pen.Color:=clwhite;
 image1.Canvas.Brush.Color:=clwhite;
 image1.Canvas.Rectangle(0,0,image1.Height,image1.Width);
 image1.Canvas.Pen.Color:=p;
 image1.Canvas.Brush.Color:=b;
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
var
  i: integer;
begin
 try
  for i := 0 to stringgrid1.ColCount-1 do
   begin
    x[i+1]:=strtoint(stringgrid1.Cells[i,0]);
    y[i+1]:=strtoint(stringgrid1.Cells[i,1]);
   end;
 except
  on EConvertError do
   begin
    showmessage('Введены неверные данные!');
    exit;
   end;
 end;
 col_rib:=strtoint(edit5.Text);
 for i := 1 to col_rib do
  begin
   if (x[i]>299) or (x[i]<0) or (y[i]>299) or (y[i]<0) then
    begin
     showmessage('Выход за пределы допустимых значений!');
     exit;
    end;
  end;
 image1.Canvas.Pen.Color:=panel2.Color;
 potting_poly;
end;

procedure TForm3.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
 col: integer;
begin
 col:=strtoint(edit5.Text);
 if button=btnext then inc(col);
 if button=btprev then dec(col);
 edit5.Text:=inttostr(col);
 stringgrid1.ColCount:=col;
 if col>3 then stringgrid1.Height:=70;
 if col=3 then stringgrid1.Height:=53;
end;

procedure tform3.putpixel(x: Integer; y: Integer; cl: TColor);
begin
 image1.Canvas.Pixels[x,y]:=cl;
end;

procedure tform3.push(x: Integer; y: Integer; var i: Integer);
begin
 inc(i);
 s[i]:=x;
 inc(i);
 s[i]:=y;
end;

procedure tform3.pop(var x: Integer; var y: Integer; var i: Integer);
begin
 y:=s[i];
 dec(i);
 x:=s[i];
 dec(i);
end;

function tform3.pixelcolor(x: Integer; y: Integer): tcolor;
begin
 pixelcolor:=getpixel(image1.Canvas.Handle,x,y);
end;

procedure tform3.zatravka(x,y: integer);
var
 i: integer;
begin
 i:=0;
 push(x,y,i);
 while i<>0 do
  begin
   pop(x,y,i);
   putpixel(x,y,colpot);
   if (pixelcolor(x+1,y)=colcur) and (pixelcolor(x+1,y)<>colpot) then push(x+1,y,i);
   if (pixelcolor(x-1,y)=colcur) and (pixelcolor(x-1,y)<>colpot) then push(x-1,y,i);
   if (pixelcolor(x,y+1)=colcur) and (pixelcolor(x,y+1)<>colpot) then push(x,y+1,i);
   if (pixelcolor(x,y-1)=colcur) and (pixelcolor(x,y-1)<>colpot) then push(x,y-1,i);
  end;
end;

procedure tform3.rowwise(x,y: integer);
var
 x0,y0: integer;
begin
 x0:=x;
 y0:=y;
 putpixel(x0,y0,colpot);
 while (pixelcolor(x0-1,y0)=colcur) and (pixelcolor(x0-1,y0)<>colpot) do
  begin
   dec(x0);
   putpixel(x0,y0,colpot);
   if (pixelcolor(x0,y-1)=colcur) and (pixelcolor(x0,y-1)<>colpot) then rowwise(x0,y-1);
   if (pixelcolor(x0,y+1)=colcur) and (pixelcolor(x0,y+1)<>colpot) then rowwise(x0,y+1);
  end;
 x0:=x;
 y0:=y;
 while (pixelcolor(x0+1,y0)=colcur) and (pixelcolor(x0+1,y0)<>colpot) do
  begin
   inc(x0);
   putpixel(x0,y0,colpot);
   if (pixelcolor(x0,y-1)=colcur) and (pixelcolor(x0,y-1)<>colpot) then rowwise(x0,y-1);
   if (pixelcolor(x0,y+1)=colcur) and (pixelcolor(x0,y+1)<>colpot) then rowwise(x0,y+1);
  end;
 x0:=x;
 y0:=y;
 if (pixelcolor(x0,y-1)=colcur) and (pixelcolor(x0,y-1)<>colpot) then rowwise(x0,y-1);
 if (pixelcolor(x0,y+1)=colcur) and (pixelcolor(x0,y+1)<>colpot) then rowwise(x0,y+1);
end;

procedure tform3.potting_poly;
var
 tr: array [1..30,1..7] of real;
 tar,tar_: array [1..30,1..4] of real;
 rib: string;
 temp: real;
 i,j,y_max,y_min,n,m,y_cur,k,l,length_tr,length_tar,group: integer;
 f: textfile;
begin
 assignfile(f,'Заливка многоугольником.txt');
 rewrite(f);
 writeln(f,'Координаты многоугольника:');
 for i := 1 to col_rib do
  begin
   writeln(f,'x[',i,']->',x[i]:4,', y[',i,']->',y[i]:4);
  end;
 {поиск y[min] и y[max]}
 y_min:=y[1];
 y_max:=y[1];
 for i := 1 to col_rib do
  begin
   if y[i]>y_max then y_max:=y[i];
   if y[i]<y_min then y_min:=y[i];
  end;
 writeln(f,'y[min]->',y_min:4);
 writeln(f,'y[max]->',y_max:4);
 {создание таблицы ребер}
 {запись ребер в таблицу}
 j:=0;
 for i := 1 to col_rib do
  begin
   if i<>col_rib then
    begin
     k:=y[i];
     l:=y[i+1];
     if k<>l then
      begin
       inc(j);
       if l<k then
        begin
         rib:=inttostr(i+1)+inttostr(i);
         tr[j,2]:=strtoint(rib);
         tr[j,3]:=l;
         tr[j,4]:=k;
         tr[j,5]:=x[i+1];
         tr[j,6]:=x[i];
        end
       else
        begin
         rib:=inttostr(i)+inttostr(i+1);
         tr[j,2]:=strtoint(rib);
         tr[j,3]:=k;
         tr[j,4]:=l;
         tr[j,5]:=x[i];
         tr[j,6]:=x[i+1];
        end;
      end;
    end
   else
    begin
     k:=y[i];
     l:=y[1];
     if k<>l then
      begin
       inc(j);
       if l<k then
        begin
         rib:=inttostr(1)+inttostr(i);
         tr[j,2]:=strtoint(rib);
         tr[j,3]:=l;
         tr[j,4]:=k;
         tr[j,5]:=x[1];
         tr[j,6]:=x[i];
        end
       else
        begin
         rib:=inttostr(i)+inttostr(1);
         tr[j,2]:=strtoint(rib);
         tr[j,3]:=l;
         tr[j,4]:=k;
         tr[j,5]:=x[i];
         tr[j,6]:=x[1];
        end;
      end;
    end;
  end;
 length_tr:=j;
 {сортировка по нарастанию y[min]}
 for i := 1 to length_tr do
  begin
   for j := i+1 to length_tr do
    begin
     if tr[j,3]<tr[i,3] then
      begin
       temp:=tr[j,2];
       tr[j,2]:=tr[i,2];
       tr[i,2]:=temp;
       temp:=tr[j,3];
       tr[j,3]:=tr[i,3];
       tr[i,3]:=temp;
       temp:=tr[j,4];
       tr[j,4]:=tr[i,4];
       tr[i,4]:=temp;
       temp:=tr[j,5];
       tr[j,5]:=tr[i,5];
       tr[i,5]:=temp;
       temp:=tr[j,6];
       tr[j,6]:=tr[i,6];
       tr[i,6]:=temp;
      end;
    end;
  end;
 {растановка групп}
 k:=round(tr[1,3]);
 l:=1;
 for i := 1 to length_tr do
  begin
   if k<>round(tr[i,3]) then
    begin
     inc(l);
     k:=round(tr[i,3]);
    end;
   tr[i,1]:=l;
  end;
 {сортировка каждой группы по нарастанию x[нач.]}
 k:=1;
 l:=0;
 for i := 1 to length_tr do
  begin
   if round(tr[i,1])<>k then
    begin
     inc(l);
     inc(k);
     for j := l to i-1 do
      begin
       for n := j+1 to i-1 do
        begin
         if tr[n,5]<tr[j,5] then
          begin
           temp:=tr[n,1];
           tr[n,1]:=tr[j,1];
           tr[j,1]:=temp;
           temp:=tr[n,2];
           tr[n,2]:=tr[j,2];
           tr[j,2]:=temp;
           temp:=tr[n,3];
           tr[n,3]:=tr[j,3];
           tr[j,3]:=temp;
           temp:=tr[n,4];
           tr[n,4]:=tr[j,4];
           tr[j,4]:=temp;
           temp:=tr[n,5];
           tr[n,5]:=tr[j,5];
           tr[j,5]:=temp;
           temp:=tr[n,6];
           tr[n,6]:=tr[j,6];
           tr[j,6]:=temp;
          end;
        end;
      end;
    end;
  end;
 {вычисление deltaX}
 for i := 1 to length_tr do
  begin
   tr[i,7]:=(tr[i,6]-tr[i,5])/(tr[i,4]-tr[i,3]);
  end;
 {вывод таблицы ребер в файл}
 writeln(f,'Таблица ребер:');
 writeln(f,'Группа Ребро Y[min] Y[max] X[нач.] X[кон.] DeltaX');
 for i := 1 to length_tr do
  begin
   writeln(f,tr[i,1]:6:0,tr[i,2]:6:0,tr[i,3]:7:0,tr[i,4]:7:0,tr[i,5]:8:0,tr[i,6]:8:0,tr[i,7]:7:3);
  end;
 {заполнение области}
 group:=1;
 length_tar:=0;
 y_cur:=y_min;
 repeat
  {перенос группы из таблицы ребер в таблицу активных ребер}
  if y_cur=tr[1,3] then
   begin
    l:=0;
    if length_tar>0 then
     begin
      tar_:=tar;
      l:=length_tar;
     end;
    {вычисление колличества ребер группы}
    for i := 1 to length_tr do
     begin
      n:=i;
      if group<>tr[i,1] then
       begin
        inc(group);
        dec(n);
        break;
       end;
     end;
    {копирование группы ребер из таблицы ребер в таблицу активных ребер}
    for i := 1 to n do
     begin
      tar[i,1]:=tr[i,2];
      tar[i,2]:=tr[i,4];
      tar[i,3]:=tr[i,5];
      tar[i,4]:=tr[i,7];
     end;
    length_tar:=n;
    {удаление группы из таблицы ребер}
    for i := 1 to length_tr do
     begin
      tr[i,1]:=tr[i+n,1];
      tr[i,2]:=tr[i+n,2];
      tr[i,3]:=tr[i+n,3];
      tr[i,4]:=tr[i+n,4];
      tr[i,5]:=tr[i+n,5];
      tr[i,6]:=tr[i+n,6];
      tr[i,7]:=tr[i+n,7];
     end;
    length_tr:=length_tr-n;
    {дописывание ребер в таблицу активных ребер}
    if l<>0 then
     begin
      for i := 1 to l do
       begin
        inc(length_tar);
        tar[length_tar,1]:=tar_[i,1];
        tar[length_tar,2]:=tar_[i,2];
        tar[length_tar,3]:=tar_[i,3];
        tar[length_tar,4]:=tar_[i,4];
       end;
     end;
   end;
  {сортировка по нарастанию x[нач.]}
  for i := 1 to length_tar do
   begin
    for j := i+1 to length_tar do
     begin
     if tar[j,3]<tar[i,3] then
      begin
       temp:=tar[j,1];
       tar[j,1]:=tar[i,1];
       tar[i,1]:=temp;
       temp:=tar[j,2];
       tar[j,2]:=tar[i,2];
       tar[i,2]:=temp;
       temp:=tar[j,3];
       tar[j,3]:=tar[i,3];
       tar[i,3]:=temp;
       temp:=tar[j,4];
       tar[j,4]:=tar[i,4];
       tar[i,4]:=temp;
       end;
     end;
   end;
  {вывод таблиц в файл}
  writeln(f,'y[current]->',y_cur:4);
  writeln(f,'Таблица ребер:');
  writeln(f,'Группа Ребро Y[min] Y[max] X[нач.] X[кон.] DeltaX');
  for i := 1 to length_tr do
   begin
    writeln(f,tr[i,1]:6:0,tr[i,2]:6:0,tr[i,3]:7:0,tr[i,4]:7:0,tr[i,5]:8:0,tr[i,6]:8:0,tr[i,7]:7:2);
   end;
  writeln(f,'Таблица активных ребер:');
  writeln(f,'Ребро Y[max] X[нач.] DeltaX');
  for i := 1 to length_tar do
   begin
    writeln(f,tar[i,1]:5:0,tar[i,2]:7:0,tar[i,3]:8:0,tar[i,4]:7:2);
   end;
  {проведение сканирующей строки}
  for i := 2 to length_tar do
   begin
    image1.Canvas.MoveTo(round(tar[1,3]),y_cur);
    image1.Canvas.LineTo(round(tar[i,3]),y_cur);
   end;
  if y_cur+1<>y_max then
   begin
    {удаление ребер из таблицы активных ребер для которых y=y[max]}
    k:=length_tar;
    for i := 1 to length_tar do
     begin
      if y_cur=tar[i,2] then
       begin
        dec(k);
        if i<>length_tar then
         begin
          for j := i to length_tar do
           begin
            tar[j,1]:=tar[j+1,1];
            tar[j,2]:=tar[j+1,2];
            tar[j,3]:=tar[j+1,3];
            tar[j,4]:=tar[j+1,4];
           end;
         end;
       end;
     end;
    length_tar:=k;
    {для всех ребер в таблице активных ребер x[нач.]:=x[нач.]+deltaX}
    for i := 1 to length_tar do
     begin
      tar[i,3]:=tar[i,3]+tar[i,4];
     end;
   end;
  {переход на следующую строку}
  inc(y_cur);
 until y_cur>y_max;
 closefile(f);
end;

end.
