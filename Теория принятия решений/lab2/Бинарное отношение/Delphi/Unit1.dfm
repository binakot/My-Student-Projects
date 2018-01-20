object Form1: TForm1
  Left = 434
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1041#1080#1085#1072#1088#1085#1086#1077' '#1086#1090#1085#1086#1096#1077#1085#1080#1077
  ClientHeight = 440
  ClientWidth = 652
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
    Left = 8
    Top = 8
    Width = 136
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1084#1085'-'#1074#1072' = '
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 158
    Height = 13
    Caption = #1052#1072#1090#1088#1080#1094#1072' '#1073#1080#1085#1072#1088#1085#1086#1075#1086' '#1086#1090#1085#1086#1096#1077#1085#1080#1103
  end
  object Edit1: TEdit
    Left = 144
    Top = 6
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '5'
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 48
    Width = 257
    Height = 257
    ColCount = 6
    DefaultColWidth = 30
    DefaultRowHeight = 30
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 280
    Top = 8
    Width = 361
    Height = 297
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 5
    Width = 25
    Height = 25
    Caption = ' '
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 312
    Width = 257
    Height = 33
    Caption = #1047#1072#1076#1072#1090#1100' '#1073#1080#1085#1072#1088#1085#1086#1077' '#1086#1090#1085#1086#1096#1077#1085#1080#1077' '#1089' '#1087#1086#1084#1086#1097#1100#1102' '#1084#1072#1090#1088#1080#1094#1099
    Enabled = False
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 240
    Top = 5
    Width = 25
    Height = 25
    Caption = ' '
    Enabled = False
    TabOrder = 5
    OnClick = BitBtn3Click
    Kind = bkRetry
  end
  object Panel1: TPanel
    Left = 8
    Top = 352
    Width = 137
    Height = 81
    Enabled = False
    TabOrder = 6
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 47
      Height = 13
      Caption = #1069#1083#1077#1084#1077#1085#1090' '
    end
    object Edit2: TEdit
      Left = 64
      Top = 6
      Width = 64
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object BitBtn4: TBitBtn
      Left = 8
      Top = 32
      Width = 121
      Height = 17
      Caption = #1053#1080#1078#1085#1077#1077' '#1089#1077#1095#1077#1085#1080#1077
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 8
      Top = 56
      Width = 121
      Height = 17
      Caption = #1042#1077#1088#1093#1085#1077#1077' '#1089#1077#1095#1077#1085#1080#1077
      TabOrder = 2
      OnClick = BitBtn5Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 280
    Top = 312
    Width = 121
    Height = 121
    Caption = #1059#1085#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
    Enabled = False
    TabOrder = 7
    object BitBtn6: TBitBtn
      Left = 8
      Top = 24
      Width = 105
      Height = 25
      Caption = #1044#1086#1087#1086#1083#1085#1077#1085#1080#1077
      TabOrder = 0
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 8
      Top = 56
      Width = 105
      Height = 25
      Caption = #1048#1085#1074#1077#1088#1089#1080#1103
      TabOrder = 1
      OnClick = BitBtn7Click
    end
    object BitBtn8: TBitBtn
      Left = 8
      Top = 88
      Width = 105
      Height = 25
      Caption = #1044#1074#1086#1081#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100
      TabOrder = 2
      OnClick = BitBtn8Click
    end
  end
  object BitBtn9: TBitBtn
    Left = 152
    Top = 352
    Width = 113
    Height = 81
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072
    TabOrder = 8
    OnClick = BitBtn9Click
    Kind = bkHelp
  end
end
