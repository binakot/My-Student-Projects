//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
float Pi = 3.14159265;
float a = 0,
      b = 2*Pi;
      
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormCreate(TObject *Sender)
{
  float x = 0;

  for (int i = 0; i <= 200; i++)
  {
    Chart1->Series[0]->AddXY(x, sin(x));
    x += Pi / 100.0;
  }
}
//---------------------------------------------------------------------------
