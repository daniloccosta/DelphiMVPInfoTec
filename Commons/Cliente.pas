unit Cliente;

interface

type
  TCliente = class
  private
    FId: Integer;
    FNome: String;
  protected
    function GetId: Integer;
    procedure SetId(Value: Integer);
    function GetNome: String;
    procedure SetNome(Value: String);
  public
    property Id: Integer read GetId write SetId;
    property Nome: String read GetNome write SetNome;
  end;

implementation

{ TCliente }

function TCliente.GetId: Integer;
begin
  Result := FId;
end;

function TCliente.GetNome: String;
begin
  Result := FNome;
end;

procedure TCliente.SetId(Value: Integer);
begin
  FId := Value;
end;

procedure TCliente.SetNome(Value: String);
begin
  FNome := Value;
end;

end.
