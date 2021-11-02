unit Item;

interface

uses Produto;

type
  TItem = class
  private
    FProduto: TProduto;
    FQuantidade: Double;
  protected
    function GetProduto: TProduto;
    procedure SetProduto(Value: TProduto);
    function GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
  public
    constructor Create;
    property Produto: TProduto read GetProduto write SetProduto;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
  end;

implementation

{ TItem }

constructor TItem.Create;
begin
  FProduto := TProduto.Create;
end;

function TItem.GetProduto: TProduto;
begin
  Result := FProduto;
end;

function TItem.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

procedure TItem.SetProduto(Value: TProduto);
begin
  FProduto := Value;
end;

procedure TItem.SetQuantidade(Value: Double);
begin
  FQuantidade := Value;
end;

end.
