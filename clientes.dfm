object Frmclientes: TFrmclientes
  Left = 192
  Top = 125
  Width = 846
  Height = 417
  Caption = 'Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 24
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 72
    Top = 56
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 48
    Top = 88
    Width = 56
    Height = 13
    Caption = 'Nascimento'
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Inclus'#227'o'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Exclus'#227'o'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 296
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object DBGrid1: TDBGrid
    Left = 120
    Top = 160
    Width = 425
    Height = 120
    DataSource = dscontato
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn4: TBitBtn
    Left = 120
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Inclus'#227'o'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 280
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Exclus'#227'o'
    TabOrder = 5
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 200
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Altera'#231#227'o'
    TabOrder = 6
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 600
    Top = 280
    Width = 177
    Height = 57
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn7Click
  end
  object DBGrid2: TDBGrid
    Left = 568
    Top = 24
    Width = 249
    Height = 137
    DataSource = dscliente
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
  object id_cliente: TEdit
    Left = 120
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object nome: TEdit
    Left = 120
    Top = 56
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object ed_data: TMaskEdit
    Left = 120
    Top = 88
    Width = 118
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 11
    Text = '  /  /    '
  end
  object ed_tipo: TRadioGroup
    Left = 376
    Top = 24
    Width = 185
    Height = 73
    Caption = 'Tip de Cliente'
    Items.Strings = (
      'Fisica'
      'Juridica')
    TabOrder = 12
  end
  object dscontato: TDataSource
    DataSet = DataModule1.ibcontato
    Left = 592
    Top = 32
  end
  object ibcontato: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CONTATOS')
    Left = 672
    Top = 32
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
  object dscliente: TDataSource
    DataSet = DataModule1.ibcliente
    OnDataChange = dsclienteDataChange
    Left = 576
    Top = 88
  end
  object ibcliente: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 760
    Top = 184
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
end
