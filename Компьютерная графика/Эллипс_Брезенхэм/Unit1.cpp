//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
int x,y,a,b;
bool k;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void putpixel(int x, int y)
{
  Form1->Canvas->Pixels[x][y]=clBlack;
}
//---------------------------------------------------------------------------
void ellipse(int x, int y, int a, int b)
{
int col, i, row, bnew;
int a_square, b_square, two_a_square, two_b_square;
int four_a_square, four_b_square, d;

  b_square=b*b;
  a_square=a*a;
  row=b;
  col=0;
  two_a_square=a_square*2;
  four_a_square=a_square*4;
  four_b_square=b_square*4;
  two_b_square=b_square*2;
  d=two_a_square*((row-1)*(row))+a_square+two_b_square*(1-a_square);
  while (a_square*(row)>b_square*(col))
    {
      putpixel(col+x,row+y);
      putpixel(col+x,y-row);
      putpixel(x-col,row+y);
      putpixel(x-col,y-row);
      if (d>=0)
        {
          row--;
          d=d-four_a_square*(row);
        }
      d=d+two_b_square*(3+(col*2));
      col++;
    }
  d=two_b_square*(col+1)*col+two_a_square*(row*(row-2)+1)+(1-two_a_square)*b_square;
  while (row>=0)
    {
      putpixel(col+x,row+y);
      putpixel(col+x,y-row);
      putpixel(x-col,row+y);
      putpixel(x-col,y-row);
      if (d<=0)
        {
          col++;
          d=d+four_b_square*col;
        }
      row--;
      d=d+two_a_square*(3-(row*2));
    }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Image1MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  x=X;
  y=Y;
  k=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Image1MouseMove(TObject *Sender, TShiftState Shift,
      int X, int Y)
{
  if (k==true){
    Image1->Canvas->FillRect(Image1->Canvas->ClipRect);
    a=X-x;
    b=Y-y;
    ellipse(x,y,a,b);
  }
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Image1MouseUp(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
  k=false;
  a=X-x;
  b=Y-y;
  ellipse(x,y,a,b);        
}
//---------------------------------------------------------------------------

