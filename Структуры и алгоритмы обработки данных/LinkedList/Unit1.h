//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TStringGrid *StringGrid1;
        TLabel *Label1;
        TEdit *Edit1;
        TSpeedButton *SpeedButton1;
        TBitBtn *BitBtn1;
        TGroupBox *GroupBox1;
        TEdit *Edit2;
        TBitBtn *BitBtn2;
        TGroupBox *GroupBox2;
        TEdit *Edit3;
        TBitBtn *BitBtn3;
        TLabel *Label2;
        TEdit *Edit4;
        TLabel *Label3;
        TBitBtn *BitBtn4;
        TBitBtn *BitBtn5;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn4Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall BitBtn3Click(TObject *Sender);
        void __fastcall BitBtn5Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
