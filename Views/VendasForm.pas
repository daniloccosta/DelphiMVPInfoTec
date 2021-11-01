unit VendasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXPickers,
  Vcl.StdCtrls, PedidoMVPIntf, Pedido, ProdutoMVPIntf, ProdutoIntf, Produto,
  Generics.Collections, Vcl.Buttons, Vcl.ExtCtrls, Cliente, ClienteMVPIntf;

type
  TFormVendas = class(TForm, IPedidoView)
    lvCupom: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbFormaPagtos: TComboBox;
    dtDataVenda: TDateTimePicker;
    dtDataEntrega: TDateTimePicker;
    edTotal: TEdit;
    Label10: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    edQuant: TEdit;
    edValorUnit: TEdit;
    edValorTotal: TEdit;
    btFecharVenda: TBitBtn;
    Label16: TLabel;
    Label17: TLabel;
    edCliente: TEdit;
    Label18: TLabel;
    Painel: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edQuantExit(Sender: TObject);
    procedure edQuantKeyPress(Sender: TObject; var Key: Char);
    procedure dtDataVendaChange(Sender: TObject);
    procedure dtDataEntregaChange(Sender: TObject);
    procedure cbFormaPagtosChange(Sender: TObject);
    procedure edValorUnitKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FPedido: TPedido;
    FProduto: TProduto;
    FPedPresenter: Pointer;
    FProdPresenter: Pointer;
    FCliPresenter: Pointer;
    FProdutos: TList<TProduto>;
    FClientes: TList<TCliente>;
    function GetPedido: TPedido;
    procedure SetPedido(Value: TPedido);
    function GetPresenter: IPedidoPresenter;
    procedure SetPresenter(const Value: IPedidoPresenter);
    function GetPresenterProd: IProdutoPresenter;
    procedure SetPresenterProd(const Value: IProdutoPresenter);
    function GetPresenterCli: IClientePresenter;
    procedure SetPresenterCli(const Value: IClientePresenter);
    procedure ProcurarProduto;
    procedure ProcurarCliente;
    procedure LimparCampos;
    procedure CalcularValorTotalItem;
    procedure CalcularValorTotalPedido;
    procedure AdicionaItem;
  public
    { Public declarations }
    property Pedido: TPedido read GetPedido write SetPedido;
    property Presenter: IPedidoPresenter read GetPresenter write SetPresenter;
    property PresenterProduto: IProdutoPresenter read GetPresenterProd write SetPresenterProd;
    property PresenterCliente: IClientePresenter read GetPresenterCli write SetPresenterCli;

    function ShowView: TModalResult;
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

uses ProdutoPresenter, ProdutoM, Utils, MainUnit, Item;

{ TFormVendas }

procedure TFormVendas.AdicionaItem;
var
  Item: TItem;
  ListItem: TListItem;
begin
  Item := TItem.Create;
  try
    FProduto.Preco := MoedaToDouble(edValorUnit.Text);

    Item.Produto := FProduto;
    Item.Quantidade := MoedaToDouble(edQuant.Text);

    Pedido.Items.Add(Item);

    ListItem := lvCupom.Items.Add;
    ListItem.Caption := Item.Produto.Id.ToString;
    ListItem.SubItems.Add(Item.Produto.Descricao);
    ListItem.SubItems.Add(Item.Quantidade.ToString);
    ListItem.SubItems.Add(FormatFloat('0.00', Item.Produto.Preco));
    ListItem.SubItems.Add(FormatFloat('0.00', Item.Quantidade * Item.Produto.Preco));;

    LimparCampos;
  finally
    Item.Free;
  end;
end;

procedure TFormVendas.CalcularValorTotalItem;
var
  tt: Double;
begin
  if (Trim(edQuant.Text) = '') or (FProduto = nil)then
    Exit;

  tt := MoedaToDouble(Trim(edQuant.Text)) * FProduto.Preco;
  edValorTotal.Text := FormatFloat('0.00', tt);
end;

procedure TFormVendas.CalcularValorTotalPedido;
begin

end;

procedure TFormVendas.cbFormaPagtosChange(Sender: TObject);
begin
  Pedido.FormaPagto := cbFormaPagtos.ItemIndex;
end;

procedure TFormVendas.dtDataEntregaChange(Sender: TObject);
begin
  Pedido.DataEntrega := dtDataEntrega.Date;
end;

procedure TFormVendas.dtDataVendaChange(Sender: TObject);
begin
  Pedido.DataPedido := dtDataVenda.Date;
end;

procedure TFormVendas.edQuantExit(Sender: TObject);
begin
  CalcularValorTotalItem;
end;

procedure TFormVendas.edQuantKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(Sender, Key, True);
end;

procedure TFormVendas.edValorUnitKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    AdicionaItem;
end;

procedure TFormVendas.FormCreate(Sender: TObject);
begin
  FPedido := TPedido.Create;

  Pedido.Id := 0;
  Pedido.DataPedido := dtDataVenda.Date;
  Pedido.DataEntrega := dtDataEntrega.Date;
  Pedido.FormaPagto := cbFormaPagtos.ItemIndex;

  PresenterCliente := MainForm.PresenterCliente;
  PresenterProduto := MainForm.PresenterProduto;

  FProdutos := TList<TProduto>.Create;
  FClientes := TList<TCliente>.Create;

  //Listar Clientes e Produtos;
  FClientes := PresenterCliente.ListAll;
  FProdutos := PresenterProduto.ListAll;

  dtDataVenda.DateTime := Date;
  dtDataEntrega.DateTime := Date;
end;

procedure TFormVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    SelectNext(ActiveControl, True, True);
  end
  else if (Key = VK_F2) then
    ProcurarCliente
  else if (Key = VK_F3) then
    ProcurarProduto;
end;

function TFormVendas.GetPedido: TPedido;
begin
  Result := FPedido;
end;

function TFormVendas.GetPresenter: IPedidoPresenter;
begin
  Result := IPedidoPresenter(FPedPresenter);
end;

function TFormVendas.GetPresenterCli: IClientePresenter;
begin
  Result := IClientePresenter(FCliPresenter);
end;

function TFormVendas.GetPresenterProd: IProdutoPresenter;
begin
  Result := IProdutoPresenter(FProdPresenter);
end;

procedure TFormVendas.LimparCampos;
begin
  edCodigo.Text := '';
  edDescricao.Text := '';
  edQuant.Text := '1';
  edValorUnit.Text := '0.00';
  edValorTotal.Text := '0.00';
end;

procedure TFormVendas.ProcurarCliente;
var
  Lista: TListView;
  Item: TListItem;
  Column: TListColumn;
  Cli: TCliente;
  i: Integer;
  Retorno: TObject;
begin
  Lista := TListView.Create(Self);
  try
    Lista.Parent := Self;
    Lista.Visible := False;

    Lista.Columns.Clear;
    Column := Lista.Columns.Add;
    Column.Caption := 'Código';
    Column.Width := 80;
    Column := Lista.Columns.Add;
    Column.Caption := 'Nome';
    Column.Width := 340;

    for i := 0 to FClientes.Count - 1 do
    begin
      Item := Lista.Items.Add;
      Cli := FClientes.Items[i];
      Item.Caption := Cli.Id.ToString;
      Item.SubItems.Add(Cli.Nome);
      Item.SubItems.AddObject('', Cli);
    end;

    Retorno := Procurar(Lista.Items, Lista.Columns, 'Procurar cliente', 'Nome');
    if (Retorno <> nil) then
    begin
      Pedido.Cliente := TCliente(Retorno);
      edCliente.Text := Pedido.Cliente.Nome;
    end;
  finally
    FreeAndNil(Lista);
  end;
end;

procedure TFormVendas.ProcurarProduto;
var
  Lista: TListView;
  Item: TListItem;
  Column: TListColumn;
  Prod: TProduto;
  i: Integer;
  Retorno: TObject;
begin
  Lista := TListView.Create(Self);
  try
    Lista.Parent := Self;
    Lista.Visible := False;

    Lista.Columns.Clear;
    Column := Lista.Columns.Add;
    Column.Caption := 'Código';
    Column.Width := 80;
    Column := Lista.Columns.Add;
    Column.Caption := 'Descrição';
    Column.Width := 280;
    Column := Lista.Columns.Add;
    Column.Caption := 'Preço';
    Column.Width := 90;
    Column.Alignment := taRightJustify;

    for i := 0 to FProdutos.Count - 1 do
    begin
      Item := Lista.Items.Add;
      Prod := FProdutos.Items[i];
      Item.Caption := Prod.Id.ToString;
      Item.SubItems.Add(Prod.Descricao);
      Item.SubItems.Add(FormatFloat('0.00', Prod.Preco));
      Item.SubItems.AddObject('', Prod);
    end;
    Retorno := Procurar(Lista.Items, Lista.Columns, 'Procurar produto', 'Descrição');
    if (Retorno <> nil) then
    begin
      FProduto := TProduto(Retorno);
      edCodigo.Text := FProduto.Id.ToString;
      edDescricao.Text := FProduto.Descricao;
      edQuant.Text := '1';
      edValorUnit.Text := FormatFloat('0.00', FProduto.Preco);
      edValorTotal.Text := FormatFloat('0.00', FProduto.Preco);
    end;
  finally
    FreeAndNil(Lista);
  end;
end;

procedure TFormVendas.SetPedido(Value: TPedido);
begin
  FPedido := Value;
end;

procedure TFormVendas.SetPresenter(const Value: IPedidoPresenter);
begin
  FPedPresenter := Pointer(Value);
end;

procedure TFormVendas.SetPresenterCli(const Value: IClientePresenter);
begin
  FCliPresenter := Pointer(Value);
end;

procedure TFormVendas.SetPresenterProd(const Value: IProdutoPresenter);
begin
  FProdPresenter := Pointer(Value);
end;

function TFormVendas.ShowView: TModalResult;
begin
  Result := Self.ShowModal;
end;

end.
