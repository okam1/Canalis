object FCategoryMaster: TFCategoryMaster
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1052#1072#1081#1089#1090#1077#1088' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1082#1072#1090#1077#1075#1086#1088#1110#1081
  ClientHeight = 188
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblKeyWords: TLabel
    Left = 8
    Top = 49
    Width = 74
    Height = 13
    Caption = #1050#1083#1102#1095#1086#1074#1110' '#1089#1083#1086#1074#1072
  end
  object lbledtName: TLabeledEdit
    Left = 8
    Top = 24
    Width = 241
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = #1030#1084#39#1103' '#1082#1072#1090#1077#1075#1086#1088#1110#1111
    TabOrder = 0
  end
  object btnCreate: TBitBtn
    Left = 174
    Top = 159
    Width = 75
    Height = 25
    Caption = #1057#1090#1074#1086#1088#1080#1090#1080
    TabOrder = 1
    OnClick = btnCreateClick
  end
  object mmoKeyWords: TMemo
    Left = 8
    Top = 64
    Width = 241
    Height = 89
    TabOrder = 2
  end
end
