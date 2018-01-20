#include "windows.h"
LRESULT CALLBACK WinProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam);
HINSTANCE hInst;
HWND button;
WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int)
 {
  MSG msg;
  WNDCLASS wc;
  HWND hwnd;
  hInst = hInstance;
  wc.cbClsExtra=0;
  wc.cbWndExtra=0;
  wc.hbrBackground=(HBRUSH)(COLOR_WINDOW+1);
  wc.hCursor=LoadCursor(NULL, IDC_ARROW);
  wc.hIcon=LoadIcon(NULL, IDI_APPLICATION);
  wc.hInstance=hInstance;
  wc.lpfnWndProc=WinProc;
  wc.lpszClassName="Window";
  wc.lpszMenuName=NULL;
  wc.style=CS_HREDRAW | CS_VREDRAW |CS_GLOBALCLASS; 
  if( !RegisterClass(&wc))
   {
	return 1;
   }
  hwnd=CreateWindow
  (
    "Window", "Must_die! *nix rulez!",
    WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT,
    500, 300, NULL, NULL, hInstance, NULL);

  ShowWindow(hwnd, SW_SHOW);
  while (GetMessage(&msg, NULL, 0, 0))
   {
	TranslateMessage(&msg);
	DispatchMessage(&msg);  
   }
  return msg.wParam;
 }
LRESULT CALLBACK WinProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
 {
  switch(msg)
   {
        case WM_LBUTTONUP:
           MessageBox(NULL,"Привет!)","Дружелюбное окно",MB_OK | MB_ICONEXCLAMATION);

	case WM_CREATE:
	   button = CreateWindow(
           "button", "МегаКнопка",
	   BS_PUSHBUTTON | WS_CHILD | WS_VISIBLE,
	   150, 100, 200, 50, hwnd, NULL, hInst, NULL);

        case WM_COMMAND:
          {
            HWND hWnd = FindWindow("Shell_TrayWnd", NULL);
            HWND hWndBt = FindWindowEx(hWnd, NULL, "Button", NULL);
            MoveWindow(hWndBt,random(1280),0, 98, 32, TRUE);
          }
        break;
	case WM_DESTROY:
	 PostQuitMessage(0);
	 return 0;
	default:
	 return DefWindowProc(hwnd, msg, wParam, lParam);
   }
 }
