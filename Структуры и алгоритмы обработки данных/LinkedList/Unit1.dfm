object Form1: TForm1
  Left = 511
  Top = 292
  BorderStyle = bsSingle
  Caption = #1057#1040#1054#1044' - '#1057#1087#1080#1089#1082#1080' - 9.10 - '#1046#1050
  ClientHeight = 352
  ClientWidth = 564
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
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 107
    Height = 13
    Caption = #1057#1090#1077#1087#1077#1085#1100' '#1087#1086#1083#1080#1085#1086#1084#1072' = '
  end
  object SpeedButton1: TSpeedButton
    Left = 168
    Top = 8
    Width = 23
    Height = 41
    OnClick = SpeedButton1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 32
    Width = 153
    Height = 313
    ColCount = 2
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      64
      64)
  end
  object Edit1: TEdit
    Left = 120
    Top = 8
    Width = 41
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object BitBtn1: TBitBtn
    Left = 376
    Top = 8
    Width = 185
    Height = 41
    Caption = '&'#1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object GroupBox1: TGroupBox
    Left = 168
    Top = 56
    Width = 385
    Height = 81
    Caption = #1042#1080#1076' '#1087#1086#1083#1080#1085#1086#1084#1072
    TabOrder = 3
    object Edit2: TEdit
      Left = 8
      Top = 16
      Width = 369
      Height = 21
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Caption = #1042#1099#1074#1077#1089#1090#1080
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 168
    Top = 144
    Width = 201
    Height = 81
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1080#1085#1086#1084#1072
    TabOrder = 4
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 17
      Height = 13
      Caption = 'x = '
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 64
      Height = 13
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' = '
    end
    object Edit3: TEdit
      Left = 104
      Top = 51
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 104
      Top = 18
      Width = 81
      Height = 25
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object Edit4: TEdit
      Left = 40
      Top = 22
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '1'
    end
  end
  object BitBtn4: TBitBtn
    Left = 200
    Top = 8
    Width = 169
    Height = 41
    Caption = '&'#1057#1083#1091#1095#1072#1081#1085#1086#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077
    TabOrder = 5
    OnClick = BitBtn4Click
    Kind = bkRetry
  end
  object BitBtn5: TBitBtn
    Left = 376
    Top = 152
    Width = 177
    Height = 73
    Caption = #1042#1099#1087#1086#1083#1080#1085#1090#1100
    TabOrder = 6
    OnClick = BitBtn5Click
  end
end
