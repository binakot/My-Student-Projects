//---------------------------------------------------------------------------

#ifndef BenchmarkH
#define BenchmarkH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TForm2 : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TEdit *Count_Element;
        TGroupBox *GroupBox1;
        TLabel *Label2;
        TLabel *Label3;
        TEdit *Time_Push_List;
        TEdit *Time_Push_Array;
        TButton *Test;
        TGroupBox *GroupBox2;
        TLabel *Label4;
        TLabel *Label5;
        TEdit *Time_Pop_List;
        TEdit *Time_Pop_Array;
        TLabel *Label6;
        TEdit *Resize_Size;
        void __fastcall TestClick(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm2 *Form2;
//---------------------------------------------------------------------------
#endif
