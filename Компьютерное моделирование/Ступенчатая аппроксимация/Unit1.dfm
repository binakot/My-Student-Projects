object Form1: TForm1
  Left = 282
  Top = 134
  BorderStyle = bsSingle
  Caption = #1057#1090#1091#1087#1077#1085#1095#1072#1090#1072#1103' '#1072#1087#1087#1088#1086#1082#1089#1080#1084#1072#1094#1080#1103
  ClientHeight = 433
  ClientWidth = 823
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
    Width = 117
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1086#1073#1099#1090#1080#1081' = '
  end
  object Label2: TLabel
    Left = 456
    Top = 396
    Width = 215
    Height = 16
    Caption = #1053#1072' '#1101#1090#1086#1090' '#1088#1072#1079' '#1087#1088#1086#1080#1079#1086#1096#1083#1086' '#1089#1086#1073#1099#1090#1080#1077' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 736
    Top = 396
    Width = 20
    Height = 13
    Caption = 'R = '
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 32
    Width = 217
    Height = 345
    ColCount = 3
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 128
    Top = 6
    Width = 65
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Button1: TButton
    Left = 200
    Top = 8
    Width = 17
    Height = 17
    TabOrder = 2
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 384
    Width = 217
    Height = 41
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Chart1: TChart
    Left = 232
    Top = 8
    Width = 289
    Height = 201
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Legend.Visible = False
    TabOrder = 4
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Style = smsValue
      Marks.Visible = False
      SeriesColor = clLime
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
    Left = 528
    Top = 8
    Width = 289
    Height = 201
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Legend.Visible = False
    TabOrder = 5
    object Series2: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clAqua
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Chart3: TChart
    Left = 232
    Top = 216
    Width = 585
    Height = 161
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Increment = 0.000011574074074074
    BottomAxis.Visible = False
    Legend.Visible = False
    TabOrder = 6
    object Series3: TGanttSeries
      ColorEachPoint = True
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'Start'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      StartValues.DateTime = True
      StartValues.Name = 'Start'
      StartValues.Multiplier = 1.000000000000000000
      StartValues.Order = loAscending
      EndValues.DateTime = True
      EndValues.Name = 'End'
      EndValues.Multiplier = 1.000000000000000000
      EndValues.Order = loNone
      NextTask.DateTime = False
      NextTask.Name = 'NextTask'
      NextTask.Multiplier = 1.000000000000000000
      NextTask.Order = loNone
    end
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 384
    Width = 217
    Height = 41
    Caption = #1050#1072#1082#1086#1077' '#1078#1077' '#1089#1086#1073#1099#1090#1080#1077' '#1087#1088#1086#1080#1079#1086#1081#1076#1077#1090'???'
    TabOrder = 7
    OnClick = BitBtn2Click
    Kind = bkHelp
  end
  object Edit2: TEdit
    Left = 672
    Top = 396
    Width = 57
    Height = 21
    TabOrder = 8
  end
  object Edit3: TEdit
    Left = 760
    Top = 396
    Width = 49
    Height = 21
    TabOrder = 9
  end
end
