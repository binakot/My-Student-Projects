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
TMapForm *MapForm;  // Форма

AnsiString DOSArea =
"     Область совместимости с DOS\n\n"
" Применяется для  совместимости про-\n"
" граммам DOS и Win32. В эту область \n"
" проэцируется 1Mb адресного простра-\n"
" нства реального режима.\n"
" (только в Windows 9X.)";


AnsiString MMFArea =
"       Область MMF (Memory Mapped File)\n\n"
" Вэту область помещается код системных .DLL\n"
" (только в Windows 9X.)";


AnsiString ReserveArea =
"         Зарезервированная область памяти\n\n"
"   Предназначена для некоторых случаев\n"
"  системной блокировки.\n"
"  (только в Windows2000).";


AnsiString CodeAndDataArea =
"                                             Код и данные OS\n\n"
" В этот раздел помещается код операционной системы, в том числе\n"
" драйверы  устройств и код  низкоуровневого управления потоками,\n"
" памятью, файловой системой,  сетьевой поддержкой. Всё, что на-\n"
" ходится здесь,  доступно  любому процессу. В  Windows 2000 эти\n"
" копоненты полностью защищены. Поток, который пытается обратит-\n"
" ся по одному из адресов памяти в этом разделе, вызовет наруше-\n"
" ние доступа, а это приведёт к  тому,  что  система  в конечном\n"
" счёте просто закроет его приложение.";

AnsiString NULLPointersArea =
"     Область для хранения нулевых указателей\n\n"
" Используется для хранения нулевых указателей.\n"
" Попытка доступа в эту  область вызывает нару-\n"
" шение доступа. Компиляторы языков  программи-\n"
" рования связывают значения нулевых указателей\n"
" с данной областью.";


/*------------------- Макросы для диаграммы ----------------------------------*/

#define            LEFT_X    10  // Отступ от левого края Imag'a до начала диагаммы
#define           RIGHT_X   110  // Отступ от левого края Imag'a до конца диагаммы
#define             TOP_Y    10  // Отступ от сверхнего края Imag'a до начала диагаммы
#define          BOTTOM_Y    10  // Отступ от нижнего края Imag'a до начала диагаммы
#define               MMF    20  // Размер на диаграмме области MMF
#define           OS_DATA    20  // Размер на диаграмме области данных OS
#define     NULL_POINTERS    20  // Размер на диаграмме области NULL POINTERS
#define               DOS    20  // Размер на диаграмме области DOS
#define           RESERVE    20  // Размер на диаграмме области зарезервировано
#define        BLOCK_SIZE    11  // Размер блока на диаграмме

/*----------------------------------------------------------------------------*/


/*--------------------- Описание переменных ----------------------------------*/

CToolhelp g_toolhelp;

// Тип указателя на функцию GetMappedFileName
typedef DWORD (WINAPI* PFNGETMAPPEDFILENAME)(HANDLE, PVOID, PTSTR, DWORD);

// Указатель на функцию GetMappedFileName
PFNGETMAPPEDFILENAME g_pfnGetMappedFileName = NULL;

// Флаг, определяющий отображение расширенной информации о регионе
bool fExpandRegions;

// Указатель на список, список нужен для построения диаграммы
TList *list = new TList;

// Размер блока на диаграмме
int BSize;

// ID процесса
DWORD dwProcessId;

// Элемент описанного выше списка
struct ListItem
{
  unsigned int Adress;     // Адрес начала региона
  AnsiString RgnStorage;   // Тип региона
  ListItem(unsigned int A, AnsiString RS): Adress(A), RgnStorage(RS) {}
};

// Указатель на фнкцию, которая строит "карту памяти"
void (*BuildMap)(bool);

/*----------------------------------------------------------------------------*/

// Прототоп функции построения "карты памяти" для Windows9X
void BuildMap_For_W9X(bool IsAdress);

// Прототоп функции построения "карты памяти" для Windows2000
void BuildMap_For_W2000(bool IsAdress);


//---------------------------------------------------------------------------
__fastcall TMapForm::TMapForm(TComponent* Owner)
        : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TMapForm::FormCreate(TObject *Sender)
{
  // Установка размеров столбцов в StringGrid1
  StringGrid1->ColWidths[0] = StringGrid1->Width / 7;
  StringGrid1->ColWidths[1] = StringGrid1->Width / 10;
  StringGrid1->ColWidths[2] = StringGrid1->Width / 8;
  StringGrid1->ColWidths[3] = StringGrid1->Width / 10;
  StringGrid1->ColWidths[4] = StringGrid1->Width / 10;
  StringGrid1->ColWidths[5] = StringGrid1->Width;

  // Установка размеров секций в HeaderControl1
  for (int i = 0; i < HeaderControl1->Sections->Count; i++)
  {
    HeaderControl1->Sections->Items[i]->Width = StringGrid1->ColWidths[i];
    if (!(i % 2)) HeaderControl1->Sections->Items[i]->Width +=2;
  }

  OSVERSIONINFO verinfo = {sizeof(OSVERSIONINFO)};
  GetVersionEx(&verinfo);

  // Проверка версии OS
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

  Caption = "Карта памяти прцесса (" + (AnsiString)(tmp.szExeFile + i) + ")";

  ShowVirtualMemoryMap();
}
//---------------------------------------------------------------------------


// Формирование строки с тип региона памяти
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


// Формитование строки с атрибутами защиты
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


// Вывод информации о регионе памяти в StringGrid1
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

   if (pVMQ->fRgnIsAStack) MapForm->StringGrid1->Cells[5][RowCount] = "Стек потока";
}


// Вывод информации о блоке памяти
void OutputBlkInfo(PVMQUERY pVMQ, int RowCount)
{
   AnsiString tmp;
   MapForm->StringGrid1->Cells[0][RowCount] = "    " + tmp.IntToHex((int)pVMQ->pvBlkBaseAddress, 8);
   MapForm->StringGrid1->Cells[1][RowCount] = GetMemStorageText(pVMQ->dwBlkStorage);
   MapForm->StringGrid1->Cells[2][RowCount] = pVMQ->BlkSize;

   if (pVMQ->dwBlkStorage != MEM_FREE)
     MapForm->StringGrid1->Cells[4][RowCount] = GetProtectText(pVMQ->dwBlkProtection, TRUE);
}

// Выбор цвета
TColor SwitchColor(AnsiString s)
{
   if (!s.AnsiCompare("Reserve")) return clGreen;
   if (!s.AnsiCompare("Image"))   return clFuchsia;
   if (!s.AnsiCompare("Mapped"))  return clBlue;
   if (!s.AnsiCompare("Private")) return clGray;
   if (!s.AnsiCompare("Free"))    return clTeal;

   return clRed;
}

/*------------------------- Главная функция ----------------------------------*/

// Эта функция содержит цикл обхода регионов адресного пространства процесса
void TMapForm::ShowVirtualMemoryMap()
{
   // Отчистка StringGrid'а
   for (int i = 0; i < StringGrid1->RowCount; i++) StringGrid1->Rows[i]->Clear();
   StringGrid1->RowCount = 0;

   ScrollBox1->VertScrollBar->Position = 0;

   // Попытка загрузки библиотеки PSAPI.DLL
   HMODULE hmodPSAPI = LoadLibrary(TEXT("PSAPI"));
   if (hmodPSAPI != NULL) g_pfnGetMappedFileName = (PFNGETMAPPEDFILENAME)
                          GetProcAddress(hmodPSAPI, "GetMappedFileNameA");

   // Снимок модулей используемых процессом c идентификатором dwProcessId
   g_toolhelp.CreateSnapshot(/*TH32CS_SNAPALL*/TH32CS_SNAPMODULE, dwProcessId);

   BOOL fOk = TRUE;         // Рузультат завершения функции VMQuery
   PVOID pvAddress = NULL;  // Текущий адрес
   int Row = 0;             // Позиция строки в StringGrid'e
   list->Clear();

   // Получение дескриптора процеса
   HANDLE hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, FALSE, dwProcessId);

   // Цикл обхода регионов адресного пространства процесса
   while (fOk)
   {
      VMQUERY vmq;
      if (fOk = VMQuery(hProcess, pvAddress, &vmq))
      {
         // Вывод сведений о регионе памяти в StringGrid1
         OutputRgnInfo(hProcess, &vmq, Row++);
         // Заполнение списка для построения "Карты памяти"
         if (Row > 1 && (unsigned int)pvAddress < 0x80000000)
           if (list->Count == 0 || StringGrid1->Cells[1][Row - 1].AnsiCompare(((ListItem*)list->Items[list->Count - 1])->RgnStorage))
           {
             ListItem *new_item = new ListItem((unsigned int)pvAddress, StringGrid1->Cells[1][Row - 1]);
             list->Add(new_item);
           }

         StringGrid1->RowCount++;

         // Если установлен флаг fExpandRegions, то отображается расширенная
         // информация о регионе адресного пространства
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
         // переход к следующему региону
         pvAddress = ((PBYTE) vmq.pvRgnBaseAddress + vmq.RgnSize);
      }
   }
   StringGrid1->RowCount--;
   CloseHandle(hProcess);

   // Вызрузка библиотеки PSAPI.DLL
   if (g_pfnGetMappedFileName != NULL) FreeLibrary(g_pfnGetMappedFileName);

   // Установка размера блока на карте
   BSize = BLOCK_SIZE;
   // Построение "карты памяти"
   BuildMap(true);
}

/*----------------------------------------------------------------------------*/

// Раскраска строк в StringGrid1
void __fastcall TMapForm::StringGrid1DrawCell(TObject *Sender, int ACol,
      int ARow, TRect &Rect, TGridDrawState State)
{
   TRect r = StringGrid1->CellRect(ACol, ARow);
   StringGrid1->Canvas->Font->Color = SwitchColor(StringGrid1->Cells[1][ARow]);
   StringGrid1->Canvas->TextRect(r, r.Left + 2, r.Top += 2, StringGrid1->Cells[ACol][ARow]);
}
//---------------------------------------------------------------------------


// Отображение расширенной информации о регионе
void __fastcall TMapForm::SpeedButton10Click(TObject *Sender)
{
   fExpandRegions = SpeedButton10->Down;
   ShowVirtualMemoryMap();
}
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------

// Увеличение диаграммы
void __fastcall TMapForm::SpeedButton4Click(TObject *Sender)
{
   if (BSize >= 30) return; else ++BSize;
   if (BSize < 10) BuildMap(false); else BuildMap(true);
}
//---------------------------------------------------------------------------

// Уменьшение диаграммы
void __fastcall TMapForm::SpeedButton5Click(TObject *Sender)
{
   if (BSize < 4 || Image1->Height < ScrollBox1->Height) return; else --BSize;
   if (BSize < 10) BuildMap(false); else BuildMap(true);
}
//---------------------------------------------------------------------------

// Максимальный размер карты памяти
void __fastcall TMapForm::SpeedButton1Click(TObject *Sender)
{
   BSize = 30;
   BuildMap(true);
}
//---------------------------------------------------------------------------

// Минимальный размер карты памяти
void __fastcall TMapForm::SpeedButton3Click(TObject *Sender)
{
   if (Image1->Height == ScrollBox1->Height - 4) return;
   BSize = 3;
   BuildMap(false);
}
//---------------------------------------------------------------------------

// Размер карты по умолчанию
void __fastcall TMapForm::SpeedButton6Click(TObject *Sender)
{
   BSize = BLOCK_SIZE;
   BuildMap(true);
}
//---------------------------------------------------------------------------


/*--------------- Обработчики OnMouseDown'а на Image -------------------------*/

// Если программа запущена на платформе Windows2000
void __fastcall TMapForm::Image1MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if (X <= LEFT_X || X >= RIGHT_X || Y <= TOP_Y) return;

   int tmp = TOP_Y + NULL_POINTERS + list->Count * BSize;
   if (Y > tmp && Y <= tmp + RESERVE)              // Зарезервированная область
   {
      ShowMessage(ReserveArea);
      return;
   }
   if (Y > tmp + RESERVE && Y <= tmp + RESERVE + OS_DATA) // Область данных OS
   {
      ShowMessage(CodeAndDataArea);
      return;
   }

   if (Y > TOP_Y && Y < TOP_Y + NULL_POINTERS)         // Область NULL POINTERS
   {
      StringGrid1->Row = 0;
      ShowMessage(NULLPointersArea);
      return;
   }

   int index = 0;
   // Поиск индекса в списке list
   for (int i = TOP_Y + NULL_POINTERS; i < Image1->Height; i += BSize, index++)
     if (Y < i) break;

   if (index <= list->Count)
   {
     // Получение адреса из списка list
     AnsiString Adress = IntToHex((int)((ListItem*)list->Items[index - 1])->Adress, 8);

     // Поиск нужного адреса в StringGrid1
     for (int i = 0; i < StringGrid1->RowCount; i++)
       if (!StringGrid1->Cells[0][i].AnsiCompare(Adress))
       {
         // Установка позиции в StringGrid'е
         StringGrid1->Row = i;
         break;
       }
   }
}

// Если программа запущена на платформе Windows9X
void __fastcall TMapForm::Image2MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
   if (X < LEFT_X || X > RIGHT_X || Y < TOP_Y) return;

   int tmp = TOP_Y + NULL_POINTERS + DOS + list->Count * BSize;

   if (Y > tmp && Y <= tmp + MMF)   // Область MMF
   {
      ShowMessage(MMFArea);
      return;
   }

   if (Y > tmp + MMF && Y <= tmp + MMF + OS_DATA)  // Область данных OS
   {
      ShowMessage(CodeAndDataArea);
      return;
   }

   if (Y > TOP_Y && Y < TOP_Y + NULL_POINTERS)   // Область NULL POINTERS
   {
      StringGrid1->Row = 0;
      ShowMessage(NULLPointersArea);
      return;
   }

   if (Y > TOP_Y && Y < TOP_Y + NULL_POINTERS + DOS)   // Область DOS
   {
      StringGrid1->Row = 1;
      ShowMessage(DOSArea);
      return;
   }

   int index = 0;
   // Поиск индекса в списке list
   for (int i = TOP_Y + NULL_POINTERS + DOS; i < Image1->Height; i += BSize, index++)
     if (Y < i) break;

   if (index <= list->Count)
   {
     // Получение адреса из списка list
     AnsiString Adress = IntToHex((int)((ListItem*)list->Items[index - 1])->Adress, 8);

     // Поиск нужного адреса в StringGrid1'e
     for (int i = 0; i < StringGrid1->RowCount; i++)
       if (!StringGrid1->Cells[0][i].AnsiCompare(Adress))
       {
          // Установка позиции в StringGrid'е
          StringGrid1->Row = i;
          break;
       }
   }
}

/*----------------------------------------------------------------------------*/

// Вывод текущей строки StringGrid1'да в StatusBar1
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
   // Установка размеров столбцов в StringGrid1
   StringGrid1->ColWidths[0] = StringGrid1->Width / 7;
   StringGrid1->ColWidths[1] = StringGrid1->Width / 10;
   StringGrid1->ColWidths[2] = StringGrid1->Width / 8;
   StringGrid1->ColWidths[3] = StringGrid1->Width / 10;
   StringGrid1->ColWidths[4] = StringGrid1->Width / 10;
   StringGrid1->ColWidths[5] = StringGrid1->Width;

   // Установка размеров секций в HeaderControl1
   for (int i = 0; i < 6; i++)
   {
     HeaderControl1->Sections->Items[i]->Width = StringGrid1->ColWidths[i];
     if (!(i % 2)) HeaderControl1->Sections->Items[i]->Width +=2;
   }

   // Обновление "карты памяти"
   if (list->Count > 0) if (BSize < 10) BuildMap(false); else BuildMap(true);
}
//---------------------------------------------------------------------------


/*-------------------- Построение "карты памяти" -----------------------------*/

// Построение "карты памяти" для Windows2000
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
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, i + 5, "Зарезервировано");
   MapForm->Image1->Canvas->Rectangle(LEFT_X, i + RESERVE - 1, RIGHT_X, i + RESERVE + OS_DATA);
   MapForm->Image1->Canvas->TextOut(LEFT_X + 1, i + RESERVE + 1, "      OS Data");
   MapForm->Image1->Canvas->Brush->Color = clWhite;
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i - 6, "7FFF0000");
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i + RESERVE - 5, "80000000");
   MapForm->Image1->Canvas->TextOut(RIGHT_X + 10, i + RESERVE + OS_DATA - 5, "FFFFFFFF");
}


// Построение "карты памяти" для Windows9X
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

// Обработчик на изменение размеров секций в HeaderControl1
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


// Вывод Hint'ов при наведении курсоро мыши на секции HeaderControl1
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

// Сортировка по типу
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


// Сортировка по размеру
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

// Сортировка по адресам
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


// Сортировка при нажатии на секции HeaderControl1
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


// Обаботчик нажатия на кнопку "Выбор процесса"
void __fastcall TMapForm::SpeedButton8Click(TObject *Sender)
{
   ProcessForm->AvailableProcesses();
   ProcessForm->ShowModal();
}
//---------------------------------------------------------------------------


// Обаботчик нажатия на кнопку "Обновить"
void __fastcall TMapForm::SpeedButton2Click(TObject *Sender)
{
   ShowVirtualMemoryMap();
}
//---------------------------------------------------------------------------


// Обаботчик нажатия на кнопку "Выход"
void __fastcall TMapForm::N4Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

// Обаботчик нажатия на кнопку "Справка"
void __fastcall TMapForm::SpeedButton7Click(TObject *Sender)
{
  HelpForm->ShowModal();
}
//---------------------------------------------------------------------------

// Обаботчик нажатия на кнопку "О программе"
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



