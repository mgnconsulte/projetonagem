object Frmcontatos: TFrmcontatos
  Left = 362
  Top = 268
  Width = 514
  Height = 315
  Caption = 'Contatos do Cliente'
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
    Left = 64
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Label2: TLabel
    Left = 64
    Top = 58
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label3: TLabel
    Left = 68
    Top = 91
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label4: TLabel
    Left = 56
    Top = 114
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label5: TLabel
    Left = 72
    Top = 136
    Width = 25
    Height = 13
    Caption = 'Email'
  end
  object id_cliente: TEdit
    Left = 104
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object nome_cliente: TEdit
    Left = 184
    Top = 32
    Width = 241
    Height = 21
    TabOrder = 1
  end
  object id_contato: TEdit
    Left = 104
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object ed_nome: TEdit
    Left = 104
    Top = 88
    Width = 257
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object ed_fone: TEdit
    Left = 104
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object ed_email: TEdit
    Left = 104
    Top = 136
    Width = 257
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 30
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 200
    Width = 121
    Height = 41
    Caption = 'Confirma'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 296
    Top = 200
    Width = 121
    Height = 41
    Caption = 'Cancela'
    TabOrder = 7
    OnClick = BitBtn2Click
  end
end
