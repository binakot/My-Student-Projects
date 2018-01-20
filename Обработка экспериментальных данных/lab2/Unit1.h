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
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TStringGrid *StringGrid1;
        TGroupBox *GroupBox2;
        TLabel *Label1;
        TEdit *Edit1;
        TLabel *Label2;
        TEdit *Edit2;
        TGroupBox *GroupBox3;
        TLabel *Label3;
        TLabel *Label4;
        TEdit *Edit3;
        TEdit *Edit4;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TGroupBox *GroupBox4;
        TStringGrid *StringGrid2;
        TGroupBox *GroupBox5;
        TLabel *Label5;
        TEdit *Edit5;
        TLabel *Label6;
        TEdit *Edit6;
        TLabel *Label7;
        TEdit *Edit7;
        TEdit *Edit8;
        TLabel *Label8;
        TLabel *Label9;
        TEdit *Edit9;
        TLabel *Label10;
        TEdit *Edit10;
        TLabel *Label11;
        TEdit *Edit11;
        TGroupBox *GroupBox6;
        TLabel *Label12;
        TEdit *Edit12;
        TLabel *Label13;
        TEdit *Edit13;
        TLabel *Label14;
        TEdit *Edit14;
        TEdit *Edit15;
        TLabel *Label15;
        TEdit *Edit16;
        TEdit *Edit17;
        TChart *Chart1;
        TFastLineSeries *Series1;
        TFastLineSeries *Series2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
