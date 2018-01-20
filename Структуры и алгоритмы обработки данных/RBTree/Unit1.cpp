//--------------------------------------------------------------------------- 
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "InorderIterator.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
const Range = 100;
TForm1 *Form1;
RBTree<int> Tree;
int ColNode;           
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
  Randomize();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  int ColNode = StrToInt(Edit1->Text), tmp;

  Memo1->Clear();
  Memo2->Clear();
  
  for (int i = 0; i < ColNode; i++)
  {
    tmp = (rand() % Range) + 1;
    Tree.insertNode(tmp);
    Memo1->Lines->Add(IntToStr(tmp));
  }  

  // сканирование узлов и печать их значений
  for (InorderIterator<int> Iter(Tree.GetRoot()); !Iter.EndOfList(); Iter.Next())
    Memo2->Lines->Add(IntToStr(Iter.Data()) + ' ' + Iter.GetColor());

  Tree.ClearTree(Tree.GetRoot());
}
//---------------------------------------------------------------------------
