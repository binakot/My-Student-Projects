unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, jpeg, StdCtrls, Grids, Buttons;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    Label1: TLabel;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    GroupBox4: TGroupBox;
    Edit7: TEdit;
    GroupBox3: TGroupBox;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Count : integer;
  First, Last, i, j, k : integer;
  Mas : array[1..10,1..10] of integer; //������� ���������
  c,     //������� ���������� ����������
  pred,  //������ ���������� ������,
  fl,    //������ ������
  d : array[1..10] of integer; //������ ��� ������ ����

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'i/j';   
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i, j : integer;
begin
  Memo1.Lines.Clear;

  Count := StrToInt(Edit1.Text);
  StringGrid1.RowCount := Count + 1;
  StringGrid1.ColCount := Count + 1;

  for i := 1 to Count do
    begin
      StringGrid1.Cells[i,0] := 'j=' + IntToStr(i);
      StringGrid1.Cells[0,i] := 'i=' + IntToStr(i);
    end;

  StringGrid1.Cells[1,1] := '0';
  StringGrid1.Cells[2,1] := '1';
  StringGrid1.Cells[3,1] := '00';
  StringGrid1.Cells[4,1] := '00';
  StringGrid1.Cells[5,1] := '3';

  StringGrid1.Cells[1,2] := '-1';
  StringGrid1.Cells[2,2] := '0';
  StringGrid1.Cells[3,2] := '3';
  StringGrid1.Cells[4,2] := '3';
  StringGrid1.Cells[5,2] := '8';

  StringGrid1.Cells[1,3] := '-1';
  StringGrid1.Cells[2,3] := '-1';
  StringGrid1.Cells[3,3] := '0';
  StringGrid1.Cells[4,3] := '1';
  StringGrid1.Cells[5,3] := '5';

  StringGrid1.Cells[1,4] := '-1';
  StringGrid1.Cells[2,4] := '-1';
  StringGrid1.Cells[3,4] := '2';
  StringGrid1.Cells[4,4] := '0';
  StringGrid1.Cells[5,4] := '00';

  StringGrid1.Cells[1,5] := '-1';
  StringGrid1.Cells[2,5] := '-1';
  StringGrid1.Cells[3,5] := '00';
  StringGrid1.Cells[4,5] := '4';
  StringGrid1.Cells[5,5] := '0';
end;
//������� ����� ����
function GetSum : integer;
var i, res : integer;
begin
  res := Mas[First,d[1]];
  for i := 1 to j - 1 do
    res := res + Mas[d[i],d[i+1]];
  result := res;
end;
//����� ���� �����
procedure AllWay(Num : integer);
var i : integer;
    Str : String;
begin
  if Num = Last then  //���� ������� �������� �����
    begin
      Str := IntToStr(First);
      for i := 1 to j do
        Str := Str + '->' + IntToStr(d[i]);
      Form1.Memo1.Lines.Add(Str + ' = ' + IntToStr(GetSum));  //������� ���� 
      exit      //�������
    end;
  fl[Num] := 1;    //�������� �������
  for i := 1 to Count do
    if (fl[i] = 0) and (Mas[Num,i]<>100500) then
      begin
        inc(j);
        d[j] := i;     //���������� ����
        AllWay(i);
        dec(j);
      end;
    fl[Num]:=0;   //�������� ��� ������� ��������
end;
//�������� �����-��������
procedure AlgFordBellman;
var Str : String;
begin
  //��������� �������
  for i := 1 to Count do
  for j := 1 to Count do
    if (Form1.StringGrid1.Cells[j,i] = '0') OR (Form1.StringGrid1.Cells[j,i] = '-1') OR (Form1.StringGrid1.Cells[j,i] = '00') then
      Mas[i,j] := 100500
    else
      Mas[i,j] := StrToint(Form1.StringGrid1.Cells[j,i]);
  //��������� �������� � ����
  First := StrToInt(Form1.Edit5.Text);
  Last := StrToInt(Form1.Edit7.Text);
  //���������� D(1)
  for j := 1 to Count do
    begin
      c[j] := Mas[First,j];
      if Mas[first,j] < 100500 then
        pred[j] := first;  //���� ���������� ����, �� ���������� ���
    end;

  for i := 3 to Count do
  for j := 1 to Count do
    if j <> First then
      for k := 1 to Count do
        if (c[k] < 100500) AND (c[k] + Mas[k,j] < c[j]) then //���� ������� ��������� � ���� ����� ��������
          begin
            c[j] := c[k] + Mas[k,j];  //���������� ����� ��������
            pred[j] := k;             //���������� ���������� �������
          end;

  if c[Last] = 100500 then    //��������� ���� �� ������������
    Form1.Memo1.Lines.Add('���� ����������� �� �������� ���������')
  else
    begin
      Form1.Memo1.Lines.Add('���������� ����: ');
      str := IntToStr(First);
      i := Last;
      k := 1;
      while i <> First do
        begin
         d[k] := i;   //���������� ����
         inc(k);
         i := pred[i]
        end;
      for i := k-1 downto 1 do
        Str := Str + '->' + IntToStr(d[i]); //������� ���������� ����
      Form1.Memo1.Lines.Add(Str);
      Form1.Memo1.Lines.Add('��� ��������� ����: ');
      j := 0;
      AllWay(First);    //������� ��� ����
    end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add('�������� �����-��������: ');
  Memo1.Lines.Add('**************************************');
  AlgFordBellman;
  Memo1.Lines.Add('**************************************');
end;

end.
