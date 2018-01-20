unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Spin, XPMan, Grids;

  const n=50; // ���������� ����� � �������� � ���� StringGrid'a

type
  TForm1 = class(TForm)

    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    Timer1: TTimer;

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;

    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;

    Bevel1: TBevel;
    Bevel2: TBevel;

    Edit1: TEdit;

    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);

    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure Timer1Timer(Sender: TObject);

    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);

    procedure SpinEdit1Change(Sender: TObject);

    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);   

  private
  public
   // �������� ��� �������. � ������ ��������� * , �� ������ ����������� ����� �������
   mass_1, mass_2 : Array [1..n, 1..n] of String;
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

// ���������������� ��������� ��� ���������� �����
Procedure Drawing;
 var i, j, k, l : Integer;
begin
 With Form1 do
  begin

   For i := 1 to n do
   For j := 1 to n do
    begin
     Mass_2[i,j] := '0'; // ��������,
     Mass_1[i,j] := ''   // ������� �������
    end;

   For i := 0 to n-1 do
   For j := 0 to n-1 do
    If StringGrid1.Cells[j,i] = '*' then // ���� ������� * , �� � ������ mass_1 � �� �� ���������� ������ *
     mass_1[i+1,j+1] := '*';

   For i := 1 to n do
   For j := 1 to n do
    begin
     If mass_1[i,j] = '*' then // ���� ������� *, �� � ������� mass_2 ����������� ��� �������� ������ �� �������
      begin

       For k := i-1 to i+1 do
       For l := j-1 to j+1 do
        If (not (( k = i )   and ( l = j ))) and // �� ��������� ������, ��� ��������� *
                (( k > 0 )   and ( l > 0 ))  and // �� ������� �� �������  StringGrid'a
                (( k < n+1 ) and ( l < n+1 )) then
         mass_2[k,l] := IntToStr ( StrToInt( mass_2[k,l] )+1 )

      end
     end;

   For i := 1 to n do  // ��������� ������, �������� �������� ����
   For j := 1 to n do
    begin
     If mass_2[i,j] = '3' then StringGrid1.Cells[j-1,i-1] := '*';
     If (StrToInt( mass_2[i,j] ) < 2 ) or (StrToInt( mass_2[i,j] ) > 3 ) then StringGrid1.Cells[j-1,i-1] := ''
    end
  end
end;

// ���������������� ��������� ��� ������� ���� ����
Procedure Clearing;
 Var i, j : Integer;
begin
  For i := 0 to n-1 do
  For j := 0 to n-1 do
   begin

     With Form1 do
       begin
         StringGrid1.Cells[j,i] := '';
         mass_2[i+1,j+1] := '0';
         mass_1[i+1,j+1] := ''
        end

   end
end;

// ������������ ��������� � ����
procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
 Application.Minimize
end;

// �������� ���������
procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
 Close
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
 SpeedButton7.Caption := '������';
 Timer1.Enabled := not ( Timer1.Enabled )
end;

// ������� StringGrid'a
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 Clearing
end;

// �� �������� �� ������� ������� ��������� � ��������� ����� *
procedure TForm1.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 With StringGrid1 do 
   Cells[Col,Row] := '*'
end;

// ���������� ��������� �����
procedure TForm1.Timer1Timer(Sender: TObject);
begin
 SpeedButton7.Caption := '����';
 Drawing
end;

// ������\�������� �����
procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 If CheckBox1.Checked then
  StringGrid1.GridLineWidth := 0
 Else StringGrid1.GridLineWidth := 1
end;

// �������� ���������� �������� ����������� �����
procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
 If SpinEdit1.Value > 2550 then SpinEdit1.Value := 2550;
 If SpinEdit1.Value < 1 then SpinEdit1.Value := 1
end;

// �������� ��������� �������� � �����������
procedure TForm1.CheckBox2Click(Sender: TObject);
begin

 If CheckBox2.Checked // ���� ����� �������, �� ��������� �������� ...
  then
   begin
    While GroupBox1.Height < 97 do
     begin
      GroupBox1.Height := GroupBox1.Height+1; // ���������� ������ ��������
      CheckBox2.Enabled := False; // ������ ������� �����������
      Application.ProcessMessages // �������������� ����������
     end;
   end

 Else // ����� - ��������� ��������.
  begin
    While GroupBox1.Height > 0 do
     begin
      GroupBox1.Height := GroupBox1.Height-1;
      CheckBox2.Enabled := False;
      Application.ProcessMessages
     end
   end;

 CheckBox2.Enabled := True // ������ ������� ���������
end;


// ��������� ���������� �����
procedure TForm1.SpeedButton4Click(Sender: TObject);
 Label restart;
Var kol_zap, i, j : Integer;
begin
 Randomize;
 If SpeedButton7.Caption<>'������' then ShowMessage('���� "�����" ��� ��������')

  Else
   begin
    While kol_zap < SpinEdit1.Value do
     begin

restart :  i := random(n);
           j := random(n);

           If StringGrid1.Cells[i,j] <> '' then goto restart;
            StringGrid1.Cells[i,j] := '*';
           inc(kol_zap)

     end
   end
end;

// ������ ���������, ���� ������ ������ � ������� ����� �����
// ������� ����
procedure TForm1.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 With StringGrid1 do
  If Cells[Col,Row] = '' then Cells[Col,Row] := '*'
   Else Cells[Col,Row] := ''
end;

// ������ �������� ��������� ���������� ��������
procedure TForm1.Edit1Change(Sender: TObject);
begin
 Timer1.Interval := StrToInt( Edit1.Text )
end;

// ������ �� ���� �� �������� ���������� � �������� Edit
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8] ) then key := #0
end;

end.
