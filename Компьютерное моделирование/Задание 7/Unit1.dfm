object Form1: TForm1
  Left = 771
  Top = 315
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073'.'#1088' 7'
  ClientHeight = 288
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 90
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1089#1086#1073#1099#1090#1080#1081' = '
  end
  object SpeedButton1: TSpeedButton
    Left = 184
    Top = 6
    Width = 81
    Height = 22
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 272
    Top = 6
    Width = 23
    Height = 22
    Caption = '+1'
    OnClick = SpeedButton2Click
  end
  object Chart1: TChart
    Left = 8
    Top = 32
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    LeftAxis.Visible = False
    Legend.Visible = False
    TabOrder = 0
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
  object Edit1: TEdit
    Left = 104
    Top = 6
    Width = 73
    Height = 21
    TabOrder = 1
    Text = '1'
  end
end
