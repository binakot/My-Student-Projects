object Form4: TForm4
  Left = 328
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'4'
  ClientHeight = 383
  ClientWidth = 771
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
    OnMouseMove = Image1MouseMove
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 364
    Width = 771
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 324
    Top = 8
    Width = 439
    Height = 300
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    OnMouseMove = Panel1MouseMove
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 217
      Height = 57
      Caption = #1057#1080#1089#1090#1077#1084#1072' '#1082#1086#1086#1088#1076#1080#1085#1072#1090
      TabOrder = 0
      object RadioButton1: TRadioButton
        Left = 16
        Top = 24
        Width = 81
        Height = 17
        Caption = #1044#1074#1091#1084#1077#1088#1085#1072#1103
        TabOrder = 0
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 114
        Top = 24
        Width = 92
        Height = 17
        Caption = #1058#1088#1105#1093#1084#1077#1088#1085#1072#1103
        TabOrder = 1
        OnClick = RadioButton2Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 71
      Width = 397
      Height = 202
      Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 16
        Top = 24
        Width = 366
        Height = 161
        ActivePage = TabSheet1
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #1042#1088#1072#1097#1077#1085#1080#1077
          object SpeedButton1: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton1Click
          end
          object GroupBox3: TGroupBox
            Left = 139
            Top = 19
            Width = 102
            Height = 70
            Caption = #1059#1075#1086#1083' '#1087#1086#1074#1086#1088#1086#1090#1072
            TabOrder = 0
            object Edit1: TEdit
              Left = 17
              Top = 27
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '0'
            end
            object UpDown1: TUpDown
              Left = 66
              Top = 27
              Width = 17
              Height = 24
              Min = -360
              Max = 360
              TabOrder = 1
              OnClick = UpDown1Click
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1056#1072#1089#1090#1103#1078#1077#1085#1080#1077' ('#1057#1078#1072#1090#1080#1077')'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object SpeedButton2: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton2Click
          end
          object GroupBox4: TGroupBox
            Left = 48
            Top = 19
            Width = 257
            Height = 70
            Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090#1099' '#1084#1072#1089#1096#1090#1072#1073#1072
            TabOrder = 0
            object Label1: TLabel
              Left = 16
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Sx'
            end
            object Label2: TLabel
              Left = 136
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Sy'
            end
            object Edit2: TEdit
              Left = 48
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '0'
            end
            object Edit3: TEdit
              Left = 168
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 1
              Text = '0'
            end
            object UpDown2: TUpDown
              Left = 96
              Top = 24
              Width = 17
              Height = 24
              TabOrder = 2
              OnClick = UpDown2Click
            end
            object UpDown3: TUpDown
              Left = 216
              Top = 24
              Width = 17
              Height = 24
              TabOrder = 3
              OnClick = UpDown3Click
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #1054#1090#1088#1072#1078#1077#1085#1080#1077
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object SpeedButton4: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton4Click
          end
          object GroupBox6: TGroupBox
            Left = 48
            Top = 19
            Width = 257
            Height = 70
            Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090#1099' '#1086#1090#1088#1072#1078#1077#1085#1080#1103
            TabOrder = 0
            object Label5: TLabel
              Left = 24
              Top = 28
              Width = 6
              Height = 16
              Caption = 'x'
            end
            object Label6: TLabel
              Left = 144
              Top = 28
              Width = 6
              Height = 16
              Caption = 'y'
            end
            object Edit6: TEdit
              Left = 48
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '1'
            end
            object Edit7: TEdit
              Left = 168
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 1
              Text = '1'
            end
            object UpDown6: TUpDown
              Left = 96
              Top = 24
              Width = 17
              Height = 24
              Min = -1
              Max = 1
              TabOrder = 2
              OnClick = UpDown6Click
            end
            object UpDown7: TUpDown
              Left = 216
              Top = 24
              Width = 17
              Height = 24
              Min = -1
              Max = 1
              TabOrder = 3
              OnClick = UpDown7Click
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1055#1077#1088#1077#1085#1086#1089
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object SpeedButton3: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton3Click
          end
          object GroupBox5: TGroupBox
            Left = 48
            Top = 19
            Width = 257
            Height = 70
            Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090#1099' '#1087#1077#1088#1077#1085#1086#1089#1072
            TabOrder = 0
            object Label3: TLabel
              Left = 16
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Dx'
            end
            object Label4: TLabel
              Left = 136
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Dy'
            end
            object Edit4: TEdit
              Left = 48
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '0'
            end
            object UpDown4: TUpDown
              Left = 96
              Top = 24
              Width = 17
              Height = 24
              Min = -300
              Max = 300
              TabOrder = 1
              OnClick = UpDown4Click
            end
            object Edit5: TEdit
              Left = 168
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 2
              Text = '0'
            end
            object UpDown5: TUpDown
              Left = 216
              Top = 24
              Width = 17
              Height = 24
              Min = -300
              Max = 300
              TabOrder = 3
              OnClick = UpDown5Click
            end
          end
        end
      end
      object PageControl2: TPageControl
        Left = 16
        Top = 24
        Width = 366
        Height = 161
        ActivePage = TabSheet5
        TabOrder = 1
        Visible = False
        object TabSheet5: TTabSheet
          Caption = #1042#1088#1072#1097#1077#1085#1080#1077
          object SpeedButton5: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton5Click
          end
          object GroupBox7: TGroupBox
            Left = 171
            Top = 19
            Width = 102
            Height = 70
            Caption = #1059#1075#1086#1083' '#1087#1086#1074#1086#1088#1086#1090#1072
            TabOrder = 0
            object Edit8: TEdit
              Left = 17
              Top = 27
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '0'
            end
            object UpDown8: TUpDown
              Left = 66
              Top = 27
              Width = 17
              Height = 24
              Min = -360
              Max = 360
              TabOrder = 1
              OnClick = UpDown8Click
            end
          end
          object RadioButton3: TRadioButton
            Left = 52
            Top = 68
            Width = 113
            Height = 17
            Caption = #1042#1086#1082#1088#1091#1075' '#1086#1089#1080' Z'
            TabOrder = 1
          end
          object RadioButton4: TRadioButton
            Left = 52
            Top = 22
            Width = 113
            Height = 17
            Caption = #1042#1086#1082#1088#1091#1075' '#1086#1089#1080' X'
            TabOrder = 2
          end
          object RadioButton5: TRadioButton
            Left = 52
            Top = 45
            Width = 113
            Height = 17
            Caption = #1042#1086#1082#1088#1091#1075' '#1086#1089#1080' Y'
            TabOrder = 3
          end
        end
        object TabSheet6: TTabSheet
          Caption = #1056#1072#1089#1090#1103#1078#1077#1085#1080#1077' ('#1057#1078#1072#1090#1080#1077')'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object SpeedButton6: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton6Click
          end
          object GroupBox8: TGroupBox
            Left = 16
            Top = 19
            Width = 329
            Height = 70
            Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090#1099' '#1084#1072#1089#1096#1090#1072#1073#1072
            TabOrder = 0
            object Label7: TLabel
              Left = 16
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Sx'
            end
            object Label8: TLabel
              Left = 120
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Sy'
            end
            object Label9: TLabel
              Left = 224
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Sz'
            end
            object Edit9: TEdit
              Left = 36
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '0'
            end
            object Edit10: TEdit
              Left = 140
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 1
              Text = '0'
            end
            object UpDown9: TUpDown
              Left = 88
              Top = 24
              Width = 17
              Height = 24
              Min = -100
              TabOrder = 2
              OnClick = UpDown9Click
            end
            object UpDown10: TUpDown
              Left = 192
              Top = 24
              Width = 17
              Height = 24
              Min = -100
              TabOrder = 3
              OnClick = UpDown10Click
            end
            object Edit11: TEdit
              Left = 244
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 4
              Text = '0'
            end
            object UpDown11: TUpDown
              Left = 296
              Top = 24
              Width = 17
              Height = 24
              Min = -100
              TabOrder = 5
              OnClick = UpDown11Click
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = #1054#1090#1088#1072#1078#1077#1085#1080#1077
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object SpeedButton7: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton7Click
          end
          object GroupBox9: TGroupBox
            Left = 11
            Top = 19
            Width = 334
            Height = 70
            Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090#1099' '#1086#1090#1088#1072#1078#1077#1085#1080#1103
            TabOrder = 0
            object Label10: TLabel
              Left = 24
              Top = 28
              Width = 6
              Height = 16
              Caption = 'x'
            end
            object Label11: TLabel
              Left = 124
              Top = 28
              Width = 6
              Height = 16
              Caption = 'y'
            end
            object Label12: TLabel
              Left = 224
              Top = 28
              Width = 6
              Height = 16
              Caption = 'z'
            end
            object Edit12: TEdit
              Left = 36
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '1'
            end
            object Edit13: TEdit
              Left = 136
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 1
              Text = '1'
            end
            object UpDown12: TUpDown
              Left = 88
              Top = 24
              Width = 17
              Height = 24
              Min = -1
              Max = 1
              TabOrder = 2
              OnClick = UpDown12Click
            end
            object UpDown13: TUpDown
              Left = 184
              Top = 24
              Width = 17
              Height = 24
              Min = -1
              Max = 1
              TabOrder = 3
              OnClick = UpDown13Click
            end
            object Edit14: TEdit
              Left = 236
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 4
              Text = '1'
            end
            object UpDown14: TUpDown
              Left = 288
              Top = 24
              Width = 17
              Height = 24
              Min = -1
              Max = 1
              TabOrder = 5
              OnClick = UpDown14Click
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = #1055#1077#1088#1077#1085#1086#1089
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object SpeedButton8: TSpeedButton
            Left = 272
            Top = 105
            Width = 83
            Height = 22
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            OnClick = SpeedButton8Click
          end
          object GroupBox10: TGroupBox
            Left = 16
            Top = 19
            Width = 329
            Height = 70
            Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090#1099' '#1087#1077#1088#1077#1085#1086#1089#1072
            TabOrder = 0
            object Label13: TLabel
              Left = 16
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Dx'
            end
            object Label14: TLabel
              Left = 120
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Dy'
            end
            object Label15: TLabel
              Left = 231
              Top = 28
              Width = 14
              Height = 16
              Caption = 'Dz'
            end
            object Edit15: TEdit
              Left = 36
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 0
              Text = '0'
            end
            object UpDown15: TUpDown
              Left = 88
              Top = 24
              Width = 17
              Height = 24
              Min = -300
              Max = 300
              TabOrder = 1
              OnClick = UpDown15Click
            end
            object Edit16: TEdit
              Left = 145
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 2
              Text = '0'
            end
            object UpDown16: TUpDown
              Left = 200
              Top = 24
              Width = 17
              Height = 24
              Min = -300
              Max = 300
              TabOrder = 3
              OnClick = UpDown16Click
            end
            object Edit17: TEdit
              Left = 251
              Top = 24
              Width = 65
              Height = 24
              MaxLength = 4
              ReadOnly = True
              TabOrder = 4
              Text = '0'
            end
            object UpDown17: TUpDown
              Left = 301
              Top = 24
              Width = 17
              Height = 24
              Min = -300
              Max = 300
              TabOrder = 5
              OnClick = UpDown17Click
            end
          end
        end
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 24
    Top = 8
  end
end
