object FormVendas: TFormVendas
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 525
  ClientWidth = 858
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
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 557
    Top = 13
    Width = 82
    Height = 21
    Caption = 'Data Venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 557
    Top = 295
    Width = 92
    Height = 21
    Caption = 'Data Entrega:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 556
    Top = 205
    Width = 127
    Height = 21
    Caption = 'Forma Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 713
    Top = 295
    Width = 35
    Height = 21
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 713
    Top = 13
    Width = 131
    Height = 21
    Caption = 'N'#250'mero do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 446
    Width = 25
    Height = 15
    Caption = 'C'#243'd.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 64
    Top = 446
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 312
    Top = 446
    Width = 36
    Height = 15
    Caption = 'Quant.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 368
    Top = 446
    Width = 54
    Height = 15
    Caption = 'Valor Unit.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 442
    Top = 446
    Width = 54
    Height = 15
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 8
    Top = 496
    Width = 114
    Height = 15
    Caption = '(F3) Procurar produto'
  end
  object Label17: TLabel
    Left = 557
    Top = 112
    Width = 55
    Height = 21
    Caption = 'Cliente: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 739
    Top = 120
    Width = 105
    Height = 13
    Caption = '(F2) Procurar CLiente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 136
    Top = 496
    Width = 85
    Height = 15
    Caption = '(F4) Excluir item'
  end
  object lvCupom: TListView
    Left = 8
    Top = 8
    Width = 527
    Height = 425
    Color = clBtnFace
    Columns = <
      item
        Caption = 'C'#243'd.'
      end
      item
        Caption = 'Descri'#231#227'o'
        Width = 234
      end
      item
        Alignment = taRightJustify
        Caption = 'Quant.'
      end
      item
        Alignment = taRightJustify
        Caption = 'Pre'#231'o Unit.'
        Width = 80
      end
      item
        Alignment = taRightJustify
        Caption = 'Pre'#231'o Total'
        Width = 90
      end>
    ColumnClick = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    TabStop = False
    ViewStyle = vsReport
  end
  object cbFormaPagtos: TComboBox
    Left = 556
    Top = 232
    Width = 288
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 6
    TabStop = False
    Text = 'DINHEIRO'
    OnChange = cbFormaPagtosChange
    Items.Strings = (
      'DINHEIRO'
      'CART'#195'O'
      'TRANSFER'#202'NCIA')
  end
  object dtDataVenda: TDateTimePicker
    Left = 557
    Top = 40
    Width = 142
    Height = 33
    Date = 44500.000000000000000000
    Time = 0.981964201389928300
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TabStop = False
    OnChange = dtDataVendaChange
  end
  object edTotal: TEdit
    Left = 712
    Top = 322
    Width = 132
    Height = 33
    TabStop = False
    Alignment = taRightJustify
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
    Text = '0,00'
  end
  object edNumPed: TEdit
    Left = 713
    Top = 40
    Width = 131
    Height = 33
    TabStop = False
    Alignment = taRightJustify
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
    Text = '000000'
  end
  object edCodigo: TEdit
    Left = 8
    Top = 466
    Width = 49
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = edCodigoExit
  end
  object edDescricao: TEdit
    Left = 63
    Top = 466
    Width = 243
    Height = 23
    TabStop = False
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object edQuant: TEdit
    Left = 312
    Top = 466
    Width = 50
    Height = 23
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = edQuantExit
    OnKeyPress = edQuantKeyPress
  end
  object edValorUnit: TEdit
    Left = 368
    Top = 466
    Width = 68
    Height = 23
    Alignment = taRightJustify
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = edValorUnitKeyPress
  end
  object edValorTotal: TEdit
    Left = 442
    Top = 466
    Width = 93
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object btFecharVenda: TBitBtn
    Left = 557
    Top = 446
    Width = 287
    Height = 44
    Caption = '&Finalizar Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    TabStop = False
    OnClick = btFecharVendaClick
  end
  object edCliente: TEdit
    Left = 556
    Top = 139
    Width = 288
    Height = 33
    TabStop = False
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
    Text = 'CLIENTE'
  end
  object Painel: TPanel
    Left = 557
    Top = 392
    Width = 287
    Height = 41
    TabOrder = 13
  end
  object edDataEntrega: TEdit
    Left = 557
    Top = 322
    Width = 142
    Height = 33
    TabStop = False
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
end
