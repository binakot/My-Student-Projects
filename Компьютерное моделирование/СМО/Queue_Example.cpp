//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Queue_Example.h"  
#include "queue.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

queue_list<int> *queue_int;
int k = 0;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  queue_int = new queue_list<int>;

  Elements_Table->Cells[0][0] = "Касса";
  Elements_Table->Cells[1][0] = "Клиент";
  Elements_Table->Cells[2][0] = "Время";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Insert_ButtonClick(TObject *Sender)
{
  int time = StrToInt(Edit1->Text),
      type = 0;

  if (RadioButton1->Checked)
    type = 0;  //Обычный клиент
  else
    type = 1;  //Пенсионер

  queue_int->Insert(time, type);

  k++;
  Elements_Table->RowCount += 1;
  Elements_Table->Cells[0][k] = IntToStr(k);
  if (type == 0)
    Elements_Table->Cells[1][k] = "Обычный";
  else
    Elements_Table->Cells[1][k] = "Пенсионер";
  Elements_Table->Cells[2][k] = IntToStr(time);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Pop_ButtonClick(TObject *Sender)
{
  int check = 0;

  try
  {
    queue_int->Pop();
    for (int i = 1; i < Elements_Table->RowCount; i++)
    {
      if (Elements_Table->Cells[1][i] == "Пенсионер")
      {
        Elements_Table->Rows[i]->Clear();
        for (int j = i; j < Elements_Table->RowCount - 1; j++)
          Elements_Table->Rows[j] = Elements_Table->Rows[j+1];
        k = queue_int->GetSize();
        check = 1;
        break; 
      }
    }
    if (check == 0)
    {
      Elements_Table->Rows[1]->Clear();
      for (int j = 1; j < Elements_Table->RowCount - 1; j++)
        Elements_Table->Rows[j] = Elements_Table->Rows[j+1];
    }
    k = queue_int->GetSize();
  }
  catch (char* msg)
  {
    Application->MessageBoxA(msg, "Ошибка:", MB_OK);
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Clear_ButtonClick(TObject *Sender)
{
  queue_int->Clear();
  for (int i = 1; i < Elements_Table->RowCount; i++)
    Elements_Table->Rows[i]->Clear();
  k = 0;
  Elements_Table->RowCount = 2;
  Size_Edit->Text = "0";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Size_ButtonClick(TObject *Sender)
{
  Size_Edit->Text = IntToStr(queue_int->GetSize());
}
//---------------------------------------------------------------------------

