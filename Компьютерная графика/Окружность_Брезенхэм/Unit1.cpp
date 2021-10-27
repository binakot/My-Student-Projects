//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
int x1,y1,x2,y2,r;
bool k;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void circle8(int xc,int yc,int x,int y)
{
  Form1->Canvas->Pixels[xc + x][yc + y] = clBlack;
  Form1->Canvas->Pixels[xc + y][yc + x] = clBlack;
  Form1->Canvas->Pixels[xc + y][yc - x] = clBlack;
  Form1->Canvas->Pixels[xc + x][yc - y] = clBlack;
  Form1->Canvas->Pixels[xc - x][yc - y] = clBlack;
  Form1->Canvas->Pixels[xc - y][yc - x] = clBlack;
  Form1->Canvas->Pixels[xc - y][yc + x] = clBlack;
  Form1->Canvas->Pixels[xc - x][yc + y] = clBlack;
}
//---------------------------------------------------------------------------
void circle_Brez(int xc,int yc,int r)
{
int x,y,z,Dd;
x=0;
y=r;
Dd=2*(1-r);
while(x<y)
{
  circle8(xc,yc,x,y);
  if(!Dd) goto Pd;
  z=2*Dd-1;
  if(Dd>0) {
    if (z+2*x<=0) goto Pd; else goto Pv;
  }
  if (z+2*y>0) goto Pd;
Pg: ++x; Dd=Dd+2*x+1; continue;             //Горизонталь
Pd: ++x; --y; Dd=Dd+2*(x-y+1); continue;    //Диагональ
Pv: --y; Dd=Dd-2*y+1;                       //Вертикаль
}
if (x==y) circle8(xc,yc,x,y);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Image1MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  x1=X;
  y1=Y;
  k=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Image1MouseMove(TObject *Sender, TShiftState Shift,
      int X, int Y)
{
  if (k==true){
    Image1->Canvas->FillRect(Image1->Canvas->ClipRect);
    x2=X;
    y2=Y;
    r=sqrt(pow(y2-y1,2)+pow(x2-x1,2));
    circle_Brez(x1,y1,r);
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Image1MouseUp(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
  k=false;
  x1=X;
  y1=Y;
  circle_Brez(x1,y1,r);
}
//---------------------------------------------------------------------------

