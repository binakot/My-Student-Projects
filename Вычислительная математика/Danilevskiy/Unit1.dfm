object Form1: TForm1
  Left = 336
  Top = 126
  Width = 795
  Height = 713
  Caption = #1052#1077#1090#1086#1076' '#1044#1072#1085#1080#1083#1077#1074#1089#1082#1086#1075#1086
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 673
    TabOrder = 0
    object Label1: TLabel
      Left = 176
      Top = 80
      Width = 68
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
    end
    object Label2: TLabel
      Left = 16
      Top = 280
      Width = 106
      Height = 13
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1095#1080#1089#1083#1072' :'
    end
    object Label3: TLabel
      Left = 8
      Top = 144
      Width = 276
      Height = 13
      Caption = #1056#1072#1089#1095#1077#1090' '#1074#1077#1082#1086#1074#1086#1075#1086' '#1086#1087#1088#1077#1076#1077#1083#1080#1090#1077#1083#1103' '#1052#1072#1090#1088#1080#1094#1080' '#1060#1088#1086#1073#1077#1085#1080#1091#1089#1072':'
    end
    object Label4: TLabel
      Left = 16
      Top = 328
      Width = 175
      Height = 13
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1074#1077#1082#1090#1086#1088#1099' '#1084#1072#1090#1088#1080#1094#1099' '#1056':'
    end
    object Label5: TLabel
      Left = 16
      Top = 464
      Width = 175
      Height = 13
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1074#1077#1082#1090#1086#1088#1099' '#1084#1072#1090#1088#1080#1094#1099' '#1040':'
    end
    object Label6: TLabel
      Left = 320
      Top = 16
      Width = 36
      Height = 13
      Caption = #1057#1090#1088#1086#1082#1080
    end
    object Label7: TLabel
      Left = 424
      Top = 16
      Width = 242
      Height = 13
      Caption = '|                    '#1047#1083#1077#1084#1077#1085#1090#1099' '#1084#1072#1090#1088#1080#1094#1099'                    |      '
    end
    object Label8: TLabel
      Left = 664
      Top = 16
      Width = 41
      Height = 13
      Caption = #1057#1080#1075#1084#1072' 1'
    end
    object Label9: TLabel
      Left = 720
      Top = 16
      Width = 41
      Height = 13
      Caption = #1057#1080#1075#1084#1072' 2'
    end
    object Label10: TLabel
      Left = 16
      Top = 600
      Width = 80
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072': A * X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 160
      Top = 600
      Width = 107
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072': '#1051#1103#1084#1076#1072' * X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 312
      Top = 624
      Width = 77
      Height = 13
      Caption = #1057#1083#1077#1076' '#1052#1072#1090#1088#1080#1094#1099':'
    end
    object Label13: TLabel
      Left = 384
      Top = 16
      Width = 24
      Height = 13
      Caption = 'M(-1)'
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 8
      Width = 153
      Height = 129
      ColCount = 1
      DefaultColWidth = 35
      DefaultRowHeight = 30
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 256
      Top = 80
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '4'
    end
    object StringGrid2: TStringGrid
      Left = 312
      Top = 32
      Width = 457
      Height = 585
      ColCount = 1
      DefaultColWidth = 55
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
    end
    object Button1: TButton
      Left = 168
      Top = 104
      Width = 129
      Height = 33
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      TabOrder = 3
      OnClick = Button1Click
    end
    object RichEdit1: TRichEdit
      Left = 8
      Top = 160
      Width = 289
      Height = 113
      ScrollBars = ssBoth
      TabOrder = 4
    end
    object StringGrid3: TStringGrid
      Left = 8
      Top = 296
      Width = 289
      Height = 25
      ColCount = 1
      DefaultColWidth = 70
      DefaultRowHeight = 25
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 5
    end
    object StringGrid4: TStringGrid
      Left = 8
      Top = 344
      Width = 289
      Height = 113
      ColCount = 1
      DefaultColWidth = 70
      DefaultRowHeight = 25
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 6
    end
    object StringGrid5: TStringGrid
      Left = 8
      Top = 480
      Width = 289
      Height = 113
      ColCount = 1
      DefaultColWidth = 70
      DefaultRowHeight = 25
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 7
    end
    object StringGrid6: TStringGrid
      Left = 8
      Top = 616
      Width = 129
      Height = 49
      ColCount = 1
      DefaultColWidth = 55
      DefaultRowHeight = 30
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 8
    end
    object StringGrid7: TStringGrid
      Left = 152
      Top = 616
      Width = 145
      Height = 49
      ColCount = 1
      DefaultColWidth = 55
      DefaultRowHeight = 30
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 9
    end
    object Edit2: TEdit
      Left = 312
      Top = 640
      Width = 121
      Height = 21
      TabOrder = 10
    end
  end
  object XPManifest1: TXPManifest
    Left = 168
    Top = 8
  end
end
