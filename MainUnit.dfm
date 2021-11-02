object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Teste InfoTec'
  ClientHeight = 261
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object btCadCLientes: TButton
    Left = 24
    Top = 24
    Width = 113
    Height = 66
    Caption = 'Clientes'
    TabOrder = 0
    OnClick = btCadCLientesClick
  end
  object btCadProdutos: TButton
    Left = 160
    Top = 24
    Width = 113
    Height = 66
    Caption = 'Produtos'
    TabOrder = 1
    OnClick = btCadProdutosClick
  end
  object btVendas: TButton
    Left = 296
    Top = 24
    Width = 113
    Height = 66
    Caption = 'Vendas'
    TabOrder = 2
    OnClick = btVendasClick
  end
end
