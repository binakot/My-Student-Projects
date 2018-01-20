//Вычисление определителей по общему правилу вычисления определителей

unit detA;

interface

uses data;

function DetN(const a:Matrix; n:integer):real;      //для матрицы n-го порядка
procedure changeSTR(var a:matrix; i,j:integer);

implementation

procedure changeSTR(var a:matrix; i,j:integer);
var k:integer; c:real;
begin
  for k:=1 to n do
    begin
    c:=a[k,i];
    a[k,i]:=a[k,j];
    a[k,j]:=c
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


end.

