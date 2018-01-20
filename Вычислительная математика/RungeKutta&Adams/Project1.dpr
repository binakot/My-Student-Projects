program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  RungeKutta in 'RungeKutta.pas',
  Adams in 'Adams.pas',
  Unit2 in 'Unit2.pas' {Form2},
  data in 'data.pas',
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  PrKr in 'PrKr.pas',
  Eiler in 'Eiler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Метод Рунге-Кутта и Адамса';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
