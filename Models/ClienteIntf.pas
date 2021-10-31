unit ClienteIntf;

interface

uses Cliente, Generics.Collections;

type
  ICliente = interface
    ['{3B60CFF1-BF01-476E-B613-70B54DBEBBE0}']
    function GetCliente: TCliente;
    procedure SetCliente(Value: TCliente);
    procedure Add;
    function Get: TCliente;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TCliente>;
    property Cliente: TCliente read GetCliente write SetCliente;
  end;

implementation

end.
