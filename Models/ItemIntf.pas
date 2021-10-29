unit ItemIntf;

interface

type
  IItem = interface
    ['{BB8B34C4-CCAB-4EF8-9054-50E79BBEB47D}']
    function GetIdPedido: Integer;
    procedure SetIdPedido(Value: Integer);
    function GetIdProduto: Integer;
    procedure SetIdProduto(Value: Integer);
    function GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function GetValorUnit: Double;
    procedure SetValorUnit(Value: Double);
    property IdPedido: Integer read GetIdPedido write SetIdPedido;
    property IdProduto: Integer read GetIdProduto write SetIdProduto;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property ValorUnit: Double read GetValorUnit write SetValorUnit;
  end;

implementation

end.
