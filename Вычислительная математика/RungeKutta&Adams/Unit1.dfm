object Form1: TForm1
  Left = 539
  Top = 220
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1084#1077#1090#1086#1076#1086#1074' '#1056#1091#1085#1075#1077'-'#1050#1091#1090#1090#1099' '#1080' '#1040#1076#1072#1084#1089#1072' '#1076#1083#1103' '#1088#1077#1096#1077#1085#1080#1103' '#1054#1044#1059
  ClientHeight = 363
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 248
    Top = 316
    Width = 197
    Height = 13
    Caption = 'copyright(c) 2011 '#1052#1091#1088#1072#1090#1086#1074' '#1048#1074#1072#1085' '#1048#1042#1058'-09'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 65
    Caption = #1047#1072#1076#1072#1095#1072' '#1050#1086#1096#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 166
      Height = 20
      Caption = 'y'#39' = f( x, y ),  y( Xn ) = Yn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 80
    Width = 193
    Height = 113
    Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 21
      Width = 46
      Height = 20
      Caption = 'f(x,y) ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 53
      Width = 33
      Height = 20
      Caption = 'Xn ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 80
      Width = 39
      Height = 20
      Caption = 'eps ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 64
      Top = 50
      Width = 113
      Height = 24
      TabOrder = 0
      Text = '2'
    end
    object Edit1: TEdit
      Left = 64
      Top = 21
      Width = 113
      Height = 24
      DragMode = dmAutomatic
      TabOrder = 1
      Text = 'y/x + x + 1'
    end
  end
  object Panel1: TPanel
    Left = 232
    Top = 16
    Width = 225
    Height = 273
    TabOrder = 2
    object Button3: TButton
      Left = 8
      Top = 220
      Width = 209
      Height = 45
      Caption = #1057#1088#1072#1074#1085#1080#1090#1100' '#1084#1077#1090#1086#1076#1099
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 209
      Height = 45
      Caption = #1052#1077#1090#1086#1076' '#1056#1091#1085#1075#1077'-'#1050#1091#1090#1090#1099
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 8
      Top = 165
      Width = 209
      Height = 45
      Caption = #1052#1086#1076#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1084#1077#1090#1086#1076' '#1069#1081#1083#1077#1088#1072
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button2: TButton
      Left = 8
      Top = 60
      Width = 209
      Height = 45
      Caption = #1052#1077#1090#1086#1076' '#1040#1076#1072#1084#1089#1072
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 8
      Top = 112
      Width = 209
      Height = 45
      Caption = #1052#1077#1090#1086#1076' '#1087#1088#1086#1075#1085#1086#1079#1072' '#1080' '#1082#1086#1088#1088#1077#1082#1094#1080#1080
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object Edit3: TEdit
    Left = 72
    Top = 162
    Width = 113
    Height = 21
    TabOrder = 3
    Text = '0,000001'
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 200
    Width = 193
    Height = 89
    Caption = #1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1091#1089#1083#1086#1074#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label5: TLabel
      Left = 24
      Top = 21
      Width = 29
      Height = 20
      Caption = 'x0 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 53
      Width = 46
      Height = 20
      Caption = 'y(x0) ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit4: TEdit
      Left = 64
      Top = 50
      Width = 113
      Height = 24
      TabOrder = 0
      Text = '0'
    end
    object Edit5: TEdit
      Left = 64
      Top = 21
      Width = 113
      Height = 24
      TabOrder = 1
      Text = '1'
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 296
    Width = 193
    Height = 57
    Caption = #1044#1083#1103' '#1089#1088#1072#1074#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Label8: TLabel
      Left = 24
      Top = 21
      Width = 24
      Height = 20
      Caption = 'Y ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit7: TEdit
      Left = 64
      Top = 21
      Width = 113
      Height = 24
      TabOrder = 0
      Text = '3,3862943611198906188344642429164'
    end
  end
  object XPManifest1: TXPManifest
    Left = 200
    Top = 16
  end
end
