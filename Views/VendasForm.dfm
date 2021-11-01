object FormVendas: TFormVendas
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 573
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 541
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
    Left = 541
    Top = 213
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
    Left = 541
    Top = 115
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
    Left = 697
    Top = 213
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
  object Label5: TLabel
    Left = 8
    Top = 13
    Width = 31
    Height = 21
    Caption = 'C'#243'd.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 48
    Top = 13
    Width = 67
    Height = 21
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 224
    Top = 13
    Width = 46
    Height = 21
    Caption = 'Quant.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 296
    Top = 13
    Width = 72
    Height = 21
    Caption = 'Valor Unit.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 393
    Top = 13
    Width = 72
    Height = 21
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 697
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
    Top = 445
    Width = 27
    Height = 17
    Caption = 'C'#243'd.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 64
    Top = 445
    Width = 57
    Height = 17
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 463
    Top = 445
    Width = 38
    Height = 17
    Caption = 'Quant.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 8
    Top = 509
    Width = 60
    Height = 17
    Caption = 'Valor Unit.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 121
    Top = 509
    Width = 62
    Height = 17
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ListView1: TListView
    Left = 8
    Top = 40
    Width = 527
    Height = 385
    Color = clBtnFace
    Columns = <>
    ColumnClick = False
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 463
    Top = 362
    Width = 17
    Height = 1
    Date = 44500.000000000000000000
    Time = 0.978553217595617800
    TabOrder = 1
  end
  object cbFormaPagtos: TComboBox
    Left = 541
    Top = 142
    Width = 298
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 2
    Text = 'DINHEIRO'
    Items.Strings = (
      'DINHEIRO'
      'CART'#195'O'
      'TRANSFER'#202'NCIA')
  end
  object dtDataVenda: TDateTimePicker
    Left = 541
    Top = 40
    Width = 138
    Height = 33
    Date = 44500.000000000000000000
    Time = 0.981964201389928300
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dtDataEntrega: TDateTimePicker
    Left = 541
    Top = 240
    Width = 138
    Height = 33
    Date = 44500.000000000000000000
    Time = 0.981964201389928300
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 696
    Top = 240
    Width = 143
    Height = 33
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = '0,00'
  end
  object Edit2: TEdit
    Left = 697
    Top = 40
    Width = 141
    Height = 33
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = '000000'
  end
  object Edit3: TEdit
    Left = 8
    Top = 464
    Width = 49
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 64
    Top = 464
    Width = 393
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Text = 'Edit4'
  end
  object Edit5: TEdit
    Left = 463
    Top = 464
    Width = 72
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Text = 'Edit5'
  end
  object Edit6: TEdit
    Left = 8
    Top = 532
    Width = 97
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = 'Edit6'
  end
  object Edit7: TEdit
    Left = 121
    Top = 532
    Width = 121
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Text = 'Edit7'
  end
end
