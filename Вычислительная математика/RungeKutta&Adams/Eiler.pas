unit Eiler;

interface

uses data;

function EilerConstStep(var x, y: extended; level: byte): boolean;

implementation

//модифицированный метод Эйлера с постоянным шагом
function EilerConstStep(var x, y: extended; level: byte): boolean;
var i: integer;
    x2, y2: extended;
begin
  x2:= x;
  y2:= y;
  x:= x2 + h;
  y:= y2 + h * GetF(x2, y2);
  for i:= 1 to level do
    y:= y2 + h * (GetF(x2, y2) + GetF(x, y)) / 2;
  //Проверяем на окончание отрезка
  if (Xn - x < h) then
    h:= Xn - x;
  if (x - Xn < 0) and (Xn - x > eps / 100) then
    Result:= True
  else
    Result:= False
end;

end.
