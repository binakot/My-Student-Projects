object Form1: TForm1
  Left = 557
  Top = 301
  Width = 394
  Height = 511
  Caption = 'Form1'
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 377
    Height = 201
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 192
      Top = 16
      Width = 161
      Height = 97
      Caption = #1048#1089#1089#1083#1077#1076#1091#1077#1084#1099#1077' '#1089#1080#1089#1090#1077#1084#1072
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 77
        Height = 13
        Caption = 'Cos(X) + Y = 1,5'
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 92
        Height = 13
        Caption = '2X - Sin(Y - 0,5) = 1'
      end
    end
    object Button1: TButton
      Left = 112
      Top = 128
      Width = 161
      Height = 33
      Caption = #1056#1077#1096#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1091
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 16
      Width = 161
      Height = 97
      Caption = #1053#1072#1095#1072#1083#1100#1086#1077' '#1087#1088#1080#1073#1083#1080#1078#1077#1085#1080#1077
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 24
        Height = 13
        Caption = #1055#1086' X'
      end
      object Label4: TLabel
        Left = 8
        Top = 56
        Width = 24
        Height = 13
        Caption = #1055#1086' Y'
      end
      object Label5: TLabel
        Left = 104
        Top = 32
        Width = 47
        Height = 13
        Caption = #1058#1086#1095#1085#1086#1089#1090#1100
      end
      object Edit1: TEdit
        Left = 40
        Top = 24
        Width = 41
        Height = 21
        AutoSize = False
        TabOrder = 0
        Text = '0,4'
      end
      object Edit2: TEdit
        Left = 40
        Top = 56
        Width = 41
        Height = 21
        AutoSize = False
        TabOrder = 1
        Text = '-0,75'
      end
      object Edit3: TEdit
        Left = 104
        Top = 56
        Width = 49
        Height = 21
        AutoSize = False
        TabOrder = 2
        Text = '0,001'
      end
    end
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 208
    Width = 385
    Height = 265
    Lines.Strings = (
      'RichEdit1')
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
