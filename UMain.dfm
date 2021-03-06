object FMain: TFMain
  Left = 0
  Top = 0
  AlphaBlendValue = 0
  Caption = 'Canalis'
  ClientHeight = 176
  ClientWidth = 124
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object trayMain: TTrayIcon
    BalloonTitle = #1055#1088#1086#1075#1088#1072#1084#1072' '#1079#1072#1087#1091#1097#1077#1085#1072
    BalloonTimeout = 100000
    OnBalloonClick = trayMainBalloonClick
    Left = 16
    Top = 8
  end
  object pmTray: TPopupMenu
    Left = 16
    Top = 64
    object pmiTraySettings: TMenuItem
      Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      OnClick = pmiTraySettingsClick
    end
    object pmiTrayStatistic: TMenuItem
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      OnClick = pmiTrayStatisticClick
    end
    object pmiTimerControl: TMenuItem
      Caption = #1042#1080#1082#1083#1102#1095#1080#1090#1080
      OnClick = pmiTimerControlClick
    end
    object pmiTrayClose: TMenuItem
      Caption = #1042#1080#1093#1110#1076
      OnClick = pmiTrayCloseClick
    end
  end
  object tmrMain: TTimer
    Enabled = False
    OnTimer = tmrMainTimer
    Left = 16
    Top = 120
  end
  object dsStatistic: TDataSource
    AutoEdit = False
    DataSet = qryStatistic
    Left = 72
    Top = 8
  end
  object conStatistic: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Datab' +
      'ase.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLE' +
      'DB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Datab' +
      'ase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locki' +
      'ng Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global B' +
      'ulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:' +
      'Create System Database=False;Jet OLEDB:Encrypt Database=False;Je' +
      't OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Wit' +
      'hout Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 72
    Top = 64
  end
  object qryStatistic: TADOQuery
    Connection = conStatistic
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Statistic')
    Left = 72
    Top = 120
    object qryStatisticS_ID: TAutoIncField
      FieldName = 'S_ID'
      ReadOnly = True
    end
    object qryStatisticS_Title: TWideStringField
      FieldName = 'S_Title'
      Size = 255
    end
    object qryStatisticS_Time: TDateTimeField
      FieldName = 'S_Time'
      DisplayFormat = 'hh:mm:ss'
    end
    object qryStatisticS_StartDate: TDateTimeField
      FieldName = 'S_StartDate'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dtmfldStatisticS_StartTime: TDateTimeField
      FieldName = 'S_StartTime'
      DisplayFormat = 'hh:mm:ss'
    end
    object wdstrngfldStatisticS_UserName: TWideStringField
      FieldName = 'S_UserName'
      Size = 255
    end
  end
end
