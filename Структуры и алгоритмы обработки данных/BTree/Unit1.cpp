//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "btmake.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void WriteTable()
{
  fstream Source;
  BTTableClass BTTable('w', "btree.dat");

  Source.open("btree.txt", ios::in);
  if (Source.fail())
  {
    ShowMessage("Ошибка: Невозможно открыть btree.txt");  
  }

  Load(Source, BTTable);
  Source.close(); 
}
//---------------------------------------------------------------------------
void ReadTable()
{
  ItemType Item;
  KeyFieldType SearchKey;
  BTTableClass BTTable('r', "btree.dat");

  if (BTTable.Empty())
    Error("Таблица пуста");

  char ch;

  String Str = Form1->Edit1->Text;

  for (int i = 0; i <= KeyFieldMax; i++)
    SearchKey[i] = NULL;
  for (int i = 0; i < Str.Length(); i++)
    SearchKey[i] = Str[i+1];

  for (int i = 0; i <= KeyFieldMax; i++)
  {
    ch = SearchKey[i];
    if (ch == NULL)
      SearchKey[i] = ' ';
    else
      SearchKey[i] = toupper(ch);
  }

  SearchKey[KeyFieldMax] = NULL;

  if (BTTable.Retrieve(SearchKey, Item))
    ShowMessage("Слово найдено в таблице");
  else
    ShowMessage("Слово отсутствует в таблице");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  WriteTable();
  ShowMessage("Таблица на основе Б-дерева заполнена");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  ReadTable();
}
//---------------------------------------------------------------------------
