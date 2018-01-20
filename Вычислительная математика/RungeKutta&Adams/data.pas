unit data;

interface

uses Grids, math;

function GetF(x, y: extended):extended;
procedure ClearGrid(SG: TStringGrid); 

var eps: extended;     //��������
    x0, y0: extended;  //��������� ����������
    Xn: extended;     //�������� ����������
    h: extended;      //���
    mas: array[1..4,1..2] of extended;    //������ ��� ������ ������
    y1,pr,kr,f0: extended;                   //����������� �� y, �������, ���������
    res: extended;

implementation
//���������� �������� �������
function GetF(x, y: extended):extended;
var value: extended;
begin
  value:= y/x + x + 1;
  result:= value;
end;
//������� StringGrid
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
