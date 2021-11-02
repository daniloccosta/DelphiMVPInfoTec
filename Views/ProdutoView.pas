unit ProdutoView;

interface

uses ProdutoMVPIntf, Produto, Controls;

type
  TProdutoView = class(TInterfacedObject, IProdutoView)
  private
    FProduto: TProduto;
    FProdutoPresenter: Pointer;
  protected
    function GetProduto: TProduto;
    procedure SetProduto(Value: TProduto);

    function GetPresenter: IProdutoPresenter;
    procedure SetPresenter(const Value: IProdutoPresenter);
  public
    function ShowView: TModalResult;
    property Produto: TProduto read GetProduto write SetProduto;
    property Presenter: IProdutoPresenter read GetPresenter write SetPresenter;
  end;

implementation

{ TProdutoView }

function TProdutoView.GetPresenter: IProdutoPresenter;
begin
  Result := IProdutoPresenter(FProdutoPresenter);
end;

function TProdutoView.GetProduto: TProduto;
begin
  Result := FProduto;
end;

procedure TProdutoView.SetPresenter(const Value: IProdutoPresenter);
begin
  FProdutoPresenter := Pointer(Value);
end;

procedure TProdutoView.SetProduto(Value: TProduto);
begin
  FProduto := Value;
end;

function TProdutoView.ShowView: TModalResult;
begin
  Result := mrOk; //Não será utilizado!
end;

end.
