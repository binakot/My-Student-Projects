object Form6: TForm6
  Left = 559
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1084#1077#1090#1086#1076#1086#1074
  ClientHeight = 486
  ClientWidth = 607
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
  object StringGrid1: TStringGrid
    Left = 8
    Top = 88
    Width = 587
    Height = 393
    ColCount = 6
    DefaultColWidth = 90
    DefaultRowHeight = 25
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssNone
    TabOrder = 0
    ColWidths = (
      90
      90
      90
      114
      90
      103)
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 369
    Height = 73
    Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1089#1088#1072#1074#1085#1077#1085#1080#1103
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 13
      Caption = #1058#1086#1095#1085#1086#1089#1090#1100' = '
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 32
      Height = 13
      Caption = #1064#1072#1075' = '
    end
    object Edit2: TEdit
      Left = 72
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0,001'
      OnKeyUp = Edit2KeyUp
    end
    object Edit1: TEdit
      Left = 72
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0,000001'
      OnKeyUp = Edit1KeyUp
    end
    object BitBtn1: TBitBtn
      Left = 200
      Top = 16
      Width = 153
      Height = 45
      Caption = 'OK'
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
  end
  object XPManifest1: TXPManifest
    Left = 384
    Top = 16
  end
end
