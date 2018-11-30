unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
    mat=array[1..5,1..5] of real;
    mas=array[1..4] of real;

  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Label2: TLabel;
    StringGrid3: TStringGrid;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure GeTMat;
    procedure Button1Click(Sender: TObject);
    procedure GetT;
    procedure GetX;
    procedure GetE;
    procedure display(z:mat; p,q,m,l:byte);
    procedure zeroMat(var z:mat);
    procedure print;
    procedure Determinant(z:mat;var det:real; m:integer);
    function Znak:integer;
    function recombin(var z:mat; r:byte):boolean;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ymnojenie(var c:mat; a,b:mat; d:integer);

  private

  public
        a,t1,t2,prov,matr:mat;
        x,y,E,E1:mat;
        b:mas;
        n,el,zn:byte;
        show:boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      n:=strtoint(edit1.Text);
    stringgrid1.ColCount:=n+1; stringgrid1.RowCount:=n;   //применение
    edit1.SetFocus;
   with StringGrid1 do
    begin
    Cells[0,0]:='3';Cells[1,0]:='1';Cells[2,0]:='-1';Cells[3,0]:='2';Cells[4,0]:='6';
    Cells[0,1]:='5';Cells[1,1]:='1';Cells[2,1]:='3';Cells[3,1]:='-4';Cells[4,1]:='-12';
    Cells[0,2]:='2';Cells[1,2]:='0';Cells[2,2]:='1';Cells[3,2]:='-1';Cells[4,2]:='1';
    Cells[0,3]:='1';Cells[1,3]:='-5';Cells[2,3]:='3';Cells[3,3]:='-3';Cells[4,3]:='3';
    end;
    {with StringGrid1 do
    begin
    Cells[0,0]:='7,9';Cells[1,0]:='5,6';Cells[2,0]:='5,7';Cells[3,0]:='-7,2';Cells[4,0]:='6,68';
    Cells[0,1]:='8,5';Cells[1,1]:='-4,8';Cells[2,1]:='0,8';Cells[3,1]:='3,5';Cells[4,1]:='9,95';
    Cells[0,2]:='4,3';Cells[1,2]:='4,2';Cells[2,2]:='-3,2';Cells[3,2]:='9,3';Cells[4,2]:='8,6';
    Cells[0,3]:='3,2';Cells[1,3]:='-1,4';Cells[2,3]:='-8,9';Cells[3,3]:='3,3';Cells[4,3]:='1';
    end; 
    with StringGrid1 do
    begin
    Cells[0,0]:='0';Cells[1,0]:='1';Cells[2,0]:='1';Cells[3,0]:='-1';Cells[4,0]:='1';
    Cells[0,1]:='1';Cells[1,1]:='0';Cells[2,1]:='-3';Cells[3,1]:='0';Cells[4,1]:='-2';
    Cells[0,2]:='2';Cells[1,2]:='-3';Cells[2,2]:='5';Cells[3,2]:='0';Cells[4,2]:='4';
    Cells[0,3]:='1';Cells[1,3]:='2';Cells[2,3]:='-1';Cells[3,3]:='2';Cells[4,3]:='4';
    end; }

    Button2.Enabled:=true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
      edit1.SetFocus;
    show:=true;
    Button1.Enabled:=false;
    Button2.Enabled:=false;

    stringgrid1.ColCount:=4; stringgrid1.RowCount:=4;
    stringgrid2.ColCount:=6; stringgrid2.RowCount:=12;
end;

procedure TForm1.GeTMat;
var i,j:byte;
begin
      for i:=1 to n+1 do
      for j:=1 to n do
        if stringgrid1.Cells[i-1,j-1]<>''then
        a[j,i]:=strtofloat(stringgrid1.Cells[i-1,j-1])
        else a[j,i]:=0;

       for i:=1 to n do
       for j:=1 to n do
               matr[i,j]:=strtofloat(stringgrid1.cells[j-1,i-1]);
        end;

procedure TForm1.Button2Click(Sender: TObject);
var d:real;
begin
      GetMat;
      el:=1; 
      if a[1,1]=0 then recombin(a,n);
      d:=0;
      Determinant(a,d,n);
      if d<>0 then Button1.Enabled:=true
      else Button1.Enabled:=false;
      label2.Caption:='DetA = '+floattostr(d);
      
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
      GetT;
      GetX;
      GetE;
      print;
end;

procedure TForm1.print;
begin
      display(a,1,1,n,n+1);
      display(E,1,n+2,n,n+2);
      display(E1,n+1,n+2,2*n,n+2);
      display(t1,n+1,1,2*n,n);
      show:=false;
      display(t2,n+1,1,2*n,n+1);
      show:=true;
      display(y,2*n+1,n+1,3*n,n+1);
      display(x,2*n+1,n+2,3*n,n+2);
end;

procedure TForm1.GetX;
var i,j:byte;
s:real;
begin
      y[1,1]:=a[1,n+1]/t1[1,1];
      s:=0;
      for i:=2 to n do
      begin
            s:=0;
            for j:=1 to i-1 do
            s:=s+t1[i,j]*y[j,1];
            y[i,1]:=(a[i,n+1]-s)/t1[i,i];
      end;
      s:=0;
      x[n,1]:=y[n,1];
      for i:=n-1 downto 1 do
      begin
            s:=0;
            for j:=i+1 to n do
            s:=s+t2[i,j]*x[j,1];
            x[i,1]:=y[i,1]-s;
      end;
      x[n,1]:=y[n,1];
end;


procedure TForm1.GetT;
var k:byte;
i,j,l:integer;
s : real;
begin
      zeroMat(t1);
      zeroMat(t2);

      for i:=1 to n do
        T1[i,1]:=A[i,1];

      for i:=1 to n+1 do
        T2[1,i]:=A[1,i]/T1[1,1];

      for l:=2 to n do
        begin

          for i:=l to n do
              begin
                s:=0;
                for k:= 1 to l-1 do
                  s:=s+t1[i,k]*t2[k,l];

                t1[i,l]:=a[i,l]-s;
              end;

          for j:=l to n+1 do
             begin
               s:=0;
               for k:=1 to j-1 do
                s:=s+t1[l,k]*t2[k,j];

               T2[l,j]:=(a[l,j]-s)/t1[l,l];
             end;


         end;
end;

procedure TForm1.GetE;
var i,j:byte;
begin
       zeroMat(E);
       for i:=1 to n do
       for j:=1 to n+1 do
       begin
              E[i,1]:=E[i,1]+a[i,j];
              E1[i,1]:=E1[i,1]+t2[i,j];
       end;

end;

procedure TForm1.display(z:mat; p,q,m,l:byte);
var i,j,i1,j1,h:byte;
s:string;
begin
      dec(p); dec(q); dec(l); dec(m);
      i1:=1; j1:=1;
      
      for i:=p to m do
      begin
          for j:=q to l do
          begin
                if z[i1,j1]<0 then h:=6 else h:=5;
                s:=floattostr(z[i1,j1]);
                delete(s,h,length(s));
                z[i1,j1]:=strtofloat(s);
                if show then stringgrid2.Cells[j,i]:=floattostr(z[i1,j1])
                else
                    if j1=i1 then
                    stringgrid2.Cells[j,i]:=stringgrid2.Cells[j,i]+'    '+floattostr(z[i1,j1])
                    else if j1>=i1 then stringgrid2.Cells[j,i]:=floattostr(z[i1,j1]);
                j1:=j1+1;
          end;
          i1:=i1+1; j1:=1;
      end;
end;

procedure TForm1.zeroMat(var z:mat);
var i,j:byte;
begin
      for i:=1 to n do
      for j:=1 to n+1 do
      z[i,j]:=0;
end;


     function TForm1.recombin(var z:mat; r:byte):boolean;
     var s:real;
     k,v:byte;
     i,j:integer;
     begin
          v:=0;
          for k:=el to r do
          if z[el,k]<>0 then break
          else v:=v+1;
          zn:=abs(k-el);
          if v=r then
          begin
               recombin:=true;
               exit;
          end else recombin:=false;
          for i:=el to el do
          for j:=el to r do
          begin
                s:=z[j,el];
                z[j,el]:=z[j,k];
                z[j,k]:=s;
          end;
     end;
     function TForm1.Znak:integer;
     begin
          if (zn mod 2 <>0) then
          znak:=-1 else znak:=1;
     end;

     procedure TForm1.Determinant(z:mat;var det:real; m:integer);
     var i,j:integer;
     begin
          if det=0 then
          begin
               det:=1;
               el:=1;
          end;
          if z[el,el]=0 then
          if recombin(z,m) then
          begin
                Det:=0;
                exit;
          end;

          b[el]:=z[el,el];
          Det:=znak*b[el]*det;

          for i:=el+1 to m do
          for j:=el+1 to m do
               z[i,j]:=z[i,j]-(z[i,el]*z[el,j])/z[el,el];

          if el=m then
          exit
          else begin
               el:=el+1;
               Determinant(z,det,m);
          end;
     end;

procedure TForm1.ymnojenie(var c:mat; a,b:mat; d:integer);
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
procedure TForm1.Button3Click(Sender: TObject);
var i,j:integer;
begin
ymnojenie(prov,matr,x,n);
for i:=1 to n do
for j:=1 to n do
StringGrid3.Cells[j-1,i-1]:=FloatToStr(round(prov[i,j]));
end;

end.
