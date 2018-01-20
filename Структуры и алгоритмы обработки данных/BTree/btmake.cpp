//---------------------------------------------------------------------------
#pragma hdrstop
#include "btmake.h"  
//---------------------------------------------------------------------------
#pragma package(smart_init)
#include "btree.h"
//---------------------------------------------------------------------------
const int LineMax = KeyFieldMax + DFMaxPlus1;

typedef char StringType[LineMax];

//Извлечение строки из файла
int MyGetLine(istream & InStream, char * String, int StringMax)
{
  char Ch;
  int Count, Last;

  Count = 0;
  Last = StringMax - 1;
  Ch = InStream.get();

  while ((Ch != '\n') && (! InStream.fail()))
  {
    if (Count < Last)
      String[Count++] = Ch;
    Ch = InStream.get();
  }

  String[Count] = NULL;
  return Count;
}
//Считыванеи строки
void ReadLine(fstream & InputFile, KeyFieldType Word, DataFieldType Definition)
{
  char Line[LineMax];
  int k, ch;

  MyGetLine(InputFile, Line, LineMax);

  for (k = 0; k < KeyFieldMax; k++)
    Word[k] = Line[k];
  Word[KeyFieldMax] = NULL;

  for (k = 0; k < DataFieldMax; k++)
  {
    ch = Line[KeyFieldMax + k];
    if (ch == '\n')
      break;
    Definition[k] = ch;
  }
  Definition[k] = NULL;
}
//Заполнить таблицу из файла
void Load(fstream & InputFile, BTTableClass & Table)
{
  ItemType Item;

  ReadLine(InputFile, Item.KeyField, Item.DataField);

  while (! InputFile.fail())
  {
    Table.Insert(Item); 
    ReadLine(InputFile, Item.KeyField, Item.DataField);
  }
}
 
