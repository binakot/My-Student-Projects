object Form1: TForm1
  Left = 235
  Top = 187
  Width = 763
  Height = 440
  Caption = 'Form1'
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
  object Label15: TLabel
    Left = 0
    Top = 0
    Width = 145
    Height = 16
    Caption = #1050#1086#1083'-'#1074#1086' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1093' = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 363
    Width = 113
    Height = 41
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 0
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object BitBtn4: TBitBtn
    Left = 8
    Top = 216
    Width = 113
    Height = 97
    Caption = '&'#1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn4Click
    Kind = bkYes
  end
  object StringGrid1: TStringGrid
    Left = 184
    Top = 0
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
    TabOrder = 2
    OnKeyPress = StringGrid1KeyPress
  end
  object StringGrid2: TStringGrid
    Left = 504
    Top = 0
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
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 152
    Top = 0
    Width = 25
    Height = 21
    TabOrder = 4
    OnKeyUp = Edit1KeyUp
  end
  object StringGrid7: TStringGrid
    Left = 619
    Top = 0
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
    TabOrder = 5
  end
  object StringGrid8: TStringGrid
    Left = 184
    Top = 214
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
    TabOrder = 6
  end
  object XPManifest1: TXPManifest
    Left = 696
    Top = 376
  end
end
