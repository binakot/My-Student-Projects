object Form1: TForm1
  Left = 390
  Top = 158
  BorderStyle = bsSingle
  Caption = #1044#1080#1092#1092#1091#1079#1080#1103
  ClientHeight = 507
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 500
    Height = 400
  end
  object Label1: TLabel
    Left = 8
    Top = 408
    Width = 150
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1086#1083#1077#1082#1091#1083' = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 480
    Width = 133
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1096#1072#1075#1086#1074' = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 440
    Width = 153
    Height = 33
    Caption = #1064#1072#1075
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 176
    Top = 440
    Width = 153
    Height = 33
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object Edit1: TEdit
    Left = 176
    Top = 408
    Width = 153
    Height = 21
    TabOrder = 2
    Text = '100'
  end
  object BitBtn4: TBitBtn
    Left = 336
    Top = 440
    Width = 161
    Height = 33
    Caption = #1059#1073#1088#1072#1090#1100' '#1087#1077#1088#1077#1075#1086#1088#1086#1076#1082#1091
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn2: TBitBtn
    Left = 336
    Top = 408
    Width = 161
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1084#1086#1083#1077#1082#1091#1083#1099
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object Edit2: TEdit
    Left = 176
    Top = 480
    Width = 153
    Height = 21
    TabOrder = 5
    Text = '100'
  end
  object BitBtn5: TBitBtn
    Left = 334
    Top = 480
    Width = 161
    Height = 25
    Caption = #1040#1074#1090#1086#1096#1072#1075
    TabOrder = 6
    OnClick = BitBtn5Click
  end
end
