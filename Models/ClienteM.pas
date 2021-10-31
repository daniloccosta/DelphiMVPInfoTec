unit ClienteM;

interface

uses ClienteIntf, Generics.Collections, Cliente;

type
  TClienteM = class(TInterfacedObject, ICliente)
  private
    FCliente: TCliente;
    FClientes: TList<TCliente>;
    function GetIndex(Id: Integer): Integer;
  protected
    function GetCliente: TCliente;
    procedure SetCliente(Value: TCliente);
  public
    constructor Create;
    property Cliente: TCliente read GetCliente write SetCliente;

    procedure Add;
    function Get: TCliente;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TCliente>;
  end;

implementation


{ TCliente }

procedure TClienteM.Add;
begin
  Cliente.Id := FClientes.Count + 1;

  FClientes.Add(Cliente);
end;

constructor TClienteM.Create;
begin
  FCliente := TCliente.Create;
  FClientes := TList<TCliente>.Create;
end;

procedure TClienteM.Delete;
var
  Index: Integer;
begin
  Index := GetIndex(Cliente.Id);

  if (Index > -1) then
    FClientes.Delete(Index);
end;

function TClienteM.Get: TCliente;
var
  Index: Integer;
begin
  Index := GetIndex(Cliente.Id);

  if (Index > -1) then
    Result := FClientes.Items[Index]
  else Result := Nil;
end;

function TClienteM.GetCliente: TCliente;
begin
  Result := FCliente;
end;

function TClienteM.GetIndex(Id: Integer): Integer;
var
  I, Index: Integer;
begin
  Index := -1;
  for I := 0 to FClientes.Count - 1 do
    if (TCliente(FClientes.Items[I]).id = Id) then
    begin
      Index := I;
      Break;
    end;
  Result := Index;
end;

function TClienteM.ListAll: TList<TCliente>;
begin
  Result := FClientes;
end;

procedure TClienteM.SetCliente(Value: TCliente);
begin
  FCliente := Value;
end;

procedure TClienteM.Update;
var
  Index: Integer;
begin
  Index := GetIndex(Cliente.Id);
  if (Index > -1) then
    FClientes.Items[Index] := Cliente;
end;

end.
