object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 125
  Height = 276
  Width = 276
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\projeto\projeto.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 104
    Top = 8
  end
  object IBSQL: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    Transaction = IBTransaction1
    Left = 24
    Top = 64
  end
  object IBTr: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 112
    Top = 72
  end
  object ibcliente: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 32
    Top = 144
    object ibclienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES.CODIGO'
    end
    object ibclienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'CLIENTES.NOME'
      Size = 50
    end
    object ibclienteNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      Origin = 'CLIENTES.NASCIMENTO'
    end
    object ibclienteTIPOPES: TIBStringField
      FieldName = 'TIPOPES'
      Origin = 'CLIENTES.TIPOPES'
      FixedChar = True
      Size = 1
    end
  end
  object ibcontato: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CONTATOS')
    Left = 112
    Top = 144
    object ibcontatoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'CONTATOS.COD_CLIENTE'
    end
    object ibcontatoCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
      Origin = 'CONTATOS.COD_CONTATO'
    end
    object ibcontatoNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'CONTATOS.NOME'
      Size = 50
    end
    object ibcontatoTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CONTATOS.TELEFONE'
      Size = 11
    end
    object ibcontatoEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CONTATOS.EMAIL'
      Size = 30
    end
  end
end
