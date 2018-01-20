object Form1: TForm1
  Left = 338
  Top = 238
  Width = 723
  Height = 590
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 122
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099': '
  end
  object Label3: TLabel
    Left = 368
    Top = 192
    Width = 31
    Height = 13
    Caption = #1050#1086#1088#1085#1080
  end
  object Label4: TLabel
    Left = 544
    Top = 192
    Width = 50
    Height = 13
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072
  end
  object UpDown1: TUpDown
    Left = 121
    Top = 40
    Width = 17
    Height = 21
    Associate = Edit1
    TabOrder = 0
    OnClick = UpDown1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 40
    Width = 105
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object StringGrid1: TStringGrid
    Left = 200
    Top = 24
    Width = 161
    Height = 161
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 80
    Width = 145
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '#1086#1087#1088#1077#1076#1077#1083#1080#1090#1077#1083#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 112
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 200
    Top = 0
    Width = 329
    Height = 17
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1084#1072#1090#1088#1080#1094#1099
    TabOrder = 5
  end
  object StringGrid4: TStringGrid
    Left = 544
    Top = 24
    Width = 161
    Height = 161
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 6
  end
  object GroupBox4: TGroupBox
    Left = 544
    Top = 0
    Width = 161
    Height = 17
    Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
    TabOrder = 7
    Visible = False
  end
  object Button5: TButton
    Left = 8
    Top = 144
    Width = 145
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1086#1073#1088'. '#1084#1072#1090#1088#1080#1094#1099
    TabOrder = 8
    OnClick = Button5Click
  end
  object StringGrid2: TStringGrid
    Left = 368
    Top = 24
    Width = 161
    Height = 161
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 9
  end
  object StringGrid3: TStringGrid
    Left = 368
    Top = 208
    Width = 161
    Height = 161
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 10
  end
  object Button4: TButton
    Left = 8
    Top = 176
    Width = 145
    Height = 25
    Caption = #1053#1072#1093#1086#1078#1076#1077#1085#1080#1077
    TabOrder = 11
    OnClick = Button4Click
  end
  object StringGrid5: TStringGrid
    Left = 544
    Top = 208
    Width = 161
    Height = 161
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 12
  end
  object StringGrid6: TStringGrid
    Left = 232
    Top = 384
    Width = 65
    Height = 65
    ColCount = 2
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 13
  end
  object StringGrid7: TStringGrid
    Left = 304
    Top = 384
    Width = 97
    Height = 97
    ColCount = 3
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 14
  end
  object StringGrid8: TStringGrid
    Left = 408
    Top = 384
    Width = 129
    Height = 129
    ColCount = 4
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 15
  end
  object StringGrid9: TStringGrid
    Left = 192
    Top = 384
    Width = 33
    Height = 33
    ColCount = 1
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 16
  end
  object StringGrid10: TStringGrid
    Left = 544
    Top = 384
    Width = 161
    Height = 161
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedColor = clCaptionText
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 17
  end
  object XPManifest1: TXPManifest
    Left = 152
    Top = 8
  end
end
