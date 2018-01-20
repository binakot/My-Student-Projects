program MatrixLab;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  detA in 'detA.pas',
  treugol in 'treugol.pas',
  MulMatrixN in 'MulMatrixN.pas',
  Data in 'Data.pas',
  ObratMatrix in 'ObratMatrix.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
