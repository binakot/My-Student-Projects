object Form5: TForm5
  Left = 493
  Top = 253
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1052#1086#1076#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1084#1077#1090#1086#1076' '#1069#1081#1083#1077#1088#1072
  ClientHeight = 259
  ClientWidth = 565
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 65
    Caption = #1055#1086#1088#1103#1076#1086#1082' '#1090#1086#1095#1085#1086#1089#1090#1080
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = '3 '#1087#1086#1088#1103#1076#1086#1082
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 40
      Width = 113
      Height = 17
      Caption = '4 '#1087#1086#1088#1103#1076#1086#1082
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 80
    Width = 137
    Height = 65
    Caption = #1064#1072#1075
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 32
      Height = 13
      Caption = #1064#1072#1075' = '
    end
    object Edit1: TEdit
      Left = 56
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '0,001'
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 208
    Width = 137
    Height = 41
    Caption = #1056#1077#1096#1080#1090#1100
    Default = True
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object StringGrid1: TStringGrid
    Left = 150
    Top = 16
    Width = 405
    Height = 233
    ColCount = 4
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssVertical
    TabOrder = 3
    ColWidths = (
      46
      114
      109
      111)
  end
  object XPManifest2: TXPManifest
    Left = 112
    Top = 40
  end
end
