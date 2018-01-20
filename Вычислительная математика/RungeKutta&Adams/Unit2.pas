unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Buttons, Grids, data, RungeKutta, math;

type
  TForm2 = class(TForm)
    XPManifest1: TXPManifest;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2; 

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin 
  with StringGrid1 do
    begin
      Cells[0,0]:= 'i';
      Cells[1,0]:= 'X(i)';
      Cells[2,0]:= 'Y(i)';
      Cells[3,0]:= 'k1';
      Cells[4,0]:= 'k2';
      Cells[5,0]:= 'k3';
      Cells[6,0]:= 'k4'
    end
end;
//���������� ���
procedure TForm2.RadioButton4Click(Sender: TObject);
begin
  edit1.Text:= '0,001';         //��� �� ���������
  edit1.visible:= true;
  label1.Visible:= true;
  button1.Visible:= true
end;
//�������
procedure TForm2.RadioButton3Click(Sender: TObject);
begin
  edit1.visible:= false;
  label1.Visible:= false;
  button1.Visible:= false
end;
//������������� ��� h = eps^(1/4)
procedure TForm2.Button1Click(Sender: TObject);
begin
  edit1.Text:= floattostr(sqrt(sqrt(StrToFloat(Form1.edit3.text))))
end;
//������
procedure TForm2.BitBtn1Click(Sender: TObject);
var k1, k2, k3, k4,     //������������
    x, y: extended;         //����������
    going: boolean;     //����������� ��������
    i: integer;         //�������
begin 
  i:= 0;                //��� = 0
  x:= x0;               //���������� x �� ���������� �������
  y:= y0;               //���������� y �� ���������� �������
  //�������� ���
  if radiobutton3.Checked then
    h:= 0.001
  else
    h:= strtofloat(edit1.text);
  going:= true;                //���������� �������
  if (RadioButton1.Checked) then        //���� 3 �������
  begin
    if (RadioButton4.Checked) then          //���� ���������� ���
    begin
      ClearGrid(StringGrid1);
      StringGrid1.Cells[0,1]:= FloatToStr(i);
      StringGrid1.Cells[1,1]:= FloatToStr(x);
      StringGrid1.Cells[2,1]:= FloatToStr(y);
      while (going) do      //�������� �������
        begin
          going:= RungeKutta3ConstStep(k1, k2, k3, x, y);
          StringGrid1.Cells[3,i+1]:= FloatToStr(k1);
          StringGrid1.Cells[4,i+1]:= FloatToStr(k2);
          StringGrid1.Cells[5,i+1]:= FloatToStr(k3);
          inc(i);
          StringGrid1.RowCount := i + 2;
          StringGrid1.Cells[0,i+1]:= FloatToStr(i);
          StringGrid1.Cells[1,i+1]:= FloatToStr(x);
          StringGrid1.Cells[2,i+1]:= FloatToStr(y)
        end;
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[1,i+2]:= '��������:';
      StringGrid1.Cells[2,i+2]:= 'Yn = ';
      StringGrid1.Cells[3,i+2]:= FloatToStr(res);
      StringGrid1.Cells[4,i+2]:= 'Yn - Y = ';
      StringGrid1.Cells[5,i+2]:= FloatToStr(RoundTo(abs(res-y),-18))
    end
    else
    if (RadioButton3.Checked) then          //���� �������������� ���
      begin
        ClearGrid(StringGrid1);
        StringGrid1.Cells[0,1]:= FloatToStr(i);
        StringGrid1.Cells[1,1]:= FloatToStr(x);
        StringGrid1.Cells[2,1]:= FloatToStr(y);
        while (going) do    //�������� �������
          begin
            going:= RungeKutta3AutoStep(k1, k2, k3, x, y);
            StringGrid1.Cells[3,i+1]:= FloatToStr(k1);
            StringGrid1.Cells[4,i+1]:= FloatToStr(k2);
            StringGrid1.Cells[5,i+1]:= FloatToStr(k3);
            inc(i);
            StringGrid1.RowCount := i + 2;
            StringGrid1.Cells[0,i+1]:= FloatToStr(i);
            StringGrid1.Cells[1,i+1]:= FloatToStr(x);
            StringGrid1.Cells[2,i+1]:= FloatToStr(y)
          end;
        StringGrid1.RowCount := StringGrid1.RowCount + 1;
        StringGrid1.Cells[1,i+2]:= '��������:';
        StringGrid1.Cells[2,i+2]:= 'Yn = ';
        StringGrid1.Cells[3,i+2]:= FloatToStr(res);
        StringGrid1.Cells[4,i+2]:= 'Yn - Y = ';
        StringGrid1.Cells[5,i+2]:= FloatToStr(RoundTo(abs(res-y),-18))
      end
  end
  else
  if (RadioButton2.Checked) then        //���� 4 �������
  begin
    if (RadioButton4.Checked) then          //���� ���������� ���
    begin
      ClearGrid(StringGrid1);
      StringGrid1.Cells[0,1]:= FloatToStr(i);
      StringGrid1.Cells[1,1]:= FloatToStr(x);
      StringGrid1.Cells[2,1]:= FloatToStr(y);
      while (going) do     //�������� �������
        begin
          going := RungeKutta4ConstStep(k1, k2, k3, k4, x, y);
          StringGrid1.Cells[3,i+1]:= FloatToStr(k1);
          StringGrid1.Cells[4,i+1]:= FloatToStr(k2);
          StringGrid1.Cells[5,i+1]:= FloatToStr(k3);
          StringGrid1.Cells[6,i+1]:= FloatToStr(k4);
          inc(i);
          StringGrid1.RowCount := i + 2;
          StringGrid1.Cells[0,i+1]:= FloatToStr(i);
          StringGrid1.Cells[1,i+1]:= FloatToStr(x);
          StringGrid1.Cells[2,i+1]:= FloatToStr(y)
        end;
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[1,i+2]:= '��������:';
      StringGrid1.Cells[2,i+2]:= 'Yn = ';
      StringGrid1.Cells[3,i+2]:= FloatToStr(res);
      StringGrid1.Cells[4,i+2]:= 'Yn - Y = ';
      StringGrid1.Cells[5,i+2]:= FloatToStr(RoundTo(abs(res-y),-18))
    end
    else
    if (RadioButton3.Checked) then          //���� �������������� ���
    begin
      ClearGrid(StringGrid1);
      StringGrid1.Cells[0,1]:= FloatToStr(i);
      StringGrid1.Cells[1,1]:= FloatToStr(x);
      StringGrid1.Cells[2,1]:= FloatToStr(y);
      while (going) do     //�������� �������
        begin
          going := RungeKutta4AutoStep(k1, k2, k3, k4, x, y);
          StringGrid1.Cells[3,i+1]:= FloatToStr(k1);
          StringGrid1.Cells[4,i+1]:= FloatToStr(k2);
          StringGrid1.Cells[5,i+1]:= FloatToStr(k3);
          StringGrid1.Cells[6,i+1]:= FloatToStr(k4);
          inc(i);
          StringGrid1.RowCount := i + 2;
          StringGrid1.Cells[0,i+1]:= FloatToStr(i);
          StringGrid1.Cells[1,i+1]:= FloatToStr(x);
          StringGrid1.Cells[2,i+1]:= FloatToStr(y)
        end;
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[1,i+2]:= '��������:';
      StringGrid1.Cells[2,i+2]:= 'Yn = ';
      StringGrid1.Cells[3,i+2]:= FloatToStr(res);
      StringGrid1.Cells[4,i+2]:= 'Yn - Y = ';
      StringGrid1.Cells[5,i+2]:= FloatToStr(RoundTo(abs(res-y),-18))
    end
  end

end;

end.
