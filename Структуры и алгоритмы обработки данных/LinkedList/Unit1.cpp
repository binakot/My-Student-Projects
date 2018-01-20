#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Math.h"
#include "LinkedList.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

struct Term
{
  double coeff;
  int power;
};

TForm1 *Form1;
Term curr;
LinkedList<Term> Polinom;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------  
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  StringGrid1->Cells[0][0] = ("Степень");
  StringGrid1->Cells[1][0] = ("Коэфф");
  StringGrid1->Cells[0][1] = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::SpeedButton1Click(TObject *Sender)
{
  int i;

  if (StrToInt(Edit1->Text) + 2 >= 2)
  {
    StringGrid1->RowCount = StrToInt(Edit1->Text) + 2;
    for (i = 1; i < StrToInt(Edit1->Text) + 2; i++)
      StringGrid1->Cells[0][i] = i - 1;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  int i;

  for (i = 1; i < StrToInt(Edit1->Text) + 2; i++)
  {
    curr.coeff = StrToFloat(StringGrid1->Cells[1][i]);
    curr.power = StrToFloat(StringGrid1->Cells[0][i]);
    Polinom.InsertFront(curr);
  }
}
//--------------------------------------------------------------------------- 
void __fastcall TForm1::BitBtn4Click(TObject *Sender)
{
  int i;

  Randomize();
  for (i = 1; i < StrToInt(Edit1->Text) + 2; i++)
    StringGrid1->Cells[1][i] = random(10);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  int i;
  String str;

  str = "";

  Edit2->Text = "";

  for (i = 1; i < StrToInt(Edit1->Text) + 2; i++)
  {
    curr = Polinom.Data();
    Polinom.Next();
    if (i != StrToInt(Edit1->Text) + 1)
      str = str + FloatToStr(curr.coeff) + "*x^" + IntToStr(curr.power) + "+";
    else
      str = str + FloatToStr(curr.coeff) + "*x^" + IntToStr(curr.power);
  }
  Edit2->Text = str;
  Polinom.ClearList();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{
   int i;
   double x, Res;

   x = StrToFloat(Edit4->Text);
   Res = 0;
   for (i = 1; i < StrToInt(Edit1->Text) + 2; i++)
   {
     curr = Polinom.Data();
     Polinom.Next();
     Res = Res + curr.coeff * pow(x,curr.power);
   }
   Edit3->Text = FloatToStr(Res);
   Polinom.ClearList();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn5Click(TObject *Sender)
{
   int i;
   String str;
   double x, Res;

   str = "";
   Edit2->Text = "";
   x = StrToFloat(Edit4->Text);
   Res = 0;

   for (i = 1; i < StrToInt(Edit1->Text) + 2; i++)
   {
     curr = Polinom.Data();
     Polinom.Next();
     Res = Res + curr.coeff * pow(x,curr.power);
     if (i != StrToInt(Edit1->Text) + 1)
       str = str + FloatToStr(curr.coeff) + "*x^" + IntToStr(curr.power) + "+";
     else
       str = str + FloatToStr(curr.coeff) + "*x^" + IntToStr(curr.power);
   }
   Edit2->Text = str;
   Edit3->Text = FloatToStr(Res);
   Polinom.ClearList();
}
//---------------------------------------------------------------------------
