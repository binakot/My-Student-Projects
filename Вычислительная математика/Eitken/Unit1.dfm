object Form1: TForm1
  Left = 302
  Top = 160
  BorderStyle = bsSingle
  Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1086#1085#1085#1072#1103' c'#1093#1077#1084#1072' '#1069#1081#1090#1082#1077#1085#1072
  ClientHeight = 352
  ClientWidth = 600
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
  object SG1: TStringGrid
    Left = 312
    Top = 13
    Width = 273
    Height = 160
    ColCount = 3
    DefaultColWidth = 80
    RowCount = 7
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24)
  end
  object SG2: TStringGrid
    Left = 8
    Top = 192
    Width = 585
    Height = 153
    ColCount = 8
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 1
    ColWidths = (
      64
      83
      81
      80
      71
      70
      60
      64)
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 129
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
    TabOrder = 2
    object lbl1: TLabel
      Left = 24
      Top = 56
      Width = 20
      Height = 20
      Caption = 'X='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 24
      Top = 96
      Width = 69
      Height = 16
      Caption = #1058#1086#1095#1085#1086#1089#1090#1100'='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 24
      Top = 24
      Width = 87
      Height = 16
      Caption = #1050#1086#1083'-'#1074#1086' '#1091#1079#1083#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EditOfCount: TEdit
      Left = 128
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '6'
      OnKeyUp = EditOfCountKeyUp
    end
    object EditOfX: TEdit
      Left = 72
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '2,5'
    end
    object EditOfAccuracy: TEdit
      Left = 104
      Top = 96
      Width = 89
      Height = 21
      TabOrder = 2
      Text = '0,001'
    end
  end
  object btn1: TButton
    Left = 8
    Top = 144
    Width = 131
    Height = 41
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn1Click
  end
  object xpmnfst1: TXPManifest
    Left = 144
    Top = 144
  end
end
