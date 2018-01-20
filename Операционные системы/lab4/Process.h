//---------------------------------------------------------------------------

#ifndef ProcessH
#define ProcessH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Chart.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Series.hpp>
#include <TeeFunci.hpp>
#include <Grids.hpp>
#include <Menus.hpp>
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <ImgList.hpp>
#include <Buttons.hpp>
//#include "RxGrdCpt.hpp"
//---------------------------------------------------------------------------
class TProcessForm : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TStringGrid *StringGrid1;
        TSpeedButton *SpeedButton2;
        TSpeedButton *SpeedButton3;
        TSpeedButton *SpeedButton5;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall SpeedButton2Click(TObject *Sender);
        void __fastcall SpeedButton3Click(TObject *Sender);
        void __fastcall SpeedButton5Click(TObject *Sender);
        void __fastcall StringGrid1DrawCell(TObject *Sender, int ACol,
          int ARow, TRect &Rect, TGridDrawState State);
private:	// User declarations
public:		// User declarations
        __fastcall TProcessForm(TComponent* Owner);
        void AvailableProcesses();        
};
//---------------------------------------------------------------------------
extern PACKAGE TProcessForm *ProcessForm;
//---------------------------------------------------------------------------
#endif
