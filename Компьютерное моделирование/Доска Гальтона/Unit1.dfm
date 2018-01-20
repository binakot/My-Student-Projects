object Form1: TForm1
  Left = 344
  Top = 124
  BorderStyle = bsSingle
  Caption = #1044#1086#1089#1082#1072' '#1043#1072#1083#1100#1090#1086#1085#1072
  ClientHeight = 521
  ClientWidth = 805
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
  object Image1: TImage
    Left = 296
    Top = 8
    Width = 500
    Height = 500
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 136
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1096#1072#1088#1086#1074' '#1076#1083#1103' '#1086#1087#1099#1090#1072' = '
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 105
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1086#1089#1082#1080
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 131
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1088#1103#1076#1086#1074' '#1089#1090#1077#1088#1078#1085#1077#1081' = '
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 168
      Height = 13
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1089#1090#1077#1088#1078#1085#1103#1084#1080' = '
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 140
      Height = 13
      Caption = #1056#1072#1076#1080#1091#1089' '#1082#1072#1078#1076#1086#1075#1086' '#1089#1090#1077#1088#1078#1085#1103' = '
    end
    object Edit1: TEdit
      Left = 176
      Top = 22
      Width = 89
      Height = 21
      TabOrder = 0
      Text = '10'
    end
    object Edit2: TEdit
      Left = 176
      Top = 46
      Width = 89
      Height = 21
      TabOrder = 1
      Text = '30'
    end
    object Edit3: TEdit
      Left = 176
      Top = 70
      Width = 89
      Height = 21
      TabOrder = 2
      Text = '5'
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 120
    Width = 137
    Height = 41
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1076#1086#1089#1082#1091
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 120
    Width = 137
    Height = 41
    Caption = #1041#1088#1086#1089#1080#1090#1100' '#1086#1076#1080#1085' '#1096#1072#1088#1080#1082
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkHelp
  end
  object Chart1: TChart
    Left = 8
    Top = 240
    Width = 281
    Height = 274
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Visible = False
    BottomAxis.ExactDateTime = False
    BottomAxis.Visible = False
    Legend.Visible = False
    TabOrder = 3
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = True
      SeriesColor = clLime
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Edit4: TEdit
    Left = 152
    Top = 168
    Width = 137
    Height = 21
    TabOrder = 4
    Text = '100'
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 192
    Width = 281
    Height = 41
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1087#1099#1090
    TabOrder = 5
    OnClick = BitBtn3Click
    Kind = bkRetry
  end
end
