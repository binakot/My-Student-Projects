//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "queue.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
Queue MyQueue = Queue();
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  if (!MyQueue.isFull())
    {
      MyQueue.push(StrToInt(Edit1->Text));
      Memo1->Lines->Add("Добавляем в конец " + Edit1->Text);
    }
  else
    {
      Memo1->Lines->Add("Очередь полная!");
    };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{
  if (!MyQueue.isEmpty())
    {
      Memo1->Lines->Add("Первый элемент = " + IntToStr(MyQueue.getFirst()));
    }
  else
    {
      Memo1->Lines->Add("Очередь пуста!");
    };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  if (!MyQueue.isEmpty())
    {
      Memo1->Lines->Add("Удаляем из начала " + IntToStr(MyQueue.getFirst()));
      MyQueue.pop();
    }
  else
    {
      Memo1->Lines->Add("Очередь пуста!");
    };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  MyQueue.push(0);        
}
//---------------------------------------------------------------------------
