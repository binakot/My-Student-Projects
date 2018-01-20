object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'5'
  ClientHeight = 338
  ClientWidth = 802
  Color = clWindowFrame
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000000000
    0000000000000000000000000000000000050000002500000043000000520000
    0052000000430000002500000005000000000000000000000000000000000000
    0000000000000000000000000025000000490000005100000084000000A50000
    00A5000000840000005100000049000000250000000000000000000000000000
    0000000000000000003400000043000000A50000006800000097000000C60000
    00C60000009700000068000000A5000000430000003400000000000000000000
    000000000025000000430000008C000000970000007E0000009E000000DB0000
    00DB0000009E0000007E000000970000008C0000004300000025000000000000
    000500000049000000A5000000970000007A000000AA00000096000000E60000
    00E600000096000000AA0000007A00000097000000A500000049000000050000
    002500000051000000680000007E000000AA000000E60000008D000000ED0000
    00ED0000008D000000E6000000AA0000007E0000006800000051000000250000
    004300000084000000970000009E000000960000008D000000A8000000FD0000
    00FD000000A80000008D000000960000009E0000009700000084000000430000
    0052000000A5000000C6000000DB000000E6000000ED000000FD0000001C0000
    001C000000FD000000ED000000E6000000DB000000C6000000A5000000520000
    0052000000A5000000C6000000DB000000E6000000ED000000FD0000001C0000
    001C000000FD000000ED000000E6000000DB000000C6000000A5000000520000
    004300000084000000970000009E000000960000008D000000A8000000FD0000
    00FD000000A80000008D000000960000009E0000009700000084000000430000
    002500000051000000680000007E000000AA000000E60000008D000000ED0000
    00ED0000008D000000E6000000AA0000007E0000006800000051000000250000
    000500000049000000A5000000970000007A000000AA00000096000000E60000
    00E600000096000000AA0000007A00000097000000A500000049000000050000
    000000000025000000430000008C000000970000007E0000009E000000DB0000
    00DB0000009E0000007E000000970000008C0000004300000025000000000000
    0000000000000000003400000043000000A50000006800000097000000C60000
    00C60000009700000068000000A5000000430000003400000000000000000000
    0000000000000000000000000025000000490000005100000084000000A50000
    00A500000084000000510000004900000025000000000000000000000000FFFF
    FF00000000000000000000000000000000050000002500000043000000520000
    005200000043000000250000000500000000000000000000000000000000F00F
    0000E0070000C003000080010000000000000000000000000000000000000000
    000000000000000000000000000080010000C0030000E0070000700F0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 16
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 300
    Height = 300
    Cursor = crCross
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 319
    Width = 802
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 314
    Top = 8
    Width = 481
    Height = 249
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    OnMouseMove = Panel1MouseMove
    object SpeedButton2: TSpeedButton
      Left = 392
      Top = 215
      Width = 81
      Height = 22
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = SpeedButton2Click
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 257
      Height = 201
      Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1086#1081' '#1086#1073#1083#1072#1089#1090#1080
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 170
        Top = 166
        Width = 84
        Height = 22
        Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
        OnClick = SpeedButton1Click
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 24
        Width = 225
        Height = 65
        Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1074#1077#1088#1093#1085#1077#1075#1086' '#1083#1077#1074#1086#1075#1086' '#1091#1075#1086#1083#1072
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 24
          Width = 8
          Height = 16
          Caption = 'X'
        end
        object Label2: TLabel
          Left = 128
          Top = 24
          Width = 7
          Height = 16
          Caption = 'Y'
        end
        object Edit1: TEdit
          Left = 46
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 150
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 16
        Top = 95
        Width = 225
        Height = 65
        Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1085#1080#1078#1085#1077#1075#1086' '#1087#1088#1072#1074#1086#1075#1086' '#1091#1075#1083#1072
        TabOrder = 1
        object Label3: TLabel
          Left = 24
          Top = 24
          Width = 8
          Height = 16
          Caption = 'X'
        end
        object Label4: TLabel
          Left = 128
          Top = 24
          Width = 7
          Height = 16
          Caption = 'Y'
        end
        object Edit3: TEdit
          Left = 46
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 0
        end
        object Edit4: TEdit
          Left = 150
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 1
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 271
      Top = 8
      Width = 202
      Height = 201
      Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1086#1090#1088#1077#1079#1082#1072
      TabOrder = 1
      object SpeedButton3: TSpeedButton
        Left = 115
        Top = 166
        Width = 84
        Height = 22
        Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
        OnClick = SpeedButton3Click
      end
      object GroupBox5: TGroupBox
        Left = 16
        Top = 24
        Width = 172
        Height = 65
        Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1085#1072#1095#1072#1083#1072
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 24
          Width = 8
          Height = 16
          Caption = 'X'
        end
        object Label6: TLabel
          Left = 96
          Top = 24
          Width = 7
          Height = 16
          Caption = 'Y'
        end
        object Edit5: TEdit
          Left = 30
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 0
        end
        object Edit6: TEdit
          Left = 109
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 1
        end
      end
      object GroupBox6: TGroupBox
        Left = 16
        Top = 95
        Width = 172
        Height = 65
        Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1082#1086#1085#1094#1072
        TabOrder = 1
        object Label7: TLabel
          Left = 16
          Top = 24
          Width = 8
          Height = 16
          Caption = 'X'
        end
        object Label8: TLabel
          Left = 96
          Top = 24
          Width = 7
          Height = 16
          Caption = 'Y'
        end
        object Edit7: TEdit
          Left = 30
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 0
        end
        object Edit8: TEdit
          Left = 109
          Top = 22
          Width = 46
          Height = 24
          MaxLength = 3
          TabOrder = 1
        end
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 24
    Top = 8
  end
end
