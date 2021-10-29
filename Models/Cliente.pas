unit Cliente;

interface

uses ClienteIntf;

type
  TCliente = class(TInterfacedObject, ICliente)
  private
    aId: Integer;
    aNome: String;
  protected
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetNome: String;
    procedure SetNome(Value: String);
  public
    property Id: Integer read aId write aId;
    property Nome: String read aNome write aNome;
  end;

implementation

{ TCliente }

function TCliente.GetId: Integer;
begin
  Result := aId;
end;

function TCliente.GetNome: String;
begin
  Result := aNome;
end;

procedure TCliente.SetId(Value: Integer);
begin
  aId := Value;
end;

procedure TCliente.SetNome(Value: String);
begin
  aNome := Value;
end;

end.
