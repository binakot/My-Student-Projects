object Form1: TForm1
  Left = 247
  Top = 134
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1052#1054' - '#1054#1095#1077#1088#1077#1076#1100' '#1082' '#1086#1076#1085#1086#1081' '#1082#1072#1089#1089#1077' (FIFO)'
  ClientHeight = 313
  ClientWidth = 488
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 473
    Height = 297
    TabOrder = 0
    object Elements_Table: TStringGrid
      Left = 248
      Top = 22
      Width = 217
      Height = 195
      ColCount = 3
      RowCount = 2
      ScrollBars = ssVertical
      TabOrder = 0
      RowHeights = (
        24
        24)
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 16
      Width = 233
      Height = 137
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 121
        Height = 13
        Caption = #1042#1088#1077#1084#1103' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103' = '
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 32
        Width = 217
        Height = 57
        Caption = #1057#1090#1072#1090#1091#1089
        TabOrder = 0
        object RadioButton1: TRadioButton
          Left = 8
          Top = 16
          Width = 201
          Height = 17
          Caption = #1054#1073#1099#1095#1085#1099#1081' '#1082#1083#1080#1077#1085#1090' ('#1074#1089#1090#1072#1077#1090' '#1074' '#1086#1095#1077#1088#1077#1076#1100')'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButton2: TRadioButton
          Left = 8
          Top = 32
          Width = 153
          Height = 17
          Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088' ('#1074#1085#1077' '#1086#1095#1077#1088#1077#1076#1080')'
          TabOrder = 1
        end
      end
      object Edit1: TEdit
        Left = 144
        Top = 12
        Width = 81
        Height = 21
        TabOrder = 1
        Text = '10'
      end
      object Insert_Button: TButton
        Left = 8
        Top = 96
        Width = 217
        Height = 33
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1086#1095#1077#1088#1077#1076#1100
        TabOrder = 2
        OnClick = Insert_ButtonClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 160
      Width = 233
      Height = 57
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077' '#1086#1076#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
      TabOrder = 2
      object Pop_Button: TButton
        Left = 8
        Top = 16
        Width = 217
        Height = 33
        Caption = #1054#1073#1089#1083#1091#1078#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
        TabOrder = 0
        OnClick = Pop_ButtonClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 224
      Width = 457
      Height = 57
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1100#1085#1099#1077' '#1092#1091#1085#1082#1094#1080#1080
      TabOrder = 3
      object Clear_Button: TButton
        Left = 272
        Top = 16
        Width = 161
        Height = 33
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1082#1072#1089#1089#1091
        TabOrder = 0
        OnClick = Clear_ButtonClick
      end
      object Size_Button: TButton
        Left = 16
        Top = 16
        Width = 137
        Height = 33
        Caption = #1051#1102#1076#1077#1081' '#1074' '#1086#1095#1077#1088#1077#1076#1080' '
        TabOrder = 1
        OnClick = Size_ButtonClick
      end
      object Size_Edit: TEdit
        Left = 160
        Top = 18
        Width = 73
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
end
