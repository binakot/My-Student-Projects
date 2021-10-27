//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.cpp"
#include "math.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
Vector Vec1, Vec2, Vec3;
int n = 5;  
//---------------------------------------------------------------------------

__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  int i;

  StringGrid1->Cells[0][0] = "i";
  i = 0;
  while (i<5) {
    StringGrid1->Cells[0][i+1] = IntToStr(i+1);
    i++;
  };
  StringGrid1->Cells[1][0] = "1 вектор";
  StringGrid1->Cells[2][0] = "2 вектор";
  StringGrid1->Cells[3][0] = "3 вектор";

  StringGrid2->Cells[0][0] = "i";
  i = 0;
  while (i<5) {
    StringGrid2->Cells[0][i+1] = IntToStr(i+1);
    i++;
  };
  StringGrid2->Cells[1][0] = "1 вектор";
  StringGrid2->Cells[2][0] = "2 вектор";
  StringGrid2->Cells[3][0] = "3 вектор";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  for (int i=0; i<5; i++) {
    for (int j=0; j<3; j++) {
      StringGrid1->Cells[j+1][i+1] = FloatToStr((float)random(100)/10);
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  int i;
  float TempMas[5];

  i = 0;
  while (i<n) {
    if (StringGrid1->Cells[1][i+1] == "")
      TempMas[i] = 0;
    else
      TempMas[i] = StrToFloat(StringGrid1->Cells[1][i+1]);
    i++;
  };
  Vec1 = Vector(TempMas);
  i = 0;
  while (i<n) {
    if (StringGrid1->Cells[2][i+1] == "")
      TempMas[i] = 0;
    else
      TempMas[i] = StrToFloat(StringGrid1->Cells[2][i+1]);
    i++;
  };
  Vec2 = Vector(TempMas);
  i = 0;
  while (i<n) {
    if (StringGrid1->Cells[3][i+1] == "")
      TempMas[i] = 0;
    else
      TempMas[i] = StrToFloat(StringGrid1->Cells[3][i+1]);
    i++;
  };
  Vec3 = Vector(TempMas);

  i = 0;
  while (i<n) {
    StringGrid2->Cells[1][i+1] = FloatToStr(RoundTo(Vec1.GetNum(i),-3));
    i++;
  };
  i = 0;
  while (i<n) {
    StringGrid2->Cells[2][i+1] = FloatToStr(RoundTo(Vec2.GetNum(i),-3));
    i++;
  };
  i = 0;
  while (i<n) {
    StringGrid2->Cells[3][i+1] = FloatToStr(RoundTo(Vec3.GetNum(i),-3));
    i++;
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{
  int i;

  i = 0;
  while (i<n) {
    StringGrid2->Cells[1][i+1] = FloatToStr(RoundTo(Vec1.GetNum(i),-3));
    i++;
  };
  i = 0;
  while (i<n) {
    StringGrid2->Cells[2][i+1] = FloatToStr(RoundTo(Vec2.GetNum(i),-3));
    i++;
  };
  i = 0;
  while (i<n) {
    StringGrid2->Cells[3][i+1] = FloatToStr(RoundTo(Vec3.GetNum(i),-3));
    i++;
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton1Click(TObject *Sender)
{
  if (Edit1->Text == "1")
    Vec1 = Vec1 + StrToFloat(Edit2->Text);
  else
    if (Edit1->Text == "2")
      Vec2 = Vec2 + StrToFloat(Edit2->Text);
    else
      if (Edit1->Text == "3")
        Vec3 = Vec3 + StrToFloat(Edit2->Text);
  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton2Click(TObject *Sender)
{
  if (Edit4->Text == "1")
    Vec1 = Vec1 - StrToFloat(Edit3->Text);
  else
    if (Edit4->Text == "2")
      Vec2 = Vec2 - StrToFloat(Edit3->Text);
    else
      if (Edit4->Text == "3")
        Vec3 = Vec3 - StrToFloat(Edit3->Text);
  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton3Click(TObject *Sender)
{
  if (Edit6->Text == "1")
    Vec1 = Vec1 * StrToFloat(Edit5->Text);
  else
    if (Edit6->Text == "2")
      Vec2 = Vec2 * StrToFloat(Edit5->Text);
    else
      if (Edit6->Text == "3")
        Vec3 = Vec3 * StrToFloat(Edit5->Text);
  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton4Click(TObject *Sender)
{
  if (Edit8->Text == "1")
    Vec1 = Vec1 / StrToFloat(Edit7->Text);
  else
    if (Edit8->Text == "2")
      Vec2 = Vec2 / StrToFloat(Edit7->Text);
    else
      if (Edit8->Text == "3")
        Vec3 = Vec3 / StrToFloat(Edit7->Text);
  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton5Click(TObject *Sender)
{
  if ((Edit9->Text == "1")&(Edit10->Text == "1"))
    Vec1 = Vec1 + Vec1;
  if ((Edit9->Text == "1")&(Edit10->Text == "2"))
    Vec1 = Vec1 + Vec2;
  if ((Edit9->Text == "1")&(Edit10->Text == "3"))
    Vec1 = Vec1 + Vec3;

  if ((Edit9->Text == "2")&(Edit10->Text == "1"))
    Vec2 = Vec2+ Vec1;
  if ((Edit9->Text == "2")&(Edit10->Text == "2"))
    Vec2 = Vec2+ Vec2;
  if ((Edit9->Text == "2")&(Edit10->Text == "3"))
    Vec2 = Vec2+ Vec3;

  if ((Edit9->Text == "3")&(Edit10->Text == "1"))
    Vec3 = Vec3 + Vec1;
  if ((Edit9->Text == "3")&(Edit10->Text == "2"))
    Vec3 = Vec3 + Vec2;
  if ((Edit9->Text == "3")&(Edit10->Text == "3"))
    Vec3 = Vec3 + Vec3;

  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton6Click(TObject *Sender)
{
  if ((Edit12->Text == "1")&(Edit11->Text == "1"))
    Vec1 = Vec1 - Vec1;
  if ((Edit12->Text == "1")&(Edit11->Text == "2"))
    Vec1 = Vec1 - Vec2;
  if ((Edit12->Text == "1")&(Edit11->Text == "3"))
    Vec1 = Vec1 - Vec3;

  if ((Edit12->Text == "2")&(Edit11->Text == "1"))
    Vec2 = Vec2 - Vec1;
  if ((Edit12->Text == "2")&(Edit11->Text == "2"))
    Vec2 = Vec2 - Vec2;
  if ((Edit12->Text == "2")&(Edit11->Text == "3"))
    Vec2 = Vec2 - Vec3;

  if ((Edit12->Text == "3")&(Edit11->Text == "1"))
    Vec3 = Vec3 - Vec1;
  if ((Edit12->Text == "3")&(Edit11->Text == "2"))
    Vec3 = Vec3 - Vec2;
  if ((Edit12->Text == "3")&(Edit11->Text == "3"))
    Vec3 = Vec3 - Vec3;

  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton7Click(TObject *Sender)
{
  if ((Edit14->Text == "1")&(Edit13->Text == "1"))
    Vec1 = Vec1 * Vec1;
  if ((Edit14->Text == "1")&(Edit13->Text == "2"))
    Vec1 = Vec1 * Vec2;
  if ((Edit14->Text == "1")&(Edit13->Text == "3"))
    Vec1 = Vec1 * Vec3;

  if ((Edit14->Text == "2")&(Edit13->Text == "1"))
    Vec2 = Vec2 * Vec1;
  if ((Edit14->Text == "2")&(Edit13->Text == "2"))
    Vec2 = Vec2 * Vec2;
  if ((Edit14->Text == "2")&(Edit13->Text == "3"))
    Vec2 = Vec2 * Vec3;

  if ((Edit14->Text == "3")&(Edit13->Text == "1"))
    Vec3 = Vec3 * Vec1;
  if ((Edit14->Text == "3")&(Edit13->Text == "2"))
    Vec3 = Vec3 * Vec2;
  if ((Edit14->Text == "3")&(Edit13->Text == "3"))
    Vec3 = Vec3 * Vec3;

  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton8Click(TObject *Sender)
{
  if ((Edit16->Text == "1")&(Edit15->Text == "1"))
    Vec1 = Vec1 / Vec1;
  if ((Edit16->Text == "1")&(Edit15->Text == "2"))
    Vec1 = Vec1 / Vec2;
  if ((Edit16->Text == "1")&(Edit15->Text == "3"))
    Vec1 = Vec1 / Vec3;

  if ((Edit16->Text == "2")&(Edit15->Text == "1"))
    Vec2 = Vec2 / Vec1;
  if ((Edit16->Text == "2")&(Edit15->Text == "2"))
    Vec2 = Vec2 / Vec2;
  if ((Edit16->Text == "2")&(Edit15->Text == "3"))
    Vec2 = Vec2 / Vec3;

  if ((Edit16->Text == "3")&(Edit15->Text == "1"))
    Vec3 = Vec3 / Vec1;
  if ((Edit16->Text == "3")&(Edit15->Text == "2"))
    Vec3 = Vec3 / Vec2;
  if ((Edit16->Text == "3")&(Edit15->Text == "3"))
    Vec3 = Vec3 / Vec3;

  Form1->BitBtn3->Click();
}
//---------------------------------------------------------------------------

