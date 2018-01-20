object Form1: TForm1
  Left = 219
  Top = 109
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1055#1056' - '#1051#1072#1073'.'#1088'. 1'
  ClientHeight = 523
  ClientWidth = 649
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
    Width = 633
    Height = 137
    Caption = #1042#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 106
      Width = 27
      Height = 13
      Caption = 'dq1 ='
    end
    object Label2: TLabel
      Left = 88
      Top = 106
      Width = 21
      Height = 13
      Caption = 'q1 ='
    end
    object Label3: TLabel
      Left = 168
      Top = 106
      Width = 21
      Height = 13
      Caption = 'q2 ='
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 16
      Width = 617
      Height = 81
      ColCount = 21
      DefaultColWidth = 28
      RowCount = 3
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 40
      Top = 104
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '1,3'
    end
    object Edit2: TEdit
      Left = 120
      Top = 104
      Width = 33
      Height = 21
      TabOrder = 2
      Text = '10,5'
    end
    object Edit3: TEdit
      Left = 200
      Top = 104
      Width = 33
      Height = 21
      TabOrder = 3
      Text = '9,8'
    end
    object BitBtn1: TBitBtn
      Left = 240
      Top = 104
      Width = 377
      Height = 25
      Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080' '#1074#1099#1087#1086#1083#1080#1085#1090#1100' '#1088#1072#1089#1095#1077#1090#1099
      TabOrder = 4
      OnClick = BitBtn1Click
      Kind = bkOK
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 184
    Width = 633
    Height = 329
    Caption = #1052#1077#1090#1086#1076' '#1091#1089#1090#1091#1087#1086#1082
    TabOrder = 1
    Visible = False
    object Label4: TLabel
      Left = 8
      Top = 14
      Width = 131
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1074#1072#1078#1085#1086#1089#1090#1080
    end
    object Label5: TLabel
      Left = 8
      Top = 118
      Width = 194
      Height = 13
      Caption = 'dq1 ('#1042#1077#1083#1080#1095#1080#1085#1072' '#1076#1086#1087#1091#1089#1090#1080#1084#1086#1075#1086' '#1091#1089#1090#1091#1087#1082#1072') ='
    end
    object StringGrid2: TStringGrid
      Left = 8
      Top = 32
      Width = 617
      Height = 81
      ColCount = 21
      DefaultColWidth = 28
      RowCount = 3
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      ColWidths = (
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28
        28)
    end
    object Edit4: TEdit
      Left = 206
      Top = 116
      Width = 99
      Height = 21
      TabOrder = 1
    end
    object Memo1: TMemo
      Left = 8
      Top = 144
      Width = 297
      Height = 169
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object Chart1: TChart
      Left = 320
      Top = 120
      Width = 305
      Height = 202
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      MarginBottom = 1
      MarginLeft = 1
      MarginRight = 1
      MarginTop = 1
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      LeftAxis.ExactDateTime = False
      Legend.Visible = False
      View3D = False
      TabOrder = 3
      object Series1: TBubbleSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clRed
        Pointer.Brush.Color = clBlack
        Pointer.HorizSize = 18
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 18
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
      object Series2: TBubbleSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clGreen
        Pointer.Brush.Color = clRed
        Pointer.HorizSize = 23
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 23
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
    end
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 152
    Width = 201
    Height = 25
    Caption = #1052#1077#1090#1086#1076' '#1091#1089#1090#1091#1087#1086#1082
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 216
    Top = 152
    Width = 209
    Height = 25
    Caption = #1056#1077#1096#1077#1085#1080#1077' '#1087#1086' '#1091#1088#1086#1074#1085#1103#1084' '#1087#1088#1080#1090#1103#1079#1072#1085#1080#1103
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 432
    Top = 152
    Width = 209
    Height = 25
    Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1086' '#1055#1072#1090#1077#1088#1086
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 184
    Width = 633
    Height = 329
    Caption = #1053#1072#1093#1086#1078#1076#1077#1085#1080#1077' '#1088#1077#1096#1077#1085#1080#1103' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1099#1084' '#1091#1088#1086#1074#1085#1103#1084' '#1087#1088#1080#1090#1103#1079#1072#1085#1080#1103
    TabOrder = 5
    Visible = False
    object Label6: TLabel
      Left = 8
      Top = 34
      Width = 21
      Height = 13
      Caption = 'q1 ='
    end
    object Label7: TLabel
      Left = 8
      Top = 58
      Width = 21
      Height = 13
      Caption = 'q2 ='
    end
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 178
      Height = 13
      Caption = #1046#1077#1083#1072#1090#1077#1083#1100#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1082#1088#1080#1090#1077#1088#1080#1077#1074
    end
    object Edit5: TEdit
      Left = 40
      Top = 32
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 40
      Top = 56
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Chart2: TChart
      Left = 232
      Top = 80
      Width = 393
      Height = 241
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      Legend.Visible = False
      TabOrder = 2
      object Series3: TBubbleSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clRed
        Pointer.Brush.Color = clBlack
        Pointer.HorizSize = 16
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 16
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
      object Series4: TBubbleSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clGreen
        Pointer.Brush.Color = clRed
        Pointer.HorizSize = 14
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 14
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
      object Series5: TBubbleSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clYellow
        Pointer.Brush.Color = clLime
        Pointer.HorizSize = 27
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 27
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
    end
    object Memo2: TMemo
      Left = 8
      Top = 80
      Width = 217
      Height = 241
      TabOrder = 3
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 184
    Width = 633
    Height = 329
    Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1086' '#1055#1072#1088#1077#1090#1086
    TabOrder = 6
    Visible = False
    object Chart3: TChart
      Left = 8
      Top = 16
      Width = 616
      Height = 305
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      Legend.Visible = False
      View3D = False
      TabOrder = 0
      object Series6: TBubbleSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clRed
        Pointer.Brush.Color = clBlack
        Pointer.HorizSize = 26
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 26
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
      object Series7: TBubbleSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clGreen
        Pointer.Brush.Color = clRed
        Pointer.HorizSize = 32
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 32
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
    end
  end
  object XPManifest1: TXPManifest
    Left = 600
    Top = 112
  end
end
