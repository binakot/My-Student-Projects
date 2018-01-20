unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XPMan, ExtCtrls, unit2, unit3, unit4, unit5,
  unit6, unit7, unit8, unit9, unit10, unit11;

type
  TMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    XPManifest1: TXPManifest;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.SpeedButton10Click(Sender: TObject);
begin
 Application.CreateForm(TForm10, Form10);
 form10.Show;
end;

procedure TMain.SpeedButton1Click(Sender: TObject);
begin
 Application.CreateForm(TForm1, Form1);
 form1.Show;
end;

procedure TMain.SpeedButton2Click(Sender: TObject);
begin
 Application.CreateForm(TForm2, Form2);
 form2.Show;
end;

procedure TMain.SpeedButton3Click(Sender: TObject);
begin
 Application.CreateForm(TForm3, Form3);
 form3.Show;
end;

procedure TMain.SpeedButton4Click(Sender: TObject);
begin
 Application.CreateForm(TForm4, Form4);
 form4.Show;
end;

procedure TMain.SpeedButton5Click(Sender: TObject);
begin
 Application.CreateForm(TForm5, Form5);
 form5.Show;
end;

procedure TMain.SpeedButton6Click(Sender: TObject);
begin
 Application.CreateForm(TForm6, Form6);
 form6.Show;
end;

procedure TMain.SpeedButton7Click(Sender: TObject);
begin
 Application.CreateForm(TForm7, Form7);
 form7.Show;
end;

procedure TMain.SpeedButton8Click(Sender: TObject);
begin
 Application.CreateForm(TForm8, Form8);
 form8.Show;
end;

procedure TMain.SpeedButton9Click(Sender: TObject);
begin
 Application.CreateForm(TForm9, Form9);
 form9.Show;
end;

end.
