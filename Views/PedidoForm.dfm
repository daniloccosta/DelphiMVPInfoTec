object FormPedido: TFormPedido
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Espelho do Pedido/Venda'
  ClientHeight = 487
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 154
    Height = 15
    Caption = 'Informe o n'#250'mero do Pedido'
  end
  object Label2: TLabel
    Left = 240
    Top = 80
    Width = 37
    Height = 15
    Caption = 'Cliente'
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 64
    Height = 15
    Caption = 'Data Pedido'
  end
  object Label4: TLabel
    Left = 128
    Top = 80
    Width = 67
    Height = 15
    Caption = 'Data Entrega'
  end
  object Label5: TLabel
    Left = 512
    Top = 80
    Width = 54
    Height = 15
    Caption = 'Valor Total'
  end
  object edNumPedido: TEdit
    Left = 16
    Top = 37
    Width = 154
    Height = 23
    TabOrder = 0
    OnKeyPress = edNumPedidoKeyPress
  end
  object edCliente: TEdit
    Left = 240
    Top = 101
    Width = 257
    Height = 23
    TabStop = False
    Color = clInactiveCaption
    ReadOnly = True
    TabOrder = 3
  end
  object edDataPedido: TEdit
    Left = 16
    Top = 101
    Width = 97
    Height = 23
    TabStop = False
    Color = clInactiveCaption
    ReadOnly = True
    TabOrder = 1
  end
  object edDataEntrega: TEdit
    Left = 128
    Top = 101
    Width = 97
    Height = 23
    TabStop = False
    Color = clInactiveCaption
    ReadOnly = True
    TabOrder = 2
  end
  object edTotal: TEdit
    Left = 512
    Top = 101
    Width = 97
    Height = 23
    TabStop = False
    Color = clInactiveCaption
    ReadOnly = True
    TabOrder = 4
  end
  object lvItens: TListView
    Left = 16
    Top = 144
    Width = 593
    Height = 257
    Columns = <
      item
        Caption = 'C'#243'd.'
      end
      item
        Caption = 'Descri'#231#227'o'
        Width = 306
      end
      item
        Alignment = taRightJustify
        Caption = 'Quant.'
      end
      item
        Alignment = taRightJustify
        Caption = 'Valor Unit.'
        Width = 70
      end
      item
        Alignment = taRightJustify
        Caption = 'Valor Total'
        Width = 90
      end>
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 5
    TabStop = False
    ViewStyle = vsReport
    OnData = lvItensData
  end
  object btFechar: TBitBtn
    Left = 496
    Top = 424
    Width = 113
    Height = 41
    Caption = '&Fechar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 6
  end
end
