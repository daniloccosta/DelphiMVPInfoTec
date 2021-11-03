unit Pedido;

interface

uses Cliente, Item, Generics.Collections;

type
  TPedido = class
  private
    FId: Integer;
    FCliente: TCliente;
    FDataPedido: TDate;
    FDataEntrega: TDate;
    FFormaPagto: Integer;
    FValorTotal: Double;
    FItems: TList<TItem>;
    procedure SetItems(Value: TList<TItem>);
    procedure SetValorTotal(Value: Double);
  protected
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetCliente: TCliente;
    procedure SetCliente(Value: TCliente);
    function GetDataPedido: TDate;
    procedure SetDataPedido(Value: TDate);
    function GetDataEntrega: TDate;
    procedure SetDataEntrega(Value: TDate);
    function GetFormaPagto: Integer;
    procedure SetFormaPagto(Value: Integer);
    function GetValorTotal: Double;
    procedure CalcValorTotal(NewValue: Double);
    function GetItems: TList<TItem>;
  public
    constructor Create;
    procedure AddItem(Item: TItem);
    procedure RemoveItem(Index: Integer);

    property Id: Integer read GetId write SetId;
    property Cliente: TCliente read GetCliente write SetCliente;
    property DataPedido: TDate read GetDataPedido write SetDataPedido;
    property DataEntrega: TDate read GetDataEntrega write SetDataEntrega;
    property FormaPagto: Integer read GetFormaPagto write SetFormaPagto;
    property ValorTotal: Double read GetValorTotal;
    property Items: TList<TItem> read GetItems;
  end;

implementation

{ TPedido }

function TPedido.GetDataEntrega: TDate;
begin
  Result := FDataEntrega;
end;

function TPedido.GetDataPedido: TDate;
begin
  Result := FDataPedido;
end;

function TPedido.GetFormaPagto: Integer;
begin
  Result := FFormaPagto;
end;

function TPedido.GetId: Integer;
begin
  Result := FId;
end;

procedure TPedido.AddItem(Item: TItem);
begin
  FItems.Add(Item);
  CalcValorTotal(Item.Quantidade * Item.Produto.Preco);
end;

procedure TPedido.CalcValorTotal(NewValue: Double);
begin
  FValorTotal := FValorTotal + NewValue;
end;

constructor TPedido.Create;
begin
  FCliente := TCliente.Create;
  FItems := TList<TItem>.Create;
  //FId := Random(999999);
  FValorTotal := 0;
end;

function TPedido.GetCliente: TCliente;
begin
  Result := FCliente;
end;

function TPedido.GetItems: TList<TItem>;
begin
  Result := FItems;
end;

function TPedido.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TPedido.RemoveItem(Index: Integer);
var
  Item: TItem;
begin
  Item := FItems.Items[Index];
  CalcValorTotal((Item.Produto.Preco * Item.Quantidade) * -1);
  FItems.Delete(Index);
end;

procedure TPedido.SetDataEntrega(Value: TDate);
begin
  FDataEntrega := Value;
end;

procedure TPedido.SetDataPedido(Value: TDate);
begin
  FDataPedido := Value;
end;

procedure TPedido.SetFormaPagto(Value: Integer);
begin
  FFormaPagto := Value;
end;

procedure TPedido.SetId(Value: Integer);
begin
  FId := Value;
end;

procedure TPedido.SetCliente(Value: TCliente);
begin
  FCliente := Value;
end;

procedure TPedido.SetItems(Value: TList<TItem>);
begin
  FItems := Value;
end;

procedure TPedido.SetValorTotal(Value: Double);
begin
  FValorTotal := Value;
end;

end.
