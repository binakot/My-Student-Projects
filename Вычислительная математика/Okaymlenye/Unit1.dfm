object Form1: TForm1
  Left = 354
  Top = 249
  Width = 703
  Height = 376
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 18
    Height = 13
    Caption = 'n = '
  end
  object Label5: TLabel
    Left = 544
    Top = 48
    Width = 48
    Height = 13
    Caption = 'A x A* = E'
  end
  object Label2: TLabel
    Left = 40
    Top = 56
    Width = 96
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1052#1072#1090#1088#1080#1094#1072
  end
  object Label3: TLabel
    Left = 272
    Top = 56
    Width = 95
    Height = 13
    Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 80
    Width = 209
    Height = 185
    DefaultColWidth = 40
    DefaultRowHeight = 35
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 0
    OnKeyPress = StringGrid1KeyPress
  end
  object Edit1: TEdit
    Left = 32
    Top = 16
    Width = 33
    Height = 25
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 32
    Top = 280
    Width = 193
    Height = 41
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1054#1073#1088#1072#1090#1085#1091#1102' '#1084#1072#1090#1088#1080#1094#1091
    TabOrder = 2
    OnClick = Button1Click
  end
  object StringGrid2: TStringGrid
    Left = 248
    Top = 80
    Width = 209
    Height = 185
    DefaultColWidth = 40
    DefaultRowHeight = 35
    FixedCols = 0
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 3
  end
  object StringGrid3: TStringGrid
    Left = 472
    Top = 80
    Width = 209
    Height = 185
    DefaultColWidth = 40
    DefaultRowHeight = 35
    FixedCols = 0
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 4
  end
  object XPManifest1: TXPManifest
    Left = 240
    Top = 280
  end
end
