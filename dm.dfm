object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 607
  Top = 222
  Height = 150
  Width = 215
  object ibd: TIBDatabase
    DatabaseName = 'D:\db\DTS.GDB'
    LoginPrompt = False
    DefaultTransaction = ibt
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 16
    Top = 32
  end
  object ibt: TIBTransaction
    Active = False
    DefaultDatabase = ibd
    AutoStopAction = saNone
    Left = 80
    Top = 32
  end
  object ibq: TIBQuery
    Database = ibd
    Transaction = ibt
    BufferChunks = 1000
    CachedUpdates = False
    Left = 136
    Top = 32
  end
end
