//---------------------------------------------------------------------------

#include <vcl.h>
#include <process.h>
#include <windows.h>
#include <stdio.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "CGAUGES"
#pragma resource "*.dfm"
TForm1 *Form1;
int N = 10;
HANDLE hEvent1;
bool flag = false;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
unsigned int __stdcall Thread1 (void* pParams)
{
  for (int j = 0; j < N; j++)  flag = false;
  for (int i = 1; i <= Form1->CGauge1->MaxValue; i++) Form1->CGauge1->Progress = i;

  SetEvent( hEvent1 );

  return 0;
}

unsigned int __stdcall Thread2 (void* pParams)
{
   WaitForSingleObject( hEvent1, INFINITE );
   Beep();

   return 0;
}

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
   hEvent1 = CreateEvent( NULL, FALSE, FALSE, NULL );

   DWORD thd1 = _beginthreadex (NULL, 1024*1024, Thread1, NULL, 0, NULL);
   DWORD thd2 = _beginthreadex (NULL, 1024*1024, Thread2, NULL, 0, NULL);

   SetThreadPriority ((HANDLE)thd1,THREAD_PRIORITY_ABOVE_NORMAL);
   SetThreadPriority ((HANDLE)thd2,THREAD_PRIORITY_HIGHEST);
}
//---------------------------------------------------------------------------
