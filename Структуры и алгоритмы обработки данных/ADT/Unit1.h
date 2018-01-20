//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TBitBtn *BitBtn1;
        TPanel *Panel1;
        TPanel *Panel2;
        TEdit *Edit2;
        TLabel *Label1;
        TLabel *Label2;
        TEdit *Edit3;
        TEdit *Edit4;
        TEdit *Edit5;
        TLabel *Label3;
        TLabel *Label4;
        TRadioButton *RadioButton1;
        TRadioButton *RadioButton2;
        TBitBtn *BitBtn3;
        TEdit *Edit7;
        TBitBtn *BitBtn4;
        TBitBtn *BitBtn5;
        TEdit *Edit8;
        TMemo *Memo1;
        TBitBtn *BitBtn6;
        TEdit *Edit9;
        TBitBtn *BitBtn7;
        TEdit *Edit10;
        TBitBtn *BitBtn8;
        TEdit *Edit11;
        TEdit *Edit12;
        TLabel *Label7;
        TLabel *Label8;
        TBitBtn *BitBtn2;
        TLabel *Label5;
        TLabel *Label6;
        TEdit *Edit1;
        TEdit *Edit6;
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall BitBtn3Click(TObject *Sender);
        void __fastcall BitBtn4Click(TObject *Sender);
        void __fastcall BitBtn5Click(TObject *Sender);
        void __fastcall BitBtn6Click(TObject *Sender);
        void __fastcall BitBtn7Click(TObject *Sender);
        void __fastcall BitBtn8Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
 