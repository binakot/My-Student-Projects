object Form1: TForm1
  Left = 333
  Top = 260
  BorderStyle = bsSingle
  Caption = #1040#1085#1080#1084#1072#1094#1080#1103
  ClientHeight = 422
  ClientWidth = 739
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
    Left = 8
    Top = 8
    Width = 345
    Height = 345
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Image2: TImage
    Left = 384
    Top = 8
    Width = 345
    Height = 345
    OnMouseDown = Image2MouseDown
    OnMouseMove = Image2MouseMove
    OnMouseUp = Image2MouseUp
  end
  object Label1: TLabel
    Left = 384
    Top = 360
    Width = 78
    Height = 20
    Caption = #1063#1072#1089#1090#1086#1090#1072' ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 488
    Top = 360
    Width = 241
    Height = 57
    Caption = #1040#1085#1080#1084#1072#1094#1080#1103
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 392
    Width = 345
    Height = 25
    Caption = #1048#1089#1093#1086#1076#1085#1086#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1075#1086#1090#1086#1074#1086
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 360
    Width = 169
    Height = 25
    Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1090#1086#1095#1082#1080
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 184
    Top = 360
    Width = 169
    Height = 25
    Caption = #1059#1082#1072#1079#1072#1090#1100' '#1088#1077#1073#1088#1072
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object Edit1: TEdit
    Left = 384
    Top = 392
    Width = 97
    Height = 21
    TabOrder = 4
    Text = '100'
  end
end
