unit Pedido;

interface

uses
  System.SysUtils, PedidoIntf;

type
  TPedido = class(TInterfacedObject, IPedido)
  private
    aId: Integer;
    aIdCliente: Integer;
    aDataPedido: TDate;
    aDataEntrega: TDate;
  protected
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetIdCliente: Integer;
    procedure SetIdCliente(Value: Integer);
    function GetDataPedido: TDate;
    procedure SetDataPedido(Value: TDate);
    function GetDataEntrega: TDate;
    procedure SetDataEntrega(Value: TDate);
  public
    property Id: Integer read GetId write SetId;
    property IdCliente: Integer read GetIdCliente write SetIdCliente;
    property DataPedido: TDate read GetDataPedido write SetDataPedido;
    property DataEntrega: TDate read GetDataEntrega write SetDataEntrega;
  end;

implementation

{ TPedido }

function TPedido.GetDataEntrega: TDate;
begin
  Result := aDataEntrega;
end;

function TPedido.GetDataPedido: TDate;
begin
  Result := aDataPedido;
end;

function TPedido.GetId: Integer;
begin
  Result := aId;
end;

function TPedido.GetIdCliente: Integer;
begin
  Result := aIdCliente;
end;

procedure TPedido.SetDataEntrega(Value: TDate);
begin
  aDataEntrega := Value;
end;

procedure TPedido.SetDataPedido(Value: TDate);
begin
  aDataPedido := Value;
end;

procedure TPedido.SetId(Value: Integer);
begin
  aId := Value;
end;

procedure TPedido.SetIdCliente(Value: Integer);
begin
  aIdCliente := Value;
end;

end.
