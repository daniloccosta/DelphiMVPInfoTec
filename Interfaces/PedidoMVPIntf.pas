unit PedidoMVPIntf;

interface

uses Pedido, PedidoIntf, Controls, Generics.Collections;

type
  IPedidoPresenter = interface;

  IPedidoView = interface
    ['{D45F2B80-7CF9-4CC3-A29F-E585A51C7FAC}']
    function GetPedido: TPedido;
    procedure SetPedido(Value: TPedido);

    function GetPresenter: IPedidoPresenter;
    procedure SetPresenter(const Value: IPedidoPresenter);
    function ShowView: TModalResult;

    property Pedido: TPedido read GetPedido write SetPedido;
    property Presenter: IPedidoPresenter read GetPresenter write SetPresenter;
  end;

  IPedidoPresenter = interface
    ['{7C74346C-E2C3-44DE-966B-9770D872ECB4}']
    function GetModel: IPedido;
    procedure SetModel(const Value: IPedido);
    function GetView: IPedidoView;
    procedure SetView(const Value: IPedidoView);

    procedure Add;
    function Get: TPedido;
    function ListAll: TList<TPedido>;

    property Model: IPedido read GetModel write SetModel;
    property View: IPedidoView read GetView write SetView;
  end;

implementation

end.
