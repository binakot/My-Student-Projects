//---------------------------------------------------------------------------

#ifndef PMapH
#define PMapH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Chart.hpp>
#include <GanttCh.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Graphics.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TMapForm : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel2;
        TStringGrid *StringGrid1;
        TStatusBar *StatusBar1;
        TScrollBox *ScrollBox1;
        TImage *Image1;
        THeaderControl *HeaderControl1;
        TBevel *Bevel1;
        TBevel *Bevel2;
        TSpeedButton *SpeedButton2;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButton3;
        TSpeedButton *SpeedButton4;
        TBevel *Bevel3;
        TMainMenu *MainMenu1;
        TSpeedButton *SpeedButton5;
        TSpeedButton *SpeedButton6;
        TBevel *Bevel4;
        TSpeedButton *SpeedButton7;
        TSpeedButton *SpeedButton8;
        TBevel *Bevel5;
        TMenuItem *N1;
        TMenuItem *N2;
        TMenuItem *N3;
        TMenuItem *N4;
        TMenuItem *N5;
        TMenuItem *N6;
        TMenuItem *N7;
        TMenuItem *N8;
        TMenuItem *N9;
        TMenuItem *N10;
        TMenuItem *N11;
        TMenuItem *N12;
        TMenuItem *N13;
        TMenuItem *N14;
        TMenuItem *N15;
        TSpeedButton *SpeedButton9;
        TBevel *Bevel6;
        TBevel *Bevel7;
        TSpeedButton *SpeedButton10;
        TBevel *Bevel9;
        TSpeedButton *SpeedButton11;
        TBevel *Bevel8;
        TImageList *ImageList1;
        TMenuItem *N16;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall StringGrid1DrawCell(TObject *Sender, int ACol,
          int ARow, TRect &Rect, TGridDrawState State);
        void __fastcall Image1MouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
        void __fastcall Image2MouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
        void __fastcall StringGrid1SelectCell(TObject *Sender, int ACol,
          int ARow, bool &CanSelect);
        void __fastcall FormResize(TObject *Sender);
        void __fastcall HeaderControl1SectionResize(
          THeaderControl *HeaderControl, THeaderSection *Section);
        void __fastcall HeaderControl1MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall HeaderControl1SectionClick(
          THeaderControl *HeaderControl, THeaderSection *Section);
        void __fastcall SpeedButton3Click(TObject *Sender);
        void __fastcall SpeedButton4Click(TObject *Sender);
        void __fastcall SpeedButton5Click(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
//        void __fastcall SpeedButton7Click(TObject *Sender);
        void __fastcall SpeedButton6Click(TObject *Sender);
        void __fastcall SpeedButton8Click(TObject *Sender);
        void __fastcall SpeedButton10Click(TObject *Sender);
        void __fastcall SpeedButton2Click(TObject *Sender);
        void __fastcall N4Click(TObject *Sender);
        void __fastcall SpeedButton7Click(TObject *Sender);
        void __fastcall SpeedButton9Click(TObject *Sender);
        void __fastcall StringGrid1MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
private:	// User declarations
public:		// User declarations
        __fastcall TMapForm(TComponent* Owner);
        void ShowVirtualMemoryMap();
        int SortByType(AnsiString, int);
        void SortBySizes();
        void SortByAdress(int index);
};
//---------------------------------------------------------------------------
extern PACKAGE TMapForm *MapForm;
extern bool fExpandRegions;
// ID процесса
extern DWORD dwProcessId;
//---------------------------------------------------------------------------
#endif
