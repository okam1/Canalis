object FAddToCategory: TFAddToCategory
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1057#1090#1074#1086#1088#1077#1085#1085#1103' '#1085#1086#1074#1086#1111' '#1082#1072#1090#1077#1075#1086#1088#1110#1111
  ClientHeight = 378
  ClientWidth = 287
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
  object lblCreatedCategory: TLabel
    Left = 0
    Top = 0
    Width = 287
    Height = 13
    Align = alTop
    Caption = #1057#1090#1074#1086#1088#1077#1085#1110' '#1082#1072#1090#1077#1075#1086#1088#1110#1111
    ExplicitWidth = 93
  end
  object lblNewCategory: TLabel
    Left = 0
    Top = 315
    Width = 287
    Height = 13
    Align = alTop
    Caption = #1057#1090#1074#1086#1088#1080#1090#1080' '#1082#1072#1090#1077#1075#1086#1088#1110#1102
    ExplicitWidth = 104
  end
  object lstCreatedCategory: TListBox
    Left = 0
    Top = 13
    Width = 287
    Height = 302
    Align = alTop
    ItemHeight = 13
    TabOrder = 0
    OnClick = lstCreatedCategoryClick
  end
  object edtNewCategory: TEdit
    Left = 0
    Top = 328
    Width = 287
    Height = 21
    Align = alTop
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1110#1090#1100' '#1085#1072#1079#1074#1091' '#1085#1086#1074#1086#1111' '#1082#1072#1090#1077#1075#1086#1088#1110#1111
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 349
    Width = 287
    Height = 28
    Align = alTop
    TabOrder = 2
    object btnSave: TBitBtn
      Left = 1
      Top = 1
      Width = 141
      Height = 26
      Align = alLeft
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnDeleteCategory: TBitBtn
      Left = 138
      Top = 1
      Width = 148
      Height = 26
      Align = alRight
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
end
