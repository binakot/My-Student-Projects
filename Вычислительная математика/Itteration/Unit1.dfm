object Form1: TForm1
  Left = 182
  Top = 179
  BorderStyle = bsSingle
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1057#1051#1059' '#1084#1077#1090#1086#1076#1086#1084' '#1087#1088#1086#1089#1090#1099#1093' '#1080#1090#1077#1088#1072#1094#1080#1081
  ClientHeight = 470
  ClientWidth = 1016
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
    Width = 170
    Height = 20
    Caption = #1050#1086#1083'-'#1074#1086' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1093' = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 136
    Top = 48
    Width = 13
    Height = 24
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 280
    Top = 48
    Width = 12
    Height = 24
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 368
    Top = 48
    Width = 14
    Height = 24
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 136
    Top = 280
    Width = 31
    Height = 24
    Caption = 'Alfa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 264
    Top = 280
    Width = 37
    Height = 24
    Caption = 'Beta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 28
    Height = 20
    Caption = 'E = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 480
    Top = 280
    Width = 41
    Height = 24
    Caption = 'A(-1)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 712
    Top = 48
    Width = 88
    Height = 24
    Caption = #1048#1090#1077#1088#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 520
    Top = 48
    Width = 75
    Height = 24
    Caption = #1053#1077#1074#1103#1079#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 160
    Top = 248
    Width = 23
    Height = 24
    Caption = 'K='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 240
    Width = 137
    Height = 41
    Caption = #1056#1077#1096#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 72
    Width = 250
    Height = 161
    Color = clCream
    ColCount = 6
    DefaultColWidth = 40
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 1
  end
  object StringGrid2: TStringGrid
    Left = 264
    Top = 72
    Width = 49
    Height = 161
    Align = alCustom
    Color = clCream
    ColCount = 1
    DefaultColWidth = 45
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    FixedCols = 0
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 184
    Top = 8
    Width = 25
    Height = 21
    TabOrder = 3
    OnKeyUp = Edit1KeyUp
  end
  object StringGrid3: TStringGrid
    Left = 320
    Top = 72
    Width = 105
    Height = 161
    Align = alCustom
    Color = clCream
    ColCount = 2
    DefaultColWidth = 50
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 4
  end
  object StringGrid4: TStringGrid
    Left = 440
    Top = 72
    Width = 54
    Height = 161
    Align = alCustom
    Color = clCream
    ColCount = 1
    DefaultColWidth = 50
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    FixedCols = 0
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 5
  end
  object StringGrid5: TStringGrid
    Left = 8
    Top = 304
    Width = 250
    Height = 161
    Color = clCream
    ColCount = 6
    DefaultColWidth = 40
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 6
  end
  object StringGrid6: TStringGrid
    Left = 264
    Top = 304
    Width = 45
    Height = 161
    Align = alCustom
    Color = clCream
    ColCount = 1
    DefaultColWidth = 40
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    FixedCols = 0
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 40
    Top = 32
    Width = 57
    Height = 21
    TabOrder = 8
    OnKeyUp = Edit1KeyUp
  end
  object Panel1: TPanel
    Left = 248
    Top = 8
    Width = 105
    Height = 33
    TabOrder = 9
    object CheckBox1: TCheckBox
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      Caption = 'DetA<>0'
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object StringGrid7: TStringGrid
    Left = 360
    Top = 304
    Width = 250
    Height = 161
    Color = clCream
    ColCount = 6
    DefaultColWidth = 40
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 10
  end
  object StringGrid8: TStringGrid
    Left = 624
    Top = 72
    Width = 385
    Height = 393
    Color = clCream
    ColCount = 6
    DefaultColWidth = 63
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    RowCount = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 11
  end
  object StringGrid9: TStringGrid
    Left = 512
    Top = 72
    Width = 97
    Height = 161
    Align = alCustom
    Color = clCream
    ColCount = 1
    DefaultColWidth = 100
    DefaultRowHeight = 25
    FixedColor = clScrollBar
    FixedCols = 0
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 12
  end
  object Edit3: TEdit
    Left = 192
    Top = 248
    Width = 57
    Height = 21
    TabOrder = 13
    OnKeyUp = Edit1KeyUp
  end
  object XPManifest1: TXPManifest
    Left = 216
    Top = 8
  end
end
