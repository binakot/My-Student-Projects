object Form1: TForm1
  Left = 178
  Top = 38
  Width = 816
  Height = 559
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 24
    Width = 26
    Height = 20
    Caption = 'n = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 280
    Width = 36
    Height = 13
    Caption = 'DetA = '
  end
  object Label3: TLabel
    Left = 208
    Top = 328
    Width = 50
    Height = 13
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072
  end
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 116
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099
  end
  object Label5: TLabel
    Left = 8
    Top = 64
    Width = 95
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 88
    Width = 177
    Height = 129
    ColCount = 1
    DefaultColWidth = 30
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 40
    Top = 24
    Width = 33
    Height = 25
    AutoSize = False
    TabOrder = 1
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 16
    Top = 344
    Width = 161
    Height = 41
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '#1082#1086#1088#1085#1080
    TabOrder = 2
    OnClick = Button1Click
  end
  object StringGrid2: TStringGrid
    Left = 208
    Top = 8
    Width = 585
    Height = 313
    ColCount = 1
    DefaultColWidth = 84
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
  end
  object Button2: TButton
    Left = 16
    Top = 224
    Width = 161
    Height = 41
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '#1086#1087#1088#1077#1076#1077#1083#1080#1090#1077#1083#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object StringGrid3: TStringGrid
    Left = 208
    Top = 344
    Width = 161
    Height = 161
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 5
  end
  object Button3: TButton
    Left = 16
    Top = 400
    Width = 161
    Height = 41
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072
    TabOrder = 6
    OnClick = Button3Click
  end
end
