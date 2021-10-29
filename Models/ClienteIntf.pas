unit ClienteIntf;

interface

type
  ICliente = interface
    ['{3B60CFF1-BF01-476E-B613-70B54DBEBBE0}']
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetNome: String;
    procedure SetNome(Value: String);
    property Id: Integer read GetId write SetId;
    property Nome: String read GetNome write SetNome;
  end;

implementation

end.
