unit PedidoIntf;

interface

uses
  System.SysUtils;

type
  IPedido = interface
    ['{21C598A0-B11D-4905-B88C-49E8256A5EFA}']
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetIdCliente: Integer;
    procedure SetIdCliente(Value: Integer);
    function GetDataPedido: TDate;
    procedure SetDataPedido(Value: TDate);
    function GetDataEntrega: TDate;
    procedure SetDataEntrega(Value: TDate);
    property Id: Integer read GetId write SetId;
    property IdCliente: Integer read GetIdCliente write SetIdCliente;
    property DataPedido: TDate read GetDataPedido write SetDataPedido;
    property DataEntrega: TDate read GetDataEntrega write SetDataEntrega;
  end;

implementation

end.
