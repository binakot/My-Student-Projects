object Form1: TForm1
  Left = 425
  Top = 182
  BorderStyle = bsSingle
  Caption = 
    #1050#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1077' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077' - '#1055#1086#1090#1086#1082' '#1079#1072#1075#1086#1090#1086#1074#1086#1082' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1085#1072' '#1089#1090 +
    #1072#1085#1082#1077
  ClientHeight = 265
  ClientWidth = 662
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
    Width = 241
    Height = 105
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1086#1076#1077#1083#1080
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 88
      Height = 13
      Caption = #1057#1088#1077#1076#1085#1103#1103' '#1076#1083#1080#1085#1072' = '
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 73
      Height = 13
      Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' = '
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 126
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1075#1086#1090#1086#1074#1086#1082' = '
    end
    object Label4: TLabel
      Left = 216
      Top = 26
      Width = 15
      Height = 13
      Caption = #1057#1084
    end
    object Label5: TLabel
      Left = 216
      Top = 50
      Width = 15
      Height = 13
      Caption = #1057#1084
    end
    object Edit1: TEdit
      Left = 136
      Top = 22
      Width = 73
      Height = 21
      TabOrder = 0
      Text = '35'
    end
    object Edit2: TEdit
      Left = 136
      Top = 46
      Width = 73
      Height = 21
      TabOrder = 1
      Text = '10'
    end
    object Edit3: TEdit
      Left = 136
      Top = 70
      Width = 73
      Height = 21
      TabOrder = 2
      Text = '10'
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 120
    Width = 233
    Height = 65
    Caption = #1057#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Chart1: TChart
    Left = 256
    Top = 8
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      '')
    Title.Visible = False
    Legend.Visible = False
    TabOrder = 2
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = 16512
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
  object BitBtn2: TBitBtn
    Left = 8
    Top = 192
    Width = 233
    Height = 65
    Caption = #1057#1073#1088#1086#1089#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkRetry
  end
end
