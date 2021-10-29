unit ProdutoIntf;

interface

type
  IProduto = interface
    ['{29FBA039-37C1-4385-BDFB-3647C2909925}']
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetDescricao: String;
    procedure SetDescricao(Value: String);
    function GetPreco: Double;
    procedure SetPreco(Value: Double);
    property Id: Integer read GetId write SetId;
    property Descricao: String read GetDescricao write SetDescricao;
    property Preco: Double read GetPreco write SetPreco;
  end;

implementation

end.
