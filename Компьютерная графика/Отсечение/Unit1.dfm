object Form1: TForm1
  Left = 178
  Top = 156
  AutoSize = True
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 337
  ClientWidth = 569
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
    Width = 433
    Height = 337
    OnMouseDown = Image1MouseDown
    OnMouseUp = Image1MouseUp
  end
  object RadioButton2: TRadioButton
    Left = 448
    Top = 32
    Width = 121
    Height = 41
    Caption = #1051#1080#1085#1080#1103
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 448
    Top = 8
    Width = 105
    Height = 33
    Caption = #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 88
    Width = 121
    Height = 33
    Caption = #1054#1090#1089#1077#1095#1077#1085#1080#1077
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
