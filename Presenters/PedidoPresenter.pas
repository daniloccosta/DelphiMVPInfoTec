unit PedidoPresenter;

interface

uses PedidoMVPIntf, PedidoIntf, Pedido, Generics.Collections;

type
  TPedidoPresenter = class(TInterfacedObject, IPedidoPresenter)
  private
    FModel: IPedido;
    FView: IPedidoView;
  protected
    function GetModel: IPedido;
    procedure SetModel(const Value: IPedido);
    function GetView: IPedidoView;
    procedure SetView(const Value: IPedidoView);
  public
    function Add: Integer;
    function Get: TPedido;
    function ListAll: TList<TPedido>;

    property Model: IPedido read GetModel write SetModel;
    property View: IPedidoView read GetView write SetView;
  end;

implementation

{ TPedidoPresenter }

function TPedidoPresenter.Add: Integer;
begin
  Model.Pedido := View.Pedido;
  Result := Model.Add;

  //Prepara View para novo Pedido
  View.Pedido := TPedido.Create;
end;

function TPedidoPresenter.Get: TPedido;
begin
  Model.Pedido := View.Pedido;
  Result := Model.Get;
end;

function TPedidoPresenter.GetModel: IPedido;
begin
  Result := FModel;
end;

function TPedidoPresenter.GetView: IPedidoView;
begin
  Result := FView;
end;

function TPedidoPresenter.ListAll: TList<TPedido>;
begin
  Result := Model.ListAll;
end;

procedure TPedidoPresenter.SetModel(const Value: IPedido);
begin
  FModel := Value;
end;

procedure TPedidoPresenter.SetView(const Value: IPedidoView);
begin
  FView := Value;
end;

end.
