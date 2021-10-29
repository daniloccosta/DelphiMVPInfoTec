unit Produto;

interface

uses ProdutoIntf;

type
  TProduto = class(TInterfacedObject, IProduto)
  private
    aId: Integer;
    aDescricao: String;
    aPreco: Double;
  protected
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetDescricao: String;
    procedure SetDescricao(Value: String);
    function GetPreco: Double;
    procedure SetPreco(Value: Double);
  public
    property Id: Integer read aId write aId;
    property Descricao: String read aDescricao write aDescricao;
    property Preco: Double read aPreco write aPreco;
  end;

implementation

{ TProduto }

function TProduto.GetDescricao: String;
begin
  Result := aDescricao;
end;

function TProduto.GetId: Integer;
begin
  Result := aId;
end;

function TProduto.GetPreco: Double;
begin
  Result := aPreco;
end;

procedure TProduto.SetDescricao(Value: String);
begin
  aDescricao := Value;
end;

procedure TProduto.SetId(Value: Integer);
begin
  aId := Value;
end;

procedure TProduto.SetPreco(Value: Double);
begin
  aPreco := Value;
end;

end.
