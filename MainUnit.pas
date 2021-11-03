unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ClientesForm,
  ClienteIntf, ClienteMVPIntf, ProdutoIntf, ProdutoMVPIntf, PedidoIntf,
  PedidoMVPIntf, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.Buttons;

type
  TMainForm = class(TForm)
    btCadClientes: TBitBtn;
    btnCadProdutos: TBitBtn;
    btnVendas: TBitBtn;
    ActionList1: TActionList;
    ImageList1: TImageList;
    acClientes: TAction;
    acProdutos: TAction;
    acVendas: TAction;
    procedure FormShow(Sender: TObject);
    procedure acVendasExecute(Sender: TObject);
    procedure acClientesExecute(Sender: TObject);
    procedure acProdutosExecute(Sender: TObject);
  private
    { Private declarations }
    procedure IniciarMVPCliente;
    procedure IniciarMVPProduto;
    procedure IniciarMVPPedido;
    procedure AdicionarDadosParaTestes;
  public
    { Public declarations }
    ModelCliente: ICliente;
    ViewCliente: IClienteView;
    PresenterCliente: IClientePresenter;

    ModelProduto: IProduto;
    ViewProduto: IProdutoView;
    PresenterProduto: IProdutoPresenter;

    ModelPedido: IPedido;
    ViewPedido: IPedidoView;
    PresenterPedido: IPedidoPresenter;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses ClientePresenter, ClienteM, ProdutosForm,
  ProdutoM, ProdutoPresenter, VendasForm,
  PedidoPresenter, PedidoM;

//uses ClienteIntf, ClienteMVPIntf, ClientePresenter, ClienteM;

procedure TMainForm.acClientesExecute(Sender: TObject);
begin
  if (PresenterCliente = nil) then
    IniciarMVPCliente;

  ViewCliente.ShowView;
end;

procedure TMainForm.acProdutosExecute(Sender: TObject);
begin
  if (PresenterProduto = nil) then
    IniciarMVPProduto;

  ViewProduto.ShowView;
end;

procedure TMainForm.acVendasExecute(Sender: TObject);
begin
  if (PresenterCliente = nil) then
    IniciarMVPCliente;
  if (PresenterProduto = Nil) then
    IniciarMVPProduto;
  if (PresenterPedido = Nil) then
    IniciarMVPPedido;

  ViewPedido.ShowView;
end;

procedure TMainForm.AdicionarDadosParaTestes;
begin
  //#### CLIENTES ####//
  ViewCliente.Cliente.Nome := 'DANILO';
  PresenterCliente.Add;
  //******//
  ViewCliente.Cliente.Nome := 'LAURA';
  PresenterCliente.Add;
  //******//
  ViewCliente.Cliente.Nome := 'SAMUEL';
  PresenterCliente.Add;
  //******//
  ViewCliente.Cliente.Nome := 'STELA';
  PresenterCliente.Add;

  //#### PRODUTOS #####//
  ViewProduto.Produto.Descricao := 'PRODUTO A';
  ViewProduto.Produto.Preco := 1.23;
  PresenterProduto.Add;
  //******//
  ViewProduto.Produto.Descricao := 'PRODUTO B';
  ViewProduto.Produto.Preco := 4.56;
  PresenterProduto.Add;
  //******//
  ViewProduto.Produto.Descricao := 'PRODUTO C';
  ViewProduto.Produto.Preco := 7.89;
  PresenterProduto.Add;
  //******//
  ViewProduto.Produto.Descricao := 'PRODUTO D';
  ViewProduto.Produto.Preco := 3.21;
  PresenterProduto.Add;
  //******//
  ViewProduto.Produto.Descricao := 'PRODUTO E';
  ViewProduto.Produto.Preco := 6.54;
  PresenterProduto.Add;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  IniciarMVPCliente;
  IniciarMVPProduto;

  AdicionarDadosParaTestes;
end;

procedure TMainForm.IniciarMVPCliente;
begin
  ViewCliente := TFormClientes.Create(Nil);

  PresenterCliente := TClientePresenter.Create;
  ModelCliente := TClienteM.Create;
  PresenterCliente.Model := ModelCliente;

  PresenterCliente.View := ViewCliente;
  ViewCliente.Presenter := PresenterCliente;
end;

procedure TMainForm.IniciarMVPPedido;
begin
  ViewPedido := TFormVendas.Create(Nil);

  ModelPedido := TPedidoM.Create;
  PresenterPedido := TPedidoPresenter.Create;
  PresenterPedido.Model := ModelPedido;

  PresenterPedido.View := ViewPedido;
  ViewPedido.Presenter := PresenterPedido;
end;

procedure TMainForm.IniciarMVPProduto;
begin
  ViewProduto := TFormProdutos.Create(Nil);

  PresenterProduto := TProdutoPresenter.Create;
  ModelProduto := TProdutoM.Create;
  PresenterProduto.Model := ModelProduto;

  PresenterProduto.View := ViewProduto;
  ViewProduto.Presenter := PresenterProduto;
end;

end.
