object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Teste InfoTec'
  ClientHeight = 261
  ClientWidth = 178
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object btCadCLientes: TButton
    Left = 32
    Top = 48
    Width = 113
    Height = 25
    Caption = 'Clientes'
    TabOrder = 0
    OnClick = btCadCLientesClick
  end
  object btCadProdutos: TButton
    Left = 32
    Top = 120
    Width = 113
    Height = 25
    Caption = 'Produtos'
    TabOrder = 1
  end
  object btVendas: TButton
    Left = 32
    Top = 192
    Width = 113
    Height = 25
    Caption = 'Vendas'
    TabOrder = 2
  end
end
