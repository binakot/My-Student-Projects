unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, ExtCtrls;

type
    mas=array[1..20000] of Integer;

  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Image1: TImage;
    ColorDialog1: TColorDialog;
    procedure FormCreate(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Zatravka(x,y:integer);
    procedure save(x,y:integer;var p:integer);
    procedure Get(var x,y,p:integer);
    function pixelcolor(x,y: Integer): tcolor;
    procedure ByLine(x,y:integer);
    procedure filld(x,y,i,j,f,fg:integer);
    procedure Finder(x,y,f,go:integer;var i:integer);
    procedure Fill;
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    n,colPoint,colFill,a,b,a1,b1:integer;
    points,x,y:mas;
    buf: tbitmap;
    push:boolean;
    NumEdge:integer;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
      image1.Canvas.Create;
      buf:=tbitmap.Create;
      buf.Height:=image1.Height;
      buf.Width:=image1.Width;
      stringgrid1.Cells[0,0]:='100';
      stringgrid1.Cells[0,1]:='100';
      stringgrid1.Cells[1,0]:='300';
      stringgrid1.Cells[1,1]:='50';
      stringgrid1.Cells[2,0]:='400';
      stringgrid1.Cells[2,1]:='150';
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
      n:=strtoint(edit1.Text);
      if button=btnext then inc(n);
      if button=btprev then dec(n);
      edit1.Text:=inttostr(n);
      stringgrid1.ColCount:=n;
end;

procedure TForm1.Zatravka(x,y:integer);
var i:integer;
begin
      i:=0;
      save(x,y,i);
      while i<>0 do
      begin
          get(x,y,i);
          image1.Canvas.Pixels[x,y]:=colFill;
          if (pixelcolor(x+1,y)=colPoint) and (pixelcolor(x+1,y)<>colFill) then save(x+1,y,i);
          if (pixelcolor(x-1,y)=colPoint) and (pixelcolor(x-1,y)<>colFill) then save(x-1,y,i);
          if (pixelcolor(x,y+1)=colPoint) and (pixelcolor(x,y+1)<>colFill) then save(x,y+1,i);
          if (pixelcolor(x,y-1)=colPoint) and (pixelcolor(x,y-1)<>colFill) then save(x,y-1,i);
      end;
end;

procedure TForm1.save(x,y:integer;var p:integer);
begin
      inc(p);
      points[p]:=x;
      inc(p);
      points[p]:=y;
end;

procedure TForm1.Get(var x,y,p:integer);
begin
      y:=points[p];
      dec(p);
      x:=points[p];
      dec(p);
end;

function TForm1.pixelcolor(x,y: Integer): tcolor;
begin
      pixelcolor:=getpixel(image1.Canvas.Handle,x,y);
end;

procedure TForm1.ByLine(x,y:integer);
var x1,y1,x2,y2,i,j,p,q,cur:integer;
first,flag:boolean;
begin
      x1:=x; y1:=y;  x2:=x; y2:=y;
      while (pixelcolor(x1,y)=colpoint)and(pixelcolor(x1,y)<>colFill) do
      begin
            //image1.Canvas.Pixels[x1,y]:=colFill;
            if (pixelcolor(x1,y-1)=colpoint)and(pixelcolor(x1,y-1)<>colFill) then
            i:=x1;
            dec(x1);
      end;
      inc(x2);
      while (pixelcolor(x2,y)=colpoint)and(pixelcolor(x2,y)<>colFill) do
      begin
            //image1.Canvas.Pixels[x2,y]:=colFill;
            if (pixelcolor(x2,y-1)=colpoint)and(pixelcolor(x2,y-1)<>colFill) then
            j:=x2;
            inc(x2);
      end;
      //x2:=x1;
      inc(x1);
      filld(x1,y1,i,j,0,-1);  

      inc(y);
      x1:=x; y1:=y;  x2:=x; y2:=y;
      while (pixelcolor(x1,y)=colpoint)and(pixelcolor(x1,y)<>colFill) do
      begin
            //image1.Canvas.Pixels[x1,y]:=colFill;
            if (pixelcolor(x1,y-1)=colpoint)and(pixelcolor(x1,y-1)<>colFill) then
            i:=x1;
            dec(x1);
      end;
      inc(x2);
      while (pixelcolor(x2,y)=colpoint)and(pixelcolor(x2,y)<>colFill) do
      begin
            //image1.Canvas.Pixels[x2,y]:=colFill;
            if (pixelcolor(x2,y-1)=colpoint)and(pixelcolor(x2,y-1)<>colFill) then
            j:=x2;
            inc(x2);
      end;
      inc(x1);  dec(j); dec(j);
      filld(x1,y1,i,j,1,1);
      Refresh;
end;

procedure TForm1.filld(x,y,i,j,f,fg:integer);
var k,l,p,q,cur:integer;
first,flag:boolean;
begin
      first:=true; p:=0; q:=0; flag:=true;
      cur:=x;
      while (pixelcolor(x,y)=colpoint)and(pixelcolor(x,y)<>colFill) do
      begin
            for k:=0 to j-i do
            begin
                 if (pixelcolor(x,y+fg)=colpoint)and(pixelcolor(x,y+fg)<>colFill) then
                 if first then
                 begin
                      Finder(x,y,0,f,p);
                      dec(p);
                      if p<>0 then
                      p:=cur-p else p:=k+cur;
                      first:=false;
                 end else  q:=k+cur;
                 if (flag)and(pixelcolor(x,y)=colpoint)and(pixelcolor(x,y)<>colFill) then
                 image1.Canvas.Pixels[x,y]:=colFill
                 else if flag then flag:=false else flag:=true;
                 inc(x);
                 image1.Canvas.Pixels[x,y]:=colFill;
            end;
            //Refresh;
            Finder(x,y,1,f,q);
            dec(q);
            if (p=0)and(q=0) then break;
            if f=0 then dec(y) else inc(y);
            i:=p; j:=q;
            first:=true; flag:=true;
            if p=0 then x:=x+1
            else x:=p;
            p:=0; q:=0;
            cur:=x;
      end;
end;

procedure TForm1.Finder(x,y,f,go:integer;var i:integer);
begin
      if go=0 then y:=y-1 else y:=y+1;
      while (pixelcolor(x,y)=colpoint)and(pixelcolor(x,y)<>colFill) do
      begin
            if f=0 then dec(x)
            else inc(x);
            i:=i+1;
      end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
      for i := 0 to stringgrid1.ColCount-1 do
      begin
            x[i+1]:=strtoint(stringgrid1.Cells[i,0]);
            y[i+1]:=strtoint(stringgrid1.Cells[i,1]);
      end;

      NumEdge:=strtoint(edit1.Text);

      Fill;
end;


procedure tform1.Fill;
var
    tr: array [1..20,1..7] of real;
    Tar,Tar1: array [1..20,1..4] of real;
    edge: string;
    e: real;
    i,j,ymax,ymin,
    n,m,CurY,k,l,
    LengTr,LengTar,group,first,second: integer;

begin
      {поиск y[min] и y[max]}
      ymin:=y[1];
      ymax:=y[1];
      for i := 1 to NumEdge do    
      begin
          if y[i]>ymax then ymax:=y[i];
          if y[i]<ymin then ymin:=y[i];
      end;

      {создание таблицы ребер}
      j:=0;
      for i := 1 to NumEdge do
      begin
            if i<>NumEdge then
            begin
                  first:=y[i];
                  second:=y[i+1];
                  if first<>second then
                  begin
                        inc(j);
                        if second<first then
                        begin
                              Edge:=inttostr(i+1)+inttostr(i);
                              tr[j,2]:=strtoint(Edge);
                              tr[j,3]:=second;
                              tr[j,4]:=first;
                              tr[j,5]:=x[i+1];
                              tr[j,6]:=x[i];
                        end else
                        begin
                              Edge:=inttostr(i)+inttostr(i+1);
                              tr[j,2]:=strtoint(Edge);
                              tr[j,3]:=first;
                              tr[j,4]:=second;
                              tr[j,5]:=x[i];
                              tr[j,6]:=x[i+1];
                        end;
                  end;
            end else
            begin
                  first:=y[i];
                  second:=y[1];
                  if first<>second then
                  begin
                        inc(j);
                        if second<first then
                        begin
                              Edge:=inttostr(1)+inttostr(i);
                              tr[j,2]:=strtoint(Edge);
                              tr[j,3]:=second;
                              tr[j,4]:=first;
                              tr[j,5]:=x[1];
                              tr[j,6]:=x[i];
                        end else
                        begin
                              Edge:=inttostr(i)+inttostr(1);
                              tr[j,2]:=strtoint(Edge);
                              tr[j,3]:=second ;
                              tr[j,4]:=first;
                              tr[j,5]:=x[i];
                              tr[j,6]:=x[1];
                        end;
                  end;
            end;
      end;
      LengTr:=j;

      {сортировка по нарастанию y[min]}
      for i := 1 to LengTr do
       for j := i+1 to LengTr do
        if tr[j,3]<tr[i,3] then
         for k:=2 to 6 do
         begin
               e:=tr[j,k];
               tr[j,k]:=tr[i,k];
               tr[i,k]:=e;
         end;

      {растановка групп}
      k:=round(tr[1,3]);
      l:=1;
      for i := 1 to LengTr do
      begin
            if k<>round(tr[i,3]) then
            begin
              inc(l);
              k:=round(tr[i,3]);
            end;
            tr[i,1]:=l;
      end;

      {вычисление прирощения X}
      for i := 1 to LengTr do
         tr[i,7]:=(tr[i,6]-tr[i,5])/(tr[i,4]-tr[i,3]);

      {заполнение области}
      group:=1;
      LengTar:=0;
      CurY:=ymin;
      repeat
          {перенос группы из таблицы ребер в таблицу активных ребер}
          if CurY=tr[1,3] then
          begin
              l:=0;
              if LengTar>0 then
              begin
                    tar1:=tar;
                    l:=LengTar;
              end;
              {вычисление колличества ребер группы}
              for i := 1 to LengTr do
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
              LengTar:=n;
              {удаление текущей группы из таблицы ребер}
              for i := 1 to LengTr do
               for j:=1 to 7 do
                tr[i,j]:=tr[i+n,j];

              LengTr:=LengTr-n;

              {дописывание ребер в таблицу активных ребер}
              if l<>0 then
               for i := 1 to l do
                begin
                      inc(LengTar);
                      for j:=1 to 4 do
                      tar[LengTar,j]:=tar1[i,j];
                end;
          end;

          {сортировка по нарастанию x[нач.]}
          for i := 1 to LengTar do
           for j := i+1 to LengTar do
            if tar[j,3]<tar[i,3] then
             for k:=1 to 4 do
             begin
                   e:=tar[j,k];
                   tar[j,k]:=tar[i,k];
                   tar[i,k]:=e;
             end;

          for i := 2 to LengTar do
          begin
                image1.Canvas.MoveTo(round(tar[1,3]),CurY);
                image1.Canvas.LineTo(round(tar[i,3]),CurY); 
          end;
          if CurY+1<>ymax then
          begin
                {удаление ребер из таблицы активных ребер для которых y=y[max]}
                k:=LengTar;
                for i := 1 to LengTar do
                 if CurY=tar[i,2] then
                 begin
                        dec(k);
                        if i<>LengTar then
                         for j := i to LengTar do
                          for m:=1 to 4 do
                          tar[j,m]:=tar[j+1,m];
                 end;
                 LengTar:=k;
                 {для всех ребер в таблице активных ребер x[нач.]:=x[нач.]+deltaX}
                 for i := 1 to LengTar do
                  tar[i,3]:=tar[i,3]+tar[i,4];
            end;
            {переход на следующую строку}
            inc(CurY);
          until CurY>ymax;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      push:=false;
      a1:=x;
      b1:=y;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
      Image1.canvas.brush.style:=bssolid;
      Image1.canvas.brush.Color:=clwhite;
      Image1.Canvas.Pen.Color:=clwhite;
      Image1.Canvas.Rectangle(0,0,1000,1000);
      Image1.canvas.pen.Color:=clblack;
end;

end.
