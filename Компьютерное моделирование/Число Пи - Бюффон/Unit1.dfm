object Form1: TForm1
  Left = 192
  Top = 124
  Width = 831
  Height = 508
  Caption = #1048#1075#1083#1072' '#1041#1102#1092#1092#1086#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    815
    470)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 296
    Top = 8
    Width = 500
    Height = 400
  end
  object Label6: TLabel
    Left = 8
    Top = 416
    Width = 800
    Height = 20
    Caption = 
      #1058#1086#1095#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' Pi = 3.14159265358979323846264338327950288419716' +
      '9399375105820974944'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 440
    Width = 147
    Height = 20
    Caption = '"'#1042#1072#1096#1077'" '#1095#1080#1083#1086' Pi = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 169
    Caption = #1056#1091#1095#1085#1086#1081
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 112
      Width = 88
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1073#1088#1086#1089#1082#1086#1074' ='
    end
    object Label2: TLabel
      Left = 16
      Top = 136
      Width = 111
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1081' ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 16
      Width = 249
      Height = 41
      Caption = #1041#1088#1086#1089#1086#1082
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 64
      Width = 249
      Height = 41
      Caption = #1055#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object Edit1: TEdit
      Left = 136
      Top = 112
      Width = 129
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object Edit2: TEdit
      Left = 136
      Top = 136
      Width = 129
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 184
    Width = 281
    Height = 169
    Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 91
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1073#1088#1086#1089#1082#1086#1074' = '
    end
    object Edit3: TEdit
      Left = 136
      Top = 16
      Width = 129
      Height = 21
      TabOrder = 0
      Text = '100'
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 40
      Width = 257
      Height = 41
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1086#1087#1099#1090
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 88
      Width = 265
      Height = 73
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 16
        Width = 88
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086' '#1073#1088#1086#1089#1082#1086#1074' ='
      end
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 111
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086' '#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077' ='
      end
      object Edit4: TEdit
        Left = 128
        Top = 16
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object Edit5: TEdit
        Left = 128
        Top = 40
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
    end
  end
  object Edit6: TEdit
    Left = 190
    Top = 438
    Width = 619
    Height = 28
    Anchors = [akLeft]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object BitBtn4: TBitBtn
    Left = 8
    Top = 360
    Width = 281
    Height = 49
    Caption = '&'#1057#1073#1088#1086#1089
    TabOrder = 3
    OnClick = BitBtn4Click
    Kind = bkRetry
  end
end
