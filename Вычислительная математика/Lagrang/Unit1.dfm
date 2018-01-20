object Form1: TForm1
  Left = 380
  Top = 188
  BorderStyle = bsSingle
  Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1086#1085#1085#1072#1103' '#1092#1086#1088#1084#1091#1083#1072' '#1051#1072#1075#1088#1072#1085#1078#1072
  ClientHeight = 239
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 240
    Top = 16
    Width = 28
    Height = 20
    Caption = 'X = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 208
    Width = 28
    Height = 20
    Caption = 'Y = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 16
    Width = 212
    Height = 180
    ColCount = 3
    DefaultColWidth = 80
    RowCount = 7
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 0
    ColWidths = (
      45
      80
      80)
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 88
    Width = 145
    Height = 41
    Caption = #1056#1072#1074#1085#1086#1086#1090#1089#1090#1086#1103#1097#1080#1077' '#1091#1079#1083#1099
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 40
    Width = 145
    Height = 41
    Caption = #1053#1077#1088#1072#1074#1085#1086#1086#1090#1089#1090#1086#1103#1097#1080#1077' '#1091#1079#1083#1099
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object Edit1: TEdit
    Left = 272
    Top = 16
    Width = 113
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object BitBtn3: TBitBtn
    Left = 240
    Top = 136
    Width = 145
    Height = 57
    Caption = #1056#1077#1096#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtn3Click
    Kind = bkOK
  end
  object Edit2: TEdit
    Left = 48
    Top = 208
    Width = 177
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object XPManifest1: TXPManifest
    Left = 360
    Top = 200
  end
end
