unit RungeKutta;

interface

uses data;

function RungeKutta3ConstStep(var k1, k2, k3, x, y: extended): boolean;
function RungeKutta3AutoStep(var k1, k2, k3, x, y: extended): boolean;
function RungeKutta4ConstStep(var k1, k2, k3, k4, x, y: extended): boolean;
function RungeKutta4AutoStep(var k1, k2, k3, k4, x, y: extended): boolean;

implementation

//Метод Рунге-Кутта 3 порядка с постоянным шагом
function RungeKutta3ConstStep(var k1, k2, k3, x, y: extended): boolean;
begin
  //Считаем коэффициенты
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + h, y - h * k1 + 2 * h * k2);
  //Делаем шаг
  x:= x + h;
  //получаем значение y
  y:= y + (h / 6) * (k1 + 4 * k2 + k3);
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False
end;

//Метод Рунге-Кутта 3 порядка с автоматическим выбором шага
function RungeKutta3AutoStep(var k1, k2, k3, x, y : extended): boolean;
var h2, x2, y2: extended;  //переменные для двойного пересчета
begin
  //Считаем коэффициенты
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + h, y - h * k1 + 2 * h * k2);
  //запоминаем предыдущие x, y
  x2:= x;
  y2:= y;
  //делаем шаг
  x:= x + h;
  //получаем значение y
  y:= y + (h / 6) * (k1 + 4 * k2 + k3);
  //Уменьшаем шаг в 2 раза
  h2:= h / 2;
  //Считаем коэффициенты еще раз
  k1:= GetF(x2, y2);
  k2:= GetF(x2 + (h2 / 2), y2 + (h2 * k1 / 2));
  k3:= GetF(x2 + h2, y2 - h2 * k1 + 2 * h2 * k2);
  //получаем значение y2
  y2:= y2 + (h2 / 6) * (k1 + 4 * k2 + k3);
  //сравниваем y и y2
  if (abs(y2 - y) < eps/100) then
    h:= 2 * h
  else
  if (abs(y2 - y) > eps*100) then
    h:= h / 2;
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False
end;

//Метод Рунге-Кутта 4 порядка с постоянным шагом
function RungeKutta4ConstStep(var k1, k2, k3, k4, x, y: extended): boolean;
begin
  //Считаем коэффициенты
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + (h / 2), y + (h * k2 / 2));
  k4:= GetF(x + h, y + h * k3);
  //Делаем шаг
  x:= x + h;
  //получаем значение y
  y:= y + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False
end;

//Метод Рунге-Кутта 4 порядка с автоматическим выбором шага
function RungeKutta4AutoStep(var k1, k2, k3, k4, x, y : extended): boolean;
var h2, x2, y2: extended;   //переменные для двойного пересчета
begin
  //Считаем коэффициенты
  k1:= GetF(x, y);
  k2:= GetF(x + (h / 2), y + (h * k1 / 2));
  k3:= GetF(x + (h / 2), y + (h * k2 / 2));
  k4:= GetF(x + h, y + h * k3);
  //запоминаем предыдущие x, y
  x2:= x;
  y2:= y;
  //делаем шаг
  x:= x + h;
  //получаем значение y
  y:= y + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
  //Уменьшаем шаг в 2 раза
  h2:= h / 2;
  //Считаем коэффициенты еще раз
  k1:= GetF(x, y);
  k2:= GetF(x + (h2 / 2), y + (h2 * k1 / 2));
  k3:= GetF(x + (h2 / 2), y + (h2 * k2 / 2));
  k4:= GetF(x + h2, y + h2 * k3);
  //получаем значение y2
  y2:= y + (h2 / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
  //сравниваем y и y2
  if (abs(y2 - y) < eps/100) then
    h:= 2 * h
  else
  if (abs(y2 - y) > eps*100) then
    h:= h / 2;
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x < Xn) then
    Result:= True
  else
    Result:= False    
end;

end.
