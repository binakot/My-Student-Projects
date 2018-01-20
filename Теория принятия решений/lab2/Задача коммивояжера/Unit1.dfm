object Form1: TForm1
  Left = 608
  Top = 105
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1047#1072#1076#1072#1095#1072' '#1050#1086#1084#1084#1080#1074#1086#1103#1078#1077#1088#1072
  ClientHeight = 505
  ClientWidth = 586
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
    Width = 329
    Height = 489
    Caption = #1042#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 109
      Height = 16
      Caption = #1050#1086#1083'-'#1074#1086' '#1074#1077#1088#1096#1080#1085' = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 48
      Width = 100
      Height = 16
      Caption = #1052#1072#1090#1088#1080#1094#1072' '#1074#1077#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 72
      Width = 313
      Height = 313
      ColCount = 6
      DefaultColWidth = 30
      DefaultRowHeight = 30
      RowCount = 6
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 120
      Top = 14
      Width = 65
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '5'
    end
    object BitBtn1: TBitBtn
      Left = 192
      Top = 16
      Width = 129
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 392
      Width = 185
      Height = 89
      Caption = #1051#1077#1075#1077#1085#1076#1072
      TabOrder = 3
      object Label3: TLabel
        Left = 56
        Top = 21
        Width = 44
        Height = 13
        Caption = #1053#1077#1090' '#1087#1091#1090#1080
      end
      object Label4: TLabel
        Left = 56
        Top = 44
        Width = 31
        Height = 13
        Caption = #1055#1077#1090#1083#1103
      end
      object Label5: TLabel
        Left = 56
        Top = 68
        Width = 123
        Height = 13
        Caption = #1055#1091#1090#1100' '#1095#1077#1088#1077#1079' '#1076#1088'. '#1074#1077#1088#1096#1080#1085#1099
      end
      object Edit2: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '-1'
      end
      object Edit3: TEdit
        Left = 8
        Top = 40
        Width = 41
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object Edit4: TEdit
        Left = 8
        Top = 64
        Width = 41
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = '00'
      end
    end
    object BitBtn2: TBitBtn
      Left = 200
      Top = 448
      Width = 121
      Height = 33
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      TabOrder = 4
      OnClick = BitBtn2Click
      Kind = bkOK
    end
    object GroupBox4: TGroupBox
      Left = 264
      Top = 392
      Width = 57
      Height = 49
      Caption = #1062#1077#1083#1100
      TabOrder = 5
      object Edit7: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '5'
      end
    end
    object GroupBox3: TGroupBox
      Left = 200
      Top = 392
      Width = 57
      Height = 49
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082
      TabOrder = 6
      object Edit5: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '1'
      end
    end
  end
  object Memo1: TMemo
    Left = 352
    Top = 16
    Width = 225
    Height = 481
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object XPManifest1: TXPManifest
    Left = 296
    Top = 360
  end
end
