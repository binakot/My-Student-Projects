program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Main},
  Unit2 in 'Unit2.pas' {Form1},
  Unit3 in 'Unit3.pas' {Form2},
  Unit4 in 'Unit4.pas' {Form3},
  Unit5 in 'Unit5.pas' {Form4},
  Unit6 in 'Unit6.pas' {Form5},
  Unit7 in 'Unit7.pas' {Form6},
  Unit8 in 'Unit8.pas' {Form7},
  Unit9 in 'Unit9.pas' {Form8},
  Unit10 in 'Unit10.pas' {Form9},
  Unit11 in 'Unit11.pas' {Form10};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
