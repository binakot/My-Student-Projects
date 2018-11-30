unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Unit2, Unit3;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  N : integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'i/j';
  N := 5;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i : integer;
    Str : String;
begin
  Memo1.Lines.Clear;
  BitBtn3.Enabled := true;
  BitBtn2.Enabled := true;

  N := StrToInt(Edit1.Text);
  StringGrid1.RowCount := N + 1;
  StringGrid1.ColCount := N + 1;
  Form2.StringGrid1.RowCount := N + 1;
  Form2.StringGrid1.ColCount := N + 1;

  for i := 1 to N do
    begin
      StringGrid1.Cells[i,0] := 'j=' + IntToStr(i);
      StringGrid1.Cells[0,i] := 'i=' + IntToStr(i);
    end;

  StringGrid1.Cells[1,1] := '0';
  StringGrid1.Cells[2,1] := '1';
  StringGrid1.Cells[3,1] := '0';
  StringGrid1.Cells[4,1] := '0';
  StringGrid1.Cells[5,1] := '1';

  StringGrid1.Cells[1,2] := '1';
  StringGrid1.Cells[2,2] := '0';
  StringGrid1.Cells[3,2] := '1';
  StringGrid1.Cells[4,2] := '1';
  StringGrid1.Cells[5,2] := '1';

  StringGrid1.Cells[1,3] := '0';
  StringGrid1.Cells[2,3] := '0';
  StringGrid1.Cells[3,3] := '1';
  StringGrid1.Cells[4,3] := '1';
  StringGrid1.Cells[5,3] := '0';

  StringGrid1.Cells[1,4] := '1';
  StringGrid1.Cells[2,4] := '0';
  StringGrid1.Cells[3,4] := '1';
  StringGrid1.Cells[4,4] := '0';
  StringGrid1.Cells[5,4] := '0';

  StringGrid1.Cells[1,5] := '1';
  StringGrid1.Cells[2,5] := '0';
  StringGrid1.Cells[3,5] := '0';
  StringGrid1.Cells[4,5] := '1';
  StringGrid1.Cells[5,5] := '0';

  Memo1.Lines.Add('Множество альтернатив Q состоит из ' + IntToStr(N) + ' элементов: ');
  Str := 'Q = {';
  for i := 1 to N - 1 do
    Str := Str + IntToStr(i) + ', ';
  Str := Str + IntToStr(N) + '}';
  Memo1.Lines.Add(Str);
  Memo1.Lines.Add('На множестве альтернатив Q задано бинарное отношение R');
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i, j : integer;
    Str : String;
begin
  Panel1.Enabled := true;
  GroupBox1.Enabled := true;
  //Корректировка ввода
  for i := 1 to N do
  for j := 1 to N do
    if StringGrid1.Cells[i,j] = '' then
      StringGrid1.Cells[i,j] := '0'
    else if StrToInt(StringGrid1.Cells[i,j]) < 0 then
      StringGrid1.Cells[i,j] := '0'
    else if StrToInt(StringGrid1.Cells[i,j]) > 1 then
      StringGrid1.Cells[i,j] := '1';
  //Вывод бинарного отношения
  Str := '(';
  for i := 1 to N do
  for j := 1 to N do
    if StringGrid1.Cells[i,j] = '1' then
      Str := Str + IntToStr(i) + 'R' + IntToStr(j) + '), (';
  Delete(Str,Length(Str) - 2,3);
  Memo1.Lines.Add(Str);    
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var i, j : integer;
begin
  for i := 1 to N do
  for j := 1 to N do
    StringGrid1.Cells[i,j] := IntToStr(Random(2));
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var Num, i : integer;
    Str : String;
begin
  Num := StrToInt(Edit2.Text);
  if (Num > N) OR (Num < 1) then
    Memo1.Lines.Add('Элемент отсутствует в множестве Q')
  else
  if Num = 1 then
    Memo1.Lines.Add('R-(1) = 0')
  else
    begin
      Str := 'R-(' + IntToStr(Num) + ') = {';
      for i := 1 to Num - 1 do
        Str := Str + IntToStr(i) + ', ';
      Delete(Str,Length(Str)-1,2);
      Str := Str + '}';
      Memo1.Lines.Add(Str);
    end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var Num, i : integer;
    Str : String;
begin
  Num := StrToInt(Edit2.Text);
  if (Num > N) OR (Num < 1) then
    Memo1.Lines.Add('Элемент отсутствует в множестве Q')
  else
  if Num = N then
    Memo1.Lines.Add('R+(' + IntToStr(Num) + ') = 0')
  else
    begin
      Str := 'R+(' + IntToStr(Num) + ') = {';
      for i := Num + 1 to N do
        Str := Str + IntToStr(i) + ', ';
      Delete(Str,Length(Str)-1,2);
      Str := Str + '}';
      Memo1.Lines.Add(Str);
    end; 
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var i, j : integer;
begin
  for i := 1 to N do
  for j := 1 to N do
    Form2.StringGrid1.Cells[i,j] := IntToStr(1 - StrToInt(StringGrid1.Cells[i,j]));
  Form2.Show;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var i, j : integer;
begin
  for i := 1 to N do
  for j := 1 to N do
    Form2.StringGrid1.Cells[i,j] := StringGrid1.Cells[j,i];
  Form2.Show;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var i, j : integer;
begin
  for i := 1 to N do
  for j := 1 to N do
    Form2.StringGrid1.Cells[i,j] := StringGrid1.Cells[j,i];
  for i := 1 to N do
  for j := 1 to N do
    Form2.StringGrid1.Cells[i,j] := IntToStr(1 - StrToInt(Form2.StringGrid1.Cells[i,j]));
  Form2.Show;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
var i, j, k, k1 : integer;
    check : boolean;
begin
  Form3.Show;
  //Рефлексивность
  check := true;
  for i := 1 to N do
  for j := 1 to N do
    if i = j then
      if StringGrid1.Cells[i,j] <> '1' then
        begin
          check := false;
          break
        end;
  Form3.CheckBox1.Checked := check;
  //Антирефлексивность
  check := true;
  for i := 1 to N do
  for j := 1 to N do
    if i = j then
      if StringGrid1.Cells[i,j] <> '0' then
        begin
          check := false;
          break
        end;
  Form3.CheckBox2.Checked := check;
  //Симметричность
  check := true;
  for i := 1 to N do
  for j := 1 to N do
    if i <> j then
      if StringGrid1.Cells[i,j] <> StringGrid1.Cells[j,i] then
        begin
          check := false;
          break
        end;
  Form3.CheckBox3.Checked := check;
  //Асимметричность
  for i := 1 to N do
  for j := 1 to N do
    Form2.StringGrid1.Cells[i,j] := StringGrid1.Cells[j,i];
  check := true;
  for i := 1 to N do
  for j := 1 to N do
    if StringGrid1.Cells[i,j] = Form2.StringGrid1.Cells[i,j] then
      begin
        check := false;
        break
      end;
  Form3.CheckBox4.Checked := check;
  //Антисимметричность
  check := true;
  for i := 1 to N do
  for j := 1 to N do
    if i <> j then
      if (StringGrid1.Cells[i,j] = StringGrid1.Cells[j,i]) AND (StringGrid1.Cells[i,j] = '1') then
        begin
          check := false;
          break
        end;
  Form3.CheckBox5.Checked := check;
  //Транзитивность
  k1 := 0;
  Check := False;
  for i := 1 to N do
  for j := 1 to N do
    begin
      k1 := k1 + StrToInt(StringGrid1.Cells[i,j]);
      if i <> j then
        for k := 1 to N do
          if (i <> k) and (j <> k) then
            if (StrToInt(StringGrid1.Cells[i,j]) = StrToInt(StringGrid1.Cells[j,k])) and (StrToInt(StringGrid1.Cells[j,k]) = StrToInt(StringGrid1.Cells[i,k])) and (StrToInt(StringGrid1.Cells[i,k]) = 1) then
              Check := True
            else if (StrToInt(StringGrid1.Cells[i,j]) = StrToInt(StringGrid1.Cells[j,k])) and (StrToInt(StringGrid1.Cells[j,k]) = 1) and (StrToInt(StringGrid1.Cells[i,k]) = 0) then
              begin
                Check := False;
                break;
              end;
    end;
  Form3.CheckBox6.Checked := check;
  //Ацикличность
  check := false;
  for k := 1 to n do
  for i := 1 to n do
  for j := 1 to n do
    begin
      k1 := StrToInt(StringGrid1.Cells[i,k]) or StrToInt(StringGrid1.Cells[k,j]);
      Form2.StringGrid1.Cells[i,j] := IntToStr(k1);
    end;
  for i := 1 to n do
    if Form2.StringGrid1.Cells[i,i] = '1' then
      check := true;   
  Form3.CheckBox7.Checked := check;
end;

end.
