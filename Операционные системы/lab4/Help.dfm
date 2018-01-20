object HelpForm: THelpForm
  Left = 444
  Top = 183
  BorderStyle = bsDialog
  Caption = 'Справка'
  ClientHeight = 336
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 2
    Top = 222
    Width = 310
    Height = 81
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 94
      Top = 5
      Width = 111
      Height = 13
      Alignment = taCenter
      Caption = 'Атрибуты защиты:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 22
      Width = 177
      Height = 52
      Caption = 
        'E = execute (исполнение)'#13#10'R = read (чтение)'#13#10'W = write (запись)'#13 +
        #10'C = copy (копирование при записи)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 2
    Top = 2
    Width = 310
    Height = 219
    BevelOuter = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 82
      Top = 10
      Width = 225
      Height = 39
      Caption = 
        'Этот диапазон виртуальных адресов не со-'#13#10'сопоставлен ни с каким' +
        ' типом физической '#13#10'памяти.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 82
      Top = 53
      Width = 217
      Height = 26
      Caption = 
        'Этот  диапазон  виртуальных  адресов  со-'#13#10'поставлен со страничн' +
        'ым файлом.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 82
      Top = 84
      Width = 218
      Height = 52
      Caption = 
        'Этот диапазон виртуальных адресов изна-'#13#10'чально  был сопоставлен' +
        ' с  образом EXE-'#13#10'или DLL- файла, проецируемого в память, '#13#10'но т' +
        'еперь возможно уже нет.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 82
      Top = 140
      Width = 218
      Height = 52
      Caption = 
        'Этот диапазон виртуальных адресов изна-'#13#10'чально был сопоставлен ' +
        'с файлом данных'#13#10'проецируемым   в   пямять, но теперь воз-'#13#10'можн' +
        'о уже нет.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 82
      Top = 196
      Width = 127
      Height = 13
      Caption = 'Резервный блок памяти.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 6
      Top = 195
      Width = 22
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clGreen
      ParentColor = False
      TabOrder = 0
    end
    object StaticText6: TStaticText
      Left = 32
      Top = 195
      Width = 44
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Reserve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 6
      Top = 85
      Width = 22
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clFuchsia
      ParentColor = False
      TabOrder = 2
    end
    object StaticText7: TStaticText
      Left = 32
      Top = 85
      Width = 44
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Image   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object StaticText3: TStaticText
      Left = 6
      Top = 140
      Width = 22
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clBlue
      ParentColor = False
      TabOrder = 4
    end
    object StaticText8: TStaticText
      Left = 32
      Top = 140
      Width = 44
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Mapped'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object StaticText4: TStaticText
      Left = 6
      Top = 54
      Width = 22
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clGray
      ParentColor = False
      TabOrder = 6
    end
    object StaticText9: TStaticText
      Left = 32
      Top = 54
      Width = 44
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Private'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object StaticText5: TStaticText
      Left = 6
      Top = 10
      Width = 22
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clTeal
      ParentColor = False
      TabOrder = 8
    end
    object StaticText10: TStaticText
      Left = 32
      Top = 10
      Width = 44
      Height = 15
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Free'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
  end
  object BitBtn1: TBitBtn
    Left = 121
    Top = 308
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
end
