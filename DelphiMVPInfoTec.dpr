program DelphiMVPInfoTec;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ClienteM in 'Models\ClienteM.pas',
  ClienteIntf in 'Models\ClienteIntf.pas',
  Item in 'Models\Item.pas',
  ItemIntf in 'Models\ItemIntf.pas',
  Pedido in 'Models\Pedido.pas',
  PedidoIntf in 'Models\PedidoIntf.pas',
  Produto in 'Commons\Produto.pas',
  ProdutoIntf in 'Models\ProdutoIntf.pas',
  ClientesForm in 'Views\ClientesForm.pas' {FormClientes},
  ProdutosForm in 'Views\ProdutosForm.pas' {FormProdutos},
  Cliente in 'Commons\Cliente.pas',
  ClienteMVPIntf in 'Interfaces\ClienteMVPIntf.pas',
  ClientePresenter in 'Presenters\ClientePresenter.pas',
  ProdutoM in 'Models\ProdutoM.pas',
  ProdutoMVPIntf in 'Interfaces\ProdutoMVPIntf.pas',
  ProdutoPresenter in 'Presenters\ProdutoPresenter.pas',
  Utils in 'Commons\Utils.pas',
  VendasForm in 'Views\VendasForm.pas' {FormVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormVendas, FormVendas);
  Application.Run;
end.
