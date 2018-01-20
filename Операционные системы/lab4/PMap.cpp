//---------------------------------------------------------------------------

#include <vcl.h>
#include <winbase.h>
#include <psapi.h>
#include <tchar.h>
#include <stdio.h>
#pragma hdrstop

#include "PMap.h"
#include "Process.h"
#include "Toolhelp.h"
#include "VMQuery.h"
#include "Help.h"
#include "About.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMapForm *MapForm;  // �����

AnsiString DOSArea =
"     ������� ������������� � DOS\n\n"
" ����������� ���  ������������� ���-\n"
" ������� DOS � Win32. � ��� ������� \n"
" ������������ 1Mb ��������� �������-\n"
" ����� ��������� ������.\n"
" (������ � Windows 9X.)";


AnsiString MMFArea =
"       ������� MMF (Memory Mapped File)\n\n"
" ���� ������� ���������� ��� ��������� .DLL\n"
" (������ � Windows 9X.)";


AnsiString ReserveArea =
"         ����������������� ������� ������\n\n"
"   ������������� ��� ��������� �������\n"
"  ��������� ����������.\n"
"  (������ � Windows2000).";


AnsiString CodeAndDataArea =
"                                             ��� � ������ OS\n\n"
" � ���� ������ ���������� ��� ������������ �������, � ��� �����\n"
" ��������  ��������� � ���  ��������������� ���������� ��������,\n"
" �������, �������� ��������,  �������� ����������. ��, ��� ��-\n"
" ������� �����,  ��������  ������ ��������. �  Windows 2000 ���\n"
" ��������� ��������� ��������. �����, ������� �������� �������-\n"
" �� �� ������ �� ������� ������ � ���� �������, ������� ������-\n"
" ��� �������, � ��� ������� �  ����,  ���  �������  � ��������\n"
" ����� ������ ������� ��� ����������.";

AnsiString NULLPointersArea =
"     ������� ��� �������� ������� ����������\n\n"
" ������������ ��� �������� ������� ����������.\n"
" ������� ������� � ���  ������� �������� ����-\n"
" ����� �������. ����������� ������  ���������-\n"
" ������� ��������� �������� ������� ����������\n"
" � ������ ��������.";


/*------------------- ������� ��� ��������� ----------------------------------*/

#define            LEFT_X    10  // ������ �� ������ ���� Imag'a �� ������ ��������
#define           RIGHT_X   110  // ������ �� ������ ���� Imag'a �� ����� ��������
#define             TOP_Y    10  // ������ �� ��������� ���� Imag'a �� ������ ��������
#define          BOTTOM_Y    10  // ������ �� ������� ���� Imag'a �� ������ ��������
#define               MMF    20  // ������ �� ��������� ������� MMF
#define           OS_DATA    20  // ������ �� ��������� ������� ������ OS
#define     NULL_POINTERS    20  // ������ �� ��������� ������� NULL POINTERS
#define               DOS    20  // ������ �� ��������� ������� DOS
#define           RESERVE    20  // ������ �� ��������� ������� ���������������
#define        BLOCK_SIZE    11  // ������ ����� �� ���������

/*----------------------------------------------------------------------------*/


/*--------------------- �������� ���������� ----------------------------------*/

CToolhelp g_toolhelp;

// ��� ��������� �� ������� GetMappedFileName
typedef DWORD (WINAPI* PFNGETMAPPEDFILENAME)(HANDLE, PVOID, PTSTR, DWORD);

// ��������� �� ������� GetMappedFileName
PFNGETMAPPEDFILENAME g_pfnGetMappedFileName = NULL;

// ����, ������������ ����������� ����������� ���������� � �������
bool fExpandRegions;

// ��������� �� ������, ������ ����� ��� ���������� ���������
TList *list = new TList;

// ������ ����� �� ���������
int BSize;

// ID ��������
DWORD dwProcessId;

// ������� ���������� ���� ������
struct ListItem
{
  unsigned int Adress;     // ����� ������ �������
  AnsiString RgnStorage;   // ��� �������
  ListItem(unsigned int A, AnsiString RS): Adress(A), RgnStorage(RS) {}
};

// ��������� �� ������, ������� ������ "����� ������"
void (*BuildMap)(bool);

/*----------------------------------------------------------------------------*/

// �������� ������� ���������� "����� ������" ��� Windows9X
void BuildMap_For_W9X(bool IsAdress);

// �������� ������� ���������� "����� ������" ��� Windows2000
void BuildMap_For_W2000(bool IsAdress);


//---------------------------------------------------------------------------
__fastcall TMapForm::TMapForm(TComponent* Owner)
        : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TMapForm::FormCreate(TObject *Sender)
{
  // ��������� �������� �������� � StringGrid1
  StringGrid1->ColWidths[0] = StringGrid1->Width / 7;
  StringGrid1->ColWidths[1] = StringGrid1->Width / 10;
  StringGrid1->ColWidths[2] = StringGrid1->Width / 8;
  StringGrid1->ColWidths[3] = StringGrid1->Width / 10;
  StringGrid1->ColWidths[4] = StringGrid1->Width / 10;
  StringGrid1->ColWidths[5] = StringGrid1->Width;

  // ��������� �������� ������ � HeaderControl1
  for (int i = 0; i < HeaderControl1->Sections->Count; i++)
  {
    HeaderControl1->Sections->Items[i]->Width = StringGrid1->ColWidths[i];
    if (!(i % 2)) HeaderControl1->Sections->Items[i]->Width +=2;
  }

  OSVERSIONINFO verinfo = {sizeof(OSVERSIONINFO)};
  GetVersionEx(&verinfo);

  // �������� ������ OS
  if (verinfo.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS)
  // Windows9X
  {
     MapForm->Image1->OnMouseDown = Image2MouseDown;
     BuildMap = BuildMap_For_W9X;
  }
  else
  // Windows2000
  {
     MapForm->Image1->OnMouseDown = Image1MouseDown;
     BuildMap = BuildMap_For_W2000;
  }
  g_toolhelp.CreateSnapshot(TH32CS_SNAPALL);
  PROCESSENTRY32 tmp;
  tmp.dwSize = sizeof(PROCESSENTRY32);
  dwProcessId = GetCurrentProcessId();
  g_toolhelp.ProcessFind(dwProcessId, &tmp);
  int i;
  for (i = strlen(tmp.szExeFile); i > 0  && tmp.szExeFile[i] != '\\'; i--);
  if (*(tmp.szExeFile + i) == '\\') i++;

  Caption = "����� ������ ������� (" + (AnsiString)(tmp.szExeFile + i) + ")";

  ShowVirtualMemoryMap();
}
//---------------------------------------------------------------------------


// ������������ ������ � ��� ������� ������
AnsiString GetMemStorageText(DWORD dwStorage)
{
   AnsiString p = "Unknown";
   switch (dwStorage)
   {
     case MEM_FREE:    p = "Free";    break;
     case MEM_RESERVE: p = "Reserve"; break;
     case MEM_IMAGE:   p = "Image";   break;
     case MEM_MAPPED:  p = "Mapped";  break;
     case MEM_PRIVATE: p = "Private"; break;
   }
   return p;
}


// ������������ ������ � ���������� ������
AnsiString GetProtectText(DWORD dwProtect, BOOL fShowFlags)
{
   AnsiString s = "Unknown";
   switch (dwProtect & ~(PAGE_GUARD | PAGE_NOCACHE | PAGE_WRITECOMBINE))
   {
     case PAGE_READONLY:          s = "-R--"; break;
     case PAGE_READWRITE:         s = "-RW-"; break;
     case PAGE_WRITECOPY:         s = "-RWC"; break;
     case PAGE_EXECUTE:           s = "E---"; break;
     case PAGE_EXECUTE_READ:      s = "ER--"; break;
     case PAGE_EXECUTE_READWRITE: s = "ERW-"; break;
     case PAGE_EXECUTE_WRITECOPY: s = "ERWC"; break;
     case PAGE_NOACCESS:          s = "----"; break;
   }
   if (fShowFlags)
   {
     s = s + " ";
     s = s + ((dwProtect & PAGE_GUARD)        ? "G" : "-");
     s = s + ((dwProtect & PAGE_NOCACHE)      ? "N" : "-");
     s = s + ((dwProtect & PAGE_WRITECOMBINE) ? "W" : "-");
   }
   return s;
}


// ����� ���������� � ������� ������ � StringGrid1
void OutputRgnInfo(HANDLE hProcess, PVMQUERY pVMQ, int RowCount)
{
   AnsiString tmp;
   MapForm->StringGrid1->Cells[0][RowCount] = tmp.IntToHex((int)pVMQ->pvRgnBaseAddress, 8);
   MapForm->StringGrid1->Cells[1][RowCount] = GetMemStorageText(pVMQ->dwRgnStorage);
   MapForm->StringGrid1->Cells[2][RowCount] = pVMQ->RgnSize;

   if (pVMQ->dwRgnStorage != MEM_FREE)
   {
      MapForm->StringGrid1->Cells[3][RowCount] = pVMQ->dwRgnBlocks;
      MapForm->StringGrid1->Cells[4][RowCount] = GetProtectText(pVMQ->dwRgnProtection, FALSE);
   }

   // Try to obtain the module pathname for this region.
   if (pVMQ->pvRgnBaseAddress != NULL)
   {
      MODULEENTRY32 me = { sizeof(me) };

      if (g_toolhelp.ModuleFind(pVMQ->pvRgnBaseAddress, &me))
        MapForm->StringGrid1->Cells[5][RowCount] = me.szExePath;
      else
      {
         // This is not a module; see if it's a memory-mapped file
         if (g_pfnGetMappedFileName != NULL)
         {
            int l = MapForm->StringGrid1->Cells[5][RowCount].Length();
            DWORD d = g_pfnGetMappedFileName(hProcess, pVMQ->pvRgnBaseAddress,
                     MapForm->StringGrid1->Cells[5][RowCount].c_str() + l, 256);
            if (d == 0) (MapForm->StringGrid1->Cells[5][RowCount]).c_str()[l] = 0;
         }
      }
   }

   if (pVMQ->fRgnIsAStack) MapForm->StringGrid1->Cells[5][RowCount] = "���� ������";
}


// ����� ���������� � ����� ������
void OutputBlkInfo(PVMQUERY pVMQ, int RowCount)
{
   AnsiString tmp;
   MapForm->StringGrid1->Cells[0][RowCount] = "    " + tmp.IntToHex((int)pVMQ->pvBlkBaseAddress, 8);
   MapForm->StringGrid1->Cells[1][RowCount] = GetMemStorageText(pVMQ->dwBlkStorage);
   MapForm->StringGrid1->Cells[2][RowCount] = pVMQ->BlkSize;

   if (pVMQ->dwBlkStorage != MEM_FREE)
     MapForm->StringGrid1->Cells[4][RowCount] = GetProtectText(pVMQ->dwBlkProtection, TRUE);
}

// ����� �����
TColor SwitchColor(AnsiString s)
{
   if (!s.AnsiCompare("Reserve")) return clGreen;
   if (!s.AnsiCompare("Image"))   return clFuchsia;
   if (!s.AnsiCompare("Mapped"))  return clBlue;
   if (!s.AnsiCompare("Private")) return clGray;
   if (!s.AnsiCompare("Free"))    return clTeal;

   return clRed;
}

/*------------------------- ������� ������� ----------------------------------*/

// ��� ������� �������� ���� ������ �������� ��������� ������������ ��������
void TMapForm::ShowVirtualMemoryMap()
{
   // �������� StringGrid'�
   for (int i = 0; i < StringGrid1->RowCount; i++) StringGrid1->Rows[i]->Clear();
   StringGrid1->RowCount = 0;

   ScrollBox1->VertScrollBar->Position = 0;

   // ������� �������� ���������� PSAPI.DLL
   HMODULE hmodPSAPI = LoadLibrary(TEXT("PSAPI"));
   if (hmodPSAPI != NULL) g_pfnGetMappedFileName = (PFNGETMAPPEDFILENAME)
                          GetProcAddress(hmodPSAPI, "GetMappedFileNameA");

   // ������ ������� ������������ ��������� c ��������������� dwProcessId
   g_toolhelp.CreateSnapshot(/*TH32CS_SNAPALL*/TH32CS_SNAPMODULE, dwProcessId);

   BOOL fOk = TRUE;         // ��������� ���������� ������� VMQuery
   PVOID pvAddress = NULL;  // ������� �����
   int Row = 0;             // ������� ������ � StringGrid'e
   list->Clear();

   // ��������� ����������� �������
   HANDLE hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, FALSE, dwProcessId);

   // ���� ������ �������� ��������� ������������ ��������
   while (fOk)
   {
      VMQUERY vmq;
      if (fOk = VMQuery(hProcess, pvAddress, &vmq))
      {
         // ����� �������� � ������� ������ � StringGrid1
         OutputRgnInfo(hProcess, &vmq, Row++);
         // ���������� ������ ��� ���������� "����� ������"
         if (Row > 1 && (unsigned int)pvAddress < 0x80000000)
           if (list->Count == 0 || StringGrid1->Cells[1][Row - 1].AnsiCompare(((ListItem*)list->Items[list->Count - 1])->RgnStorage))
           {
             ListItem *new_item = new ListItem((unsigned int)pvAddress, StringGrid1->Cells[1][Row - 1]);
             list->Add(new_item);
           }

         StringGrid1->RowCount++;

         // ���� ���������� ���� fExpandRegions, �� ������������ �����������
         // ���������� � ������� ��������� ������������
         if (fExpandRegions)
         {
            for (DWORD dwBlock = 0; fOk && (dwBlock < vmq.dwRgnBlocks); dwBlock++)
            {
               OutputBlkInfo(&vmq, Row++);
               StringGrid1->RowCount++;
               pvAddress = ((PBYTE) pvAddress + vmq.BlkSize);
               if (dwBlock < vmq.dwRgnBlocks - 1) fOk = VMQuery(hProcess, pvAddress, &vmq);
            }
         }
         // ������� � ���������� �������
         pvAddress = ((PBYTE) vmq.pvRgnBaseAddress + vmq.RgnSize);
      }
   }
   StringGrid1->RowCount--;
   CloseHandle(hProcess);

   // �������� ���������� PSAPI.DLL
   if (g_pfnGetMappedFileName != NULL) FreeLibrary(g_pfnGetMappedFileName);

   // ��������� ������� ����� �� �����
   BSize = BLOCK_SIZE;
   // ���������� "����� ������"
   BuildMap(true);
}

/*----------------------------------------------------------------------------*/

// ��������� ����� � StringGrid1
void __fastcall TMapForm::StringGrid1DrawCell(TObject *Sender, int ACol,
      int ARow, TRect &Rect, TGridDrawState State)
{
   TRect r = StringGrid1->CellRect(ACol, ARow);
   StringGrid1->Canvas->Font->Color = SwitchColor(StringGrid1->Cells[1][ARow]);
   StringGrid1->Canvas->TextRect(r, r.Left + 2, r.Top += 2, StringGrid1->Cells[ACol][ARow]);
}
//---------------------------------------------------------------------------


// ����������� ����������� ���������� � �������
void __fastcall TMapForm::SpeedButton10Click(TObject *Sender)
{
   fExpandRegions = SpeedButton10->Down;
   ShowVirtualMemoryMap();
}
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------

// ���������� ���������
void __fastcall TMapForm::SpeedButton4Click(TObject *Sender)
{
   if (BSize >= 30) return; else ++BSize;
   if (BSize < 10) BuildMap(false); else BuildMap(true);
}
//---------------------------------------------------------------------------

// ���������� ���������
void __fastcall TMapForm::SpeedButton5Click(TObject *Sender)
{
   if (BSize < 4 || Image1->Height < ScrollBox1->Height) return; else --BSize;
   if (BSize < 10) BuildMap(false); else BuildMap(true);
}
//---------------------------------------------------------------------------

// ������������ ������ ����� ������
void __fastcall TMapForm::SpeedButton1Click(TObject *Sender)
{
   BSize = 30;
   BuildMap(true);
}
//---------------------------------------------------------------------------

// ����������� ������ ����� ������
void __fastcall TMapForm::SpeedButton3Click(TObject *Sender)
{
   if (Image1->Height == ScrollBox1->Height - 4) return;
   BSize = 3;
   BuildMap(false);
}
//---------------------------------------------------------------------------

// ������ ����� �� ���������
void __fastcall TMapForm::SpeedButton6Click(TObject *Sender)
{
   BSize = BLOCK_SIZE;
   BuildMap(true);
}
//---------------------------------------------------------------------------


/*--------------- ����������� OnMouseDown'� �� Image -------------------------*/

// ���� ��������� �������� �� ��������� Windows2000
void __fastcall TMapForm::Image1MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if (X <= LEFT_X || X >= RIGHT_X || Y <= TOP_Y) return;

   int tmp = TOP_Y + NULL_POINTERS + list->Count * BSize;
   if (Y > tmp && Y <= tmp + RESERVE)              // ����������������� �������
   {
      ShowMessage(ReserveArea);
      return;
   }
   if (Y > tmp + RESERVE && Y <= tmp + RESERVE + OS_DATA) // ������� ������ OS
   {
      ShowMessage(CodeAndDataArea);
      return;
   }

   if (Y > TOP_Y && Y < TOP_Y + NULL_POINTERS)         // ������� NULL POINTERS
   {
      StringGrid1->Row = 0;
      ShowMessage(NULLPointersArea);
      return;
   }

   int index = 0;
   // ����� ������� � ������ list
   for (int i = TOP_Y + NULL_POINTERS; i < Image1->Height; i += BSize, index++)
     if (Y < i) break;

   if (index <= list->Count)
   {
     // ��������� ������ �� ������ list
     AnsiString Adress = IntToHex((int)((ListItem*)list->Items[index - 1])->Adress, 8);

     // ����� ������� ������ � StringGrid1
     for (int i = 0; i < StringGrid1->RowCount; i++)
       if (!StringGrid1->Cells[0][i].AnsiCompare(Adress))
       {
         // ��������� ������� � StringGrid'�
         StringGrid1->Row = i;
         break;
       }
   }
}

// ���� ��������� �������� �� ��������� Windows9X
void __fastcall TMapForm::Image2MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if (X < LEFT_X || X > RIGHT_X || Y < TOP_Y) return;

   int tmp = TOP_Y + NULL_POINTERS + DOS + list->Count * BSize;

   if (Y > tmp && Y <= tmp + MMF)   // ������� MMF
   {
      ShowMessage(MMFArea);
      return;
   }

   if (Y > tmp + MMF && Y <= tmp + MMF + OS_DATA)  // ������� ������ OS
   {
      ShowMessage(CodeAndDataArea);
      return;
   }

   if (Y > TOP_Y && Y < TOP_Y + NULL_POINTERS)   // ������� NULL POINTERS
   {
      StringGrid1->Row = 0;
      ShowMessage(NULLPointersArea);
      return;
   }

   if (Y > TOP_Y && Y < TOP_Y + NULL_POINTERS + DOS)   // ������� DOS
   {
      StringGrid1->Row = 1;
      ShowMessage(DOSArea);
      return;
   }

   int index = 0;
   // ����� ������� � ������ list
   for (int i = TOP_Y + NULL_POINTERS + DOS; i < Image1->Height; i += BSize, index++)
     if (Y < i) break;

   if (index <= list->Count)
   {
     // ��������� ������ �� ������ list
     AnsiString Adress = IntToHex((int)((ListItem*)list->Items[index - 1])->Adress, 8);

     // ����� ������� ������ � StringGrid1'e
     for (int i = 0; i < StringGrid1->RowCount; i++)
       if (!StringGrid1->Cells[0][i].AnsiCompare(Adress))
       {
          // ��������� ������� � StringGrid'�
          StringGrid1->Row = i;
          break;
       }
   }
}

/*----------------------------------------------------------------------------*/

// ����� ������� ������ StringGrid1'�� � StatusBar1
void __fastcall TMapForm::StringGrid1SelectCell(TObject *Sender, int ACol,
      int ARow, bool &CanSelect)
{
   StatusBar1->Panels->Items[0]->Text = StringGrid1->Cells[0][ARow];
   StatusBar1->Panels->Items[1]->Text = StringGrid1->Cells[1][ARow];
   StatusBar1->Panels->Items[2]->Text = StringGrid1->Cells[2][ARow];
   StatusBar1->Panels->Items[3]->Text = StringGrid1->Cells[3][ARow];
   StatusBar1->Panels->Items[4]->Text = StringGrid1->Cells[4][ARow];
   StatusBar1->Panels->Items[5]->Text = StringGrid1->Cells[5][ARow];
}
//---------------------------------------------------------------------------

void __fastcall TMapForm::FormResize(TObject *Sender)
{
   // ��������� �������� �������� � StringGrid1
   StringGrid1->ColWidths[0] = StringGrid1->Width / 7;
   StringGrid1->ColWidths[1] = StringGrid1->Width / 10;
   StringGrid1->ColWidths[2] = StringGrid1->Width / 8;
   StringGrid1->ColWidths[3] = StringGrid1->Width / 10;
   StringGrid1->ColWidths[4] = StringGrid1->Width / 10;
   StringGrid1->ColWidths[5] = StringGrid1->Width;

   // ��������� �������� ������ � HeaderControl1
   for (int i = 0; i < 6; i++)
   {
     HeaderControl1->Sections->Items[i]->Width = StringGrid1->ColWidths[i];
     if (!(i % 2)) HeaderControl1->Sections->Items[i]->Width +=2;
   }

   // ���������� "����� ������"
   if (list->Count > 0) if (BSize < 10) BuildMap(false); else BuildMap(true);
}
//---------------------------------------------------------------------------


/*-------------------- ���������� "����� ������" -----------------------------*/

// ���������� "����� ������" ��� Windows2000
void BuildMap_For_W2000(bool IsAdress)
{
   int tmp = TOP_Y + RESERVE + OS_DATA + BOTTOM_Y + NULL_POINTERS;
   MapForm->Image1->Canvas->Brush->Color = clWhite;
//   if (((MapForm->ScrollBox1->Height - tmp) / (float)list->Count) < BSize)
   if ((tmp + list->Count * BSize) > MapForm->ScrollBox1->Height - 4
       && (tmp + list->Count * BLOCK_SIZE) > MapForm->ScrollBox1->Height - 4)
   {
     MapForm->Image1->Height = list->Count * BSize + tmp;
     MapForm->Image1->Picture->Bitmap->Height  = list->Count * BSize + tmp;
   }
   else
   {
     MapForm->Image1->Height = MapForm->ScrollBox1->Height - 4;
     MapForm->Image1->Picture->Bitmap->Height  = MapForm->ScrollBox1->Height - 4;
     BSize = (MapForm->Image1->Height - tmp) / list->Count;
   }

   MapForm->Image1->Canvas->Brush->Style = bsSolid;
   MapForm->Image1->Canvas->Pen->Color = clWhite;
   MapForm->Image1->Canvas->Pen->Mode = pmCopy;
   MapForm->Image1->Canvas->Pen->Color = clWhite;
   MapForm->Image1->Canvas->Rectangle(0, 0, MapForm->Image1->Width, MapForm->Image1->Height);
   MapForm->Image1->Canvas->Brush->Color = clRed;
   MapForm->Image1->Canvas->Pen->Color = clBlack;
   MapForm->Image1->Canvas->Rectangle(LEFT_X, TOP_Y, RIGHT_X, TOP_Y + NULL_POINTERS);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, TOP_Y + 1, "  NULL Pointers");
   MapForm->Image1->Canvas->Brush->Color = clWhite;
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, TOP_Y - 5, "00000000");

   int j = 0, i;
   for (i = TOP_Y + NULL_POINTERS; i < TOP_Y + NULL_POINTERS + list->Count * BSize; i += BSize, j++)
   {
     MapForm->Image1->Canvas->Brush->Color = SwitchColor(((ListItem*)list->Items[j])->RgnStorage);
     MapForm->Image1->Canvas->Rectangle(LEFT_X, i - 1, RIGHT_X, i + BSize);
     if (IsAdress)
     {
       MapForm->Image1->Canvas->Brush->Color = clWhite;
       MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i - 5, IntToHex((int)((ListItem*)list->Items[j])->Adress, 8));
     }
   }

   MapForm->Image1->Canvas->Brush->Color = clRed;
   MapForm->Image1->Canvas->Rectangle(LEFT_X, i - 1, RIGHT_X, i + RESERVE);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, i + 5, "���������������");
   MapForm->Image1->Canvas->Rectangle(LEFT_X, i + RESERVE - 1, RIGHT_X, i + RESERVE + OS_DATA);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, i + RESERVE + 1, "      OS Data");
   MapForm->Image1->Canvas->Brush->Color = clWhite;
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i - 6, "7FFF0000");
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i + RESERVE - 5, "80000000");
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i + RESERVE + OS_DATA - 5, "FFFFFFFF");
}


// ���������� "����� ������" ��� Windows9X
void BuildMap_For_W9X(bool IsAdress)
{
   int tmp = TOP_Y + NULL_POINTERS + DOS + BOTTOM_Y + MMF + OS_DATA;
   MapForm->Image1->Canvas->Brush->Color = clWhite;
//   if (((MapForm->ScrollBox1->Height - tmp) / (float)list->Count) < BSize)
//   if ((tmp + list->Count * BSize) > MapForm->ScrollBox1->Height)
   if ((tmp + list->Count * BSize) > MapForm->ScrollBox1->Height - 4
       && (tmp + list->Count * BLOCK_SIZE) > MapForm->ScrollBox1->Height - 4)
   {
     MapForm->Image1->Canvas->Brush->Color = clWhite;
     MapForm->Image1->Height = list->Count * BSize + tmp;
     MapForm->Image1->Picture->Bitmap->Height  = list->Count * BSize + tmp;
   }
   else
   {
     MapForm->Image1->Height = MapForm->ScrollBox1->Height - 4;
     MapForm->Image1->Picture->Bitmap->Height  = MapForm->ScrollBox1->Height - 4;
     BSize = (MapForm->Image1->Height - tmp) / list->Count;
   }

   MapForm->Image1->Canvas->Brush->Style = bsSolid;
   MapForm->Image1->Canvas->Pen->Color = clWhite;
   MapForm->Image1->Canvas->Pen->Mode = pmCopy;
   MapForm->Image1->Canvas->Pen->Color = clWhite;
   MapForm->Image1->Canvas->Rectangle(0, 0, MapForm->Image1->Width, MapForm->Image1->Height);
   MapForm->Image1->Canvas->Brush->Color = clRed;
   MapForm->Image1->Canvas->Pen->Color = clBlack;
   MapForm->Image1->Canvas->Rectangle(LEFT_X, TOP_Y, RIGHT_X, TOP_Y + NULL_POINTERS);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, TOP_Y + 1, "  NULL Pointers");
   MapForm->Image1->Canvas->Rectangle(LEFT_X, TOP_Y + NULL_POINTERS - 1, RIGHT_X, TOP_Y + NULL_POINTERS + DOS);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, TOP_Y + NULL_POINTERS + 1, "        DOS");
   MapForm->Image1->Canvas->Brush->Color = clWhite;
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, TOP_Y - 5, "00000000");
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, TOP_Y + NULL_POINTERS - 5, "00001000");

   int j = 0, i;
   for (i = TOP_Y + NULL_POINTERS + DOS; i < TOP_Y + NULL_POINTERS + DOS + list->Count * BSize; i += BSize, j++)
   {
     MapForm->Image1->Canvas->Brush->Color = SwitchColor(((ListItem*)list->Items[j])->RgnStorage);
     MapForm->Image1->Canvas->Rectangle(LEFT_X, i - 1, RIGHT_X, i + BSize);
     if (IsAdress)
     {
       MapForm->Image1->Canvas->Brush->Color = clWhite;
       MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i - 5, IntToHex((int)((ListItem*)list->Items[j])->Adress, 8));
     }
   }

   MapForm->Image1->Canvas->Brush->Color = clRed;
   MapForm->Image1->Canvas->Rectangle(LEFT_X, i - 1, RIGHT_X, i + MMF);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, i + 5, "        MMF");
   MapForm->Image1->Canvas->Rectangle(LEFT_X, i + MMF - 1, 110, i + MMF + OS_DATA);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, i + MMF + 1, "      OS Data");
   MapForm->Image1->Canvas->Brush->Color = clWhite;
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i - 5, "80000000");
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i + MMF - 5, "C0000000");
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i + MMF + OS_DATA - 5, "FFFFFFFF");
}

/*----------------------------------------------------------------------------*/

// ���������� �� ��������� �������� ������ � HeaderControl1
void __fastcall TMapForm::HeaderControl1SectionResize(
      THeaderControl *HeaderControl, THeaderSection *Section)
{
  for (int i = 0; i < HeaderControl1->Sections->Count; i++)
  {
    StringGrid1->ColWidths[i] = HeaderControl1->Sections->Items[i]->Width;
    if (!(i % 2)) StringGrid1->ColWidths[i] -=2;
  }
}
//---------------------------------------------------------------------------


// ����� Hint'�� ��� ��������� ������� ���� �� ������ HeaderControl1
void __fastcall TMapForm::HeaderControl1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  for (int i = 0, j = HeaderControl1->Left; i < HeaderControl1->Sections->Count; i++)
  {
     j +=HeaderControl1->Sections->Items[i]->Width;
     if (X < j)  { Hint = HeaderControl1->Sections->Items[i]->Text; break; }
  }
}
//---------------------------------------------------------------------------

// ���������� �� ����
int TMapForm::SortByType(AnsiString Type, int index)
{
  int end_index = StringGrid1->RowCount - 1;

  for (int i = index; i < StringGrid1->RowCount; i++)
    if (StringGrid1->Cells[1][i].AnsiCompare(Type))
     for (int j = i + 1; j < StringGrid1->RowCount; j++)
       if (!StringGrid1->Cells[1][j].AnsiCompare(Type))
       {
          for (int k = 0; k < StringGrid1->ColCount; k++)
          {
            AnsiString tmp = StringGrid1->Cells[k][j];
            StringGrid1->Cells[k][j] = StringGrid1->Cells[k][i];
            StringGrid1->Cells[k][i] = tmp;
            end_index = i;
          }
          break;
       }

  return end_index + 1;
}


// ���������� �� �������
void TMapForm::SortBySizes()
{
  for (int i = 0; i < StringGrid1->RowCount; i++)
  {
     int max = i, tmp = StrToInt(StringGrid1->Cells[2][i]);
     for (int j = i + 1; j < StringGrid1->RowCount; j++)
       if (StrToInt(StringGrid1->Cells[2][j]) > tmp)
       {
          tmp = StrToInt(StringGrid1->Cells[2][j]);
          max = j;
       }
     if (max > i)
      for (int k = 0; k < StringGrid1->ColCount; k++)
      {
        AnsiString s = StringGrid1->Cells[k][max];
        StringGrid1->Cells[k][max] = StringGrid1->Cells[k][i];
        StringGrid1->Cells[k][i] = s;
      }
  }
}

// ���������� �� �������
void TMapForm::SortByAdress(int index)
{
  for (int i = index; i < StringGrid1->RowCount; i++)
  {
     unsigned int max = i, tmp = StrToInt("0x" + Trim(StringGrid1->Cells[0][i])), tmp_;
     for (int j = i + 1; j < StringGrid1->RowCount; j++)
       if ((tmp_ = StrToInt("0x" + Trim(StringGrid1->Cells[0][j]))) <= tmp)
       {
          tmp = tmp_;
          max = j;
       }
     if (max > i)
      for (int k = 0; k < StringGrid1->ColCount; k++)
      {
        AnsiString s = StringGrid1->Cells[k][max];
        StringGrid1->Cells[k][max] = StringGrid1->Cells[k][i];
        StringGrid1->Cells[k][i] = s;
      }
  }
}


// ���������� ��� ������� �� ������ HeaderControl1
void __fastcall TMapForm::HeaderControl1SectionClick(
      THeaderControl *HeaderControl, THeaderSection *Section)
{
  switch(Section->ID)
  {
    case 0: {
              SortByAdress(0);
              break;
            }
    case 1: {
              SortByType("Mapped", SortByType("Image", SortByType("Private",  SortByType("Free", 0))));
              break;
            }
    case 2: {
              SortBySizes();
              break;
            }
  }
}


// ��������� ������� �� ������ "����� ��������"
void __fastcall TMapForm::SpeedButton8Click(TObject *Sender)
{
   ProcessForm->AvailableProcesses();
   ProcessForm->ShowModal();
}
//---------------------------------------------------------------------------


// ��������� ������� �� ������ "��������"
void __fastcall TMapForm::SpeedButton2Click(TObject *Sender)
{
   ShowVirtualMemoryMap();
}
//---------------------------------------------------------------------------


// ��������� ������� �� ������ "�����"
void __fastcall TMapForm::N4Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

// ��������� ������� �� ������ "�������"
void __fastcall TMapForm::SpeedButton7Click(TObject *Sender)
{
  HelpForm->ShowModal();
}
//---------------------------------------------------------------------------

// ��������� ������� �� ������ "� ���������"
void __fastcall TMapForm::SpeedButton9Click(TObject *Sender)
{
  AboutForm->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TMapForm::StringGrid1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  int ACol, ARow;
  StringGrid1->MouseToCell(X, Y, ACol, ARow);
  if (ARow == -1) return;
  StringGrid1->Hint = "";
  for (int i = 0; i < StringGrid1->ColCount; i++)
    StringGrid1->Hint = StringGrid1->Hint + StringGrid1->Cells[i][ARow] + " "; 
}
//---------------------------------------------------------------------------



