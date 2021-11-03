unit PedidoM;

interface

uses PedidoIntf, Pedido, Generics.Collections;

type
  TPedidoM = class(TInterfacedObject, IPedido)
  private
    FPedido: TPedido;
    FPedidos: TList<TPedido>;
    function GetIndex(Id: Integer): Integer;
  protected
    function GetPedido: TPedido;
    procedure SetPedido(Value: TPedido);
    function Add: Integer;
    function Get: TPedido;
  public
    constructor Create;
    function ListAll: TList<TPedido>;
    property Pedido: TPedido read GetPedido write SetPedido;
  end;

implementation


{ TPedidoM }

function TPedidoM.Add: Integer;
begin
  Pedido.Id := FPedidos.Count + 1;
  FPedidos.Add(Pedido);
  Result := Pedido.Id;
end;

constructor TPedidoM.Create;
begin
  FPedido := TPedido.Create;
  FPedidos := TList<TPedido>.Create;
end;

function TPedidoM.Get: TPedido;
var
  Index: Integer;
begin
  Index := GetIndex(Pedido.Id);

  if (Index > -1) then
    Result := FPedidos.Items[Index]
  else Result := Nil;
end;

function TPedidoM.GetIndex(Id: Integer): Integer;
var
  I, Index: Integer;
begin
  Index := -1;
  for I := 0 to FPedidos.Count - 1 do
    if (TPedido(FPedidos.Items[I]).id = Id) then
    begin
      Index := I;
      Break;
    end;
  Result := Index;
end;

function TPedidoM.GetPedido: TPedido;
begin
  Result := FPedido;
end;

function TPedidoM.ListAll: TList<TPedido>;
begin
  Result := FPedidos;
end;

procedure TPedidoM.SetPedido(Value: TPedido);
begin
  FPedido := Value;
end;

end.
