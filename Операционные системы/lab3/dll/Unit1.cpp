//---------------------------------------------------------------------------

#include <vcl.h>
#include <windows.h>
#pragma hdrstop


#pragma argsused

extern "C" int  __declspec (dllexport) Test (int a, int b)
{
  Beep(10,10);
  return (a+b);
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fwdreason, LPVOID lpvReserved)
{
  return 1;
}
//---------------------------------------------------------------------------

