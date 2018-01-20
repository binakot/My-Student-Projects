//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Node.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

typedef int Item;
struct node
{
  Item item;
  node* next;
  node(Item x)
  {
    item = x;
    next = 0;
  }
};
typedef node *link;
typedef link Node;

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
link findmax(link head)
{
  int max;
  link tmp;

  max = head->next->item;
  for (tmp = head->next; tmp->next != 0; tmp = tmp->next)
  {
    if (max < tmp->item)
      max = tmp->item;
  }
  return tmp;
}
//---------------------------------------------------------------------------
link listselection(link h)
{
  node dummy(0);
  link head = &dummy;
  link out = 0;

  head->next = h;
  while (head->next != 0)
  {
    link max = findmax(head);
    link t = max->next;
    max->next = t->next;
    t->next = out;
    out = t;
  }
  return out;
}
//---------------------------------------------------------------------------
link Sort(link h)
{
  link tmp1, tmp2;

  for( tmp1 = h->next; tmp1; tmp1 = tmp1->next )
    for( tmp2 = h->next; tmp2; tmp2 = tmp2->next )
      if( tmp1->item < tmp2->item )
      {
        int i = tmp1->item;
        tmp1->item = tmp2->item;
        tmp2->item = i;
      }
  return h;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  int N, curr;
  node heada(0);
  link a = &heada;
  node headb(0);
  link b = &headb;
  link tmp1, tmp2;

  Memo1->Lines->Clear();
  Memo2->Lines->Clear();

  N = StrToInt(Edit1->Text);

  tmp1 = a;
  for (int i = 0; i < N; i++)
  {
    curr = rand() % 1000;
    tmp1 = (tmp1->next = new node(curr)); 
  }
  for (tmp1 = a->next; tmp1 != 0; tmp1 = tmp1->next)
    Memo1->Lines->Add(IntToStr(tmp1->item));

  b = Sort(a);

  for (tmp2 = b->next; tmp2 != 0; tmp2 = tmp2->next)
    Memo2->Lines->Add(IntToStr(tmp2->item));
}
//---------------------------------------------------------------------------

