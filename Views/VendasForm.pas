unit VendasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, System.Contnrs, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.WinXPickers, Vcl.StdCtrls, PedidoMVPIntf, Pedido, ProdutoMVPIntf,
  ProdutoIntf, Produto, Utils, Generics.Collections, Vcl.Buttons, Vcl.ExtCtrls,
  Cliente, ClienteMVPIntf;

type
  TFormVendas = class(TForm, IPedidoView)
    lvCupom: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbFormaPagtos: TComboBox;
    dtDataVenda: TDateTimePicker;
    edTotal: TEdit;
    Label10: TLabel;
    edNumPed: TEdit;
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
    Label5: TLabel;
    edDataEntrega: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edQuantExit(Sender: TObject);
    procedure edQuantKeyPress(Sender: TObject; var Key: Char);
    procedure dtDataVendaChange(Sender: TObject);
    procedure cbFormaPagtosChange(Sender: TObject);
    procedure edValorUnitKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoExit(Sender: TObject);
    procedure btFecharVendaClick(Sender: TObject);
  private
    { Private declarations }
    FPedido: TPedido;
    FProduto: TProduto;
    FPedPresenter: Pointer;
    FProdPresenter: Pointer;
    FCliPresenter: Pointer;
    FProdutos: TObjectList;
    FClientes: TObjectList;
    function GetPedido: TPedido;
    procedure SetPedido(Value: TPedido);
    function GetPresenter: IPedidoPresenter;
    procedure SetPresenter(const Value: IPedidoPresenter);
    function GetPresenterProd: IProdutoPresenter;
    procedure SetPresenterProd(const Value: IProdutoPresenter);
    function GetPresenterCli: IClientePresenter;
    procedure SetPresenterCli(const Value: IClientePresenter);
    //****//
    procedure ProcurarProduto;
    procedure ProcurarCliente;
    procedure LimparCampos;
    procedure CalcularValorTotalItem;
    function PodeAdicionarItem: Boolean;
    procedure AdicionaItem;
    procedure RemoverItem;
    procedure BuscarProdutoPeloCodigo(Cod: Integer);
    function PodeFinalizarVenda: Boolean;
    procedure FinalizarVendas;
    procedure IniciarPedido;
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

uses ProdutoPresenter, ProdutoM, MainUnit, Item, ProdutoView,
  ProcurarForm;

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

    Pedido.AddItem(Item);
    edTotal.Text := FormatFloat('#,##0.00', Pedido.ValorTotal);

    ListItem := lvCupom.Items.Add;
    ListItem.Caption := Item.Produto.Id.ToString;
    ListItem.SubItems.Add(Item.Produto.Descricao);
    ListItem.SubItems.Add(Item.Quantidade.ToString);
    ListItem.SubItems.Add(FormatFloat('0.00', Item.Produto.Preco));
    ListItem.SubItems.Add(FormatFloat('0.00', Item.Quantidade * Item.Produto.Preco));;

    LimparCampos;
  finally
    //Item.Free;
  end;
end;

procedure TFormVendas.btFecharVendaClick(Sender: TObject);
begin
  if PodeFinalizarVenda then
    FinalizarVendas;
end;

procedure TFormVendas.BuscarProdutoPeloCodigo(Cod: Integer);
var
  ViewProduto: IProdutoView;
begin
  ViewProduto := TProdutoView.Create;
  if (FProduto = nil) then
    FProduto := TProduto.Create;
  try
    PresenterProduto.View := ViewProduto;
    ViewProduto.Presenter := PresenterProduto;

    FProduto.Id := Cod;
    ViewProduto.Produto := FProduto;
    FProduto := PresenterProduto.Get;
    if (FProduto <> Nil) then
    begin
      edDescricao.Text := FProduto.Descricao;
      edQuant.Text := '1';
      edValorUnit.Text := FormatFloat('0.00', FProduto.Preco);
      edValorTotal.Text := FormatFloat('0.00', FProduto.Preco);
    end;
  finally
    ViewProduto := nil;
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

procedure TFormVendas.cbFormaPagtosChange(Sender: TObject);
begin
  Pedido.FormaPagto := cbFormaPagtos.ItemIndex;
end;

procedure TFormVendas.dtDataVendaChange(Sender: TObject);
begin
  Pedido.DataPedido := dtDataVenda.Date;
  Pedido.DataEntrega := AddDiasUteis(Pedido.DataPedido, 10);
  edDataEntrega.Text := FormatDateTime('dd/mm/yyyy', Pedido.DataEntrega);
end;

procedure TFormVendas.edCodigoExit(Sender: TObject);
var
  Cod: Integer;
begin
  if (Trim(EdCodigo.Text) <> '') then
  begin
    Cod := StrToInt(Trim(edCodigo.Text));
    BuscarProdutoPeloCodigo(Cod);
  end;
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
  begin
    if PodeAdicionarItem then
      AdicionaItem;
    edCodigo.SetFocus;
  end;
end;

procedure TFormVendas.FinalizarVendas;
begin
  Presenter.Add;
  IniciarPedido;
  edCodigo.SetFocus;
end;

procedure TFormVendas.FormCreate(Sender: TObject);
var
  tempCli: TList<TCliente>;
  tempProd: TList<TProduto>;
  i: Integer;
begin
  IniciarPedido;

  PresenterCliente := MainForm.PresenterCliente;
  PresenterProduto := MainForm.PresenterProduto;

  FProdutos := TObjectList.Create;
  FClientes := TObjectList.Create;

  //Preencher Listas de  Clientes e Produtos;
  //Preferi assim, para reduzir trabalho com a implementa��o
  //da tela procura (FormProcurar)
  tempCli := PresenterCliente.ListAll;
  tempProd := PresenterProduto.ListAll;
  try
    for i := 0 to tempCli.Count - 1 do
      FClientes.Add(tempCli.Items[i]);

    for i := 0 to tempProd.Count - 1 do
      FProdutos.Add(tempProd.Items[i]);
  finally
    //N�o pode liberar, causa a libera�ao das inst�ncias em suas origens
    //tempCli.Free;
    //tempProd.Free;
  end;
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
    ProcurarProduto
  else if (Key = VK_F4) then
    RemoverItem;
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

procedure TFormVendas.IniciarPedido;
begin
  FPedido := TPedido.Create;

  Pedido.DataPedido := Date;
  Pedido.DataEntrega := AddDiasUteis(Pedido.DataPedido, 10);
  Pedido.FormaPagto := cbFormaPagtos.ItemIndex;

  edNumPed.Text := FormatFloat('000000', Pedido.Id);
  dtDataVenda.Date := Pedido.DataPedido;
  edDataEntrega.Text := FormatDateTime('dd/mm/yyyy', Pedido.DataEntrega);
  edCliente.Text := '';
  cbFormaPagtos.ItemIndex := 0;
  edTotal.Text := '0.00';

  lvCupom.Items.Clear;
  LimparCampos;
end;

function TFormVendas.PodeAdicionarItem: Boolean;
begin
  Result := (Trim(edCodigo.Text) <> '')
    and (Trim(edDescricao.Text) <> '')
    and (Trim(edQuant.Text) <> '');
end;

function TFormVendas.PodeFinalizarVenda: Boolean;
begin
  Result := False;

  if (Pedido.Items.Count = 0) then
  begin
    MessageDlg('Para finalizar o pedido, voc� deve adicionar produtos.', mtInformation, [mbOk], 0);
    Exit;
  end;

  if (Pedido.Cliente = Nil) then
    if (Pedido.Cliente.Id <> 0) then
    begin
      MessageDlg('Para finalizar o pedido, voc� deve informar um cliente.', mtInformation, [mbOk], 0);
      Exit;
    end;

  if (Pedido.ValorTotal <= 0) then
  begin
    MessageDlg('O valor total do pedido nn�o pode ser menor ou igual a zero.', mtInformation, [mbOk], 0);
    Exit;
  end;

  Result := True;
end;

procedure TFormVendas.ProcurarCliente;
var
  Lista: TListView;
  Column: TListColumn;
  Retorno: TObject;
begin
  Lista := TListView.Create(Self);
  try
    Lista.Parent := Self;
    Lista.Visible := False;

    Lista.Columns.Clear;
    Column := Lista.Columns.Add;
    Column.Caption := 'C�digo';
    Column.Width := 80;
    Column := Lista.Columns.Add;
    Column.Caption := 'Nome';
    Column.Width := 340;

    Retorno := Procurar(FClientes, Lista.Columns, 'Procurar cliente', 'Nome');
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
  Column: TListColumn;
  Retorno: TObject;
begin
  Lista := TListView.Create(Self);
  try
    Lista.Parent := Self;
    Lista.Visible := False;

    //Carregando ListColumns
    Lista.Columns.Clear;
    Column := Lista.Columns.Add;
    Column.Caption := 'C�digo';
    Column.Width := 80;
    Column := Lista.Columns.Add;
    Column.Caption := 'Descri��o';
    Column.Width := 280;
    Column := Lista.Columns.Add;
    Column.Caption := 'Pre�o';
    Column.Width := 90;
    Column.Alignment := taRightJustify;

    //Chama tela de Procura
    Retorno := Procurar(FProdutos, Lista.Columns, 'Procurar produto', 'Descri��o');
    if (Retorno <> nil) then
    begin
      //Retira o foco da edit antes de ser preenchida
      //para n�o ocorrer a busca dos dados do produto 2x
      edQuant.SetFocus;

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

procedure TFormVendas.RemoverItem;
var
  idx: Integer;
begin
  if (Pedido.Items.Count > 0) and (lvCupom.Selected <> nil) then
  begin
    idx := lvCupom.Selected.Index;
    if MessageDlg('Confirma a exclus�o do item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Pedido.RemoveItem(idx);
      lvCupom.Items.Delete(idx);
      edTotal.Text := FormatFloat('#,##0.00', Pedido.ValorTotal);
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
