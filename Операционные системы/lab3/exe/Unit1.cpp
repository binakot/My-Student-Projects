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

/* ����������, ����������� ����� ���������� DLL, ������ ��������� ���������
   ���� ��������:
   - �������� DLL (����� LoadLibrary())
   - ��������� ������ ������ ������� (����� GetProcAddress())
   - �������� DLL (����� FreeLibrary()) */

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  // ���������� hMod �������� ������������  DLL
   HMODULE hMod = LoadLibrary ("project1.dll");

   // ���� ���������� ����������� DLL = NULL, ������ �������� �� �������
   if (!hMod)
     MessageBox (NULL, "������ �������� dll!", "������!", MB_OK | MB_ICONEXCLAMATION);

   // ��������� ������ �������
   pfn addr = (pfn)GetProcAddress (hMod, "_Test");

   // ���� ������� ������� �����, ������ ������� � ����� ������ �� ������� ��� ����������� � DLL
   if (!addr)
     MessageBox (NULL, "������ ��������� ������ �������!", "������!", MB_OK | MB_ICONEXCLAMATION);

   // ����� ������� �� �� ������ � ��������� ������, ������� ���������� Test()
   a=StrToInt(Edit1->Text);
   b=StrToInt(Edit2->Text);
   int c = (*addr)(a,b);
   Edit3->Text=IntToStr(c);
   
   // �������� ����� �� ������ ���������� DLL
   FreeLibrary (hMod);
}
//---------------------------------------------------------------------------
