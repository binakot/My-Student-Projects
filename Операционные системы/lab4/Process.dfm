object ProcessForm: TProcessForm
  Left = 379
  Top = 176
  Anchors = []
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1086#1094#1077#1089#1089#1072
  ClientHeight = 283
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 264
    Height = 283
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object SpeedButton2: TSpeedButton
      Left = 120
      Top = 250
      Width = 54
      Height = 27
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666616666
        6666666600006666619996666666666600006666619996666666666600006666
        6999966666666666000066666999916666666666000066661999916666666666
        0000666619999166666666660000666699999966666666660000691199699966
        6666666600006999996999166666666600006999966699166666666600006699
        6666699166666666000066666666699966666666000066666666669916666666
        0000666666666699916666660000666666666669991666660000666666666666
        9991666600006666666666669999111600006666666666666699999600006666
        66666666666999960000}
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 179
      Top = 250
      Width = 75
      Height = 27
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFF0000FFF99FFFFFFFFFF99FFF0000FF9999FFFFFFFFF999FF0000FF99
        99FFFFFFFF9999FF0000FF99999FFFFFF99999FF0000FFF99999FFFF99999FFF
        0000FFFF99999FF99999FFFF0000FFFFF9999999999FFFFF0000FFFFFF999999
        99FFFFFF0000FFFFFFF999999FFFFFFF0000FFFFFFF999999FFFFFFF0000FFFF
        FF99999999FFFFFF0000FFFFF9999999999FFFFF0000FFFF99999FF999999FFF
        0000FF999999FFFF9999999F0000F999999FFFFFF999999F0000F99999FFFFFF
        FFF9999F0000FF999FFFFFFFFFFFF99F0000FFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFF0000}
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton5: TSpeedButton
      Left = 8
      Top = 250
      Width = 88
      Height = 27
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        666666660000666666666666666666660000666666CCCCCCCC66666600006666
        CCC0CCCCC0CC6666000066CCCCB00CCCB000C666000066CC0BBB0CCCBB00C666
        000066CBBBBB00CCBBB00C6600006CCBBBBB000BBBBB0C66000066CCBBBBB00B
        BBBBCCC6000066CCCCBBBBBBBCCCCCC6000066CCCCCBBBBB00CCCCC6000066CC
        CCCBBBBBB00CCC66000066CCCCBBBBBBBB00CC66000066CCBBBBBB0BBBBB0C66
        000066CBBBBBB0CCBBBBCC66000066CCBBBB0CCCBBB0C666000066CCCBBBCCCC
        BB0CC6660000666CCCBCCCCCCCC666660000666666CCCCCCC666666600006666
        66666666666666660000}
      ParentFont = False
      OnClick = SpeedButton5Click
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 10
      Width = 246
      Height = 233
      ColCount = 1
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goColSizing, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDrawCell = StringGrid1DrawCell
      ColWidths = (
        235)
    end
  end
end
