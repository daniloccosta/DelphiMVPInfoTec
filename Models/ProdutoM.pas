unit ProdutoM;

interface

uses ProdutoIntf, Produto, Generics.Collections;

type
  TProdutoM = class(TInterfacedObject, IProduto)
  private
    FProduto: TProduto;
    FProdutos: TList<TProduto>;
    function GetIndex(Id: Integer): Integer;
  protected
    function GetProduto: TProduto;
    procedure SetProduto(Value: TProduto);
  public
    constructor Create;
    property Produto: TProduto read GetProduto write SetProduto;

    procedure Add;
    function Get: TProduto;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TProduto>;
  end;

implementation

{ TProdutoM }

procedure TProdutoM.Add;
begin
  Produto.Id := FProdutos.Count + 1;

  FProdutos.Add(Produto);
end;

constructor TProdutoM.Create;
begin
  FProduto := TProduto.Create;
  FProdutos := TList<TProduto>.Create;
end;

procedure TProdutoM.Delete;
var
  Index: Integer;
begin
  Index := GetIndex(Produto.Id);

  if (Index > -1) then
    FProdutos.Delete(Index);
end;

function TProdutoM.Get: TProduto;
var
  Index: Integer;
begin
  Index := GetIndex(Produto.Id);

  if (Index > -1) then
    Result := FProdutos.Items[Index]
  else Result := Nil;
end;

function TProdutoM.GetIndex(Id: Integer): Integer;
var
  I, Index: Integer;
begin
  Index := -1;
  for I := 0 to FProdutos.Count - 1 do
    if (TProduto(FProdutos.Items[I]).id = Id) then
    begin
      Index := I;
      Break;
    end;
  Result := Index;
end;

function TProdutoM.GetProduto: TProduto;
begin
  Result := FProduto;
end;

function TProdutoM.ListAll: TList<TProduto>;
begin
  Result := FProdutos;
end;

procedure TProdutoM.SetProduto(Value: TProduto);
begin
  FProduto := Value;
end;

procedure TProdutoM.Update;
var
  Index: Integer;
begin
  Index := GetIndex(Produto.Id);
  if (Index > -1) then
    FProdutos.Items[Index] := Produto;
end;

end.
