unit Produto;

interface

type
  TProduto = class
  private
    FId: Integer;
    FDescricao: String;
    FPreco: Double;
  protected
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetDescricao: String;
    procedure SetDescricao(Value: String);
    function GetPreco: Double;
    procedure SetPreco(Value: Double);
  public
    property Id: Integer read FId write FId;
    property Descricao: String read FDescricao write FDescricao;
    property Preco: Double read FPreco write FPreco;
  end;

implementation

{ TProduto }

function TProduto.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TProduto.GetId: Integer;
begin
  Result := FId;
end;

function TProduto.GetPreco: Double;
begin
  Result := FPreco;
end;

procedure TProduto.SetDescricao(Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetId(Value: Integer);
begin
  FId := Value;
end;

procedure TProduto.SetPreco(Value: Double);
begin
  FPreco := Value;
end;

end.
