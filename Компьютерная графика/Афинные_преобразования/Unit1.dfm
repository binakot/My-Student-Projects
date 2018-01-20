object Form1: TForm1
  Left = 430
  Top = 107
  BorderStyle = bsSingle
  Caption = #1040#1092#1080#1085#1085#1099#1077' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
  ClientHeight = 442
  ClientWidth = 735
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
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 545
    Height = 441
  end
  object Panel1: TPanel
    Left = 552
    Top = 0
    Width = 177
    Height = 105
    TabOrder = 0
    object Label1: TLabel
      Left = 29
      Top = 8
      Width = 116
      Height = 13
      Caption = #1042#1088#1072#1097#1077#1085#1080#1077' '#1074#1086#1082#1088#1091#1075' '#1086#1089#1077#1081
    end
    object Label2: TLabel
      Left = 29
      Top = 24
      Width = 14
      Height = 24
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 85
      Top = 24
      Width = 12
      Height = 24
      Caption = 'Y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 133
      Top = 24
      Width = 12
      Height = 24
      Caption = 'Z'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 64
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Edit2: TEdit
      Left = 120
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object Edit3: TEdit
      Left = 8
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object BitBtn1: TBitBtn
      Left = 40
      Top = 72
      Width = 105
      Height = 25
      Caption = #1055#1086#1074#1077#1088#1085#1091#1090#1100
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 552
    Top = 112
    Width = 177
    Height = 105
    TabOrder = 1
    object Label5: TLabel
      Left = 29
      Top = 8
      Width = 108
      Height = 13
      Caption = #1056#1072#1089#1090#1103#1078#1077#1085#1080#1077' ('#1089#1078#1072#1090#1080#1077')'
    end
    object Label6: TLabel
      Left = 29
      Top = 24
      Width = 21
      Height = 24
      Caption = 'dx'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 85
      Top = 24
      Width = 20
      Height = 24
      Caption = 'dy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 133
      Top = 24
      Width = 20
      Height = 24
      Caption = 'dz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit4: TEdit
      Left = 8
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object Edit5: TEdit
      Left = 64
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object Edit6: TEdit
      Left = 120
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object BitBtn2: TBitBtn
      Left = 40
      Top = 72
      Width = 105
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object Panel3: TPanel
    Left = 552
    Top = 224
    Width = 177
    Height = 105
    TabOrder = 2
    object Label9: TLabel
      Left = 53
      Top = 8
      Width = 57
      Height = 13
      Caption = #1054#1090#1088#1072#1078#1077#1085#1080#1077
    end
    object Label10: TLabel
      Left = 29
      Top = 24
      Width = 10
      Height = 24
      Caption = 'x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 85
      Top = 24
      Width = 9
      Height = 24
      Caption = 'y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 133
      Top = 24
      Width = 9
      Height = 24
      Caption = 'z'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit7: TEdit
      Left = 8
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object Edit8: TEdit
      Left = 64
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object Edit9: TEdit
      Left = 120
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object BitBtn3: TBitBtn
      Left = 40
      Top = 72
      Width = 97
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object Panel4: TPanel
    Left = 552
    Top = 336
    Width = 177
    Height = 105
    TabOrder = 3
    object Label13: TLabel
      Left = 61
      Top = 8
      Width = 44
      Height = 13
      Caption = #1055#1077#1088#1077#1085#1086#1089
    end
    object Label14: TLabel
      Left = 29
      Top = 24
      Width = 10
      Height = 24
      Caption = 'x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 85
      Top = 24
      Width = 9
      Height = 24
      Caption = 'y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 133
      Top = 24
      Width = 9
      Height = 24
      Caption = 'z'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit10: TEdit
      Left = 8
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object Edit11: TEdit
      Left = 64
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object Edit12: TEdit
      Left = 120
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object BitBtn4: TBitBtn
      Left = 40
      Top = 72
      Width = 97
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = BitBtn4Click
    end
  end
  object XPManifest1: TXPManifest
  end
end
