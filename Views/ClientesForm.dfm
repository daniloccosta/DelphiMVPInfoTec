object FormClientes: TFormClientes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Clientes'
  ClientHeight = 342
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 16
    Top = 88
    Width = 42
    Height = 15
    Caption = 'Clientes'
  end
  object Label3: TLabel
    Left = 16
    Top = 288
    Width = 346
    Height = 15
    Caption = 
      'Para excluir um registro selecionado, pressione as telas CTRL+DE' +
      'L'
  end
  object Label4: TLabel
    Left = 16
    Top = 309
    Width = 317
    Height = 15
    Caption = 'Para alterar um registro, d'#234' um clique duplo sobre o registro'
  end
  object edNome: TEdit
    Left = 16
    Top = 45
    Width = 314
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object btAdicionar: TBitBtn
    Left = 352
    Top = 44
    Width = 97
    Height = 25
    Caption = '&Adicionar'
    TabOrder = 1
    OnClick = btAdicionarClick
  end
  object lvClientes: TListView
    Left = 16
    Top = 109
    Width = 433
    Height = 172
    Columns = <
      item
        Caption = 'C'#243'digo'
        Width = 80
      end
      item
        Caption = 'Nome'
        Width = 326
      end>
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnData = lvClientesData
    OnDblClick = lvClientesDblClick
    OnKeyDown = lvClientesKeyDown
  end
end
