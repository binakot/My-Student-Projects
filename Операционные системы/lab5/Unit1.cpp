//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include <process.h>

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "CGAUGES"
#pragma resource "*.dfm"
TForm1 *Form1;
bool res1,res2,res3,res4 = false;
HANDLE hEvent1,hEvent2,hEvent3;
HANDLE hSem1,hSem2;
long PrevCount;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
};
//---------------------------------------------------------------------------
void __stdcall Disable(int Num)
{
  if (Num==1) {
    Form1->Image1->Canvas->Pen->Color=clBlack;
    Form1->Image1->Canvas->Brush->Color=clGreen;
    Form1->Image1->Canvas->Rectangle(0,0,Form1->Image1->Height,Form1->Image1->Width);
    Form1->Label5->Visible = false;
    Form1->Label9->Visible = false;
  }
  else
  if (Num==2) {
    Form1->Image2->Canvas->Pen->Color=clBlack;
    Form1->Image2->Canvas->Brush->Color=clGreen;
    Form1->Image2->Canvas->Rectangle(0,0,Form1->Image2->Height,Form1->Image2->Width);
    Form1->Label6->Visible = false;
    Form1->Label10->Visible = false;
  }
  else
  if (Num==3) {
    Form1->Image3->Canvas->Pen->Color=clBlack;
    Form1->Image3->Canvas->Brush->Color=clGreen;
    Form1->Image3->Canvas->Rectangle(0,0,Form1->Image3->Height,Form1->Image3->Width);
    Form1->Label7->Visible = false;
    Form1->Label11->Visible = false;
  }
  else
  if (Num==4) {
    Form1->Image4->Canvas->Pen->Color=clBlack;
    Form1->Image4->Canvas->Brush->Color=clGreen;
    Form1->Image4->Canvas->Rectangle(0,0,Form1->Image4->Height,Form1->Image4->Width);
    Form1->Label8->Visible = false;
    Form1->Label12->Visible = false;
  };
};
//---------------------------------------------------------------------------
void __stdcall EnableNotPreor(int Num)
{
  if (Num==1) {
    Form1->Image1->Canvas->Pen->Color=clBlack;
    Form1->Image1->Canvas->Brush->Color=clYellow;
    Form1->Image1->Canvas->Rectangle(0,0,Form1->Image1->Height,Form1->Image1->Width);
    Form1->Label9->Visible = true;
  }
  else
  if (Num==2) {
    Form1->Image2->Canvas->Pen->Color=clBlack;
    Form1->Image2->Canvas->Brush->Color=clYellow;
    Form1->Image2->Canvas->Rectangle(0,0,Form1->Image2->Height,Form1->Image2->Width);
    Form1->Label10->Visible = true;
  }
  else
  if (Num==3) {
    Form1->Image3->Canvas->Pen->Color=clBlack;
    Form1->Image3->Canvas->Brush->Color=clYellow;
    Form1->Image3->Canvas->Rectangle(0,0,Form1->Image3->Height,Form1->Image3->Width);
    Form1->Label11->Visible = true;
  }
  else
  if (Num==4) {
    Form1->Image4->Canvas->Pen->Color=clBlack;
    Form1->Image4->Canvas->Brush->Color=clYellow;
    Form1->Image4->Canvas->Rectangle(0,0,Form1->Image4->Height,Form1->Image4->Width);
    Form1->Label12->Visible = true;
  };
};
//---------------------------------------------------------------------------
void __stdcall EnablePreor(int Num)
{
  if (Num==1) {
    Form1->Image1->Canvas->Pen->Color=clBlack;
    Form1->Image1->Canvas->Brush->Color=clRed;
    Form1->Image1->Canvas->Rectangle(0,0,Form1->Image1->Height,Form1->Image1->Width);
    Form1->Label5->Visible = true;
  }
  else
  if (Num==2) {
    Form1->Image2->Canvas->Pen->Color=clBlack;
    Form1->Image2->Canvas->Brush->Color=clRed;
    Form1->Image2->Canvas->Rectangle(0,0,Form1->Image2->Height,Form1->Image2->Width);
    Form1->Label6->Visible = true;
  }
  else
  if (Num==3) {
    Form1->Image3->Canvas->Pen->Color=clBlack;
    Form1->Image3->Canvas->Brush->Color=clRed;
    Form1->Image3->Canvas->Rectangle(0,0,Form1->Image3->Height,Form1->Image3->Width);
    Form1->Label7->Visible = true;
  }
  else
  if (Num==4) {
    Form1->Image4->Canvas->Pen->Color=clBlack;
    Form1->Image4->Canvas->Brush->Color=clRed;
    Form1->Image4->Canvas->Rectangle(0,0,Form1->Image4->Height,Form1->Image4->Width);
    Form1->Label8->Visible = true;
  };
};
//---------------------------------------------------------------------------
unsigned int __stdcall ThreadNotPreor(void* pParams)
{
  WaitForSingleObject( hEvent1, INFINITE );      //Ждем приоритетные потоки
  WaitForSingleObject( hSem1, INFINITE );        //ждем освобождение ресурса для любого потока
  WaitForSingleObject( hSem2, INFINITE );        //ждем освобождения ресурса для неприоритетного потока
  ResetEvent(hEvent3);                           //Есть неприоритетные потоки

  if (res1 == false) {
    res1 = true;
    EnableNotPreor(1);
    for (int i = 1; i <= Form1->CGauge1->MaxValue; i++) Form1->CGauge1->Progress = i;
    Form1->CGauge1->Progress = 0;
    Disable(1);
    res1 = false;
  }
  else
  if (res2 == false) {
    res2 = true;
    EnableNotPreor(2);
    for (int i = 1; i <= Form1->CGauge2->MaxValue; i++) Form1->CGauge2->Progress = i;
    Form1->CGauge2->Progress = 0;
    Disable(2);
    res2 = false;
  }
  else
  if (res3 == false) {
    res3 = true;
    EnableNotPreor(3);
    for (int i = 1; i <= Form1->CGauge3->MaxValue; i++) Form1->CGauge3->Progress = i;
    Form1->CGauge3->Progress = 0;
    Disable(3);
    res3 = false;
  }
  else
  if (res4 == false) {
    res4 = true;
    EnableNotPreor(4);
    for (int i = 1; i <= Form1->CGauge4->MaxValue; i++) Form1->CGauge4->Progress = i;
    Form1->CGauge4->Progress = 0;
    Disable(4);
    res4 = false;
  };                                      

  ReleaseSemaphore( hSem2, 1, &PrevCount );   //Освобождаем один ресурс от неприоритетного потока
  if (PrevCount == 3) SetEvent(hEvent3);      //Если неприоритетных больше нет, то выполняем приоритетными
  ReleaseSemaphore( hSem1, 1, NULL );         //Освобождаем один ресурс от любого потока

  return 0;
};
//---------------------------------------------------------------------------
unsigned int __stdcall ThreadPreor(void* pParams)
{
  ResetEvent(hEvent1);                          //Останавливаем неприоритетные потоки
  WaitForSingleObject( hEvent3, INFINITE );     //Ждем пока не будет неприоритетных
  WaitForSingleObject( hSem1, INFINITE );       //ждем освобождение ресурса для любого потока

  if (res1 == false) {
    res1 = true;
    EnablePreor(1);
    for (int i = 1; i <= Form1->CGauge1->MaxValue; i++) Form1->CGauge1->Progress = i;
    Form1->CGauge1->Progress = 0;
    Disable(1);
    res1 = false;
  }
  else
  if (res2 == false) {
    res2 = true;
    EnablePreor(2);
    for (int i = 1; i <= Form1->CGauge2->MaxValue; i++) Form1->CGauge2->Progress = i;
    Form1->CGauge2->Progress = 0;
    Disable(2);
    res2 = false;
  }
  else
  if (res3 == false) {
    res3 = true;
    EnablePreor(3);
    for (int i = 1; i <= Form1->CGauge3->MaxValue; i++) Form1->CGauge3->Progress = i;
    Form1->CGauge3->Progress = 0;
    Disable(3);
    res3 = false;
  }
  else
  if (res4 == false) {
    res4 = true;
    EnablePreor(4);
    for (int i = 1; i <= Form1->CGauge4->MaxValue; i++) Form1->CGauge4->Progress = i;
    Form1->CGauge4->Progress = 0;
    Disable(4);
    res4 = false;
  };

  ReleaseSemaphore( hSem1, 1, NULL );             //Освобождаем один ресурс от любого потока
  SetEvent(hEvent1);                              //Пропускаем неприоритетные потоки
  
  return 0;
};
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  DWORD thdNotPrior = _beginthreadex (NULL, 1024*1024, ThreadNotPreor, NULL, 0, NULL);
};
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  DWORD thdPrior = _beginthreadex (NULL, 1024*1024, ThreadPreor, NULL, 0, NULL);
};
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Image1->Canvas->Pen->Color=clBlack;
  Image1->Canvas->Brush->Color=clGreen;
  Image1->Canvas->Rectangle(0,0,Image1->Height,Image1->Width);
  Image2->Canvas->Pen->Color=clBlack;
  Image2->Canvas->Brush->Color=clGreen;
  Image2->Canvas->Rectangle(0,0,Image1->Height,Image1->Width);
  Image3->Canvas->Pen->Color=clBlack;
  Image3->Canvas->Brush->Color=clGreen;
  Image3->Canvas->Rectangle(0,0,Image1->Height,Image1->Width);
  Image4->Canvas->Pen->Color=clBlack;
  Image4->Canvas->Brush->Color=clGreen;
  Image4->Canvas->Rectangle(0,0,Image1->Height,Image1->Width);

  hEvent1 = CreateEvent( NULL, TRUE, TRUE, NULL );    
  hEvent2 = CreateEvent( NULL, TRUE, TRUE, NULL );
  hEvent3 = CreateEvent( NULL, TRUE, TRUE, NULL );
  hSem1 = CreateSemaphore(NULL, 4, 4, NULL);
  hSem2 = CreateSemaphore(NULL, 4, 4, NULL);
};
//---------------------------------------------------------------------------
