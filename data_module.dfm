object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 613
  Top = 287
  Height = 150
  Width = 215
  object ibd: TIBDatabase
    DatabaseName = '172.22.16.72:d:\db\DTS.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=mis_sdd_3ggs')
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
