//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <stdlib.h>

#include "Unit1.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

const DefSizeMas = 1000000;
const Col = 100;
int mas[DefSizeMas];
int count[DefSizeMas];

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
// Функция заполнения массива mas размера size случайными числами
void ToRandom(int Mas[],const int Size)
{
  randomize();
  for(int i = 0; i < Size; ++i)
    Mas[i] = (rand() % Col) + 1;
};
//---------------------------------------------------------------------------
// Функция обнуления массива mas размера size
void ToZero(int Mas[],const int Size)
{
  for(int i = 0; i < Size; ++i)       // O(Size)
    Mas[i] = 0;                       // O(1)
};
//---------------------------------------------------------------------------
//Поиск одиннаковых элементов в массиве
int Find(const int Mas[],const int Size,const int Cur)
{
  int value;

  value = 0;                        //O(1)
  for(int i = 0; i < Size; ++i)     //O(Size)
    if(Mas[i] == Cur)               //O(1)
      value++;                      //O(1)

  return value;
};
//-------------------------------------------------------------------------
//Вывод элементов массива
void GetMass(const int Mas[],const int First,const int Last, TMemo *Memo)
{
  int i;

  i = First - 1;
  while (i<Last) {
    Memo->Lines->Add(IntToStr(i+1)+". "+IntToStr(Mas[i]));
    i++;
  }
};
//---------------------------------------------------------------------------
//Блочная сортировка
void BucketSort(int Mas[],int Count[],const int Size)
{
  int i,j;

  ToZero(Count,Size);                       //O(Size*1)
  for(int i = 0; i < Col; ++i) {            //O(100)
    Count[i] = Find(Mas,Size,i+1);          //O(1+Size) ->O(100*Size)
  }
  j = 0;                                    //O(1)
  for(int i = 0; i < Col; ++i) {            //O(100)
    while (Count[i]>0) {                    //O(1)
      Mas[j] = i + 1;                       //O(1)
      Count[i]--;                           //O(1)
      j++;                                  //O(1)  -> доминанта O(1)
    }
  }
  /*O(Size*1)+
    O(100*Size)+
    O(1)+
    O(100*1)=
    O(Size)+O(100*Size)+O(100)=O(Size)+O(Size)=O(Size^2)
  */
};
//-------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  Memo1->Clear();
  Memo2->Clear();
  ToRandom(mas,StrToInt(Edit1->Text));
  GetMass(mas,1,StrToInt(Edit1->Text),Memo1);
  BucketSort(mas,count,StrToInt(Edit1->Text));
  GetMass(mas,1,StrToInt(Edit1->Text),Memo2);
}
//---------------------------------------------------------------------------


