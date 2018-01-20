unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  R : real;
  massX : array[1..1000] of integer;
  massY : array[1..1000] of integer;
  Limit : boolean;
  N, n1, n2, h : integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Create;
  Randomize;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.MoveTo(250,0);
  Image1.Canvas.LineTo(250,400);
  Limit := true;
  Image1.Canvas.Rectangle(140,190,160,210);
  Image1.Canvas.Rectangle(340,190,360,210);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  if BitBtn4.Caption = 'Убрать перегородку' then
    begin
      Limit := false;
      BitBtn4.Caption := 'Поставить перегородку';
      Image1.Canvas.Pen.Color := clWhite;
      Image1.Canvas.MoveTo(250,0);
      Image1.Canvas.LineTo(250,400);
    end
  else
    begin
      Limit := true;
      BitBtn4.Caption := 'Убрать перегородку';
      Image1.Canvas.Pen.Color := clBlack;
      Image1.Canvas.MoveTo(250,0);
      Image1.Canvas.LineTo(250,400);
    end
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Limit := true;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.MoveTo(250,0);
  Image1.Canvas.LineTo(250,400);
  BitBtn4.Caption := 'Убрать перегородку';
  Image1.Canvas.Rectangle(140,190,160,210);
  Image1.Canvas.Rectangle(340,190,360,210);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i : integer;
begin
  N := StrToInt(Edit1.Text);
  n1 := Round(N/2);
  n2 := N - n1;
  For i := 1 to n1 do
    begin
      massX[i] := Random(20) + 140;
      massY[i] := Random(20) + 190;
    end;
  For i := (n1 + 1) to N do
    begin
      massX[i] := Random(20) + 340;
      massY[i] := Random(20) + 190;
    end;
  For i := 1 to N do
    begin
      if i<=n1 then Image1.Canvas.Pen.Color := clBlue
      else Image1.Canvas.Pen.Color := clRed;
      Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2,massX[i]+2,massY[i]+2);
    end;
end;

function wall(ii : integer; RR : real; Limited : boolean) : boolean;
begin
  if Limited = false then
    begin
      result := true;
      exit
    end;
  if ii<=n1 then
    begin
      if (RR>0)and(RR<=0.25) then
        if massX[ii] + h >= 250 then
          begin
            result := false;
            exit
          end
    end
  else
    begin
      if (RR>0.25)and(RR<=0.5) then
        if massX[ii] - h <= 250 then
          begin
            result := false;
            exit
          end
    end
end;

function Border(ii : integer; RR : real) : boolean;
begin
  result := true;
  if (RR>0)and(RR<=0.25) then
    begin
      if massX[ii] + h >= Form1.Image1.Width then
        begin
          result := false;
          exit
        end
    end
  else if (RR>0.25)and(RR<=0.5) then
    if massX[ii] - h <= 0 then
      begin
        result := false;
        exit
      end
  else if (RR>0.5)and(RR<=0.75) then
    if massY[ii] + h >= Form1.Image1.Height then
      begin
        result := false;
        exit
      end
  else if (RR>0.75)and(RR<=1) then
    if massY[ii] - h <= 0 then
      begin
        result := false;
        exit
      end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i : integer;
    CurColor : TColor;
begin
  for i := 1 to N do
    begin
      Image1.Refresh;
      Image1.Canvas.Pen.Color := clBlack;
      if Limit = true then
        begin
          Image1.Canvas.MoveTo(250,0);
          Image1.Canvas.LineTo(250,400);
        end;
      Image1.Canvas.Rectangle(140,190,160,210);
      Image1.Canvas.Rectangle(340,190,360,210);
      h := Random(30);
      R := Random;
      Image1.Canvas.Pen.Color := clWhite;
      Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2,massX[i]+2,massY[i]+2);
      if i<=n1 then Image1.Canvas.Pen.Color := clBlue
      else Image1.Canvas.Pen.Color := clRed;
      if R = 0 then Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2,massX[i]+2,massY[i]+2)
      else if Border(i, R) and wall(i, R, Limit) then
        begin
          if (R>0)and(R<=0.25) then
            begin
              Image1.Canvas.Rectangle(massX[i]-2+h,massY[i]-2,massX[i]+2+h,massY[i]+2);
              massX[i] := massX[i] + h
            end
          else if (R>0.25)and(R<=0.5) then
            begin
              Image1.Canvas.Rectangle(massX[i]-2-h,massY[i]-2,massX[i]+2-h,massY[i]+2);
              massX[i] := massX[i] - h
            end
          else if (R>0.5)and(R<=0.75) then
            begin
              Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2+h,massX[i]+2,massY[i]+2+h);
              massY[i] := massY[i] + h
            end
          else if (R>0.75)and(R<=1) then
            begin
              Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2-h,massX[i]+2,massY[i]+2-h);
              massY[i] := massY[i] - h
            end
        end
    end
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var i, j, k : integer;
    CurColor : TColor;
begin
  k := StrToInt(Edit2.Text);
  for j := 1 to k do
    begin
      for i := 1 to N do
        begin
          Image1.Refresh;
          Image1.Canvas.Pen.Color := clBlack;
          if Limit = true then
            begin
              Image1.Canvas.MoveTo(250,0);
              Image1.Canvas.LineTo(250,400);
            end;
          Image1.Canvas.Rectangle(140,190,160,210);
          Image1.Canvas.Rectangle(340,190,360,210);
          h := Random(30);
          R := Random;
          Image1.Canvas.Pen.Color := clWhite;
          Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2,massX[i]+2,massY[i]+2);
          if i<=n1 then Image1.Canvas.Pen.Color := clBlue
          else Image1.Canvas.Pen.Color := clRed;
          if R = 0 then Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2,massX[i]+2,massY[i]+2)
          else if Border(i, R) and wall(i, R, Limit) then
            begin
              if (R>0)and(R<=0.25) then
                begin
                  Image1.Canvas.Rectangle(massX[i]-2+h,massY[i]-2,massX[i]+2+h,massY[i]+2);
                  massX[i] := massX[i] + h
                end
              else if (R>0.25)and(R<=0.5) then
                begin
                  Image1.Canvas.Rectangle(massX[i]-2-h,massY[i]-2,massX[i]+2-h,massY[i]+2);
                  massX[i] := massX[i] - h
                end
              else if (R>0.5)and(R<=0.75) then
                begin
                  Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2+h,massX[i]+2,massY[i]+2+h);
                  massY[i] := massY[i] + h
                end
              else if (R>0.75)and(R<=1) then
                begin
                  Image1.Canvas.Rectangle(massX[i]-2,massY[i]-2-h,massX[i]+2,massY[i]+2-h);
                  massY[i] := massY[i] - h
                end
            end
        end
    end
end;

end.
