//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Tree.cpp" 
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

const ColNode = 500;
const Range = 10000;

TForm1 *Form1;
BinSTree<int> MyTree;
TreeNode<int> *MaxElm, *MinElm;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  int tmp;

  Memo1->Lines->Clear(); 

  for (int i = 0; i < ColNode; i++)
  {
    tmp = (rand() % Range) + 1;
    MyTree.Insert(tmp);
    Memo1->Lines->Add(IntToStr(tmp));
  }

  MaxElm = MyTree.Max(MyTree.GetRoot());
  MinElm = MyTree.Min(MyTree.GetRoot());
  Edit1->Text = IntToStr(MaxElm->GetData());
  Edit2->Text = IntToStr(MinElm->GetData()); 

  MyTree.ClearTree(MyTree.GetRoot());
}
//---------------------------------------------------------------------------
