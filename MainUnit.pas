unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ClientesForm;

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
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses ClienteMVPIntf, ClienteIntf, ClientePresenter, ClienteM, ProdutosForm,
  ProdutoMVPIntf, ProdutoIntf, ProdutoM, ProdutoPresenter, VendasForm;

//uses ClienteIntf, ClienteMVPIntf, ClientePresenter, ClienteM;

procedure TMainForm.btCadCLientesClick(Sender: TObject);
var
  pView: IClienteView;
  pCliente: ICliente;
  pPresenter: IClientePresenter;
begin
  pView := TFormClientes.Create(Nil);
  pPresenter := TClientePresenter.Create;
  pCliente := TClienteM.Create;

  pPresenter.Model := pCliente;
  pPresenter.View := pView;
  pView.Presenter := pPresenter;
  pView.ShowView;
end;

procedure TMainForm.btCadProdutosClick(Sender: TObject);
var
  pView: IProdutoView;
  pProduto: IProduto;
  pPresenter: IProdutoPresenter;
begin
  pView := TFormProdutos.Create(Nil);
  pPresenter := TProdutoPresenter.Create;
  pProduto := TProdutoM.Create;

  pPresenter.Model := pProduto;
  pPresenter.View := pView;
  pView.Presenter := pPresenter;
  pView.ShowView;
end;

procedure TMainForm.btVendasClick(Sender: TObject);
begin
  FormVendas := TFormVendas.Create(Nil);
  FormVendas.ShowModal;
end;

end.
