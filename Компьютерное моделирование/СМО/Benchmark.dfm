object Form2: TForm2
  Left = 429
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1094#1077#1085#1082#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080
  ClientHeight = 363
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 120
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074':'
  end
  object Label6: TLabel
    Left = 16
    Top = 72
    Width = 207
    Height = 13
    Caption = 'Resize() '#1076#1083#1103' '#1086#1095#1077#1088#1077#1076#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1084#1072#1089#1089#1080#1074#1072':'
  end
  object Count_Element: TEdit
    Left = 144
    Top = 20
    Width = 129
    Height = 21
    TabOrder = 0
    Text = '50000'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 128
    Width = 401
    Height = 105
    Caption = 'PUSH'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 149
      Height = 13
      Caption = '1) '#1086#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1089#1087#1080#1089#1082#1072':'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 157
      Height = 13
      Caption = '2) '#1086#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1084#1072#1089#1089#1080#1074#1072':'
    end
    object Time_Push_List: TEdit
      Left = 224
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Time_Push_Array: TEdit
      Left = 224
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object Test: TButton
    Left = 328
    Top = 18
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 2
    OnClick = TestClick
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 248
    Width = 401
    Height = 105
    Caption = 'POP'
    TabOrder = 3
    object Label4: TLabel
      Left = 16
      Top = 24
      Width = 149
      Height = 13
      Caption = '1) '#1086#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1089#1087#1080#1089#1082#1072':'
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 157
      Height = 13
      Caption = '2) '#1086#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1084#1072#1089#1089#1080#1074#1072':'
    end
    object Time_Pop_List: TEdit
      Left = 224
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Time_Pop_Array: TEdit
      Left = 224
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object Resize_Size: TEdit
    Left = 232
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '10000'
  end
end
