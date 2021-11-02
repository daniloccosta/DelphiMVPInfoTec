unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ClientesForm,
  ClienteIntf, ClienteMVPIntf, ProdutoIntf, ProdutoMVPIntf, PedidoIntf,
  PedidoMVPIntf;

type
  TMainForm = class(TForm)
    btCadCLientes: TButton;
    btCadProdutos: TButton;
    btVendas: TButton;
    procedure btCadCLientesClick(Sender: TObject);
    procedure btCadProdutosClick(Sender: TObject);
    procedure btVendasClick(Sender: TObject);
  private
    { Private declarations }
    procedure IniciarPresenterCliente;
    procedure IniciarPresenterProduto;
    procedure IniciarPresenterPedido;
  public
    { Public declarations }
    ModelCliente: ICliente;
    PresenterCliente: IClientePresenter;

    ModelProduto: IProduto;
    PresenterProduto: IProdutoPresenter;

    ModelPedido: IPedido;
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

procedure TMainForm.btCadCLientesClick(Sender: TObject);
var
  ViewCliente: IClienteView;
begin
  ViewCliente := TFormClientes.Create(Nil);

  if (PresenterCliente = nil) then
    IniciarPresenterCliente;

  PresenterCliente.View := ViewCliente;
  ViewCliente.Presenter := PresenterCliente;
  ViewCliente.ShowView;
end;

procedure TMainForm.btCadProdutosClick(Sender: TObject);
var
  ViewProduto: IProdutoView;
begin
  ViewProduto := TFormProdutos.Create(Nil);

  if (PresenterProduto = nil) then
    IniciarPresenterProduto;

  PresenterProduto.View := ViewProduto;
  ViewProduto.Presenter := PresenterProduto;
  ViewProduto.ShowView;
end;

procedure TMainForm.btVendasClick(Sender: TObject);
var
  ViewPedido: IPedidoView;
begin
  if (PresenterCliente = nil) then
    IniciarPresenterCliente;
  if (PresenterProduto = Nil) then
    IniciarPresenterProduto;

  ViewPedido := TFormVendas.Create(Nil);

  IniciarPresenterPedido;

  PresenterPedido.View := ViewPedido;
  ViewPedido.Presenter := PresenterPedido;
  ViewPedido.ShowView;
end;

procedure TMainForm.IniciarPresenterCliente;
begin
  PresenterCliente := TClientePresenter.Create;
  ModelCliente := TClienteM.Create;
  PresenterCliente.Model := ModelCliente;
end;

procedure TMainForm.IniciarPresenterPedido;
begin
  ModelPedido := TPedidoM.Create;
  PresenterPedido := TPedidoPresenter.Create;
  PresenterPedido.Model := ModelPedido;
end;

procedure TMainForm.IniciarPresenterProduto;
begin
  PresenterProduto := TProdutoPresenter.Create;
  ModelProduto := TProdutoM.Create;
  PresenterProduto.Model := ModelProduto;
end;

end.
