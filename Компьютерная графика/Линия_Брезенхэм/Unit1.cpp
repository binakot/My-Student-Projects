//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
int x1,y1,x2,y2,k=0;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void brez_line( int X0, int Y0, int X1, int Y1 )   // �������� �������� ���
{
  float dx,dy,sx,sy,d,d1,d2;
  dx = abs(x2-x1);
  dy = abs(y2-y1);
  sx = x2 >= x1 ? 1:-1;
  sy = y2 >= y1 ? 1:-1;
  if(dy <= dx)                     //�������� ���� ������� �����
  {
    d=dy/2-dx;                       //������� �� ��� ��� ����������� �������� ������������
    d1=dy/2;
    d2=(dy-dx)/2;
    Form1->Canvas->Pixels[x1][y1] = clBlack;                   //����� ������ ����� �� ������
    for(int x=x1+sx, y=y1, i=1; i<=dx; i++, x+=sx) // ���� ������ ����� �� �����
    {
      if(d>0)            //���� d < 0 �������� y �� �������� �� ��������� � ���������� ������, ����� y ������������� * /
      {
        d+=d2;
        y+=sy;
      }
      else d+=d1;
      Form1->Canvas->Pixels[x][y]=clBlack;                    //����� �� ����� ��������� ����� �����
    }
  }
  else
  {
    d=dx/2-dy;
    d1=dx/2;
    d2=(dx-dy)/2;
    Form1->Canvas->Pixels[x1][y1] = clBlack;
    for(int x=x1,y=y1+sy,i=1;i<=dy;i++,y+=sy)
    {
      if(d>0)
      {
        d+=d2;
        x+=sx;
      }
      else d+=d1;
    Form1->Canvas->Pixels[x][y] = clBlack;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Image1MouseUp(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
  if (k==0) {x1=X; y1=Y;} else {x2=X; y2=Y;}
  if (k==0) k++; else
    if (k==1)
      {
        brez_line(x1,y1,x2,y2);
        k=0;
      }
}
//---------------------------------------------------------------------------

