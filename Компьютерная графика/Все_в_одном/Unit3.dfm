object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'2'
  ClientHeight = 336
  ClientWidth = 722
  Color = clWindowFrame
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
  TextHeight = 13
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
  object Panel1: TPanel
    Left = 329
    Top = 8
    Width = 385
    Height = 209
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnMouseMove = Panel1MouseMove
    object SpeedButton3: TSpeedButton
      Left = 288
      Top = 175
      Width = 81
      Height = 22
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = SpeedButton3Click
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 169
      Height = 161
      Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1086#1082#1088#1091#1078#1085#1086#1089#1090#1080
      TabOrder = 0
      OnMouseMove = GroupBox1MouseMove
      object SpeedButton1: TSpeedButton
        Left = 85
        Top = 126
        Width = 81
        Height = 22
        Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
        OnClick = SpeedButton1Click
      end
      object Label3: TLabel
        Left = 18
        Top = 87
        Width = 40
        Height = 16
        Caption = #1056#1072#1076#1080#1091#1089
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 23
        Width = 137
        Height = 58
        Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1094#1077#1085#1090#1088#1072
        TabOrder = 0
        object Label1: TLabel
          Left = 13
          Top = 24
          Width = 8
          Height = 16
          Caption = 'X'
        end
        object Label2: TLabel
          Left = 74
          Top = 24
          Width = 7
          Height = 16
          Caption = 'Y'
        end
        object Edit1: TEdit
          Left = 30
          Top = 22
          Width = 38
          Height = 24
          MaxLength = 3
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 87
          Top = 22
          Width = 38
          Height = 24
          MaxLength = 3
          TabOrder = 1
        end
      end
      object Edit3: TEdit
        Left = 78
        Top = 87
        Width = 38
        Height = 24
        MaxLength = 3
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 191
      Top = 8
      Width = 180
      Height = 161
      Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1101#1083#1083#1080#1087#1089#1072
      TabOrder = 1
      OnMouseMove = GroupBox3MouseMove
      object Label6: TLabel
        Left = 34
        Top = 87
        Width = 8
        Height = 16
        Caption = 'A'
      end
      object Label7: TLabel
        Left = 100
        Top = 87
        Width = 7
        Height = 16
        Caption = 'B'
      end
      object SpeedButton2: TSpeedButton
        Left = 96
        Top = 126
        Width = 81
        Height = 22
        Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
        OnClick = SpeedButton2Click
      end
      object GroupBox4: TGroupBox
        Left = 22
        Top = 23
        Width = 137
        Height = 58
        Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1094#1077#1085#1090#1088#1072
        TabOrder = 0
        object Label4: TLabel
          Left = 13
          Top = 24
          Width = 8
          Height = 16
          Caption = 'X'
        end
        object Label5: TLabel
          Left = 74
          Top = 24
          Width = 7
          Height = 16
          Caption = 'Y'
        end
        object Edit4: TEdit
          Left = 30
          Top = 22
          Width = 38
          Height = 24
          MaxLength = 3
          TabOrder = 0
        end
        object Edit5: TEdit
          Left = 87
          Top = 22
          Width = 38
          Height = 24
          MaxLength = 3
          TabOrder = 1
        end
      end
      object Edit6: TEdit
        Left = 56
        Top = 87
        Width = 38
        Height = 24
        MaxLength = 3
        TabOrder = 1
      end
      object Edit7: TEdit
        Left = 111
        Top = 87
        Width = 38
        Height = 24
        MaxLength = 3
        TabOrder = 2
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 317
    Width = 722
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object XPManifest1: TXPManifest
    Left = 24
    Top = 8
  end
end
