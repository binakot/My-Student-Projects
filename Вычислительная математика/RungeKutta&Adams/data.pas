unit data;

interface

uses Grids, math;

function GetF(x, y: extended):extended;
procedure ClearGrid(SG: TStringGrid); 

var eps: extended;     //точность
    x0, y0: extended;  //начальные координаты
    Xn: extended;     //конечная координата
    h: extended;      //шаг
    mas: array[1..4,1..2] of extended;    //массив для метода Адамса
    y1,pr,kr,f0: extended;                   //производная от y, прогноз, коррекция
    res: extended;

implementation
//нахождение значений функций
function GetF(x, y: extended):extended;
var value: extended;
begin
  value:= y/x + x + 1;
  result:= value;
end;
//очистка StringGrid
procedure ClearGrid(SG: TStringGrid);
var i: integer;
begin
  for i:=1 to SG.RowCount do
    begin
      SG.Cells[0,i]:= '';
      SG.Cells[1,i]:= '';
      SG.Cells[2,i]:= '';
      SG.Cells[3,i]:= '';
      SG.Cells[4,i]:= '';
      SG.Cells[5,i]:= '';
      SG.Cells[6,i]:= ''
    end
end;

end.
