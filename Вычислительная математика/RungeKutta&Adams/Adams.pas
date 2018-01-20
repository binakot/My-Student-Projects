unit Adams;

interface

uses data, RungeKutta;

procedure Adams3Help(var x, y: extended);
procedure Adams4Help(var x, y: extended);
function Adams3ConstStep(var x, y: extended): boolean;
function Adams3AutoStep(var x, y: extended): boolean;
function Adams4ConstStep(var x, y: extended): boolean;
function Adams4AutoStep(var x, y: extended): boolean;

implementation

//Вспомогательные вычисления с помощью метода Рунге-Кутта
procedure Adams3Help(var x, y: extended);
var k1,k2,k3: extended;
    curXn: extended;
begin
  //Запомним Xn
  curXn:=Xn;
  //Временно зададим свое Xn
  Xn:= x + 3 * h;
  //Методом Рунге-Кутта найдем начальный вектор
  mas[1,1]:= x;
  mas[1,2]:= y;
  RungeKutta3ConstStep(k1, k2, k3, x, y);
  mas[2,1]:= x;
  mas[2,2]:= y;
  RungeKutta3ConstStep(k1, k2, k3, x, y);
  mas[3,1]:= x;
  mas[3,2]:= y;
  //возвращаем изначальный Xn
  Xn:=CurXn;
end;

//Вспомогательные вычисления с помощью метода Рунге-Кутта
procedure Adams4Help(var x, y: extended);
var k1,k2,k3,k4: extended;
    curXn: extended;
begin
  //Запомним Xn
  CurXn:=Xn;
  //Временно зададим свое Xn
  Xn:= x + 4 * h;
  //Методом Рунге-Кутта найдем начальный вектор
  mas[1,1]:= x;
  mas[1,2]:= y;
  RungeKutta4ConstStep(k1, k2, k3, k4, x, y);
  mas[2,1]:= x;
  mas[2,2]:= y;
  RungeKutta4ConstStep(k1, k2, k3, k4, x, y);
  mas[3,1]:= x;
  mas[3,2]:= y;
  RungeKutta4ConstStep(k1, k2, k3, k4, x, y);
  mas[4,1]:= x;
  mas[4,2]:= y;
  //возвращаем изначальный Xn
  Xn:=curXn;
end;
//----------------------------------------------------------
//Метод Адамса 3 порядка с постоянным шагом
function Adams3ConstStep(var x, y: extended): boolean;
begin
  //делаем шаг
  x:= x + h;
  //находим y
  y:= mas[3,2] + (h/12)*(23*GetF(mas[3,1], mas[3,2])-16*GetF(mas[2,1],mas[2,2])+5*GetF(mas[1,1],mas[1,2]));
  //запоминаем вектор
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= x;
  mas[3,2]:= y;
  //находим производную
  y1:= GetF(x, y);
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False
end;

//Метод Адамса 3 порядка с автоматическим выбором шага
function Adams3AutoStep(var x, y: extended): boolean;
var y2: extended;
begin
  //делаем шаг
  x:= x + h;
  //находим y
  y:= mas[3,2] + (h/12)*(23*GetF(mas[3,1], mas[3,2])-16*GetF(mas[2,1],mas[2,2])+5*GetF(mas[1,1],mas[1,2]));
  //находим y2
  y2:= mas[3,2] + ((h/2)/12)*(23*GetF(mas[3,1], mas[3,2])-16*GetF(mas[2,1],mas[2,2])+5*GetF(mas[1,1],mas[1,2]));
  //сравниваем y и y2
  if (abs(y2 - y) < eps/100) then
    h:= 2 * h
  else
  if (abs(y2 - y) > eps*100) then
    h:= h / 2;
  //запоминаем вектор
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= x;
  mas[3,2]:= y;
  //находим производную
  y1:= GetF(x, y);
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False; 
end;

//Метод Адамса 4 порядка с постоянным шагом
function Adams4ConstStep(var x, y: extended): boolean;
begin
  //делаем шаг
  x:= x + h;
  //находим y
  y:= mas[4,2] + (h/24)*(55*GetF(mas[4,1],mas[4,2])-59*GetF(mas[3,1],mas[3,2])+37*GetF(mas[2,1],mas[2,2])-9*GetF(mas[1,1],mas[1,2]));
  //запоминаем вектор
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= mas[4,1];
  mas[3,2]:= mas[4,2];
  mas[4,1]:= x;
  mas[4,2]:= y;
  //находим производную
  y1:= GetF(x, y);
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False
end;

//Метод Адамса 4 порядка с автоматическим выбором шага
function Adams4AutoStep(var x, y: extended): boolean;
var y2: extended;
begin
  //делаем шаг
  x:= x + h;
  //находим y
  y:= mas[4,2] + (h/24)*(55*GetF(mas[4,1],mas[4,2])-59*GetF(mas[3,1],mas[3,2])+37*GetF(mas[2,1],mas[2,2])-9*GetF(mas[1,1],mas[1,2]));
  //находим y2
  y2:= mas[4,2] + ((h/2)/24)*(55*GetF(mas[4,1],mas[4,2])-59*GetF(mas[3,1],mas[3,2])+37*GetF(mas[2,1],mas[2,2])-9*GetF(mas[1,1],mas[1,2]));
  //сравниваем y и y2
  if (abs(y2 - y) < eps/100) then
    h:= 2 * h
  else
  if (abs(y2 - y) > eps*100) then
    h:= h / 2;
  //запоминаем вектор
  mas[1,1]:= mas[2,1];
  mas[1,2]:= mas[2,2];
  mas[2,1]:= mas[3,1];
  mas[2,2]:= mas[3,2];
  mas[3,1]:= mas[4,1];
  mas[3,2]:= mas[4,2];
  mas[4,1]:= x;
  mas[4,2]:= y;
  //находим производную
  y1:= GetF(x, y);
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False;
end; 

end.
