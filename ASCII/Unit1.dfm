object Form1: TForm1
  Left = 52
  Top = 151
  Width = 1097
  Height = 415
  Caption = 'ANSI ASCII'
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
  object Gauge1: TGauge
    Left = 968
    Top = 80
    Width = 100
    Height = 25
    Progress = 0
  end
  object Label1: TLabel
    Left = 968
    Top = 116
    Width = 22
    Height = 13
    Caption = 'HEX'
  end
  object Label2: TLabel
    Left = 968
    Top = 140
    Width = 22
    Height = 13
    Caption = 'DEC'
  end
  object SG: TStringGrid
    Left = 8
    Top = 8
    Width = 953
    Height = 358
    ColCount = 17
    Ctl3D = False
    DefaultColWidth = 55
    DefaultRowHeight = 20
    RowCount = 17
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnClick = SGClick
  end
  object BitBtn1: TBitBtn
    Left = 968
    Top = 8
    Width = 97
    Height = 25
    Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 968
    Top = 40
    Width = 97
    Height = 25
    Caption = 'Excel'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object Edit1: TEdit
    Left = 1000
    Top = 112
    Width = 67
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 1000
    Top = 136
    Width = 67
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 968
    Top = 176
    Width = 105
    Height = 25
    Caption = #1050#1086#1085#1074#1077#1088#1090#1086#1088' '#1089#1083#1086#1074#1072
    TabOrder = 5
    OnClick = Button1Click
  end
end
