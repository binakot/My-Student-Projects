unit PrKr;

interface

uses data, Adams;

function PrKr3ConstStep(var x, y: extended): boolean;
function PrKr3AutoStep(var x, y: extended): boolean;
function PrKr4ConstStep(var x, y: extended): boolean;
function PrKr4AutoStep(var x, y: extended): boolean;

implementation


//����� �������� � ��������� 3 ������� � ���������� �����
function PrKr3ConstStep(var x, y: extended): boolean;
begin
  //������ ���
  x:= x + h;
  //������ �������
  pr:= mas[3,2] + (h/12)*(23*GetF(mas[3,1], mas[3,2]) - 16*GetF(mas[2,1],mas[2,2]) + 5*GetF(mas[1,1],mas[1,2]));
  f0:= GetF(x,pr);
  //������ ���������
  kr:= mas[3,2] + (h/12)*(5*f0 + 8*GetF(mas[3,1], mas[3,2]) - GetF(mas[2,1], mas[2,2]));
  //���������� ������
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= x;
  mas[3,2]:= kr;
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False
end;

//����� �������� � ��������� 3 ������� � �������������� ������� ����
function PrKr3AutoStep(var x, y: extended): boolean;
var h2,x2: extended;
begin
  h2:= h;
  x2:= x;
  repeat
    //����������� ���
    x:= x2 + h;
    //������ �������
    pr:= mas[3,2] + (h/12)*(23*GetF(mas[3,1], mas[3,2]) - 16*GetF(mas[2,1],mas[2,2]) + 5*GetF(mas[1,1],mas[1,2]));
    f0:= GetF(x,pr);
    //������ ���������
    kr:= mas[3,2] + (h/12)*(5*f0 + 8*GetF(mas[3,1], mas[3,2]) - GetF(mas[2,1], mas[2,2]));
    h:= h / 2
  until abs(pr - kr) < eps/100;
  //���������� ���
  h:=h2;
  if abs(pr - kr) < eps/100 then
    h:=2*h
  else
  if abs(pr - kr) > eps*100 then
    h:=h/2;
  //���������� ������
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= x;
  mas[3,2]:= kr;
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False
end;

//����� �������� � ��������� 4 ������� � ���������� �����
function PrKr4ConstStep(var x, y: extended): boolean;
begin
  //������ ���
  x:= x + h;
  //������ �������
  pr:= mas[4,2] + (h/24)*(55*GetF(mas[4,1], mas[4,2]) - 59*GetF(mas[3,1], mas[3,2]) + 37*GetF(mas[2,1],mas[2,2]) - 9*GetF(mas[1,1],mas[1,2]));
  f0:= GetF(x,pr);
  //������ ���������
  kr:= mas[4,2] + (h/24)*(9*f0 + 19*GetF(mas[4,1], mas[4,2]) - 5*GetF(mas[3,1], mas[3,2]) + GetF(mas[2,1], mas[2,2]));
  //���������� ������
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= mas[4,1];
  mas[3,2]:= mas[4,2];
  mas[4,1]:= x;
  mas[4,2]:= kr;
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False
end;

//����� �������� � ��������� 4 ������� � �������������� ������� ����
function PrKr4AutoStep(var x, y: extended): boolean;
var h2,x2: extended;
begin
  h2:= h;
  x2:= x;
  repeat
    //����������� ���
    x:= x2 + h;
    //������ �������
    pr:= mas[4,2] + (h/24)*(55*GetF(mas[4,1], mas[4,2]) - 59*GetF(mas[3,1], mas[3,2]) + 37*GetF(mas[2,1],mas[2,2]) - 9*GetF(mas[1,1],mas[1,2]));
    f0:= GetF(x,pr);
    //������ ���������
    kr:= mas[4,2] + (h/24)*(9*f0 + 19*GetF(mas[4,1], mas[4,2]) - 5*GetF(mas[3,1], mas[3,2]) + GetF(mas[2,1], mas[2,2]));
    h:= h / 2
  until abs(pr - kr) < eps/100;
  //���������� ���
  h:=h2;
  if abs(pr - kr) < eps/100 then
    h:=2*h
  else
  if abs(pr - kr) > eps*100 then
    h:=h/2;
  //���������� ������
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= mas[4,1];
  mas[3,2]:= mas[4,2];
  mas[4,1]:= x;
  mas[4,2]:= kr;
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False
end;

end.
