unit ClienteMVPIntf;

interface

uses ClienteIntf, Generics.Collections, Controls, Cliente;

type
  IClientePresenter = interface;

  IClienteView = interface
    ['{00931CA2-789C-43DD-A6A8-46758B2D66F2}']
    function GetCliente: TCliente;
    procedure SetCliente(Value: TCliente);

    function GetPresenter: IClientePresenter;
    procedure SetPresenter(const Value: IClientePresenter);
    function ShowView: TModalResult;

    property Cliente: TCliente read GetCliente write SetCliente;
    property Presenter: IClientePresenter read GetPresenter write SetPresenter;
  end;

  IClientePresenter = interface
    ['{D256E1E8-1C91-46AF-B962-7575FE302E05}']
//    function GetCliente: TCliente;
//    procedure SetCliente(Value: TCliente);

    function GetModel: ICliente;
    procedure SetModel(const Value: ICliente);
    function GetView: IClienteView;
    procedure SetView(const Value: IClienteView);

    procedure Add;
    function Get: TCliente;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TCliente>;

    property Model: ICliente read GetModel write SetModel;
    property View: IClienteView read GetView write SetView;
//    property Cliente: TCliente read GetCliente write SetCliente;
  end;

implementation

end.
