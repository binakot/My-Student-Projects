unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, ExtCtrls, data;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Label4: TLabel;
    Edit3: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Button4: TButton;
    Button5: TButton;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Edit7: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}
//Метод Рунге-Кутта
procedure TForm1.Button1Click(Sender: TObject);
begin
  res:= strtofloat(edit7.text);   //Получаем истинное значение
  eps:= strtofloat(edit3.text);   //Получаем точность
  x0:= strtofloat(edit5.text);    //Получаем x0
  y0:= strtofloat(edit4.text);    //Получаем y0
  Xn:= strtofloat(edit2.text);    //Получаем Xn
  Form2.ShowModal;
end;
//Метод Адамса
procedure TForm1.Button2Click(Sender: TObject);
begin
  res:= strtofloat(edit7.text);   //Получаем истинное значение
  eps:= strtofloat(edit3.text);   //Получаем точность
  x0:= strtofloat(edit5.text);    //Получаем x0
  y0:= strtofloat(edit4.text);    //Получаем y0
  Xn:= strtofloat(edit2.text);    //Получаем Xn
  Form3.ShowModal;
end;
//Сравнение методов
procedure TForm1.Button3Click(Sender: TObject);
begin
  res:= strtofloat(edit7.text);   //Получаем истинное значение
  eps:= strtofloat(edit3.text);   //Получаем точность
  x0:= strtofloat(edit5.text);    //Получаем x0
  y0:= strtofloat(edit4.text);    //Получаем y0
  Xn:= strtofloat(edit2.text);    //Получаем Xn
  Form6.ShowModal;
end;
//метод прогноза и коррекции
procedure TForm1.Button4Click(Sender: TObject);
begin
  res:= strtofloat(edit7.text);   //Получаем истинное значение
  eps:= strtofloat(edit3.text);   //Получаем точность
  x0:= strtofloat(edit5.text);    //Получаем x0
  y0:= strtofloat(edit4.text);    //Получаем y0
  Xn:= strtofloat(edit2.text);    //Получаем Xn
  Form4.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  res:= strtofloat(edit7.text);   //Получаем истинное значение
  eps:= strtofloat(edit3.text);   //Получаем точность
  x0:= strtofloat(edit5.text);    //Получаем x0
  y0:= strtofloat(edit4.text);    //Получаем y0
  Xn:= strtofloat(edit2.text);    //Получаем Xn
  Form5.ShowModal;
end;

end.
 