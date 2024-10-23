object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 206
  Width = 407
  object FDConnection: TFDConnection
    LoginPrompt = False
    Left = 248
    Top = 40
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 96
    Top = 40
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 120
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 248
    Top = 120
  end
end
