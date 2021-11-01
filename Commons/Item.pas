unit Item;

interface

type
  TItem = class
  private
    FIdProduto: Integer;
    FQuantidade: Double;
    FValorUnit: Double;
  protected
    function GetIdProduto: Integer;
    procedure SetIdProduto(Value: Integer);
    function GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function GetValorUnit: Double;
    procedure SetValorUnit(Value: Double);
  public
    property IdProduto: Integer read GetIdProduto write SetIdProduto;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property ValorUnit: Double read GetValorUnit write SetValorUnit;
  end;

implementation

{ TItem }

function TItem.GetIdProduto: Integer;
begin
  Result := FIdProduto;
end;

function TItem.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

function TItem.GetValorUnit: Double;
begin
  Result := FValorUnit;
end;

procedure TItem.SetIdProduto(Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TItem.SetQuantidade(Value: Double);
begin
  FQuantidade := Value;
end;

procedure TItem.SetValorUnit(Value: Double);
begin
  FValorUnit := Value;
end;

end.
