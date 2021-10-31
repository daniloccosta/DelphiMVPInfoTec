object FormProdutos: TFormProdutos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Produtos'
  ClientHeight = 367
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 16
    Top = 19
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel
    Left = 312
    Top = 19
    Width = 30
    Height = 15
    Caption = 'Pre'#231'o'
  end
  object Label1: TLabel
    Left = 16
    Top = 80
    Width = 48
    Height = 15
    Caption = 'Produtos'
  end
  object Label4: TLabel
    Left = 16
    Top = 309
    Width = 346
    Height = 15
    Caption = 
      'Para excluir um registro selecionado, pressione as telas CTRL+DE' +
      'L'
  end
  object Label5: TLabel
    Left = 16
    Top = 330
    Width = 317
    Height = 15
    Caption = 'Para alterar um registro, d'#234' um clique duplo sobre o registro'
  end
  object edDescricao: TEdit
    Left = 16
    Top = 40
    Width = 281
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edPreco: TEdit
    Left = 312
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object btAdicionar: TBitBtn
    Left = 456
    Top = 39
    Width = 97
    Height = 25
    Caption = '&Adicionar'
    TabOrder = 2
    OnClick = btAdicionarClick
  end
  object lvProdutos: TListView
    Left = 16
    Top = 101
    Width = 537
    Height = 204
    Columns = <
      item
        Caption = 'C'#243'digo'
        Width = 80
      end
      item
        Caption = 'Descri'#231#227'o'
        Width = 346
      end
      item
        Alignment = taRightJustify
        Caption = 'Pre'#231'o'
        Width = 80
      end>
    TabOrder = 3
    ViewStyle = vsReport
    OnDblClick = lvProdutosDblClick
    OnKeyDown = lvProdutosKeyDown
  end
end
