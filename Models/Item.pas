unit Item;

interface

uses
  System.SysUtils, ItemIntf;

type
  TItem = class(TInterfacedObject, IItem)
  private
    aIdPedido: Integer;
    aIdProduto: Integer;
    aQuantidade: Double;
    aValorUnit: Double;
  protected
    function GetIdPedido: Integer;
    procedure SetIdPedido(Value: Integer);
    function GetIdProduto: Integer;
    procedure SetIdProduto(Value: Integer);
    function GetQuantidade: Double;
    procedure SetQuantidade(Value: Double);
    function GetValorUnit: Double;
    procedure SetValorUnit(Value: Double);
  public
    property IdPedido: Integer read aIdPedido write aIdPedido;
    property IdProduto: Integer read aIdProduto write aIdProduto;
    property Quantidade: Double read aQuantidade write aQuantidade;
    property ValorUnit: Double read aValorUnit write aValorUnit;
  end;

implementation

{ TItem }

function TItem.GetIdPedido: Integer;
begin
  Result := aIdPedido;
end;

function TItem.GetIdProduto: Integer;
begin
  Result := aIdProduto;
end;

function TItem.GetQuantidade: Double;
begin
  Result := aQuantidade;
end;

function TItem.GetValorUnit: Double;
begin
  Result := aValorUnit;
end;

procedure TItem.SetIdPedido(Value: Integer);
begin
  aIdPedido := Value;
end;

procedure TItem.SetIdProduto(Value: Integer);
begin
  aIdProduto := Value;
end;

procedure TItem.SetQuantidade(Value: Double);
begin
  aQuantidade := Value;
end;

procedure TItem.SetValorUnit(Value: Double);
begin
  aValorUnit := Value;
end;

end.
