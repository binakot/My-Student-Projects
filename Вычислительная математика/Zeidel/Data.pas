unit Data;

interface

type mass=array[1..5] of extended;    //�������
     matrix=array[1..5,1..5] of extended;  //�������

var
  a,at,alfa,olda:matrix;  //�������� �������, ������� alfa
  x,x0,b,b1,beta,oldb:mass;   //������� ������ ���������, ������� ������������, ������� ��������� ������, ������ ��� ��������, ������� beta
  n,k:integer;  //�����������, ���
  E,normAlfa,normBeta,norma,n1,n2:extended; //�������, �����

implementation

end.

