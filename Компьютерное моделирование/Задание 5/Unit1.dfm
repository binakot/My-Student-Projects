object Form1: TForm1
  Left = 382
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1072' 5 - '#1050#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1077' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1074' '#1101#1082#1086#1083#1086#1075#1080#1080
  ClientHeight = 294
  ClientWidth = 631
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
  object Label7: TLabel
    Left = 8
    Top = 216
    Width = 78
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1096#1072#1075#1086#1074' = '
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 121
    Caption = #1055#1086#1087#1091#1083#1103#1094#1080#1103' '#1093#1080#1097#1085#1080#1082#1086#1074
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 19
      Height = 13
      Hint = #1063#1080#1089#1083#1077#1085#1085#1086#1089#1090#1100' '#1087#1086#1087#1091#1083#1103#1094#1080#1080' '#1093#1080#1097#1085#1080#1082#1086#1074
      Caption = 'C = '
      ParentShowHint = False
      ShowHint = True
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 18
      Height = 13
      Hint = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1101#1092#1092#1077#1082#1090#1080#1074#1085#1086#1089#1090#1080' '#1087#1086#1080#1089#1082#1072
      Caption = 'a = '
      ParentShowHint = False
      ShowHint = True
    end
    object Label5: TLabel
      Left = 8
      Top = 64
      Width = 18
      Height = 13
      Hint = #1057#1084#1077#1088#1090#1085#1086#1089#1090#1100' '#1087#1086#1087#1091#1083#1103#1094#1080#1080' '#1093#1080#1097#1085#1080#1082#1086#1074' '#1073#1077#1079' '#1087#1080#1097#1080
      Caption = 'q = '
      ParentShowHint = False
      ShowHint = True
    end
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 15
      Height = 13
      Hint = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1101#1092#1092#1077#1082#1090#1080#1074#1085#1086#1089#1090#1080' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1087#1080#1097#1080' '#1074' '#1087#1086#1090#1086#1084#1089#1090#1074#1086' '#1093#1080#1097#1085#1080#1082#1086#1074
      Caption = 'f = '
      ParentShowHint = False
      ShowHint = True
    end
    object Edit1: TEdit
      Left = 40
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '50'
    end
    object Edit3: TEdit
      Left = 40
      Top = 40
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '0,5'
    end
    object Edit5: TEdit
      Left = 40
      Top = 64
      Width = 81
      Height = 21
      TabOrder = 2
      Text = '100'
    end
    object Edit6: TEdit
      Left = 40
      Top = 88
      Width = 81
      Height = 21
      TabOrder = 3
      Text = '0,5'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 137
    Height = 73
    Caption = #1055#1086#1087#1091#1083#1103#1094#1080#1103' '#1078#1077#1088#1090#1074
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 20
      Height = 13
      Hint = #1063#1080#1089#1083#1077#1085#1085#1086#1089#1090#1100' '#1087#1086#1087#1091#1083#1103#1094#1080#1080' '#1078#1077#1088#1090#1074
      Caption = 'N = '
      ParentShowHint = False
      ShowHint = True
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 15
      Height = 13
      Hint = 
        #1057#1082#1086#1088#1086#1089#1090#1100' '#1088#1086#1089#1090#1072' '#1087#1086#1087#1091#1083#1103#1094#1080#1080' '#1078#1077#1088#1090#1074'  '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1074#1085#1091#1090#1088#1080#1074#1080#1076#1086#1074#1086#1081' '#1082#1086#1085#1082#1091#1088#1077#1085 +
        #1094#1080#1080
      Caption = 'r = '
      ParentShowHint = False
      ShowHint = True
    end
    object Edit2: TEdit
      Left = 40
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '100'
    end
    object Edit4: TEdit
      Left = 40
      Top = 40
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '50'
    end
  end
  object Chart1: TChart
    Left = 152
    Top = 16
    Width = 473
    Height = 273
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Visible = False
    TabOrder = 2
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = #1061#1080#1097#1085#1080#1082#1080
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = #1046#1077#1088#1090#1074#1099
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
  object BitBtn1: TBitBtn
    Left = 8
    Top = 240
    Width = 137
    Height = 49
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Edit7: TEdit
    Left = 96
    Top = 215
    Width = 49
    Height = 21
    TabOrder = 4
    Text = '100'
  end
end
