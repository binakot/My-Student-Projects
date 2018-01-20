object Form1: TForm1
  Left = 209
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' - 2 '#1083'.'#1088'. - '#1051#1080#1085#1077#1081#1085#1072#1103' '#1082#1086#1088#1088#1077#1083#1103#1094#1080 +
    #1103
  ClientHeight = 486
  ClientWidth = 1077
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 289
    Caption = #1042#1099#1073#1086#1088#1086#1095#1085#1072#1103' '#1082#1086#1088#1088#1077#1083#1103#1094#1080#1086#1085#1085#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 8
      Top = 16
      Width = 292
      Height = 266
      ColCount = 7
      DefaultColWidth = 40
      DefaultRowHeight = 25
      RowCount = 10
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 304
    Width = 153
    Height = 57
    Caption = #1051#1086#1078#1085#1099#1077' '#1085#1091#1083#1080
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 56
      Height = 13
      Caption = 'C1 ('#1087#1086' X) = '
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 56
      Height = 13
      Caption = 'C2 ('#1087#1086' Y) = '
    end
    object Edit1: TEdit
      Left = 64
      Top = 14
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 64
      Top = 32
      Width = 81
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 168
    Top = 304
    Width = 145
    Height = 57
    Caption = #1064#1072#1075#1080
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 55
      Height = 13
      Caption = 'h1 ('#1087#1086' X) = '
    end
    object Label4: TLabel
      Left = 8
      Top = 32
      Width = 55
      Height = 13
      Caption = 'h2 ('#1087#1086' Y) = '
    end
    object Edit3: TEdit
      Left = 64
      Top = 14
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 64
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 368
    Width = 153
    Height = 33
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 368
    Width = 145
    Height = 33
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkRetry
  end
  object GroupBox4: TGroupBox
    Left = 320
    Top = 8
    Width = 585
    Height = 393
    Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
    TabOrder = 5
    object StringGrid2: TStringGrid
      Left = 8
      Top = 16
      Width = 566
      Height = 369
      ColCount = 10
      DefaultColWidth = 55
      DefaultRowHeight = 27
      RowCount = 13
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 408
    Width = 897
    Height = 65
    Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1080#1077
    TabOrder = 6
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 20
      Height = 13
      Caption = 'U = '
    end
    object Label6: TLabel
      Left = 8
      Top = 40
      Width = 19
      Height = 13
      Caption = 'V = '
    end
    object Label7: TLabel
      Left = 160
      Top = 16
      Width = 26
      Height = 13
      Caption = 'U2 = '
    end
    object Label8: TLabel
      Left = 160
      Top = 40
      Width = 25
      Height = 13
      Caption = 'V2 = '
    end
    object Label9: TLabel
      Left = 312
      Top = 16
      Width = 24
      Height = 13
      Caption = 'du = '
    end
    object Label10: TLabel
      Left = 312
      Top = 40
      Width = 24
      Height = 13
      Caption = 'dv = '
    end
    object Label11: TLabel
      Left = 488
      Top = 19
      Width = 34
      Height = 29
      Caption = 'r = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit5: TEdit
      Left = 32
      Top = 14
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 32
      Top = 38
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Edit7: TEdit
      Left = 192
      Top = 14
      Width = 113
      Height = 21
      TabOrder = 2
    end
    object Edit8: TEdit
      Left = 192
      Top = 38
      Width = 113
      Height = 21
      TabOrder = 3
    end
    object Edit9: TEdit
      Left = 344
      Top = 14
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object Edit10: TEdit
      Left = 344
      Top = 38
      Width = 137
      Height = 21
      TabOrder = 5
    end
    object Edit11: TEdit
      Left = 544
      Top = 16
      Width = 345
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object GroupBox6: TGroupBox
    Left = 912
    Top = 8
    Width = 153
    Height = 161
    Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1103' '#1088#1077#1075#1088#1077#1089#1089#1080#1081
    TabOrder = 7
    object Label12: TLabel
      Left = 8
      Top = 16
      Width = 19
      Height = 13
      Caption = 'X = '
    end
    object Label13: TLabel
      Left = 8
      Top = 40
      Width = 19
      Height = 13
      Caption = 'Y = '
    end
    object Label14: TLabel
      Left = 8
      Top = 64
      Width = 29
      Height = 13
      Caption = 'Pyx = '
    end
    object Label15: TLabel
      Left = 8
      Top = 88
      Width = 29
      Height = 13
      Caption = 'Pxy = '
    end
    object Edit12: TEdit
      Left = 40
      Top = 14
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object Edit13: TEdit
      Left = 40
      Top = 38
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object Edit14: TEdit
      Left = 40
      Top = 62
      Width = 105
      Height = 21
      TabOrder = 2
    end
    object Edit15: TEdit
      Left = 40
      Top = 86
      Width = 105
      Height = 21
      TabOrder = 3
    end
    object Edit16: TEdit
      Left = 8
      Top = 110
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object Edit17: TEdit
      Left = 8
      Top = 134
      Width = 137
      Height = 21
      TabOrder = 5
    end
  end
  object Chart1: TChart
    Left = 912
    Top = 176
    Width = 153
    Height = 297
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Legend.Alignment = laTop
    View3D = False
    TabOrder = 8
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'y(x)'
      LinePen.Color = clRed
      LinePen.Width = 2
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
    object Series2: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'x(y)'
      LinePen.Color = clBlue
      LinePen.Width = 2
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
end
