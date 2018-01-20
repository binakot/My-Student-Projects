object Form1: TForm1
  Left = 246
  Top = 138
  Width = 701
  Height = 327
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1057#1051#1059' '#1084#1077#1090#1086#1076#1086#1084' '#1050#1088#1072#1084#1077#1088#1072
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
  object Label1: TLabel
    Left = 0
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
  object BitBtn1: TBitBtn
    Left = 0
    Top = 240
    Width = 209
    Height = 57
    Caption = #1056#1077#1096#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 40
    Width = 310
    Height = 190
    Color = clCream
    ColCount = 6
    DefaultColWidth = 50
    DefaultRowHeight = 30
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
    Left = 328
    Top = 40
    Width = 85
    Height = 190
    Align = alCustom
    Color = clCream
    ColCount = 1
    DefaultColWidth = 80
    DefaultRowHeight = 30
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
    Left = 176
    Top = 8
    Width = 25
    Height = 21
    TabOrder = 3
    OnKeyUp = Edit1KeyUp
  end
  object StringGrid3: TStringGrid
    Left = 432
    Top = 40
    Width = 125
    Height = 190
    Align = alCustom
    Color = clCream
    ColCount = 2
    DefaultColWidth = 60
    DefaultRowHeight = 30
    DragMode = dmAutomatic
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
    Left = 608
    Top = 40
    Width = 85
    Height = 190
    Align = alCustom
    Color = clCream
    ColCount = 1
    DefaultColWidth = 80
    DefaultRowHeight = 30
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
  object XPManifest1: TXPManifest
    Left = 216
    Top = 240
  end
end
