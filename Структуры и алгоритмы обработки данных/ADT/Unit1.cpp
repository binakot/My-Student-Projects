//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Prog.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TForm1 *Form1;
Progress MyProg;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{

}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  MyProg = Progress();
  Edit2->Text = IntToStr(MyProg.GetA1());
  Edit3->Text = IntToStr(MyProg.GetD());
  BitBtn3->Enabled = True;
  RadioButton1->Enabled = true;
  RadioButton2->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  MyProg = Progress(StrToInt(Edit1->Text),StrToInt(Edit6->Text));
  Edit2->Text = IntToStr(MyProg.GetA1());
  Edit3->Text = IntToStr(MyProg.GetD());
  BitBtn3->Enabled = True;
  RadioButton1->Enabled = true;
  RadioButton2->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{
  Memo1->Lines->Clear();
  if (RadioButton1->Checked == true) {
    MyProg.TypeProg('a');
    Memo1->Lines->Add("Арифметическая");
  }
  else {
    MyProg.TypeProg('g');
    Memo1->Lines->Add("Геометрическая");
  };
  BitBtn4->Enabled = True;
  BitBtn5->Enabled = True;
  BitBtn6->Enabled = True;
  BitBtn7->Enabled = True;
  BitBtn8->Enabled = True;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn4Click(TObject *Sender)
{
  MyProg.SetA1(StrToInt(Edit7->Text));
  Edit2->Text = IntToStr(MyProg.GetA1());
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn5Click(TObject *Sender)
{
  MyProg.SetD(StrToInt(Edit8->Text));
  Edit3->Text = IntToStr(MyProg.GetD());
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn6Click(TObject *Sender)
{
  Edit4->Text = MyProg.GetOne(StrToInt(Edit9->Text));
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn7Click(TObject *Sender)
{
  Edit5->Text = MyProg.GetSum(StrToInt(Edit10->Text));
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn8Click(TObject *Sender)
{
  int i, last, first;

  Memo1->Clear();
  if (RadioButton1->Checked == true) {
    Memo1->Lines->Add("Арифметическая");
  }
  else {
    Memo1->Lines->Add("Геометрическая");
  };

  first = StrToInt(Edit11->Text);
  last = StrToInt(Edit12->Text);

  i = first;
  while (i<=last) {
    Memo1->Lines->Add(IntToStr(MyProg.GetOne(i)));
    i++;
  }
}
//---------------------------------------------------------------------------

