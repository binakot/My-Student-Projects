object Form1: TForm1
  Left = 259
  Top = 142
  BorderStyle = bsSingle
  Caption = #1051#1072#1073'.'#1088'. 1 ('#1050#1074#1072#1076#1088#1072#1090#1080#1095#1085#1072#1103' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1100')'
  ClientHeight = 477
  ClientWidth = 1215
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
    Left = 8
    Top = 360
    Width = 141
    Height = 13
    Caption = #1050#1074#1072#1076#1088#1072#1090#1080#1095#1085#1072#1103' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1100
  end
  object Label2: TLabel
    Left = 8
    Top = 400
    Width = 24
    Height = 13
    Caption = 'a0 = '
  end
  object Label3: TLabel
    Left = 8
    Top = 424
    Width = 24
    Height = 13
    Caption = 'a1 = '
  end
  object Label4: TLabel
    Left = 352
    Top = 416
    Width = 90
    Height = 32
    Caption = 'Delta = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 448
    Width = 24
    Height = 13
    Caption = 'a2 = '
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 905
    Height = 81
    Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1090#1086#1095#1077#1082
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 8
      Top = 16
      Width = 885
      Height = 54
      ColCount = 20
      DefaultColWidth = 43
      RowCount = 2
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 920
    Top = 8
    Width = 75
    Height = 81
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Chart1: TChart
    Left = 8
    Top = 96
    Width = 337
    Height = 265
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Legend.Visible = False
    View3D = False
    TabOrder = 2
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Color = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TBubbleSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.Brush.Color = clGreen
      Pointer.HorizSize = 12
      Pointer.InflateMargins = False
      Pointer.Style = psCircle
      Pointer.VertSize = 12
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      RadiusValues.DateTime = False
      RadiusValues.Name = 'Radius'
      RadiusValues.Multiplier = 1.000000000000000000
      RadiusValues.Order = loNone
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Edit1: TEdit
    Left = 8
    Top = 376
    Width = 185
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = 'y = a0 + a1*x + a2*x^2'
  end
  object StringGrid2: TStringGrid
    Left = 352
    Top = 96
    Width = 857
    Height = 289
    ColCount = 12
    DefaultRowHeight = 30
    RowCount = 21
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssVertical
    TabOrder = 4
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      120
      64
      64
      64)
  end
  object Edit2: TEdit
    Left = 40
    Top = 400
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 40
    Top = 424
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 456
    Top = 416
    Width = 753
    Height = 40
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object BitBtn2: TBitBtn
    Left = 201
    Top = 389
    Width = 143
    Height = 81
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object Edit5: TEdit
    Left = 40
    Top = 448
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
end
