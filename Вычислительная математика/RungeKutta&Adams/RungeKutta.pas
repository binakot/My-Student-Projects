unit RungeKutta;

interface

uses data;

function RungeKutta3ConstStep(var k1, k2, k3, x, y: extended): boolean;
function RungeKutta3AutoStep(var k1, k2, k3, x, y: extended): boolean;
function RungeKutta4ConstStep(var k1, k2, k3, k4, x, y: extended): boolean;
function RungeKutta4AutoStep(var k1, k2, k3, k4, x, y: extended): boolean;

implementation

//����� �����-����� 3 ������� � ���������� �����
function RungeKutta3ConstStep(var k1, k2, k3, x, y: extended): boolean;
begin
  //������� ������������
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + h, y - h * k1 + 2 * h * k2);
  //������ ���
  x:= x + h;
  //�������� �������� y
  y:= y + (h / 6) * (k1 + 4 * k2 + k3);
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False
end;

//����� �����-����� 3 ������� � �������������� ������� ����
function RungeKutta3AutoStep(var k1, k2, k3, x, y : extended): boolean;
var h2, x2, y2: extended;  //���������� ��� �������� ���������
begin
  //������� ������������
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + h, y - h * k1 + 2 * h * k2);
  //���������� ���������� x, y
  x2:= x;
  y2:= y;
  //������ ���
  x:= x + h;
  //�������� �������� y
  y:= y + (h / 6) * (k1 + 4 * k2 + k3);
  //��������� ��� � 2 ����
  h2:= h / 2;
  //������� ������������ ��� ���
  k1:= GetF(x2, y2);
  k2:= GetF(x2 + (h2 / 2), y2 + (h2 * k1 / 2));
  k3:= GetF(x2 + h2, y2 - h2 * k1 + 2 * h2 * k2);
  //�������� �������� y2
  y2:= y2 + (h2 / 6) * (k1 + 4 * k2 + k3);
  //���������� y � y2
  if (abs(y2 - y) < eps/100) then
    h:= 2 * h
  else
  if (abs(y2 - y) > eps*100) then
    h:= h / 2;
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False
end;

//����� �����-����� 4 ������� � ���������� �����
function RungeKutta4ConstStep(var k1, k2, k3, k4, x, y: extended): boolean;
begin
  //������� ������������
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + (h / 2), y + (h * k2 / 2));
  k4:= GetF(x + h, y + h * k3);
  //������ ���
  x:= x + h;
  //�������� �������� y
  y:= y + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False
end;

//����� �����-����� 4 ������� � �������������� ������� ����
function RungeKutta4AutoStep(var k1, k2, k3, k4, x, y : extended): boolean;
var h2, x2, y2: extended;   //���������� ��� �������� ���������
begin
  //������� ������������
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + (h / 2), y + (h * k2 / 2));
  k4:= GetF(x + h, y + h * k3);
  //���������� ���������� x, y
  x2:= x;
  y2:= y;
  //������ ���
  x:= x + h;
  //�������� �������� y
  y:= y + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
  //��������� ��� � 2 ����
  h2:= h / 2;
  //������� ������������ ��� ���
  k1:= GetF(x, y);
  k2:= GetF(x + (h2 / 2), y + (h2 * k1 / 2));
  k3:= GetF(x + (h2 / 2), y + (h2 * k2 / 2));
  k4:= GetF(x + h2, y + h2 * k3);
  //�������� �������� y2
  y2:= y + (h2 / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
  //���������� y � y2
  if (abs(y2 - y) < eps/100) then
    h:= 2 * h
  else
  if (abs(y2 - y) > eps*100) then
    h:= h / 2;
  //��������� �� ��������� �������
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False    
end;

end.
