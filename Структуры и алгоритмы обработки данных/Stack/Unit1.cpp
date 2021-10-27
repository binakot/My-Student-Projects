//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "dstring.h"

#include "Unit1.h"
#include "Stack.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
Stack MyStack = Stack();
AnsiString w;
int length, l1, l2;
bool InLanguage;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
bool Prov()
{
  int number,i;

  number = 0;
  i = 1;
  while (i<=w.Length()) {
    if (w[i] == '&') {
      number++;
    };
    i++;
  };
  if (number == 1) return true;
  else return false; 
};
//---------------------------------------------------------------------------
void CreateStack()
{
  int i;

  i = 1;
  while (w[i] != '&') {
    MyStack.Push(w[i]);
    i++;
  }

  l1 = i - 1;
  i++;

  InLanguage = true;
  while (InLanguage == true && i<=w.Length()) {
    if (MyStack.Pop() == w[i]) {
      i++;
    }
    else {
      InLanguage = false;
    };
  };

  if (!MyStack.StackEmpty()) InLanguage = false;  

  MyStack.ClearStack();
};
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
   w = Edit1->Text;
   length = w.Length();
   if (Prov() == true) {
     CreateStack();
     l2 = length - l1 - 1;
     Edit2->Text = l1;
     Edit3->Text = l2;

     if (InLanguage == true && MyStack.StackEmpty()) {
        RadioButton1->Checked = true;
        RadioButton2->Checked = false;
     }
     else {
       RadioButton2->Checked = true;
       RadioButton1->Checked = false;
     };
   }
   else {
     Application->MessageBox("Нет символа '&', или их больше, чем 1", MB_OK);
   }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  l1 = 0;
  l2 = 0;
  length = 0;
}
//---------------------------------------------------------------------------

