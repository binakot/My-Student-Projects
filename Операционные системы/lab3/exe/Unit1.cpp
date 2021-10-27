//---------------------------------------------------------------------------
#include <windows.h>
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
typedef  int  (*pfn) (int,int);
TForm1 *Form1;
int a,b,c;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

/* Приложение, выполняющее явное связывание DLL, должно выполнить следующий
   цикл действий:
   - загрузка DLL (через LoadLibrary())
   - получения адреса нужной функции (через GetProcAddress())
   - выгрузка DLL (через FreeLibrary()) */

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  // Переменная hMod является дескриптором  DLL
   HMODULE hMod = LoadLibrary ("project1.dll");

   // Если дескриптор загруженной DLL = NULL, значит загрузка не удалась
   if (!hMod)
     MessageBox (NULL, "Ошибка загрузки dll!", "ОШИБКА!", MB_OK | MB_ICONEXCLAMATION);

   // Получение адреса функции
   pfn addr = (pfn)GetProcAddress (hMod, "_Test");

   // Если получен нулевой адрес, значит функция с таким именем не найдена или отсутствует в DLL
   if (!addr)
     MessageBox (NULL, "Ошибка получения адреса функции!", "ОШИБКА!", MB_OK | MB_ICONEXCLAMATION);

   // Вызов функции по ее адресу и получение строки, которую возвращает Test()
   a=StrToInt(Edit1->Text);
   b=StrToInt(Edit2->Text);
   int c = (*addr)(a,b);
   Edit3->Text=IntToStr(c);
   
   // Выгрузка более не нужной библиотеки DLL
   FreeLibrary (hMod);
}
//---------------------------------------------------------------------------
