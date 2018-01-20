object Form1: TForm1
  Left = 285
  Top = 136
  BorderStyle = bsSingle
  Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1077' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077' - '#1042#1072#1088#1080#1072#1085#1090' 13 - '#1047#1072#1076#1072#1085#1080#1077' 2'
  ClientHeight = 525
  ClientWidth = 718
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
    Left = 208
    Top = 16
    Width = 500
    Height = 500
  end
  object Label14: TLabel
    Left = 8
    Top = 352
    Width = 42
    Height = 13
    Caption = 'deltaT = '
  end
  object Label15: TLabel
    Left = 168
    Top = 352
    Width = 7
    Height = 16
    Caption = #1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 169
    Caption = 'I '#1079#1072#1088#1103#1078#1077#1085#1085#1072#1103' '#1095#1072#1089#1090#1080#1094#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 21
      Height = 16
      Caption = 'q = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 8
      Height = 16
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 160
      Top = 40
      Width = 13
      Height = 16
      Caption = #1082#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 24
      Height = 16
      Caption = 'm = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 64
      Width = 19
      Height = 16
      Caption = 'x = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 88
      Width = 20
      Height = 16
      Caption = 'y = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 112
      Width = 22
      Height = 16
      Caption = 'V = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 160
      Top = 112
      Width = 20
      Height = 16
      Caption = #1084'/c'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 8
      Top = 136
      Width = 48
      Height = 16
      Caption = 'Alpha = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 32
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0,01'
    end
    object Edit2: TEdit
      Left = 32
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0,001'
    end
    object Edit3: TEdit
      Left = 32
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '250'
    end
    object Edit4: TEdit
      Left = 32
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '250'
    end
    object Edit7: TEdit
      Left = 32
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '0,1'
    end
    object Edit9: TEdit
      Left = 56
      Top = 136
      Width = 97
      Height = 21
      TabOrder = 5
      Text = '30'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 184
    Width = 193
    Height = 97
    Caption = 'II '#1079#1072#1088#1103#1078#1077#1085#1085#1072#1103' '#1095#1072#1089#1090#1080#1094#1072
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 23
      Height = 16
      Caption = 'Q = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 40
      Width = 19
      Height = 16
      Caption = 'x = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 64
      Width = 20
      Height = 16
      Caption = 'y = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 160
      Top = 16
      Width = 8
      Height = 16
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit5: TEdit
      Left = 32
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '250'
    end
    object Edit6: TEdit
      Left = 32
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '300'
    end
    object Edit8: TEdit
      Left = 32
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '0,05'
    end
  end
  object Edit10: TEdit
    Left = 56
    Top = 352
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '0,0001'
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 288
    Width = 193
    Height = 57
    Caption = #1047#1072#1088#1103#1076#1099
    TabOrder = 3
    object RadioButton1: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = #1054#1076#1085#1086#1080#1084#1077#1085#1085#1099#1077
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 32
      Width = 113
      Height = 17
      Caption = #1056#1072#1079#1085#1086#1080#1084#1077#1085#1085#1099#1077
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 384
    Width = 193
    Height = 41
    Caption = '&'#1047#1072#1087#1091#1089#1082
    TabOrder = 4
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 432
    Width = 193
    Height = 41
    Caption = '&'#1058#1072#1073#1083#1080#1094#1072
    TabOrder = 5
    OnClick = BitBtn2Click
    Kind = bkHelp
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 480
    Width = 193
    Height = 41
    Caption = '&'#1057#1073#1088#1086#1089
    TabOrder = 6
    OnClick = BitBtn3Click
    Kind = bkRetry
  end
end
