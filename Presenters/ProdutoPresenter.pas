unit ProdutoPresenter;

interface

uses ProdutoMVPIntf, ProdutoIntf, Produto, Generics.Collections;

type
  TProdutoPresenter = class(TInterfacedObject, IProdutoPresenter)
  private
    FModel: IProduto;
    FView: IProdutoView;
  protected
    function GetModel: IProduto;
    procedure SetModel(const Value: IProduto);
    function GetView: IProdutoView;
    procedure SetView(const Value: IProdutoView);
  public
    property Model: IProduto read GetModel write SetModel;
    property View: IProdutoView read GetView write SetView;

    procedure Add;
    function Get: TProduto;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TProduto>;
  end;

implementation

{ TProdutoPresenter }

procedure TProdutoPresenter.Add;
begin
  Model.Produto := View.Produto;
  Model.Add;

  //Prepara View para novo Produto
  View.Produto := TProduto.Create;
end;

procedure TProdutoPresenter.Delete;
begin
  Model.Produto := View.Produto;
  Model.Delete;
end;

function TProdutoPresenter.Get: TProduto;
begin
  Model.Produto := View.Produto;
  Result := Model.Get;
end;

function TProdutoPresenter.GetModel: IProduto;
begin
  Result := FModel;
end;

function TProdutoPresenter.GetView: IProdutoView;
begin
  Result := FView;
end;

function TProdutoPresenter.ListAll: TList<TProduto>;
begin
  Result := Model.ListAll;
end;

procedure TProdutoPresenter.SetModel(const Value: IProduto);
begin
  FModel := Value;
end;

procedure TProdutoPresenter.SetView(const Value: IProdutoView);
begin
  FView := Value;
end;

procedure TProdutoPresenter.Update;
begin
  Model.Produto := View.Produto;
  Model.Update;
end;

end.
