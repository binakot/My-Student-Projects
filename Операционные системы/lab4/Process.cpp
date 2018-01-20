//---------------------------------------------------------------------------

#include <vcl.h>
#include <FileCtrl.hpp>
#include <tlhelp32.h>  // Для использования функций ToolHelpAPI
#include <process.h>   //
#pragma hdrstop

#include "Process.h"
#include "PMap.h"
//#include "WinMem.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TProcessForm *ProcessForm;
//---------------------------------------------------------------------------
__fastcall TProcessForm::TProcessForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------


/*----------------------------------------------------------------------------*/

// Вывод списка процессов в StringGrid1
void TProcessForm::AvailableProcesses()
{
   for (int i = 1; i < StringGrid1->RowCount; i++)
   {
      StringGrid1->Rows[i]->Clear();
      delete (PROCESSENTRY32*)(StringGrid1->Objects[0][i]);
   }
   StringGrid1->RowCount = 2;

   HANDLE hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);

   PROCESSENTRY32 prc;
   prc.dwSize = sizeof(PROCESSENTRY32);
   if (!Process32First(hSnap, &prc)) return;
   int RowPos = 1;
   do
   {
     PROCESSENTRY32* tmp = new PROCESSENTRY32;
     CopyMemory(tmp, &prc, sizeof (PROCESSENTRY32));
/*
     int i;
     for (i = strlen(tmp->szExeFile); i > 0  && tmp->szExeFile[i] != '\\'; i--);
     if (*(tmp->szExeFile + i) == '\\') i++;
     StringGrid1->Cells[0][RowPos] = tmp->szExeFile + i;
*/
     StringGrid1->Objects[0][RowPos++] = (TObject*)tmp;
     StringGrid1->RowCount++;
   } while (Process32Next(hSnap, &prc));
   StringGrid1->RowCount--;

   CloseHandle(hSnap);
}


void __fastcall TProcessForm::FormCreate(TObject *Sender)
{
   StringGrid1->Cells[0][0] = "  Процессы";
}
//---------------------------------------------------------------------------




// Обработчик на кнопку OK
void __fastcall TProcessForm::SpeedButton2Click(TObject *Sender)
{
   PROCESSENTRY32* tmp = (PROCESSENTRY32*)StringGrid1->Objects[0][StringGrid1->Row];
   int i;
   for (i = strlen(tmp->szExeFile); i > 0  && tmp->szExeFile[i] != '\\'; i--);
   if (*(tmp->szExeFile + i) == '\\') i++;

   MapForm->Caption = "Карта памяти прцесса (" + AnsiString(tmp->szExeFile + i) + ")";
   fExpandRegions = false;
   MapForm->SpeedButton10->Down = false;
   DWORD PrId = ((PROCESSENTRY32*)StringGrid1->Objects[0][StringGrid1->Row])->th32ProcessID;

   HANDLE hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, FALSE, PrId);

   if (hProcess == NULL)
   {
      char *buff = NULL;
      FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_ALLOCATE_BUFFER,
                NULL, GetLastError(), MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                (PTSTR) &buff, 0, NULL);
      ShowMessage(buff);
      delete buff;
      return;
   }
   dwProcessId = PrId;

   MapForm->ShowVirtualMemoryMap();
   Close();
}
//---------------------------------------------------------------------------

// Отмена
void __fastcall TProcessForm::SpeedButton3Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

// Обновить
void __fastcall TProcessForm::SpeedButton5Click(TObject *Sender)
{
   StringGrid1->RowCount = 2;
   AvailableProcesses();
   StringGrid1->Cells[0][0] = "  Процессы";
}
//---------------------------------------------------------------------------


void __fastcall TProcessForm::StringGrid1DrawCell(TObject *Sender,
      int ACol, int ARow, TRect &Rect, TGridDrawState State)
{
   if (ARow == 0) return;

   unsigned short IconIndex = 0;


   PROCESSENTRY32* tmp = (PROCESSENTRY32*)StringGrid1->Objects[0][ARow];

   char s[256];
   strcpy(s, tmp->szExeFile);
   HANDLE h = ExtractAssociatedIcon(HInstance, s, &IconIndex);
   DrawIconEx(StringGrid1->Canvas->Handle, 0, Rect.Top, h,
   StringGrid1->DefaultRowHeight, StringGrid1->DefaultRowHeight, 0,
   CreateHatchBrush(NULL, clWhite), DI_COMPAT);

   int i;
   for (i = strlen(tmp->szExeFile); i > 0  && tmp->szExeFile[i] != '\\'; i--);
   if (*(tmp->szExeFile + i) == '\\') i++;

   StringGrid1->Canvas->TextOut(StringGrid1->DefaultRowHeight, Rect.Top + 2,
                                " " + (AnsiString)(tmp->szExeFile + i));

   StringGrid1->Canvas->TextOut(StringGrid1->DefaultRowHeight, Rect.Top + 2,
   " " + (AnsiString)(tmp->szExeFile + i) + "                                ");
}
//---------------------------------------------------------------------------

