object Form1: TForm1
  Left = 377
  Top = 115
  BorderStyle = bsSingle
  Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1077' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077' - '#1052#1086#1085#1077#1090#1072
  ClientHeight = 535
  ClientWidth = 715
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 116
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1088#1086#1089#1082#1086#1074' = '
  end
  object Edit1: TEdit
    Left = 128
    Top = 6
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '100'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 32
    Width = 177
    Height = 33
    Caption = '&'#1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Chart1: TChart
    Left = 8
    Top = 72
    Width = 345
    Height = 225
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.AdjustFrame = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clRed
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1054#1088#1077#1083)
    Legend.Visible = False
    TabOrder = 2
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = #1054#1088#1077#1083
      Dark3D = False
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
  object Chart2: TChart
    Left = 360
    Top = 72
    Width = 345
    Height = 225
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.AdjustFrame = False
    Title.Text.Strings = (
      #1056#1077#1096#1082#1072)
    Legend.Visible = False
    TabOrder = 3
    object LineSeries1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = #1056#1077#1096#1082#1072
      Dark3D = False
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
  object Chart3: TChart
    Left = 8
    Top = 304
    Width = 697
    Height = 225
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.AdjustFrame = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1054#1088#1077#1083' '#1080' '#1056#1077#1096#1082#1072)
    Legend.Visible = False
    TabOrder = 4
    object LineSeries2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clLime
      Title = #1054#1088#1077#1083' '#1080' '#1056#1077#1096#1082#1072
      Dark3D = False
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
end
