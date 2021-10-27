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
void dda_line( int X0, int Y0, int X1, int Y1 )   // алгоритм простого ЦДА
{
  int i, n;
  float x, y, dx=0, dy=0;     // Генерация точек отрезка по алгоритму простого ЦДА
  n = abs(X1-X0);
  if (n< abs(Y1-Y0) ) n = abs(Y1-Y0);
  if (n>0) {dx=(0.+X1-X0)/n; dy=(0.+Y1-Y0)/n;}
  x=X0;
  y=Y0;
  if (dx>0) x+=0.5; else
    if (dx<0) x-=0.5;
  if (dy>0) y+=0.5; else
    if (dy<0) y-=0.5;
  for(i=0;i<=n;i++)           // алгоритм простого ЦДА
  {
    x+=dx;
    y+=dy;
    Form1->Canvas->Pixels[x][y]=clBlack;
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
        dda_line(x1,y1,x2,y2);
        k=0;
      }
}
//---------------------------------------------------------------------------

 