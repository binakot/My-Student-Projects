object Form1: TForm1
  Left = 281
  Top = 218
  Width = 841
  Height = 460
  Caption = #1047#1072#1082#1088#1072#1089#1082#1072' '#1084#1085#1086#1075#1086#1091#1075#1086#1083#1100#1085#1080#1082#1072
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
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 633
    Height = 425
    OnMouseUp = Image1MouseUp
  end
  object Panel1: TPanel
    Left = 632
    Top = 0
    Width = 201
    Height = 193
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 8
      Width = 185
      Height = 177
      Caption = #1047#1072#1083#1080#1074#1082#1072' '#1084#1085#1086#1075#1086#1091#1075#1086#1083#1100#1085#1080#1082#1072
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 100
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1077#1088#1096#1080#1085
      end
      object Edit1: TEdit
        Left = 120
        Top = 32
        Width = 33
        Height = 25
        AutoSize = False
        TabOrder = 0
        Text = '3'
      end
      object UpDown1: TUpDown
        Left = 152
        Top = 32
        Width = 17
        Height = 25
        TabOrder = 1
        OnClick = UpDown1Click
      end
      object StringGrid1: TStringGrid
        Left = 8
        Top = 72
        Width = 169
        Height = 57
        ColCount = 3
        DefaultColWidth = 40
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 2
      end
      object Button1: TButton
        Left = 32
        Top = 136
        Width = 113
        Height = 25
        Caption = #1047#1072#1082#1088#1072#1089#1080#1090#1100
        TabOrder = 3
        OnClick = Button1Click
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 800
    Top = 200
  end
end
