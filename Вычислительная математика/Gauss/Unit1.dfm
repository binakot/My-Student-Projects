object Form1: TForm1
  Left = 169
  Top = 147
  AutoScroll = False
  Caption = #1052#1077#1090#1086#1076' '#1043#1072#1091#1089#1089#1072
  ClientHeight = 512
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 336
    Top = 8
    Width = 13
    Height = 13
    Caption = 'X1'
  end
  object Label2: TLabel
    Left = 416
    Top = 8
    Width = 13
    Height = 13
    Caption = 'X2'
  end
  object Label3: TLabel
    Left = 496
    Top = 8
    Width = 13
    Height = 13
    Caption = 'X3'
  end
  object Label4: TLabel
    Left = 584
    Top = 8
    Width = 13
    Height = 13
    Caption = 'X4'
  end
  object Label5: TLabel
    Left = 632
    Top = 8
    Width = 91
    Height = 13
    Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1077' '#1095#1083#1077#1085#1099
  end
  object Label6: TLabel
    Left = 760
    Top = 8
    Width = 13
    Height = 13
    Caption = 'E1'
  end
  object Label7: TLabel
    Left = 840
    Top = 8
    Width = 13
    Height = 13
    Caption = 'E2'
  end
  object Label8: TLabel
    Left = 912
    Top = 8
    Width = 44
    Height = 13
    Caption = #1053#1077#1074#1103#1079#1082#1080
  end
  object Label17: TLabel
    Left = 992
    Top = 8
    Width = 50
    Height = 13
    Caption = #1055#1086#1087#1088#1072#1074#1082#1080
  end
  object Label16: TLabel
    Left = 16
    Top = 16
    Width = 68
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 48
    Width = 185
    Height = 129
    ColCount = 6
    DefaultColWidth = 30
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 192
    Width = 233
    Height = 41
    Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1087#1088#1080#1073#1083#1080#1078#1077#1085#1085#1099#1093' '#1082#1086#1088#1085#1077#1081
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 88
    Top = 16
    Width = 25
    Height = 21
    TabOrder = 2
    OnKeyUp = Edit1KeyUp
  end
  object StringGrid2: TStringGrid
    Left = 296
    Top = 24
    Width = 769
    Height = 449
    ColCount = 9
    DefaultColWidth = 84
    FixedCols = 0
    RowCount = 18
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 3
  end
  object Button2: TButton
    Left = 8
    Top = 248
    Width = 233
    Height = 41
    Caption = #1053#1072#1093#1086#1078#1076#1077#1085#1080#1077' '#1085#1077#1074#1103#1079#1086#1082
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 264
    Top = 24
    Width = 33
    Height = 129
    AutoSize = False
    TabOrder = 5
    Text = '    A'
  end
  object Edit3: TEdit
    Left = 264
    Top = 152
    Width = 33
    Height = 97
    AutoSize = False
    TabOrder = 6
    Text = '  A1'
  end
  object Edit4: TEdit
    Left = 264
    Top = 248
    Width = 33
    Height = 73
    AutoSize = False
    TabOrder = 7
    Text = '   A2'
  end
  object Edit5: TEdit
    Left = 264
    Top = 320
    Width = 33
    Height = 57
    AutoSize = False
    TabOrder = 8
    Text = '   A3'
  end
  object Edit6: TEdit
    Left = 264
    Top = 376
    Width = 33
    Height = 97
    AutoSize = False
    TabOrder = 9
    Text = '    B'
  end
  object Button3: TButton
    Left = 8
    Top = 304
    Width = 233
    Height = 41
    Caption = #1053#1072#1093#1086#1078#1076#1077#1085#1080#1077' '#1087#1086#1087#1088#1072#1074#1086#1082
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 360
    Width = 233
    Height = 41
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1087#1088#1072#1074#1086#1082' '#1080' '#1087#1086#1076#1089#1095#1077#1090' '#1085#1077#1074#1103#1079#1086#1082
    TabOrder = 11
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 416
    Width = 233
    Height = 41
    Caption = #1055#1086#1076#1089#1095#1077#1090' '#1087#1088#1086#1074#1077#1088#1086#1082
    TabOrder = 12
    OnClick = Button5Click
  end
  object StringGrid3: TStringGrid
    Left = 296
    Top = 24
    Width = 597
    Height = 449
    ColCount = 7
    DefaultColWidth = 84
    FixedCols = 0
    RowCount = 18
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssNone
    TabOrder = 13
    Visible = False
  end
  object Edit7: TEdit
    Left = 264
    Top = 24
    Width = 33
    Height = 129
    AutoSize = False
    TabOrder = 14
    Text = '    A'
    Visible = False
  end
  object Edit8: TEdit
    Left = 264
    Top = 152
    Width = 33
    Height = 97
    AutoSize = False
    TabOrder = 15
    Text = '  A1'
    Visible = False
  end
  object Edit9: TEdit
    Left = 264
    Top = 248
    Width = 33
    Height = 73
    AutoSize = False
    TabOrder = 16
    Text = '   A2'
    Visible = False
  end
  object Edit10: TEdit
    Left = 264
    Top = 320
    Width = 33
    Height = 57
    AutoSize = False
    TabOrder = 17
    Text = '   A3'
    Visible = False
  end
  object Edit11: TEdit
    Left = 264
    Top = 376
    Width = 33
    Height = 97
    AutoSize = False
    TabOrder = 18
    Text = '    B'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 464
    Width = 121
    Height = 41
    Caption = #1055#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1099#1077
    TabOrder = 19
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 176
    Top = 464
  end
  object XPManifest1: TXPManifest
    Left = 208
    Top = 464
  end
end
