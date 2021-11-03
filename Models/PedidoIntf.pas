unit PedidoIntf;

interface

uses
  Pedido, Item, Generics.Collections;

type
  IPedido = interface
    ['{21C598A0-B11D-4905-B88C-49E8256A5EFA}']
    function GetPedido: TPedido;
    procedure SetPedido(Value: TPedido);
    function Add: Integer;
    function Get: TPedido;
//    procedure Update;
//    procedure Delete;
    function ListAll: TList<TPedido>;
    property Pedido: TPedido read GetPedido write SetPedido;
  end;

implementation

end.
