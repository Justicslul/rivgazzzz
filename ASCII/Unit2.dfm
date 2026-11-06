object Form2: TForm2
  Left = 174
  Top = 152
  Width = 756
  Height = 359
  Caption = #1050#1086#1085#1074#1077#1088#1090#1077#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 22
    Height = 13
    Caption = 'DEC'
  end
  object Label3: TLabel
    Left = 40
    Top = 112
    Width = 22
    Height = 13
    Caption = 'HEX'
  end
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 38
    Height = 13
    Caption = #1057#1051#1054#1042#1054
  end
  object Dec_Ed: TEdit
    Left = 96
    Top = 72
    Width = 529
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Hex_Ed: TEdit
    Left = 96
    Top = 112
    Width = 529
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 96
    Top = 152
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = Button1Click
  end
  object Slovo: TEdit
    Left = 96
    Top = 40
    Width = 529
    Height = 21
    TabOrder = 0
    OnKeyPress = SlovoKeyPress
  end
  object RadioGroup1: TRadioGroup
    Left = 640
    Top = 32
    Width = 73
    Height = 73
    Caption = #1048#1047
    ItemIndex = 0
    Items.Strings = (
      #1057#1051#1054#1042#1054
      'HEX'
      'DEC')
    TabOrder = 4
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Button2: TButton
    Left = 96
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Float'
    TabOrder = 6
  end
end
