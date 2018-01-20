//---------------------------------------------------------------------------

#ifndef Queue_ExampleH
#define Queue_ExampleH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TStringGrid *Elements_Table;
        TGroupBox *GroupBox2;
        TLabel *Label1;
        TGroupBox *GroupBox3;
        TRadioButton *RadioButton1;
        TRadioButton *RadioButton2;
        TEdit *Edit1;
        TButton *Insert_Button;
        TGroupBox *GroupBox4;
        TButton *Pop_Button;
        TGroupBox *GroupBox5;
        TButton *Clear_Button;
        TButton *Size_Button;
        TEdit *Size_Edit;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Insert_ButtonClick(TObject *Sender);
        void __fastcall Pop_ButtonClick(TObject *Sender);
        void __fastcall Clear_ButtonClick(TObject *Sender);
        void __fastcall Size_ButtonClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
