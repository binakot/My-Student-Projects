object Form1: TForm1
  Left = 458
  Top = 174
  BorderStyle = bsSingle
  Caption = #1051#1072#1073'.'#1088' 6 - '#1052#1077#1090#1086#1076' '#1052#1086#1085#1090#1077'-'#1050#1072#1088#1083#1086
  ClientHeight = 436
  ClientWidth = 390
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
  object Image1: TImage
    Left = 128
    Top = 176
    Width = 250
    Height = 250
  end
  object Memo1: TMemo
    Left = 8
    Top = 176
    Width = 97
    Height = 49
    Lines.Strings = (
      'f(x) = (2*x+3)*sin(x)'
      '[a; b] = [0,4; 1,2]'
      '[c; d] = [0,5; 0,6]')
    ReadOnly = True
    TabOrder = 0
  end
  object Chart1: TChart
    Left = 8
    Top = 8
    Width = 369
    Height = 161
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      '(2x+3)sinx - '#1054#1073#1097#1080#1081' '#1074#1080#1076
      '')
    Legend.Visible = False
    TabOrder = 1
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 232
    Width = 97
    Height = 33
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Memo2: TMemo
    Left = 8
    Top = 272
    Width = 97
    Height = 145
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
