object Form1: TForm1
  Left = 601
  Top = 281
  BorderStyle = bsSingle
  Caption = #1057#1040#1054#1044' - '#1044#1077#1088#1077#1074#1100#1103
  ClientHeight = 226
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Max = '
  end
  object Label2: TLabel
    Left = 128
    Top = 40
    Width = 29
    Height = 13
    Caption = 'Min = '
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 105
    Height = 209
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 168
    Top = 6
    Width = 73
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 168
    Top = 38
    Width = 73
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 64
    Width = 113
    Height = 33
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
end
