//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("ProcessMap.res");
USEFORM("Process.cpp", ProcessForm);
USEFORM("PMap.cpp", MapForm);
USEUNIT("VMQuery.cpp");
USEFORM("Help.cpp", HelpForm);
USEFORM("About.cpp", AboutForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TMapForm), &MapForm);
                 Application->CreateForm(__classid(TProcessForm), &ProcessForm);
                 Application->CreateForm(__classid(THelpForm), &HelpForm);
                 Application->CreateForm(__classid(TAboutForm), &AboutForm);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
