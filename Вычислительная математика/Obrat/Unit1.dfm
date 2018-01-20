object Form1: TForm1
  Left = 252
  Top = 206
  BorderStyle = bsSingle
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1057#1051#1059' '#1089' '#1087#1086#1084#1086#1097#1100#1102' '#1086#1073#1088#1072#1090#1085#1086#1081' '#1084#1072#1090#1088#1080#1094#1099
  ClientHeight = 402
  ClientWidth = 758
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
  object Label4: TLabel
    Left = 0
    Top = 40
    Width = 96
    Height = 16
    Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 0
    Top = 64
    Width = 43
    Height = 20
    Caption = 'detA='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
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
  object Label16: TLabel
    Left = 504
    Top = 728
    Width = 70
    Height = 32
    Caption = 'A*b=x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 504
    Top = 760
    Width = 108
    Height = 32
    Caption = 'x=A(-1)*b'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit2: TEdit
    Left = 48
    Top = 64
    Width = 97
    Height = 21
    DragMode = dmAutomatic
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 0
    Top = 360
    Width = 113
    Height = 41
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object BitBtn4: TBitBtn
    Left = 0
    Top = 240
    Width = 113
    Height = 97
    Caption = '&'#1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn4Click
    Kind = bkYes
  end
  object StringGrid3: TStringGrid
    Left = 184
    Top = 416
    Width = 160
    Height = 160
    Color = clBtnHighlight
    DefaultColWidth = 30
    DefaultRowHeight = 30
    DragMode = dmAutomatic
    FixedColor = clWhite
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 3
    Visible = False
  end
  object StringGrid4: TStringGrid
    Left = 360
    Top = 416
    Width = 160
    Height = 160
    Color = clBtnHighlight
    DefaultColWidth = 30
    DefaultRowHeight = 30
    DragMode = dmAutomatic
    FixedColor = clWhite
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 4
    Visible = False
  end
  object StringGrid5: TStringGrid
    Left = 536
    Top = 416
    Width = 160
    Height = 160
    Color = clBtnHighlight
    DefaultColWidth = 30
    DefaultRowHeight = 30
    DragMode = dmAutomatic
    FixedColor = clWhite
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 5
    Visible = False
  end
  object StringGrid6: TStringGrid
    Left = 720
    Top = 416
    Width = 160
    Height = 160
    Color = clBtnHighlight
    DefaultColWidth = 30
    DefaultRowHeight = 30
    DragMode = dmAutomatic
    FixedColor = clWhite
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 6
    Visible = False
  end
  object StaticText1: TStaticText
    Left = 160
    Top = 568
    Width = 4
    Height = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
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
    TabOrder = 8
  end
  object StringGrid2: TStringGrid
    Left = 520
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
    TabOrder = 9
  end
  object Edit1: TEdit
    Left = 152
    Top = 0
    Width = 25
    Height = 21
    TabOrder = 10
    OnKeyUp = Edit1KeyUp
  end
  object StringGrid7: TStringGrid
    Left = 632
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
    TabOrder = 11
  end
  object StringGrid8: TStringGrid
    Left = 184
    Top = 208
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
    TabOrder = 12
  end
  object StringGrid9: TStringGrid
    Left = 520
    Top = 208
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
    TabOrder = 13
  end
  object XPManifest1: TXPManifest
    Left = 8
    Top = 200
  end
end
