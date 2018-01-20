object Form1: TForm1
  Left = 427
  Top = 191
  BorderStyle = bsSingle
  Caption = #1057#1040#1054#1044' - '#1089#1087#1080#1089#1082#1080
  ClientHeight = 260
  ClientWidth = 217
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
    Left = 8
    Top = 8
    Width = 20
    Height = 13
    Caption = 'N = '
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 81
    Height = 13
    Caption = #1042#1093#1086#1076#1085#1086#1081' '#1089#1087#1080#1089#1086#1082
  end
  object Label3: TLabel
    Left = 112
    Top = 40
    Width = 89
    Height = 13
    Caption = #1042#1099#1093#1086#1076#1085#1086#1081' '#1089#1087#1080#1089#1086#1082
  end
  object Edit1: TEdit
    Left = 32
    Top = 6
    Width = 65
    Height = 21
    TabOrder = 0
    Text = '5'
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 90
    Height = 193
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 112
    Top = 56
    Width = 90
    Height = 193
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button1: TButton
    Left = 112
    Top = 6
    Width = 89
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
end
