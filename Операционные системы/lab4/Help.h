//---------------------------------------------------------------------------

#ifndef HelpH
#define HelpH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class THelpForm : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel4;
        TLabel *Label1;
        TLabel *Label2;
        TPanel *Panel1;
        TLabel *Label4;
        TLabel *Label6;
        TLabel *Label5;
        TLabel *Label7;
        TLabel *Label3;
        TStaticText *StaticText1;
        TStaticText *StaticText6;
        TStaticText *StaticText2;
        TStaticText *StaticText7;
        TStaticText *StaticText3;
        TStaticText *StaticText8;
        TStaticText *StaticText4;
        TStaticText *StaticText9;
        TStaticText *StaticText5;
        TStaticText *StaticText10;
        TBitBtn *BitBtn1;
private:	// User declarations
public:		// User declarations
        __fastcall THelpForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THelpForm *HelpForm;
//---------------------------------------------------------------------------
#endif
